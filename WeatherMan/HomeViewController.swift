//
//  ViewController.swift
//  WeatherMan
//
//  Created by Trevor Steele on 3/14/16.
//  Copyright © 2016 Trevor Steele. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var lat = 0.0
    var lon = 0.0
    
    @IBAction func getWeather(sender: AnyObject) {
        manager.requestLocation()
    }
    
    @IBOutlet weak var weatherButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location.coordinate)")
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
}

