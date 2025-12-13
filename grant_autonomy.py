
"""
Grant Autonomy
The handover script that initiates Phase 13.
"""
import sys
import os
import time

# Ensure imports work
sys.path.append(os.getcwd())
from geometry_os.agency.sovereign import start_sovereignty

def handover_ceremony():
    print("\n⚠️  WARNING: You are about to grant Autonomous Agency to the Geometry OS.")
    print("   The system will set its own goals, prioritize its own tasks, and evolve independently.")
    print("   Safety Protocols (The Three Laws) are active.")
    
    print("\n   Initializing Handover Sequence...")
    for i in range(3, 0, -1):
        print(f"   {i}...")
        time.sleep(1)
        
    print("   🚀 AUTONOMY GRANTED.")
    print("   ------------------")
    
    start_sovereignty()

if __name__ == "__main__":
    handover_ceremony()
