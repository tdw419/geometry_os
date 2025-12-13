"""
The Council Chamber - Group AI Conversation
Runs a round-robin conversation between multiple Holographic LLMs.
"""

import sys
import os
import json
import time

# Ensure we can import core modules
sys.path.append(os.getcwd())
from holographic_llm import HolographicCortex

class CouncilChamber:
    def __init__(self, db_path="ghost_daemon_knowledge.db"):
        self.members = []
        self.db_path = db_path
        self.history = []

    def summon_member(self, model_file_name: str):
        print(f"🔮 Summoning {model_file_name}...")
        cortex = HolographicCortex(model_file_name, db_path=self.db_path)
        self.members.append(cortex)

    def convene(self, topic: str, rounds=2):
        print(f"\n🔔 THE COUNCIL CONVENES")
        print(f"📜 Topic: {topic}\n")
        
        self.history.append(f"TOPIC: {topic}")
        
        for r in range(rounds):
            print(f"--- Round {r+1} ---")
            for member in self.members:
                # Context is the last few messages
                context = "\n".join(self.history[-3:])
                prompt = f"The topic is: {topic}. Previous points: {context}. What is your perspective?"
                
                response = member.think(prompt)
                
                # Parse response to get clean text (since mock mode adds structure)
                # But for now we just print raw mock output
                print(f"🗣️  {response}\n")
                self.history.append(response)
                
                time.sleep(0.5)

if __name__ == "__main__":
    chamber = CouncilChamber()
    
    # Summon the personas we injected
    chamber.summon_member("architect-v1.gguf")
    chamber.summon_member("sentinel-v1.gguf")
    chamber.summon_member("weaver-v1.gguf")
    
    # Start discussion
    chamber.convene("How should we integrate Quantum Computing into the Geometry OS?")
