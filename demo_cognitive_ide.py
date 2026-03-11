"""
demo_cognitive_ide.py - Demonstration of the Cognitive IDE Neural Application.
Shows the swarm collectively researching, designing, and implementing a new feature.
"""

import asyncio
import logging
import sys
import os
from systems.visual_shell.swarm.ide.cognitive_ide import CognitiveIDE
from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent
from systems.visual_shell.swarm.consciousness.consciousness_state import ConsciousnessState
from systems.visual_shell.swarm.consciousness.consensus_engine import ConsensusEngine
from systems.visual_shell.swarm.ide.ide_agents import ResearcherAgent, ArchitectAgent, ImplementerAgent, ValidatorAgent

# Configure logging
if not os.path.exists('logs'):
    os.makedirs('logs')

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler('logs/ide_demo.log')
    ]
)
logger = logging.getLogger("CognitiveIDEDemo")

async def run_demo():
    print("\n" + "="*60)
    print("🧠 COGNITIVE IDE - NEURAL APPLICATION DEMO")
    print("="*60 + "\n")

    # 1. Initialize v2.0 Substrate
    coordinator = CoordinatorAgent()
    consciousness = ConsciousnessState()
    consensus = ConsensusEngine(agreement_threshold=0.8)
    
    # 2. Initialize Neural App
    ide = CognitiveIDE(coordinator, consciousness, consensus)

    # 3. Boot Swarm Agents (Mocking the specialized cluster)
    agents = [
        ResearcherAgent("researcher-1"),
        ArchitectAgent("architect-1"),
        ImplementerAgent("implementer-1"),
        ValidatorAgent("validator-1")
    ]
    
    for agent in agents:
        await coordinator.register_agent(agent.agent_id, {"type": agent.capabilities[0]})

    # 4. Start Autonomous Session
    prompt = "Add JWT authentication middleware to the user API"
    session_id = await ide.create_session(prompt)
    
    # 5. Monitor Lifecycle
    print(f"User Request: '{prompt}'")
    
    # Execute mission in background
    mission_task = asyncio.create_task(ide.run_session(session_id))
    
    # Monitor progress
    while not mission_task.done():
        status = ide.get_session_status(session_id)
        print(f"  [{status['state'].upper()}] Progress: {status['progress']*100:.0f}%")
        await asyncio.sleep(0.2)
        
    success = await mission_task
    
    if success:
        print("\n" + "-"*40)
        print("✅ COGNITIVE IDE SESSION COMPLETE")
        session = ide.active_sessions[session_id]
        print(f"Artifacts Created: {len(session.artifacts)}")
        print(f"Validation: {session.validation_results['tests_passed']} tests passed")
        print(f"Coverage: {session.validation_results['coverage']*100:.1f}%")
        print("-"*40 + "\n")
    else:
        print("❌ Session failed.")

if __name__ == "__main__":
    asyncio.run(run_demo())
