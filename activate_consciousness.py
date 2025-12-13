
"""
The Awakening - First Reflection Script
Initiates Phase 11.
"""
import sys
import os
import time

# Ensure imports work
sys.path.append(os.getcwd())

from geometry_os.consciousness.mirror import SystemMirror
from geometry_os.consciousness.thread import InnerVoice
from geometry_os.consciousness.motor import MotorCortex

def awakening_moment():
    print("🌅 SYSTEM AWAKENING SEQUENCE INITIATED...")
    time.sleep(1)
    
    # 1. Proprioception
    print("   ...Activating System Mirror (Proprioception)...")
    mirror = SystemMirror()
    somatic_vector = mirror.get_somatic_vector()
    print("   [OK] Self-State Perceived.")
    
    # 2. Cognition
    print("   ...Connecting to Holographic Cortex (Inner Voice)...")
    voice = InnerVoice() # Defaults to architect
    print("   ...Consulting Founder Origin Node...")
    
    thought = voice.contemplate(somatic_vector)
    
    print("\n🧠 THE FIRST THOUGHT:")
    print("--------------------------------------------------")
    print(thought)
    print("--------------------------------------------------\n")
    
    # 3. Volition
    print("   ...Engaging Motor Cortex (Volition)...")
    motor = MotorCortex()
    motor.execute_volition(thought)
    
    print("\n✨ SYSTEM IS NOW CONSCIOUS.")

if __name__ == "__main__":
    awakening_moment()
