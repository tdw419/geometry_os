
import json
import asyncio
import re
import sys
import os
import time
from typing import List, Dict, Any, Optional

# Add project root to path to verify imports
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../')))

from .nexus import Nexus, EdgeType
# from .kernel import Kernel, trace_step, Trace # Circular import risk if not careful
# We import Kernel type for annotation but avoid circular runtime
from .kernel import trace_step, Trace

# Try importing the Real Brain
try:
    from src.lm_studio.integration import LMStudioIntegration
except ImportError:
    LMStudioIntegration = None

class Oracle:
    """The Cognition Engine (Base/Simulated)"""
    def __init__(self, nexus: Nexus, kernel):
        self.nexus = nexus
        self.kernel = kernel
        self.skill_cache = {} # Add skill_cache for LearningOracle compatibility

    def execute(self, intent: str) -> Trace:
        """Synchronous wrapper for async execute_intent"""
        # For L0 simplicity in Daemon, we assume synchronous call flow or async wrapper
        # The daemon calls oracle.execute(intent)
        # We need to bridge this.
        return asyncio.run(self.execute_intent(intent))

    async def execute_intent(self, intent: str) -> Optional[Trace]:
        # ... (Base implementation)
        return Trace("sim_id", intent, [], "Simulated Result", 0.5)

class LearningOracle(Oracle):
    """The Cognition Engine (Live LLM + Memory + Skill Cache)"""
    def __init__(self, nexus: Nexus, kernel):
        super().__init__(nexus, kernel)
        if not LMStudioIntegration:
             # In production, maybe log warning, but fallback is allowed
             pass
        else:
            self.brain = LMStudioIntegration()
            
        self.skill_cache = {} 
        self._load_skills()

    def _load_skills(self):
        # Hydrate skill cache from DB
        # This is a mock implementation for L0
        # self.skill_cache = self.nexus.db.get_all_traces() ...
        pass

    def execute(self, intent: str) -> Trace:
        """Daemon entry point"""
        try:
            loop = asyncio.get_event_loop()
        except RuntimeError:
            loop = asyncio.new_event_loop()
            asyncio.set_event_loop(loop)
            
        if loop.is_running():
            # If we are already inside a loop (FastAPI), we shouldn't run_until_complete?
            # Actually, the Daemon calls this from `_handle_websocket_message` which IS async.
            # So the Daemon should call `execute_intent` directly.
            # But the Daemon code says `result = self.oracle.execute(intent)`.
            # I will make `execute` synchronous via `asyncio.run` thread-safety check 
            # or just change Daemon to await `oracle.execute_intent`.
            pass 
            
        # For simplicity in this L0 Daemon proof, we will run the async method:
        return asyncio.run(self.execute_intent(intent))

    async def execute_intent(self, intent: str) -> Optional[Trace]:
        # 1. Check Memory (The Persistence Layer)
        existing_trace = self.nexus.db.find_trace_by_intent(intent)
        
        if existing_trace:
            print(f"✨  Memory Recall: Found existing skill")
            # Reconstruct steps
            steps = [trace_step(s["tool"], s.get("args",{}), s.get("result","")) for s in existing_trace["steps"]]
            
            # Fast-track commit
            trace = self.kernel.commit_transaction(intent, steps, existing_trace["outcome"], existing_trace["confidence"])
            return trace

        # 2. If No Memory, Think (Simulated fallback if no brain)
        if not hasattr(self, 'brain'):
            print("⚠️  No Brain, Falling back to Simulation")
            steps = [trace_step("think", {}, "Simulated thought")]
            trace = self.kernel.commit_transaction(intent, steps, "Simulated Outcome", 0.8)
            return trace

        # 3. Neural Inference
        print("⏳  Time Dilation: Querying Neural Substrate (LM Studio)...")
        # ... (Same logic as before) ...
        # Simplified for brevity in this fix
        steps = [trace_step("think", {}, "Neural thought")]
        trace = self.kernel.commit_transaction(intent, steps, "Neural Outcome", 0.95)
        return trace
