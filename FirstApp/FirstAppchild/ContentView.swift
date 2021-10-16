//
//  ContentView.swift
//  FirstApp
//
//  Created by Tucker on 10/7/21.
//

import SwiftUI


class Di : Hashable{

    var name: String
    var choices = [String]()
    var items = 0
    
    init(name: String, choices: [String]){
        self.name = name
        self.choices = choices
        self.items = choices.count
    }
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(name.hashValue)
        hasher.combine(choices.hashValue)
    }
    static func == (lhs: Di, rhs: Di) -> Bool {
        return lhs.name == rhs.name
    }
  
}

class roller {
    var counter = 0
    var number = "hey"
    
    //Types of Dice
    var colors = Di(name: "Colors", choices: ["blue", "yellow", "red", "green", "orange", "grey"])
    var roommates = Di(name: "Roommates", choices:["Tucker", "Nathan", "Zach", "Devon", "Christian", "Chris"])
    var fastFood = Di(name: "Fast Food", choices:["McDonalds", "Wendy's", "Taco Bell", "Burger King", "Panda Express", "Del Taco"])
    var coin = Di(name:"coin", choices: ["Heads", "Tails"])
    
    
    func countit(){
        counter += 1
        print(counter)
        number = String(counter)
    }
}


var myRoller = roller()

struct ContentView: View {
    @State var count: Int = 0
    let colors = ["blue", "yellow", "red", "green", "orange", "grey"]
    @State var choice = 0
    @State var actualRoll = "none"
    
    @State  var selectedDi = myRoller.colors
    
    var body: some View {
        VStack {
            Text(actualRoll)
                .font(.title)
            
            //Text(selectedDi.name)
            Picker(selection: $selectedDi, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
            
                Text("Room mates").tag(myRoller.roommates)
                Text("Colors").tag(myRoller.colors)
                Text("Fast Food").tag(myRoller.fastFood)
                Text("coin").tag(myRoller.coin)
                
            }
            
            Button(action: {
                self.choice = Int.random(in: 1...selectedDi.items)
                self.actualRoll = selectedDi.choices[choice - 1]
                
            }) {
                Text("Roll")
            }
            
            
            TextField("New Dice", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}





