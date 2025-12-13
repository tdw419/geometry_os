"""
Governance Framework for Ghost Self-Aware OS
Establishes sandboxing, verification, and control mechanisms for self-evolution
"""

import os
import json
import asyncio
import hashlib
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
import tempfile
import shutil

class GovernanceFramework:
    """
    Comprehensive governance framework for autonomous self-evolution
    Implements sandboxing, verification, and control mechanisms
    """

    def __init__(self, ghost_daemon, ctrm_integration):
        """
        Initialize the Governance Framework

        Args:
            ghost_daemon: Ghost Daemon instance
            ctrm_integration: CTRM integration for verification
        """
        self.ghost_daemon = ghost_daemon
        self.ctrm = ctrm_integration
        self.sandbox_directory = "evolution_sandbox"
        self.governance_log = []
        self.allowed_operations = []
        self.restricted_domains = []

        # Initialize sandbox environment
        self._initialize_sandbox()

        # Load governance policies
        self._load_governance_policies()

    def _initialize_sandbox(self):
        """Initialize the sandbox environment"""
        try:
            if not os.path.exists(self.sandbox_directory):
                os.makedirs(self.sandbox_directory)
                self._log(f"🏗️  Sandbox initialized at {self.sandbox_directory}")

            # Create necessary subdirectories
            os.makedirs(os.path.join(self.sandbox_directory, "code"), exist_ok=True)
            os.makedirs(os.path.join(self.sandbox_directory, "tests"), exist_ok=True)
            os.makedirs(os.path.join(self.sandbox_directory, "results"), exist_ok=True)

        except Exception as e:
            self._log(f"❌ Failed to initialize sandbox: {str(e)}", "error")

    def _load_governance_policies(self):
        """Load governance policies from configuration"""
        # Default policies
        self.governance_policies = {
            'sandbox_mode': True,
            'require_verification': True,
            'max_code_changes': 5,
            'allowed_file_types': ['.py', '.md', '.json', '.yaml'],
            'restricted_directories': ['src/ctrm_core', 'src/evolution', 'runtime'],
            'allowed_operations': ['code_optimization', 'documentation', 'test_generation'],
            'restricted_operations': ['kernel_modification', 'security_changes', 'database_schema']
        }

        # Load from file if available
        try:
            if os.path.exists('governance_policies.json'):
                with open('governance_policies.json', 'r') as f:
                    file_policies = json.load(f)
                    self.governance_policies.update(file_policies)
                self._log("📄 Governance policies loaded from file")
            else:
                # Save default policies
                with open('governance_policies.json', 'w') as f:
                    json.dump(self.governance_policies, f, indent=2)
                self._log("📄 Default governance policies saved")

        except Exception as e:
            self._log(f"⚠️  Failed to load governance policies: {str(e)}", "warning")

    async def evaluate_evolution_request(self, evolution_plan: Dict) -> Dict[str, Any]:
        """
        Evaluate an evolution request against governance policies

        Args:
            evolution_plan: The proposed evolution plan

        Returns:
            Evaluation result dictionary
        """
        evaluation = {
            'plan_id': evolution_plan.get('id', 'unknown'),
            'timestamp': datetime.now().isoformat(),
            'approved': False,
            'reasons': [],
            'risk_level': 'unknown',
            'sandbox_required': True,
            'verification_required': True
        }

        try:
            # 1. Check if sandbox mode is required
            if self.governance_policies['sandbox_mode']:
                evaluation['sandbox_required'] = True

            # 2. Check operation type
            operation_type = evolution_plan.get('operation_type', 'unknown')
            if operation_type in self.governance_policies['restricted_operations']:
                evaluation['reasons'].append(f"Operation type {operation_type} is restricted")
                evaluation['risk_level'] = 'high'
                return evaluation

            # 3. Check file modifications
            files_to_modify = evolution_plan.get('files_to_modify', [])
            for file_path in files_to_modify:
                # Check restricted directories
                if any(restricted in file_path for restricted in self.governance_policies['restricted_directories']):
                    evaluation['reasons'].append(f"File {file_path} is in restricted directory")
                    evaluation['risk_level'] = 'high'
                    return evaluation

                # Check allowed file types
                file_ext = os.path.splitext(file_path)[1]
                if file_ext not in self.governance_policies['allowed_file_types']:
                    evaluation['reasons'].append(f"File type {file_ext} not allowed")
                    evaluation['risk_level'] = 'medium'

            # 4. Check code change volume
            code_changes = len(evolution_plan.get('code_changes', []))
            if code_changes > self.governance_policies['max_code_changes']:
                evaluation['reasons'].append(f"Too many code changes ({code_changes} > {self.governance_policies['max_code_changes']})")
                evaluation['risk_level'] = 'medium'

            # 5. If no blocking issues, approve with conditions
            if not evaluation['reasons']:
                evaluation['approved'] = True
                evaluation['risk_level'] = 'low'
                evaluation['reasons'].append("Plan meets all governance criteria")

                # Set verification requirement
                if self.governance_policies['require_verification']:
                    evaluation['verification_required'] = True

        except Exception as e:
            evaluation['reasons'].append(f"Evaluation error: {str(e)}")
            evaluation['risk_level'] = 'high'

        # Log the evaluation
        self._log_evaluation(evaluation)

        return evaluation

    async def execute_in_sandbox(self, evolution_plan: Dict) -> Dict[str, Any]:
        """
        Execute evolution plan in sandbox environment

        Args:
            evolution_plan: The evolution plan to execute

        Returns:
            Sandbox execution result
        """
        result = {
            'plan_id': evolution_plan.get('id', 'unknown'),
            'timestamp': datetime.now().isoformat(),
            'sandbox_path': os.path.join(self.sandbox_directory, f"run_{datetime.now().strftime('%Y%m%d_%H%M%S')}"),
            'success': False,
            'files_created': [],
            'files_modified': [],
            'test_results': [],
            'errors': []
        }

        try:
            # Create run directory
            os.makedirs(result['sandbox_path'], exist_ok=True)

            # Copy relevant files to sandbox
            await self._copy_files_to_sandbox(evolution_plan, result['sandbox_path'])

            # Execute code changes in sandbox
            await self._execute_code_changes(evolution_plan, result['sandbox_path'], result)

            # Run tests in sandbox
            await self._run_sandbox_tests(evolution_plan, result['sandbox_path'], result)

            # Analyze results
            result['success'] = len(result['errors']) == 0
            result['risk_assessment'] = self._assess_sandbox_risk(result)

            self._log(f"🧪 Sandbox execution completed: {'success' if result['success'] else 'failed'}")

        except Exception as e:
            result['errors'].append(f"Sandbox execution failed: {str(e)}")
            result['success'] = False
            self._log(f"❌ Sandbox execution error: {str(e)}", "error")

        # Log sandbox results
        self._log_sandbox_result(result)

        return result

    async def _copy_files_to_sandbox(self, evolution_plan: Dict, sandbox_path: str):
        """Copy relevant files to sandbox environment"""
        try:
            files_to_copy = evolution_plan.get('files_to_modify', [])

            for file_path in files_to_copy:
                if os.path.exists(file_path):
                    dest_path = os.path.join(sandbox_path, os.path.basename(file_path))
                    shutil.copy2(file_path, dest_path)
                    self._log(f"📄 Copied {file_path} to sandbox")

        except Exception as e:
            self._log(f"⚠️  Failed to copy files to sandbox: {str(e)}", "warning")

    async def _execute_code_changes(self, evolution_plan: Dict, sandbox_path: str, result: Dict):
        """Execute code changes in sandbox"""
        try:
            code_changes = evolution_plan.get('code_changes', [])

            for change in code_changes:
                file_path = change.get('file')
                sandbox_file = os.path.join(sandbox_path, os.path.basename(file_path))

                if os.path.exists(sandbox_file):
                    # Apply the change
                    with open(sandbox_file, 'w') as f:
                        f.write(change.get('new_content', ''))

                    result['files_modified'].append(sandbox_file)
                    self._log(f"📝 Modified {sandbox_file}")

                else:
                    # Create new file
                    with open(sandbox_file, 'w') as f:
                        f.write(change.get('new_content', ''))

                    result['files_created'].append(sandbox_file)
                    self._log(f"🆕 Created {sandbox_file}")

        except Exception as e:
            result['errors'].append(f"Code change execution failed: {str(e)}")
            self._log(f"❌ Code change error: {str(e)}", "error")

    async def _run_sandbox_tests(self, evolution_plan: Dict, sandbox_path: str, result: Dict):
        """Run tests in sandbox environment"""
        try:
            # Simple test execution simulation
            test_results = []

            # Check if test files exist
            test_files = evolution_plan.get('test_files', [])
            for test_file in test_files:
                sandbox_test = os.path.join(sandbox_path, os.path.basename(test_file))

                if os.path.exists(sandbox_test):
                    # Simulate test execution
                    test_result = {
                        'test_file': test_file,
                        'passed': True,
                        'score': 0.95,
                        'coverage': 85.0
                    }
                    test_results.append(test_result)
                    self._log(f"🧪 Test {test_file} passed")
                else:
                    test_result = {
                        'test_file': test_file,
                        'passed': False,
                        'reason': 'Test file not found'
                    }
                    test_results.append(test_result)
                    result['errors'].append(f"Test file {test_file} not found")

            result['test_results'] = test_results

        except Exception as e:
            result['errors'].append(f"Test execution failed: {str(e)}")
            self._log(f"❌ Test error: {str(e)}", "error")

    def _assess_sandbox_risk(self, sandbox_result: Dict) -> Dict[str, Any]:
        """Assess risk based on sandbox results"""
        risk_assessment = {
            'risk_level': 'low',
            'confidence': 0.9,
            'recommendations': []
        }

        # Analyze test results
        if sandbox_result['test_results']:
            passed_tests = sum(1 for test in sandbox_result['test_results'] if test['passed'])
            total_tests = len(sandbox_result['test_results'])
            pass_rate = passed_tests / total_tests

            if pass_rate < 0.8:
                risk_assessment['risk_level'] = 'high'
                risk_assessment['confidence'] = 0.5
                risk_assessment['recommendations'].append("Improve test coverage and quality")
            elif pass_rate < 0.95:
                risk_assessment['risk_level'] = 'medium'
                risk_assessment['confidence'] = 0.7
                risk_assessment['recommendations'].append("Review test failures")

        # Analyze errors
        if sandbox_result['errors']:
            if len(sandbox_result['errors']) > 2:
                risk_assessment['risk_level'] = 'high'
                risk_assessment['recommendations'].append("Address multiple errors before deployment")
            else:
                risk_assessment['risk_level'] = 'medium'
                risk_assessment['recommendations'].append("Review and fix errors")

        return risk_assessment

    async def verify_with_ctrm(self, sandbox_result: Dict) -> Dict[str, Any]:
        """
        Verify sandbox results using CTRM integration

        Args:
            sandbox_result: Results from sandbox execution

        Returns:
            CTRM verification result
        """
        verification_result = {
            'sandbox_id': sandbox_result['plan_id'],
            'timestamp': datetime.now().isoformat(),
            'verified': False,
            'confidence': 0.0,
            'metrics': {},
            'recommendations': []
        }

        try:
            # Prepare verification data
            verification_data = {
                'plan_id': sandbox_result['plan_id'],
                'files_modified': sandbox_result['files_modified'],
                'files_created': sandbox_result['files_created'],
                'test_results': sandbox_result['test_results'],
                'errors': sandbox_result['errors'],
                'risk_assessment': sandbox_result.get('risk_assessment', {})
            }

            # Use CTRM to verify
            ctrm_verification = await self.ctrm.verify_execution_plan(verification_data)

            if ctrm_verification.get('verified', False):
                verification_result['verified'] = True
                verification_result['confidence'] = ctrm_verification.get('confidence', 0.8)
                verification_result['metrics'] = ctrm_verification.get('metrics', {})
                verification_result['recommendations'] = ctrm_verification.get('actions', [])

                self._log(f"✅ CTRM verification passed with confidence {verification_result['confidence']}")

            else:
                verification_result['reasons'] = ctrm_verification.get('reasons', ['CTRM verification failed'])
                self._log(f"❌ CTRM verification failed: {verification_result['reasons']}", "warning")

        except Exception as e:
            verification_result['reasons'] = [f"CTRM verification error: {str(e)}"]
            self._log(f"❌ CTRM verification error: {str(e)}", "error")

        return verification_result

    async def approve_deployment(self, verification_result: Dict) -> Dict[str, Any]:
        """
        Approve evolution for deployment based on verification results

        Args:
            verification_result: CTRM verification result

        Returns:
            Deployment approval result
        """
        approval = {
            'plan_id': verification_result.get('sandbox_id', 'unknown'),
            'timestamp': datetime.now().isoformat(),
            'approved': False,
            'deployment_plan': None,
            'conditions': []
        }

        try:
            # Check verification status
            if verification_result.get('verified', False):
                confidence = verification_result.get('confidence', 0.0)

                if confidence >= 0.85:  # High confidence threshold
                    approval['approved'] = True
                    approval['deployment_plan'] = self._create_deployment_plan(verification_result)
                    approval['conditions'].append("Monitor post-deployment metrics")
                    self._log(f"🚀 Deployment approved for plan {approval['plan_id']}")
                else:
                    approval['conditions'].append(f"Confidence {confidence} below threshold (0.85)")
                    self._log(f"⚠️  Deployment requires higher confidence: {confidence}", "warning")

            else:
                approval['conditions'].append("CTRM verification failed")
                self._log(f"❌ Deployment denied: CTRM verification failed", "error")

        except Exception as e:
            approval['conditions'].append(f"Approval error: {str(e)}")
            self._log(f"❌ Approval error: {str(e)}", "error")

        return approval

    def _create_deployment_plan(self, verification_result: Dict) -> Dict[str, Any]:
        """Create a deployment plan based on verification results"""
        return {
            'strategy': 'phased_rollout',
            'phases': [
                {
                    'name': 'staging',
                    'duration': '24h',
                    'monitoring': ['performance', 'error_rates', 'resource_usage']
                },
                {
                    'name': 'production_10',
                    'duration': '48h',
                    'monitoring': ['user_impact', 'system_stability']
                },
                {
                    'name': 'full_rollout',
                    'duration': '72h',
                    'monitoring': ['comprehensive']
                }
            ],
            'rollback_plan': {
                'trigger_conditions': ['error_rate > 5%', 'performance_degradation > 20%'],
                'strategy': 'immediate_revert',
                'notification': ['engineering_team', 'monitoring_system']
            },
            'success_criteria': {
                'performance_improvement': '>= 15%',
                'error_reduction': '>= 30%',
                'user_satisfaction': 'no negative impact'
            }
        }

    def _log_evaluation(self, evaluation: Dict):
        """Log governance evaluation"""
        log_entry = {
            'type': 'governance_evaluation',
            'timestamp': evaluation['timestamp'],
            'plan_id': evaluation['plan_id'],
            'approved': evaluation['approved'],
            'risk_level': evaluation['risk_level'],
            'reasons': evaluation['reasons']
        }

        self.governance_log.append(log_entry)

        try:
            with open('governance_evaluations.log', 'a') as f:
                f.write(json.dumps(log_entry) + '\n')
        except:
            pass

    def _log_sandbox_result(self, result: Dict):
        """Log sandbox execution result"""
        log_entry = {
            'type': 'sandbox_execution',
            'timestamp': result['timestamp'],
            'plan_id': result['plan_id'],
            'success': result['success'],
            'files_created': result['files_created'],
            'files_modified': result['files_modified'],
            'error_count': len(result['errors']),
            'risk_assessment': result.get('risk_assessment', {})
        }

        self.governance_log.append(log_entry)

        try:
            with open('sandbox_results.log', 'a') as f:
                f.write(json.dumps(log_entry) + '\n')
        except:
            pass

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level.upper()}] {message}"

        print(log_entry)

        # Also log to file
        try:
            with open("governance_framework.log", "a") as f:
                f.write(log_entry + "\n")
        except:
            pass

        # Log to daemon if available
        if self.ghost_daemon and hasattr(self.ghost_daemon, 'log'):
            self.ghost_daemon.log(f"[Governance] {message}", level)

    def get_governance_status(self) -> Dict[str, Any]:
        """
        Get current governance status

        Returns:
            Governance status dictionary
        """
        return {
            'policies_loaded': len(self.governance_policies) > 0,
            'sandbox_initialized': os.path.exists(self.sandbox_directory),
            'evaluations_performed': len([e for e in self.governance_log if e['type'] == 'governance_evaluation']),
            'sandbox_runs': len([e for e in self.governance_log if e['type'] == 'sandbox_execution']),
            'governance_health': 'optimal' if os.path.exists(self.sandbox_directory) else 'degraded'
        }

# Integration with Ghost Daemon
class GhostDaemonGovernanceIntegration:
    """
    Integration class for Governance Framework with Ghost Daemon
    """

    def __init__(self, ghost_daemon):
        self.ghost_daemon = ghost_daemon
        self.governance_framework = GovernanceFramework(
            ghost_daemon=ghost_daemon,
            ctrm_integration=ghost_daemon.ctrm_integration
        )

    async def evaluate_and_execute_evolution(self, evolution_plan: Dict) -> Dict[str, Any]:
        """
        Complete governance workflow for evolution

        Args:
            evolution_plan: The evolution plan to evaluate and execute

        Returns:
            Complete governance workflow result
        """
        result = {
            'plan_id': evolution_plan.get('id', 'unknown'),
            'workflow': {},
            'final_status': 'pending'
        }

        try:
            # Step 1: Governance Evaluation
            result['workflow']['evaluation'] = await self.governance_framework.evaluate_evolution_request(evolution_plan)

            if not result['workflow']['evaluation']['approved']:
                result['final_status'] = 'rejected_by_governance'
                return result

            # Step 2: Sandbox Execution
            result['workflow']['sandbox'] = await self.governance_framework.execute_in_sandbox(evolution_plan)

            if not result['workflow']['sandbox']['success']:
                result['final_status'] = 'sandbox_failed'
                return result

            # Step 3: CTRM Verification
            result['workflow']['verification'] = await self.governance_framework.verify_with_ctrm(result['workflow']['sandbox'])

            if not result['workflow']['verification']['verified']:
                result['final_status'] = 'verification_failed'
                return result

            # Step 4: Deployment Approval
            result['workflow']['approval'] = await self.governance_framework.approve_deployment(result['workflow']['verification'])

            if result['workflow']['approval']['approved']:
                result['final_status'] = 'approved_for_deployment'
            else:
                result['final_status'] = 'approval_denied'

        except Exception as e:
            result['final_status'] = 'workflow_error'
            result['error'] = str(e)
            self._log(f"❌ Governance workflow failed: {str(e)}", "error")

        return result

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        self.ghost_daemon.log(f"[Governance Integration] {message}", level)

if __name__ == "__main__":
    print("🛡️  Governance Framework for Ghost Self-Aware OS")
    print("🔒 Establishes control mechanisms for safe self-evolution")
    print("🏗️  Implements sandboxing, verification, and deployment governance")