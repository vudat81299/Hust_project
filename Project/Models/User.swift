//
//  User.swift
//  Project
//
//  Created by Be More on 10/2/20.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    let fullName: String
    let username: String
    let profileImageUrl: String
    var stats: UserRelationStats?
    
    var isFollowed: Bool = false
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == self.uid
    }
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        let username = dictionary["username"] as? String ?? ""
        self.username = username.lowercased()
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
    
}

struct UserRelationStats {
    let followers: Int
    let following: Int
}
