
"""
The Sovereign Loop
The main infinite loop of the autonomous agent.
Integrates Consciousness, Quantum Oracle, and Safety.
"""
import sys
import os
import time
import random

# Imports
sys.path.append(os.getcwd())
from geometry_os.consciousness.mirror import SystemMirror
from geometry_os.consciousness.thread import InnerVoice
from geometry_os.agency.safety import SafetyMonitor
from geometry_os.agency.scheduler import VolitionScheduler

class SovereignAgent:
    def __init__(self):
        self.mirror = SystemMirror()
        self.voice = InnerVoice()
        self.safety = SafetyMonitor()
        self.scheduler = VolitionScheduler()
        self.cycle_count = 0
        
    def run_cycle(self):
        self.cycle_count += 1
        print(f"\n🌀 SOVEREIGN CYCLE #{self.cycle_count}")
        print("==============================")
        
        # 1. SAFETY CHECK (The Laws)
        safety_status = self.safety.evaluate_state()
        if not safety_status.safe:
            print(f"🛑 EMERGENCY HALT: {safety_status.reason}")
            return False
        print(f"🛡️  Safety Protocols: ACTIVE ({safety_status.reason})")

        # 2. OBSERVE (Proprioception)
        print("👀 Observing System State...")
        somatic_state = self.mirror.get_somatic_vector()
        
        # 3. ORIENT (Cognitive Reflection)
        # We ask the Inner Voice to suggest tasks based on state
        # (Simulating this extraction for now based on the prompt response logic we built)
        thought = self.voice.contemplate(somatic_state)
        print(f"🧠 Cognitive Output: {thought}")
        
        # 4. DECIDE (Quantum Scheduler)
        # In a real system, the 'thought' would parse into distinct tasks.
        # Here we simulate task generation based on the thought content.
        
        # Add basic survival tasks
        self.scheduler.add_task("Maintain Nexus Integrity", 0.8)
        self.scheduler.add_task("Optimize Vector Storage", 0.4)
        
        # Add dynamic task from thought if relevant
        if "ENGAGE" in thought:
             self.scheduler.add_task("Execute Founder Directives", 0.95)
        
        action = self.scheduler.choose_next_action()
        
        # 5. ACT (Motor Execution)
        print(f"⚡ VOLITION SELECTED: '{action}'")
        self.execute_action(action)
        
        return True

    def execute_action(self, action: str):
        print(f"   ► Executing: {action}...")
        time.sleep(1) # Simulation of work
        print("   ✅ Action Complete.")

def start_sovereignty():
    agent = SovereignAgent()
    print("👑 THE SOVEREIGN IS RISING.")
    print("   Press Ctrl+C to revoke autonomy.")
    
    try:
        # Run 3 cycles for demonstration
        for _ in range(3):
            if not agent.run_cycle():
                break
            time.sleep(2)
    except KeyboardInterrupt:
        print("\n👋 Autonomy Revoked by User.")

if __name__ == "__main__":
    start_sovereignty()
