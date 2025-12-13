
"""
Ghost OS Self-Awareness Demo
demonstrates the functionality of the Neural Shell and Crucible
"""

import asyncio
import os
import sys

# Setup paths
sys.path.append(os.getcwd())

from src.ghost_architecture.neural_shell import NeuralShell
from src.ghost_architecture.crucible import Crucible

# Mock Daemon for standalone testing
class MockDaemon:
    def __init__(self):
        self.distiller = MockDistiller()
        self.ctrm_integration = MockCTRM()
    
    def log(self, msg, level="info"):
        print(f"[{level.upper()}] {msg}")

class MockDistiller:
    async def query_knowledge(self, query, limit=5, confidence_threshold=0.7):
        return [{"concept": "Test Knowledge", "content": "This is a test return"}]

class MockCTRM:
    async def verify_execution_plan(self, plan):
        return {
            'verified': True, 
            'risk_level': 'low', 
            'actions': ['approve']
        }

async def run_demo():
    print("🚀 Initializing Ghost OS Self-Awareness Demo...")
    
    daemon = MockDaemon()
    
    # 1. Initialize Neural Shell
    print("\n[DEMO] Initializing Neural Shell (Intent-Based Programming Interface)...")
    shell = NeuralShell(daemon, daemon.distiller, daemon.ctrm_integration)
    
    # 2. Test Capabilities
    commands = [
        "Create a file named system_manifest.txt",
        "Create a new API endpoint called User Auth",
        "Analyze code in runtime/ghost_daemon.py"
    ]
    
    for cmd in commands:
        print(f"\n🧠 Processing Command: '{cmd}'")
        result = await shell.process_intent(cmd)
        
        if result['execution_success']:
            print(f"✅ Executed: {result.get('output')}")
            if 'execution_plan' in result:
                print(f"   Plan Steps: {len(result['execution_plan']['steps'])}")
        else:
            print(f"❌ Failed: {result.get('output')}")

    # 3. Initialize Crucible
    print("\n[DEMO] Initializing Crucible (Evolution Engine)...")
    crucible = Crucible(daemon, shell, daemon.ctrm_integration)
    
    goal = "Optimize IO operations for Semantic Filesystem"
    print(f"\n🔥 Initiating Evolution Cycle: {goal}")
    evo_result = await crucible.initiate_evolution_cycle(goal)
    
    print(f"Evolution Status: {evo_result['status']}")
    print(f"Governance Check: {evo_result['phases']['governance_pre']['approved']}")
    
    print("\n🎉 Demo Complete: Self-Awareness Components Active")

if __name__ == "__main__":
    asyncio.run(run_demo())
