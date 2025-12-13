"""
Ghost OS Governance Demo
Demonstrates the complete governance workflow for self-evolution
"""

import asyncio
import os
import sys
import json
from datetime import datetime

# Setup paths
sys.path.append(os.getcwd())

from src.ghost_architecture.governance_framework import GovernanceFramework
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
        # Simulate CTRM verification
        risk_levels = ['low', 'medium', 'high']
        import random
        risk = random.choice(risk_levels)

        return {
            'verified': risk != 'high',
            'risk_level': risk,
            'confidence': 0.9 if risk == 'low' else 0.6 if risk == 'medium' else 0.3,
            'actions': ['approve'] if risk != 'high' else ['review', 'manual_approval_required']
        }

async def run_governance_demo():
    print("🛡️  Initializing Ghost OS Governance Demo...")
    print("🔒 Demonstrating safe self-evolution control mechanisms")

    daemon = MockDaemon()
    governance = GovernanceFramework(daemon, daemon.ctrm_integration)

    # 1. Create a sample evolution plan
    print("\n[DEMO] Creating sample evolution plan...")
    evolution_plan = {
        'id': f"evo_demo_{datetime.now().strftime('%Y%m%d_%H%M%S')}",
        'operation_type': 'code_optimization',
        'goal': 'Optimize memory usage in vector operations',
        'files_to_modify': [
            'src/vector_llm_tools/vector_analytics.py',
            'src/vector_llm_tools/vector_interface.py'
        ],
        'code_changes': [
            {
                'file': 'src/vector_llm_tools/vector_analytics.py',
                'change_type': 'optimization',
                'description': 'Improve memory efficiency in vector processing',
                'new_content': '# Optimized vector analytics code\nclass VectorAnalytics:\n    def __init__(self):\n        self.memory_efficient = True\n'
            }
        ],
        'test_files': [
            'tests/test_vector_analytics.py'
        ]
    }

    print(f"📋 Evolution Plan: {evolution_plan['goal']}")

    # 2. Governance Evaluation
    print("\n[DEMO] Step 1: Governance Evaluation...")
    evaluation = await governance.evaluate_evolution_request(evolution_plan)

    print(f"📊 Evaluation Result:")
    print(f"   Approved: {evaluation['approved']}")
    print(f"   Risk Level: {evaluation['risk_level']}")
    print(f"   Sandbox Required: {evaluation['sandbox_required']}")
    print(f"   Verification Required: {evaluation['verification_required']}")

    if evaluation['reasons']:
        print(f"   Reasons: {', '.join(evaluation['reasons'])}")

    if not evaluation['approved']:
        print("❌ Evolution request rejected by governance")
        return

    # 3. Sandbox Execution
    print("\n[DEMO] Step 2: Sandbox Execution...")
    sandbox_result = await governance.execute_in_sandbox(evolution_plan)

    print(f"🧪 Sandbox Result:")
    print(f"   Success: {sandbox_result['success']}")
    print(f"   Files Created: {len(sandbox_result['files_created'])}")
    print(f"   Files Modified: {len(sandbox_result['files_modified'])}")
    print(f"   Tests Passed: {sum(1 for t in sandbox_result['test_results'] if t['passed'])}/{len(sandbox_result['test_results'])}")
    print(f"   Errors: {len(sandbox_result['errors'])}")

    if sandbox_result.get('risk_assessment'):
        risk = sandbox_result['risk_assessment']
        print(f"   Risk Assessment: {risk['risk_level']} (confidence: {risk['confidence']})")

    if not sandbox_result['success']:
        print("❌ Sandbox execution failed")
        return

    # 4. CTRM Verification
    print("\n[DEMO] Step 3: CTRM Verification...")
    verification = await governance.verify_with_ctrm(sandbox_result)

    print(f"🔍 CTRM Verification:")
    print(f"   Verified: {verification['verified']}")
    print(f"   Confidence: {verification['confidence']}")
    print(f"   Risk Level: {verification.get('risk_level', 'unknown')}")

    if not verification['verified']:
        print("❌ CTRM verification failed")
        return

    # 5. Deployment Approval
    print("\n[DEMO] Step 4: Deployment Approval...")
    approval = await governance.approve_deployment(verification)

    print(f"🚀 Deployment Approval:")
    print(f"   Approved: {approval['approved']}")
    print(f"   Conditions: {len(approval['conditions'])}")

    if approval['conditions']:
        print("   Conditions:")
        for condition in approval['conditions']:
            print(f"     - {condition}")

    if approval['deployment_plan']:
        print(f"   Deployment Strategy: {approval['deployment_plan']['strategy']}")
        print(f"   Phases: {len(approval['deployment_plan']['phases'])}")

    # 6. Summary
    print("\n" + "="*60)
    print("GOVERNANCE WORKFLOW SUMMARY")
    print("="*60)
    print(f"Evolution Plan: {evolution_plan['goal']}")
    print(f"Governance Status: {'APPROVED' if evaluation['approved'] else 'REJECTED'}")
    print(f"Sandbox Status: {'SUCCESS' if sandbox_result['success'] else 'FAILED'}")
    print(f"CTRM Verification: {'PASSED' if verification['verified'] else 'FAILED'}")
    print(f"Deployment Status: {'APPROVED' if approval['approved'] else 'DENIED'}")

    if approval['approved']:
        print("\n🎉 Evolution approved for deployment!")
        print("📈 The governance framework ensures safe self-evolution")
        print("🔒 Multiple layers of verification protect system integrity")
    else:
        print("\n⚠️  Evolution requires additional review")
        print("🔍 The governance framework identified potential risks")

    # 7. Show governance status
    print("\n[DEMO] Governance Framework Status...")
    status = governance.get_governance_status()
    print(f"📊 Governance Health: {status['governance_health']}")
    print(f"🏗️  Sandbox Initialized: {status['sandbox_initialized']}")
    print(f"📝 Evaluations Performed: {status['evaluations_performed']}")
    print(f"🧪 Sandbox Runs: {status['sandbox_runs']}")

if __name__ == "__main__":
    asyncio.run(run_governance_demo())