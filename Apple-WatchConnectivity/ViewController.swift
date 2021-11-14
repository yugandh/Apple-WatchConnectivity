//
//  ViewController.swift
//  Apple-WatchConnectivity
//
//  Created by Yugandhar Kommineni on 11/13/21.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    var session: WCSession?
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createWCSession()
    }
    func createWCSession() {
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    @IBAction func sendDataToWatch(_ sender: UIButton) {
        let myArray = ["One", "Two", "Three", "Four", "Five", "Six"]
        phoneLabel.text = myArray.randomElement()
        if let validSession = self.session, validSession.isReachable {
            validSession.sendMessage(["iPhone": phoneLabel.text!], replyHandler: nil, errorHandler: nil)
        }
    }
}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
}
