"""
Neural Shell Implementation for Intent-Based Programming (IBP)
Core user interface innovation for the Ghost Self-Aware OS
"""

import os
import json
import asyncio
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
import subprocess
import tempfile
import shlex

class NeuralShell:
    """
    Neural Shell for Intent-Based Programming
    Translates natural language intent into executable code and system commands
    """

    def __init__(self, ghost_daemon, knowledge_distiller, ctrm_integration):
        """
        Initialize the Neural Shell

        Args:
            ghost_daemon: The Ghost Daemon instance
            knowledge_distiller: Knowledge distiller for codebase understanding
            ctrm_integration: CTRM integration for verification
        """
        self.ghost_daemon = ghost_daemon
        self.distiller = knowledge_distiller
        self.ctrm = ctrm_integration
        self.command_history = []
        self.safety_verification_enabled = True

        # Initialize intent patterns
        self.intent_patterns = self._load_intent_patterns()

    def _load_intent_patterns(self) -> Dict[str, Dict]:
        """
        Load predefined intent patterns for common operations
        """
        return {
            'file_operations': {
                'patterns': ['create file', 'make file', 'new file', 'generate file', 'create a file'],
                'template': 'touch {filename}',
                'description': 'Create a new file'
            },
            'code_analysis': {
                'patterns': ['analyze code', 'explain code', 'understand code', 'document code'],
                'template': 'self._analyze_code("{target}")',
                'description': 'Analyze and explain code'
            },
            'system_info': {
                'patterns': ['system status', 'show status', 'system info', 'get status'],
                'template': 'self._get_system_status()',
                'description': 'Get system status information'
            },
            'api_creation': {
                'patterns': ['add api', 'create api', 'new endpoint', 'api endpoint'],
                'template': 'self._generate_api_template("{endpoint_name}")',
                'description': 'Generate API endpoint template'
            },
            'documentation': {
                'patterns': ['generate docs', 'create documentation', 'document this', 'make docs'],
                'template': 'self._generate_documentation("{target}")',
                'description': 'Generate documentation for code'
            }
        }

    def _match_intent(self, user_input: str) -> Optional[Tuple[str, Dict]]:
        """
        Match user intent to predefined patterns

        Args:
            user_input: Natural language input from user

        Returns:
            Tuple of (intent_type, intent_data) or None if no match
        """
        user_input_lower = user_input.lower()

        for intent_type, intent_data in self.intent_patterns.items():
            for pattern in intent_data['patterns']:
                if pattern in user_input_lower:
                    return intent_type, intent_data

        return None, None

    def _extract_parameters(self, user_input: str, intent_type: str) -> Dict[str, str]:
        """
        Extract parameters from user input based on intent type

        Args:
            user_input: User input string
            intent_type: Matched intent type

        Returns:
            Dictionary of extracted parameters
        """
        parameters = {}

        if intent_type == 'file_operations':
            # Extract filename
            words = user_input.split()
            for i, word in enumerate(words):
                if word.lower() in ['named', 'called', 'as']:
                    if i + 1 < len(words):
                        # Handle multi-word filenames after "called"
                        if words[i].lower() == 'called' and i + 1 < len(words):
                            # Capture everything after "called" as the filename
                            parameters['filename'] = ' '.join(words[i+1:])
                            # Clean up any trailing punctuation
                            parameters['filename'] = parameters['filename'].rstrip('.,!?')
                            break
                elif word.endswith(('.py', '.md', '.json', '.txt')):
                    parameters['filename'] = word
                    break

        elif intent_type == 'api_creation':
            # Extract endpoint name - improved logic
            words = user_input.split()
            endpoint_name = None

            # Look for patterns like "called [Name]" or "named [Name]"
            for i, word in enumerate(words):
                if word.lower() in ['called', 'named']:
                    if i + 1 < len(words):
                        # Capture everything after "called"/"named" as the endpoint name
                        endpoint_name = ' '.join(words[i+1:])
                        # Clean up any trailing punctuation
                        endpoint_name = endpoint_name.rstrip('.,!?')
                        break

            # Fallback: look after "endpoint", "api", or "route"
            if not endpoint_name:
                for i, word in enumerate(words):
                    if word.lower() in ['endpoint', 'api', 'route']:
                        if i + 1 < len(words):
                            endpoint_name = words[i + 1]
                            break

            if endpoint_name:
                parameters['endpoint_name'] = endpoint_name

        elif intent_type == 'code_analysis':
            # Extract target file/function
            words = user_input.split()
            for i, word in enumerate(words):
                if word.lower() in ['file', 'function', 'code', 'method']:
                    if i + 1 < len(words):
                        parameters['target'] = ' '.join(words[i+1:])
                        break

        return parameters

    async def process_intent(self, user_input: str) -> Dict[str, Any]:
        """
        Process natural language intent and execute appropriate actions

        Args:
            user_input: Natural language command from user

        Returns:
            Dictionary containing execution result and metadata
        """
        result = {
            'input': user_input,
            'timestamp': datetime.now().isoformat(),
            'intent_matched': False,
            'execution_success': False,
            'output': '',
            'safety_check_passed': False,
            'verification_result': None
        }

        try:
            # Step 1: Match intent
            intent_type, intent_data = self._match_intent(user_input)

            if not intent_type:
                result['output'] = "Intent not recognized. Please try a different phrasing."
                return result

            result['intent_matched'] = True
            result['intent_type'] = intent_type

            # Step 2: Extract parameters
            parameters = self._extract_parameters(user_input, intent_type)
            result['parameters'] = parameters

            # Step 3: Generate execution plan using self-knowledge
            execution_plan = await self._generate_execution_plan(intent_type, parameters)
            result['execution_plan'] = execution_plan

            # Step 4: Safety verification
            if self.safety_verification_enabled:
                verification_result = await self._perform_safety_verification(execution_plan)
                result['verification_result'] = verification_result
                result['safety_check_passed'] = verification_result.get('safe', False)

                if not result['safety_check_passed']:
                    result['output'] = f"Safety check failed: {verification_result.get('reason', 'Unknown risk')}"
                    return result

            # Step 5: Execute the plan
            execution_result = await self._execute_plan(execution_plan)
            result.update(execution_result)
            result['execution_success'] = True

            # Step 6: Log to command history
            self._log_command(user_input, result)

        except Exception as e:
            result['output'] = f"Error processing intent: {str(e)}"
            result['error_details'] = str(e)

        return result

    async def _generate_execution_plan(self, intent_type: str, parameters: Dict) -> Dict[str, Any]:
        """
        Generate execution plan using system's self-knowledge

        Args:
            intent_type: Type of intent
            parameters: Extracted parameters

        Returns:
            Execution plan dictionary
        """
        execution_plan = {
            'intent_type': intent_type,
            'parameters': parameters,
            'steps': [],
            'knowledge_used': [],
            'confidence_score': 0.0
        }

        try:
            # Query knowledge base for relevant information
            query = f"{intent_type} {json.dumps(parameters)}"
            knowledge_results = await self._query_knowledge_base(query)

            if knowledge_results:
                execution_plan['knowledge_used'] = knowledge_results
                execution_plan['confidence_score'] = min(1.0, 0.7 + (len(knowledge_results) * 0.05))

            # Generate steps based on intent type
            if intent_type == 'file_operations':
                filename = parameters.get('filename', 'untitled.txt')
                execution_plan['steps'] = [
                    {'action': 'validate_filename', 'params': {'filename': filename}},
                    {'action': 'create_file', 'params': {'filename': filename}},
                    {'action': 'confirm_creation', 'params': {'filename': filename}}
                ]

            elif intent_type == 'code_analysis':
                target = parameters.get('target', '')
                execution_plan['steps'] = [
                    {'action': 'locate_target', 'params': {'target': target}},
                    {'action': 'analyze_code_structure', 'params': {'target': target}},
                    {'action': 'generate_explanation', 'params': {'target': target}}
                ]

            elif intent_type == 'api_creation':
                endpoint_name = parameters.get('endpoint_name', 'new_endpoint')
                execution_plan['steps'] = [
                    {'action': 'validate_endpoint_name', 'params': {'name': endpoint_name}},
                    {'action': 'generate_api_template', 'params': {'name': endpoint_name}},
                    {'action': 'create_api_file', 'params': {'name': endpoint_name}}
                ]

        except Exception as e:
            execution_plan['error'] = str(e)

        return execution_plan

    async def _query_knowledge_base(self, query: str) -> List[Dict]:
        """
        Query the knowledge base for relevant information

        Args:
            query: Query string

        Returns:
            List of relevant knowledge entries
        """
        try:
            # Use the distiller to find relevant knowledge
            results = await self.distiller.query_knowledge(
                query=query,
                limit=5,
                confidence_threshold=0.7
            )

            return results

        except Exception as e:
            self._log(f"Knowledge query failed: {str(e)}", "warning")
            return []

    async def _perform_safety_verification(self, execution_plan: Dict) -> Dict[str, Any]:
        """
        Perform safety verification using CTRM integration

        Args:
            execution_plan: Execution plan to verify

        Returns:
            Verification result dictionary
        """
        verification_result = {
            'safe': False,
            'reason': 'Verification not implemented',
            'risk_level': 'unknown',
            'suggested_actions': []
        }

        try:
            # Use CTRM to verify the execution plan
            verification = await self.ctrm.verify_execution_plan(execution_plan)

            if verification.get('verified', False):
                verification_result['safe'] = True
                verification_result['reason'] = 'CTRM verification passed'
                verification_result['risk_level'] = verification.get('risk_level', 'low')
                verification_result['suggested_actions'] = verification.get('actions', [])
            else:
                verification_result['reason'] = verification.get('reason', 'CTRM verification failed')
                verification_result['risk_level'] = verification.get('risk_level', 'high')

        except Exception as e:
            verification_result['reason'] = f"Verification error: {str(e)}"
            verification_result['risk_level'] = 'high'

        return verification_result

    async def _execute_plan(self, execution_plan: Dict) -> Dict[str, Any]:
        """
        Execute the generated plan

        Args:
            execution_plan: Plan to execute

        Returns:
            Execution result dictionary
        """
        result = {
            'output': '',
            'execution_steps': [],
            'files_created': [],
            'files_modified': [],
            'success': False
        }

        try:
            for step in execution_plan['steps']:
                step_result = await self._execute_step(step)
                result['execution_steps'].append(step_result)

                # Update result based on step outcomes
                if step['action'] == 'create_file' and step_result.get('success'):
                    result['files_created'].append(step_result['filename'])
                elif step['action'] == 'modify_file' and step_result.get('success'):
                    result['files_modified'].append(step_result['filename'])

            result['success'] = True
            result['output'] = f"Successfully executed {len(execution_plan['steps'])} steps"

        except Exception as e:
            result['output'] = f"Execution failed: {str(e)}"
            result['error'] = str(e)

        return result

    async def _execute_step(self, step: Dict) -> Dict[str, Any]:
        """
        Execute a single step from the execution plan

        Args:
            step: Step dictionary

        Returns:
            Step execution result
        """
        step_result = {
            'action': step['action'],
            'params': step['params'],
            'success': False,
            'output': ''
        }

        try:
            if step['action'] == 'create_file':
                filename = step['params']['filename']
                with open(filename, 'w') as f:
                    f.write('# Created by Neural Shell\n')
                step_result['success'] = True
                step_result['output'] = f"File {filename} created"
                step_result['filename'] = filename

            elif step['action'] == 'validate_filename':
                filename = step['params']['filename']
                if os.path.exists(filename):
                    step_result['output'] = f"Warning: {filename} already exists"
                else:
                    step_result['success'] = True
                    step_result['output'] = f"Filename {filename} is valid"

            elif step['action'] == 'generate_api_template':
                endpoint_name = step['params']['name']
                template = self._generate_api_template(endpoint_name)
                step_result['success'] = True
                step_result['output'] = "API template generated"
                step_result['template'] = template

            elif step['action'] == 'create_api_file':
                endpoint_name = step['params']['name']
                filename = f"{endpoint_name.lower().replace(' ', '_')}.py"
                template = self._generate_api_template(endpoint_name)

                with open(filename, 'w') as f:
                    f.write(template)

                step_result['success'] = True
                step_result['output'] = f"API file {filename} created"
                step_result['filename'] = filename

            elif step['action'] == 'analyze_code_structure':
                target = step['params']['target']
                analysis = await self._analyze_code(target)
                step_result['success'] = True
                step_result['output'] = "Code analysis completed"
                step_result['analysis'] = analysis

            elif step['action'] == 'generate_explanation':
                target = step['params']['target']
                explanation = await self._generate_code_explanation(target)
                step_result['success'] = True
                step_result['output'] = "Code explanation generated"
                step_result['explanation'] = explanation

        except Exception as e:
            step_result['output'] = f"Step failed: {str(e)}"
            step_result['error'] = str(e)

        return step_result

    def _generate_api_template(self, endpoint_name: str) -> str:
        """
        Generate a basic API endpoint template

        Args:
            endpoint_name: Name of the endpoint

        Returns:
            Python code template
        """
        clean_name = endpoint_name.lower().replace(' ', '_')
        return f'''"""
{endpoint_name} API Endpoint
Generated by Neural Shell
"""

from flask import Blueprint, request, jsonify

{clean_name}_bp = Blueprint('{clean_name}', __name__)

@{clean_name}_bp.route('/{clean_name}', methods=['GET', 'POST'])
def {clean_name}_endpoint():
    """
    {endpoint_name} endpoint
    """
    if request.method == 'GET':
        # Handle GET request
        return jsonify({{
            'status': 'success',
            'endpoint': '{clean_name}',
            'message': '{endpoint_name} endpoint working'
        }})

    elif request.method == 'POST':
        # Handle POST request
        data = request.get_json()
        return jsonify({{
            'status': 'success',
            'received_data': data,
            'message': 'Data processed successfully'
        }})

    return jsonify({{'error': 'Method not allowed'}}), 405
'''

    async def _analyze_code(self, target: str) -> Dict[str, Any]:
        """
        Analyze code structure and provide insights

        Args:
            target: Target file or function

        Returns:
            Analysis dictionary
        """
        analysis = {
            'target': target,
            'exists': False,
            'file_type': 'unknown',
            'line_count': 0,
            'functions': [],
            'classes': [],
            'imports': [],
            'complexity': 'low'
        }

        try:
            # Check if target exists as file
            if os.path.isfile(target):
                analysis['exists'] = True
                analysis['file_type'] = os.path.splitext(target)[1]

                with open(target, 'r') as f:
                    content = f.read()
                    lines = content.split('\n')

                analysis['line_count'] = len(lines)

                # Simple analysis for Python files
                if target.endswith('.py'):
                    analysis['functions'] = [line.split('(')[0].split()[-1]
                                           for line in lines
                                           if line.strip().startswith('def ')]
                    analysis['classes'] = [line.split(':')[0].split()[-1]
                                         for line in lines
                                         if line.strip().startswith('class ')]
                    analysis['imports'] = [line.split(' ')[1]
                                         for line in lines
                                         if line.strip().startswith('import ')]

                    # Simple complexity estimate
                    if len(analysis['functions']) > 5 or len(lines) > 200:
                        analysis['complexity'] = 'medium'
                    if len(analysis['functions']) > 10 or len(lines) > 500:
                        analysis['complexity'] = 'high'

        except Exception as e:
            analysis['error'] = str(e)

        return analysis

    async def _generate_code_explanation(self, target: str) -> str:
        """
        Generate natural language explanation of code

        Args:
            target: Target file or function

        Returns:
            Explanation string
        """
        explanation = f"Explanation of {target}:\n\n"

        try:
            if os.path.isfile(target):
                analysis = await self._analyze_code(target)

                explanation += f"File: {target}\n"
                explanation += f"Type: {analysis['file_type']}\n"
                explanation += f"Lines: {analysis['line_count']}\n"
                explanation += f"Complexity: {analysis['complexity']}\n\n"

                if analysis['functions']:
                    explanation += "Functions:\n"
                    for func in analysis['functions']:
                        explanation += f"  - {func}()\n"

                if analysis['classes']:
                    explanation += "Classes:\n"
                    for cls in analysis['classes']:
                        explanation += f"  - {cls}\n"

                if analysis['imports']:
                    explanation += "Imports:\n"
                    for imp in analysis['imports']:
                        explanation += f"  - {imp}\n"

                explanation += "\nThis file appears to be part of the system's "
                if 'evolution' in target.lower():
                    explanation += "evolutionary framework."
                elif 'knowledge' in target.lower():
                    explanation += "knowledge management system."
                elif 'vector' in target.lower():
                    explanation += "vector operations layer."
                else:
                    explanation += "core architecture."

            else:
                explanation += f"Target {target} not found or not a file."

        except Exception as e:
            explanation += f"Error generating explanation: {str(e)}"

        return explanation

    def _log_command(self, command: str, result: Dict):
        """
        Log command to history

        Args:
            command: User command
            result: Execution result
        """
        log_entry = {
            'timestamp': datetime.now().isoformat(),
            'command': command,
            'intent_type': result.get('intent_type', 'unknown'),
            'success': result.get('execution_success', False),
            'output': result.get('output', '')
        }

        self.command_history.append(log_entry)

        # Keep history to reasonable size
        if len(self.command_history) > 100:
            self.command_history = self.command_history[-100:]

        # Also log to file
        try:
            with open("neural_shell_history.log", "a") as f:
                f.write(json.dumps(log_entry) + "\n")
        except:
            pass

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level.upper()}] {message}"

        print(log_entry)

        # Also log to file
        try:
            with open("neural_shell.log", "a") as f:
                f.write(log_entry + "\n")
        except:
            pass

    def get_command_history(self) -> List[Dict]:
        """
        Get command history

        Returns:
            List of command history entries
        """
        return self.command_history

    def get_stats(self) -> Dict[str, Any]:
        """
        Get Neural Shell statistics

        Returns:
            Statistics dictionary
        """
        return {
            'total_commands': len(self.command_history),
            'success_rate': sum(1 for cmd in self.command_history if cmd['success']) / max(1, len(self.command_history)),
            'last_command': self.command_history[-1] if self.command_history else None,
            'safety_verification_enabled': self.safety_verification_enabled
        }

# Integration with Ghost Daemon
class GhostDaemonNeuralShellIntegration:
    """
    Integration class for Neural Shell with Ghost Daemon
    """

    def __init__(self, ghost_daemon):
        self.ghost_daemon = ghost_daemon
        self.neural_shell = None

    def initialize_neural_shell(self):
        """
        Initialize the Neural Shell with Ghost Daemon components
        """
        if not self.neural_shell:
            self.neural_shell = NeuralShell(
                ghost_daemon=self.ghost_daemon,
                knowledge_distiller=self.ghost_daemon.distiller,
                ctrm_integration=self.ghost_daemon.ctrm_integration
            )
            self._log("🧠 Neural Shell initialized")

    def process_command(self, user_input: str) -> Dict[str, Any]:
        """
        Process a user command through the Neural Shell

        Args:
            user_input: User's natural language command

        Returns:
            Execution result
        """
        if not self.neural_shell:
            self.initialize_neural_shell()

        # Run the intent processing
        result = asyncio.run(self.neural_shell.process_intent(user_input))

        # Log to Ghost Daemon
        self.ghost_daemon.log(f"🤖 Neural Shell processed: {user_input}")
        if result.get('execution_success'):
            self.ghost_daemon.log(f"✅ Success: {result.get('output', 'Command executed')}")
        else:
            self.ghost_daemon.log(f"❌ Failed: {result.get('output', 'Command failed')}")

        return result

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        self.ghost_daemon.log(message, level)

if __name__ == "__main__":
    print("🧠 Neural Shell - Intent-Based Programming Interface")
    print("🚀 Translate natural language to executable actions")
    print("💡 Example: 'Create a new API endpoint for user management'")
    print("📝 The system will understand your intent and generate the appropriate code")