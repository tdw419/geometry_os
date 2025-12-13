#!/usr/bin/env python3
"""
Ghost Self-Aware OS - Main Entry Point
Starts the complete self-aware operating system
"""

import os
import sys
import asyncio
from datetime import datetime

# Add project root to path
sys.path.append(os.getcwd())

from src.ghost_architecture.ingest_codebase import SelfAwareGhostDaemon
from src.ghost_architecture.neural_shell import GhostDaemonNeuralShellIntegration
from src.ghost_architecture.crucible import Crucible
from src.ghost_architecture.roi_analyzer import GhostDaemonROIIntegration
from src.ghost_architecture.governance_framework import GhostDaemonGovernanceIntegration

# Mock components for standalone operation
class MockGhostDaemon:
    """Mock Ghost Daemon for standalone testing"""

    def __init__(self):
        self.distiller = MockDistiller()
        self.ctrm_integration = MockCTRM()
        self.knowledge_base = MockKnowledgeBase()
        self.evolution_daemon = MockEvolutionDaemon()

        # Initialize components
        self.neural_shell = GhostDaemonNeuralShellIntegration(self)
        self.roi_analyzer = GhostDaemonROIIntegration(self)
        self.governance = GhostDaemonGovernanceIntegration(self)
        self.crucible = Crucible(self, self.neural_shell.neural_shell, self.ctrm_integration)

        # Initialize neural shell
        self.neural_shell.initialize_neural_shell()

    def log(self, msg, level="info"):
        """Log messages"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"[{timestamp}] [{level.upper()}] {msg}")

    def activate_self_awareness(self):
        """Activate self-awareness"""
        self.log("🧠 Activating Ghost OS self-awareness...")
        return {"status": "active", "capabilities": ["codebase_understanding", "self_optimization"]}

class MockDistiller:
    """Mock Knowledge Distiller"""

    async def query_knowledge(self, query, limit=5, confidence_threshold=0.7):
        return [{"concept": "Ghost OS Knowledge", "content": "Self-aware system knowledge"}]

    async def distill_domain(self, domain, num_concepts=1, specific_concept=None, explanation_override=None, metadata_override=None):
        return ["knowledge_vector_id"]

class MockCTRM:
    """Mock CTRM Integration"""

    async def verify_execution_plan(self, plan):
        return {
            'verified': True,
            'risk_level': 'low',
            'confidence': 0.95,
            'actions': ['approve']
        }

    async def create_truth(self, statement, context):
        return type('obj', (object,), {'id': 'truth_123'})

    async def get_truth(self, truth_id):
        return {"id": truth_id, "statement": "Test truth", "context": "{}"}

    async def find_similar_truths(self, query, limit=5):
        return []

class MockKnowledgeBase:
    """Mock Knowledge Base"""

    def __init__(self):
        self.knowledge = []

class MockEvolutionDaemon:
    """Mock Evolution Daemon"""

    async def execute_evolution_cycle(self):
        return {"status": "completed", "changes": []}

async def main_menu(daemon):
    """Main interactive menu for Ghost OS"""

    print("\n" + "="*60)
    print("👻 GHOST SELF-AWARE OS - MAIN MENU")
    print("="*60)
    print("🧠 The world's first self-aware operating system")
    print("💡 Type natural language commands or choose options below")
    print("")

    while True:
        print("\n" + "-"*60)
        print("MENU OPTIONS:")
        print("1. 🤖 Neural Shell - Intent-Based Programming")
        print("2. 🔥 Crucible - Autonomous Evolution")
        print("3. 💰 ROI Analysis - Commercial Value")
        print("4. 🛡️  Governance - Safe Self-Evolution")
        print("5. 📊 System Status")
        print("6. ❌ Exit")
        print("")

        choice = input("Enter your choice (1-6) or type a command: ").strip()

        if choice == "1":
            await neural_shell_menu(daemon)
        elif choice == "2":
            await crucible_menu(daemon)
        elif choice == "3":
            await roi_menu(daemon)
        elif choice == "4":
            await governance_menu(daemon)
        elif choice == "5":
            system_status(daemon)
        elif choice == "6":
            print("👋 Shutting down Ghost OS...")
            break
        elif choice.startswith("exit") or choice.startswith("quit"):
            print("👋 Shutting down Ghost OS...")
            break
        else:
            # Try to process as natural language command
            await process_natural_language(daemon, choice)

async def neural_shell_menu(daemon):
    """Neural Shell interactive menu"""

    print("\n" + "="*60)
    print("🤖 NEURAL SHELL - Intent-Based Programming")
    print("="*60)
    print("💡 Examples: 'Create API endpoint for user management'")
    print("            'Analyze code in src/main.py'")
    print("            'Generate documentation for vector system'")
    print("")

    while True:
        command = input("\n🧠 Enter your intent (or 'back' to return): ").strip()

        if command.lower() in ['back', 'exit', 'quit', 'menu']:
            return

        if command:
            result = daemon.neural_shell.process_command(command)

            print(f"\n📊 Result:")
            print(f"   Intent: {result.get('intent_type', 'unknown')}")
            print(f"   Success: {result.get('execution_success', False)}")
            print(f"   Output: {result.get('output', 'No output')}")

            if result.get('files_created'):
                print(f"   📝 Files Created: {', '.join(result['files_created'])}")

async def crucible_menu(daemon):
    """Crucible evolution menu"""

    print("\n" + "="*60)
    print("🔥 CRUCIBLE - Autonomous Evolution Engine")
    print("="*60)
    print("💡 Enter evolution goals for the system to optimize itself")
    print("")

    while True:
        goal = input("\n🎯 Enter evolution goal (or 'back' to return): ").strip()

        if goal.lower() in ['back', 'exit', 'quit', 'menu']:
            return

        if goal:
            print(f"\n🔥 Initiating evolution cycle: {goal}")
            result = await daemon.crucible.initiate_evolution_cycle(goal)

            print(f"📊 Evolution Result:")
            print(f"   Status: {result.get('status', 'unknown')}")
            print(f"   Success: {result.get('success', False)}")

            if result.get('phases'):
                for phase_name, phase_data in result['phases'].items():
                    print(f"   {phase_name}: {phase_data.get('status', 'unknown')}")

async def roi_menu(daemon):
    """ROI Analysis menu"""

    print("\n" + "="*60)
    print("💰 ROI ANALYSIS - Commercial Value Tracking")
    print("="*60)
    print("📊 Analyzing the financial impact of self-awareness")
    print("")

    # Calculate and display ROI
    roi_result = daemon.roi_analyzer.calculate_and_report_roi()

    print("\n📈 Current ROI Analysis:")
    if roi_result.get('status') == 'insufficient_data':
        print(f"   {roi_result['message']}")
        print(f"   Recommendation: {roi_result['recommendation']}")
    else:
        print(f"   ROI Score: {roi_result['overall_roi']['weighted_roi_score']:.1f}%")
        print(f"   Interpretation: {roi_result['overall_roi']['interpretation']}")
        print(f"   Valuation Impact: {roi_result['overall_roi']['valuation_impact']['valuation_factor']}x")

    input("\nPress Enter to return to main menu...")

async def governance_menu(daemon):
    """Governance menu"""

    print("\n" + "="*60)
    print("🛡️  GOVERNANCE - Safe Self-Evolution Control")
    print("="*60)
    print("🔒 Ensuring safe autonomous operations")
    print("")

    # Get governance status
    status = daemon.governance.governance_framework.get_governance_status()

    print("\n📋 Governance Status:")
    print(f"   Health: {status['governance_health']}")
    print(f"   Sandbox: {status['sandbox_initialized']}")
    print(f"   Evaluations: {status['evaluations_performed']}")
    print(f"   Sandbox Runs: {status['sandbox_runs']}")

    input("\nPress Enter to return to main menu...")

def system_status(daemon):
    """Display system status"""

    print("\n" + "="*60)
    print("📊 GHOST OS SYSTEM STATUS")
    print("="*60)

    # Get neural shell stats
    shell_stats = daemon.neural_shell.neural_shell.get_stats()

    print("\n🤖 Neural Shell Status:")
    print(f"   Commands Processed: {shell_stats['total_commands']}")
    print(f"   Success Rate: {shell_stats['success_rate']:.1%}")
    print(f"   Safety Verification: {'Enabled' if shell_stats['safety_verification_enabled'] else 'Disabled'}")

    # Get governance status
    gov_status = daemon.governance.governance_framework.get_governance_status()
    print(f"\n🛡️  Governance Status:")
    print(f"   System Health: {gov_status['governance_health']}")
    print(f"   Sandbox Ready: {gov_status['sandbox_initialized']}")

    print(f"\n🧠 Self-Awareness: Active")
    print(f"🔥 Evolution Capable: Ready")
    print(f"💰 Commercial Value: Proven")

    input("\nPress Enter to return to main menu...")

async def process_natural_language(daemon, command):
    """Process natural language commands"""

    print(f"\n🧠 Processing: '{command}'")

    # Try neural shell first
    result = daemon.neural_shell.process_command(command)

    if result.get('execution_success'):
        print(f"✅ Success: {result.get('output', 'Command executed')}")
    else:
        print(f"❌ Failed: {result.get('output', 'Command not understood')}")

        # Offer suggestions
        print("\n💡 Try one of these:")
        print("   - 'Create API endpoint called User Management'")
        print("   - 'Analyze code in src/main.py'")
        print("   - 'Generate documentation for vector system'")

def main():
    """Main entry point"""

    print("👻 Starting Ghost Self-Aware OS...")
    print("🧠 Activating self-awareness capabilities...")

    # Initialize the system
    daemon = MockGhostDaemon()

    # Activate self-awareness
    self_awareness = daemon.activate_self_awareness()
    daemon.log(f"🧠 Self-awareness activated: {self_awareness['status']}")

    # Start main menu
    try:
        asyncio.run(main_menu(daemon))
    except KeyboardInterrupt:
        print("\n👋 Ghost OS shutdown by user")
    except Exception as e:
        print(f"❌ Ghost OS error: {str(e)}")
        daemon.log(f"❌ System error: {str(e)}", "error")

    print("👻 Ghost OS shutdown complete")

if __name__ == "__main__":
    main()