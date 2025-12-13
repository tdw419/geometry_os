#!/usr/bin/env python3
"""
Code Health Monitor for Proactive Refactoring

This component analyzes the codebase for potential refactoring opportunities
and integrates with the CTRM-Powered LLM OS Daemon to propose improvements.
"""

import ast
import os
import re
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass
import json
from datetime import datetime
import asyncio
import time
@dataclass
class CodeSmell:
    """Represents a potential code quality issue"""
    file_path: str
    line_number: int
    smell_type: str
    description: str
    severity: str  # "low", "medium", "high"
    confidence: float
    context: str

@dataclass
class RefactorProposal:
    """Represents a proposed code refactoring"""
    file_path: str
    start_line: int
    end_line: int
    current_code: str
    proposed_code: str
    improvement_type: str
    justification: str
    confidence: float
    estimated_impact: float
    risk_level: str  # "low", "medium", "high"
    validation_status: str = "pending"  # "pending", "approved", "rejected", "applied"

class CodeHealthAnalyzer:
    """Analyzes Python code for quality issues and refactoring opportunities"""

    def __init__(self, codebase_root: str = "src"):
        self.codebase_root = codebase_root
        self.smell_patterns = {
            "long_function": {
                "pattern": self._check_long_function,
                "severity": "medium",
                "description": "Function exceeds recommended length"
            },
            "complex_function": {
                "pattern": self._check_complex_function,
                "severity": "high",
                "description": "Function has high cyclomatic complexity"
            },
            "duplicate_code": {
                "pattern": self._check_duplicate_code,
                "severity": "high",
                "description": "Potential code duplication detected"
            },
            "missing_types": {
                "pattern": self._check_missing_types,
                "severity": "low",
                "description": "Function lacks type annotations"
            },
            "long_parameter_list": {
                "pattern": self._check_long_parameter_list,
                "severity": "medium",
                "description": "Function has too many parameters"
            },
            "nested_loops": {
                "pattern": self._check_nested_loops,
                "severity": "medium",
                "description": "Excessive loop nesting detected"
            },
            "magic_numbers": {
                "pattern": self._check_magic_numbers,
                "severity": "low",
                "description": "Hardcoded numeric literals found"
            }
        }

    def scan_codebase(self) -> List[CodeSmell]:
        """Scan the entire codebase for code smells"""
        smells = []

        for root, dirs, files in os.walk(self.codebase_root):
            for file in files:
                if file.endswith('.py'):
                    file_path = os.path.join(root, file)
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                        file_smells = self.analyze_file(file_path, content)
                        smells.extend(file_smells)
                    except Exception as e:
                        print(f"⚠️  Error analyzing {file_path}: {e}")

        return smells

    def analyze_file(self, file_path: str, content: str) -> List[CodeSmell]:
        """Analyze a single Python file for code smells"""
        smells = []

        try:
            tree = ast.parse(content)
        except SyntaxError:
            # Skip files with syntax errors
            return smells

        # Check for various code smells
        for smell_type, pattern_info in self.smell_patterns.items():
            pattern_smells = pattern_info["pattern"](file_path, content, tree)
            for smell in pattern_smells:
                smell.smell_type = smell_type
                smell.severity = pattern_info["severity"]
                smells.append(smell)

        return smells

    def _check_long_function(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for functions that are too long"""
        smells = []
        lines = content.split('\n')

        for node in ast.walk(tree):
            if isinstance(node, ast.FunctionDef):
                start_line = node.lineno
                end_line = node.end_lineno if hasattr(node, 'end_lineno') else start_line

                # Count actual lines of code (excluding blank lines and comments)
                func_lines = []
                for i in range(start_line - 1, min(end_line, len(lines))):
                    line = lines[i].strip()
                    if line and not line.startswith('#'):
                        func_lines.append(line)

                if len(func_lines) > 50:  # More than 50 lines of actual code
                    context = '\n'.join(func_lines[:5]) + f"\n... ({len(func_lines)} lines total)"
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=start_line,
                        smell_type="long_function",
                        description=f"Function '{node.name}' has {len(func_lines)} lines of code",
                        severity="medium",
                        confidence=0.9,
                        context=context
                    ))

        return smells

    def _check_complex_function(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for functions with high cyclomatic complexity"""
        smells = []

        def calculate_complexity(node):
            """Calculate cyclomatic complexity for a function"""
            complexity = 1  # Base complexity

            for child in ast.walk(node):
                if isinstance(child, (ast.If, ast.For, ast.While, ast.ExceptHandler)):
                    complexity += 1
                elif isinstance(child, ast.BoolOp):
                    complexity += 1
                elif isinstance(child, (ast.And, ast.Or)):
                    complexity += 1

            return complexity

        for node in ast.walk(tree):
            if isinstance(node, ast.FunctionDef):
                complexity = calculate_complexity(node)
                if complexity > 10:  # High complexity threshold
                    lines = content.split('\n')
                    context = '\n'.join(lines[node.lineno - 1:min(node.lineno + 4, len(lines))])
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=node.lineno,
                        smell_type="complex_function",
                        description=f"Function '{node.name}' has complexity {complexity}",
                        severity="high",
                        confidence=0.85,
                        context=context
                    ))

        return smells

    def _check_missing_types(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for functions missing type annotations"""
        smells = []

        for node in ast.walk(tree):
            if isinstance(node, ast.FunctionDef):
                # Check if function has type annotations
                has_return_annotation = node.returns is not None
                has_param_annotations = all(
                    arg.annotation is not None
                    for arg in node.args.args
                    if arg.arg != 'self'  # Skip self parameter
                )

                if not has_return_annotation or not has_param_annotations:
                    lines = content.split('\n')
                    context = lines[node.lineno - 1]  # Function signature
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=node.lineno,
                        smell_type="missing_types",
                        description=f"Function '{node.name}' missing type annotations",
                        severity="low",
                        confidence=0.95,
                        context=context
                    ))

        return smells

    def _check_long_parameter_list(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for functions with too many parameters"""
        smells = []

        for node in ast.walk(tree):
            if isinstance(node, ast.FunctionDef):
                # Count non-self parameters
                param_count = len([arg for arg in node.args.args if arg.arg != 'self'])

                if param_count > 5:  # More than 5 parameters
                    lines = content.split('\n')
                    context = lines[node.lineno - 1]  # Function signature
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=node.lineno,
                        smell_type="long_parameter_list",
                        description=f"Function '{node.name}' has {param_count} parameters",
                        severity="medium",
                        confidence=0.9,
                        context=context
                    ))

        return smells

    def _check_nested_loops(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for excessive loop nesting"""
        smells = []

        def find_nested_loops(node, depth=0):
            """Recursively find nested loops"""
            if isinstance(node, (ast.For, ast.While)):
                depth += 1
                if depth > 3:  # More than 3 levels of nesting
                    lines = content.split('\n')
                    context = '\n'.join(lines[node.lineno - 1:min(node.lineno + 2, len(lines))])
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=node.lineno,
                        smell_type="nested_loops",
                        description=f"Loop nesting depth {depth} detected",
                        severity="medium",
                        confidence=0.8,
                        context=context
                    ))

            for child in ast.iter_child_nodes(node):
                find_nested_loops(child, depth)

        find_nested_loops(tree)
        return smells

    def _check_magic_numbers(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for hardcoded magic numbers"""
        smells = []
        lines = content.split('\n')

        for node in ast.walk(tree):
            if isinstance(node, ast.Num) and isinstance(node.n, (int, float)):
                # Skip common "safe" numbers
                if node.n in [0, 1, 2, -1, 0.0, 1.0]:
                    continue

                # Check if the number appears in a context that suggests it might be magic
                parent = None
                for parent_node in ast.walk(tree):
                    for child in ast.iter_child_nodes(parent_node):
                        if child is node:
                            parent = parent_node
                            break

                if parent and not isinstance(parent, (ast.Assign, ast.AugAssign)):
                    # Number is not being assigned to a variable
                    context = lines[node.lineno - 1].strip()
                    smells.append(CodeSmell(
                        file_path=file_path,
                        line_number=node.lineno,
                        smell_type="magic_numbers",
                        description=f"Magic number {node.n} found",
                        severity="low",
                        confidence=0.7,
                        context=context
                    ))

        return smells

    def _check_duplicate_code(self, file_path: str, content: str, tree: ast.AST) -> List[CodeSmell]:
        """Check for potential code duplication"""
        # This is a simplified version - in practice would use more sophisticated analysis
        smells = []
        lines = content.split('\n')

        # Look for identical consecutive lines that might indicate duplication
        for i in range(len(lines) - 1):
            if (lines[i].strip() and
                lines[i].strip() == lines[i + 1].strip() and
                not lines[i].strip().startswith('#')):
                smells.append(CodeSmell(
                    file_path=file_path,
                    line_number=i + 1,
                    smell_type="duplicate_code",
                    description="Potential duplicate code detected",
                    severity="high",
                    confidence=0.6,
                    context=f"Line {i+1}: {lines[i].strip()}"
                ))

        return smells

class RefactorProposer:
    """Proposes specific refactoring solutions for detected code smells"""

    def __init__(self, ctrm_interface=None):
        self.ctrm_interface = ctrm_interface

    async def generate_refactor_proposals(self, smells: List[CodeSmell]) -> List[RefactorProposal]:
        """Generate specific refactoring proposals for code smells"""
        proposals = []

        for smell in smells:
            proposal = await self._generate_proposal_for_smell(smell)
            if proposal:
                proposals.append(proposal)

        return proposals

    async def _generate_proposal_for_smell(self, smell: CodeSmell) -> Optional[RefactorProposal]:
        """Generate a specific refactoring proposal for a code smell"""
        lines = smell.context.split('\n')
        file_path = smell.file_path

        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                full_content = f.read()
            full_lines = full_content.split('\n')
        except Exception as e:
            print(f"⚠️  Error reading file {file_path}: {e}")
            return None

        # Find the exact lines for the smell
        start_line = smell.line_number - 1  # Convert to 0-based index
        end_line = start_line

        # Try to find a reasonable code block
        if smell.smell_type == "long_function":
            # Find the entire function
            in_function = False
            function_start = None
            function_end = None
            indent_level = None

            for i, line in enumerate(full_lines):
                if i == start_line and line.strip().startswith('def '):
                    in_function = True
                    function_start = i
                    indent_level = len(line) - len(line.lstrip())
                    continue

                if in_function:
                    if (line.strip() and not line.strip().startswith('#') and
                        len(line) - len(line.lstrip()) <= indent_level and
                        line.strip()):
                        function_end = i
                        break

            if function_start is not None and function_end is not None:
                current_code = '\n'.join(full_lines[function_start:function_end])
                proposed_code = self._generate_refactored_function(current_code)
                return self._create_proposal(
                    file_path, function_start + 1, function_end,
                    current_code, proposed_code,
                    "function_refactor", "Split long function into smaller, focused functions",
                    0.85, 0.7, "medium"
                )

        elif smell.smell_type == "complex_function":
            # Similar to long function but focus on complexity
            in_function = False
            function_start = None
            function_end = None
            indent_level = None

            for i, line in enumerate(full_lines):
                if i == start_line and line.strip().startswith('def '):
                    in_function = True
                    function_start = i
                    indent_level = len(line) - len(line.lstrip())
                    continue

                if in_function:
                    if (line.strip() and not line.strip().startswith('#') and
                        len(line) - len(line.lstrip()) <= indent_level and
                        line.strip()):
                        function_end = i
                        break

            if function_start is not None and function_end is not None:
                current_code = '\n'.join(full_lines[function_start:function_end])
                proposed_code = self._simplify_complex_function(current_code)
                return self._create_proposal(
                    file_path, function_start + 1, function_end,
                    current_code, proposed_code,
                    "complexity_reduction", "Reduce function complexity through decomposition",
                    0.8, 0.6, "medium"
                )

        elif smell.smell_type == "missing_types":
            # Add type annotations
            function_line = full_lines[start_line]
            if function_line.strip().startswith('def '):
                proposed_code = self._add_type_annotations(function_line)
                return self._create_proposal(
                    file_path, start_line + 1, start_line + 1,
                    function_line, proposed_code,
                    "type_annotation", "Add missing type annotations",
                    0.95, 0.3, "low"
                )

        elif smell.smell_type == "long_parameter_list":
            # Refactor long parameter list
            function_line = full_lines[start_line]
            if function_line.strip().startswith('def '):
                proposed_code = self._refactor_parameter_list(function_line)
                return self._create_proposal(
                    file_path, start_line + 1, start_line + 1,
                    function_line, proposed_code,
                    "parameter_refactor", "Reduce parameter count using data structures",
                    0.9, 0.5, "low"
                )

        return None

    def _create_proposal(self, file_path: str, start_line: int, end_line: int,
                        current_code: str, proposed_code: str, improvement_type: str,
                        justification: str, confidence: float, impact: float,
                        risk: str) -> RefactorProposal:
        """Create a refactor proposal"""
        return RefactorProposal(
            file_path=file_path,
            start_line=start_line,
            end_line=end_line,
            current_code=current_code,
            proposed_code=proposed_code,
            improvement_type=improvement_type,
            justification=justification,
            confidence=confidence,
            estimated_impact=impact,
            risk_level=risk
        )

    def _generate_refactored_function(self, function_code: str) -> str:
        """Generate a refactored version of a long function"""
        lines = function_code.split('\n')
        if not lines:
            return function_code

        # Simple heuristic: look for natural breaks in the function
        # This is a placeholder - real implementation would use more sophisticated analysis
        indent = len(lines[0]) - len(lines[0].lstrip())
        function_name = lines[0].strip().replace('def ', '').split('(')[0]

        # Find potential extraction points
        extraction_points = []
        current_block_start = 1  # Start after function definition

        for i in range(1, len(lines)):
            line = lines[i]
            if (line.strip() and not line.strip().startswith('#') and
                (line.strip().startswith('if ') or
                 line.strip().startswith('for ') or
                 line.strip().startswith('while '))):
                # Potential block to extract
                if i - current_block_start > 5:  # At least 5 lines between blocks
                    extraction_points.append((current_block_start, i - 1))
                    current_block_start = i

        if extraction_points:
            # Generate extracted functions
            extracted_code = []
            main_function = [lines[0]]  # Keep original function definition

            for start, end in extraction_points:
                # Create extracted function
                block_lines = lines[start:end + 1]
                extracted_name = f"_{function_name}_part_{len(extracted_code) + 1}"
                extracted_func = [
                    f"def {extracted_name}():",
                    block_lines[0].replace(block_lines[0], f"    {block_lines[0].strip()}"),
                ]

                for line in block_lines[1:]:
                    extracted_func.append(f"    {line.strip()}")

                extracted_code.extend(extracted_func)
                extracted_code.append("")  # Blank line

                # Replace original block with function call
                main_function.append(f"    {extracted_name}()")

            # Add remaining code
            if current_block_start < len(lines):
                for line in lines[current_block_start:]:
                    main_function.append(f"    {line.strip()}")

            # Combine everything
            return '\n'.join(extracted_code + [''] + main_function)

        return function_code

    def _simplify_complex_function(self, function_code: str) -> str:
        """Simplify a complex function"""
        # This is a placeholder - real implementation would analyze control flow
        # and suggest specific simplifications
        return f"{function_code}\n\n# TODO: Refactor this complex function by:\n# 1. Extracting helper functions\n# 2. Reducing nested conditionals\n# 3. Using early returns where appropriate"

    def _add_type_annotations(self, function_line: str) -> str:
        """Add type annotations to a function"""
        # Simple heuristic-based type annotation
        if '->' not in function_line:
            # Add return type annotation
            if function_line.strip().startswith('def '):
                parts = function_line.split('def ')[1].split('(')
                func_name = parts[0].strip()
                params_part = '(' + '('.join(parts[1:])

                # Add -> Any as default return type
                return f"def {func_name}{params_part} -> Any:"

        return function_line

    def _refactor_parameter_list(self, function_line: str) -> str:
        """Refactor a function with too many parameters"""
        # Simple heuristic: suggest using a dataclass or dict
        if function_line.strip().startswith('def '):
            parts = function_line.split('def ')[1].split('(')
            func_name = parts[0].strip()
            params_part = '(' + '('.join(parts[1:])

            # Count parameters (simple approach)
            param_count = params_part.count(',') + 1

            if param_count > 5:
                # Suggest using a config object
                return f"def {func_name}(config: dict) -> Any:  # Refactor: Use config dict instead of {param_count} parameters"

        return function_line

class CodeHealthMonitorDaemon:
    """Integrates code health monitoring with the CTRM-Powered LLM OS Daemon"""

    def __init__(self, ctrm_daemon):
        self.ctrm_daemon = ctrm_daemon
        self.analyzer = CodeHealthAnalyzer()
        self.proposer = RefactorProposer(ctrm_daemon.ctrm if hasattr(ctrm_daemon, 'ctrm') else None)
        self.scan_interval = 3600  # 1 hour
        self.last_scan_time = 0
        self.pending_proposals = []

    async def run_continuous_monitoring(self):
        """Run continuous code health monitoring"""
        print("🔍 Starting continuous code health monitoring")

        while True:
            try:
                # Check if it's time to scan
                current_time = time.time()
                if current_time - self.last_scan_time >= self.scan_interval:
                    await self.perform_code_health_scan()
                    self.last_scan_time = current_time

                # Process any pending proposals
                await self.process_pending_proposals()

                # Sleep for a while
                await asyncio.sleep(300)  # Check every 5 minutes

            except Exception as e:
                print(f"⚠️  Error in code health monitoring: {e}")
                await asyncio.sleep(60)  # Wait before retrying

    async def perform_code_health_scan(self):
        """Perform a complete code health scan"""
        print("🔬 Performing code health scan...")

        # Scan the codebase
        smells = self.analyzer.scan_codebase()

        # Generate refactoring proposals
        proposals = await self.proposer.generate_refactor_proposals(smells)

        # Store proposals for review
        self.pending_proposals.extend(proposals)

        # Log results in CTRM
        if hasattr(self.ctrm_daemon, 'ctrm'):
            await self.ctrm_daemon.ctrm.create_truth(
                statement=f"Code health scan completed: {len(smells)} smells detected, {len(proposals)} refactor proposals generated",
                context=json.dumps({
                    "smell_count": len(smells),
                    "proposal_count": len(proposals),
                    "smell_types": {smell.smell_type: 0 for smell in smells},
                    "timestamp": datetime.now().isoformat()
                }),
                confidence=0.9
            )

        print(f"📊 Code health scan complete: {len(smells)} smells, {len(proposals)} proposals")

        return {
            "smells": [self._smell_to_dict(smell) for smell in smells],
            "proposals": [self._proposal_to_dict(proposal) for proposal in proposals]
        }

    async def process_pending_proposals(self):
        """Process pending refactoring proposals"""
        if not self.pending_proposals:
            return

        print(f"📋 Processing {len(self.pending_proposals)} pending refactor proposals")

        # For now, just log them - in future this would integrate with approval workflow
        for proposal in self.pending_proposals:
            print(f"💡 Proposal: {proposal.improvement_type} in {proposal.file_path}")
            print(f"   Confidence: {proposal.confidence:.2f}, Impact: {proposal.estimated_impact:.2f}")
            print(f"   Risk: {proposal.risk_level}")

            # Store in CTRM for tracking
            if hasattr(self.ctrm_daemon, 'ctrm'):
                await self.ctrm_daemon.ctrm.create_truth(
                    statement=f"Refactor proposal: {proposal.improvement_type} in {proposal.file_path}",
                    context=json.dumps(self._proposal_to_dict(proposal)),
                    confidence=proposal.confidence
                )

        # Clear processed proposals
        self.pending_proposals = []

    def _smell_to_dict(self, smell: CodeSmell) -> Dict:
        """Convert CodeSmell to dictionary"""
        return {
            "file_path": smell.file_path,
            "line_number": smell.line_number,
            "smell_type": smell.smell_type,
            "description": smell.description,
            "severity": smell.severity,
            "confidence": smell.confidence,
            "context": smell.context
        }

    def _proposal_to_dict(self, proposal: RefactorProposal) -> Dict:
        """Convert RefactorProposal to dictionary"""
        return {
            "file_path": proposal.file_path,
            "start_line": proposal.start_line,
            "end_line": proposal.end_line,
            "improvement_type": proposal.improvement_type,
            "justification": proposal.justification,
            "confidence": proposal.confidence,
            "estimated_impact": proposal.estimated_impact,
            "risk_level": proposal.risk_level,
            "validation_status": proposal.validation_status,
            "current_code": proposal.current_code,
            "proposed_code": proposal.proposed_code
        }

    async def get_code_health_report(self) -> Dict:
        """Generate a comprehensive code health report"""
        # Perform fresh scan
        scan_result = await self.perform_code_health_scan()

        # Get additional metrics
        report = {
            "timestamp": datetime.now().isoformat(),
            "smell_summary": self._generate_smell_summary(scan_result["smells"]),
            "proposal_summary": self._generate_proposal_summary(scan_result["proposals"]),
            "file_analysis": self._analyze_files_by_health(scan_result["smells"]),
            "recommendations": self._generate_recommendations(scan_result)
        }

        return report

    def _generate_smell_summary(self, smells: List[Dict]) -> Dict:
        """Generate summary statistics for code smells"""
        if not smells:
            return {"total": 0, "by_type": {}, "by_severity": {}}

        by_type = {}
        by_severity = {"low": 0, "medium": 0, "high": 0}

        for smell in smells:
            smell_type = smell["smell_type"]
            severity = smell["severity"]

            by_type[smell_type] = by_type.get(smell_type, 0) + 1
            by_severity[severity] = by_severity.get(severity, 0) + 1

        return {
            "total": len(smells),
            "by_type": by_type,
            "by_severity": by_severity,
            "average_confidence": sum(s["confidence"] for s in smells) / len(smells)
        }

    def _generate_proposal_summary(self, proposals: List[Dict]) -> Dict:
        """Generate summary statistics for refactor proposals"""
        if not proposals:
            return {"total": 0, "by_type": {}, "by_risk": {}}

        by_type = {}
        by_risk = {"low": 0, "medium": 0, "high": 0}
        total_impact = 0

        for proposal in proposals:
            improvement_type = proposal["improvement_type"]
            risk = proposal["risk_level"]
            impact = proposal["estimated_impact"]

            by_type[improvement_type] = by_type.get(improvement_type, 0) + 1
            by_risk[risk] = by_risk.get(risk, 0) + 1
            total_impact += impact

        return {
            "total": len(proposals),
            "by_type": by_type,
            "by_risk": by_risk,
            "average_impact": total_impact / len(proposals) if proposals else 0,
            "average_confidence": sum(p["confidence"] for p in proposals) / len(proposals) if proposals else 0
        }

    def _analyze_files_by_health(self, smells: List[Dict]) -> List[Dict]:
        """Analyze files by their code health"""
        file_smells = {}

        for smell in smells:
            file_path = smell["file_path"]
            if file_path not in file_smells:
                file_smells[file_path] = []
            file_smells[file_path].append(smell)

        # Calculate health score for each file
        file_analysis = []
        for file_path, smells in file_smells.items():
            total_severity = sum(1 if s["severity"] == "low" else
                                2 if s["severity"] == "medium" else 3
                                for s in smells)
            health_score = max(0, 100 - (total_severity * 10))  # Simple scoring

            file_analysis.append({
                "file_path": file_path,
                "smell_count": len(smells),
                "health_score": health_score,
                "smell_types": [s["smell_type"] for s in smells],
                "average_confidence": sum(s["confidence"] for s in smells) / len(smells)
            })

        # Sort by health score (worst first)
        file_analysis.sort(key=lambda x: x["health_score"])

        return file_analysis

    def _generate_recommendations(self, scan_result: Dict) -> List[str]:
        """Generate actionable recommendations based on scan results"""
        recommendations = []
        smells = scan_result["smells"]
        proposals = scan_result["proposals"]

        if not smells:
            recommendations.append("✅ Codebase is in excellent health - no major issues detected!")
            return recommendations

        # Prioritize by severity
        high_severity = [s for s in smells if s["severity"] == "high"]
        if high_severity:
            recommendations.append(
                f"⚠️  CRITICAL: {len(high_severity)} high-severity issues detected. "
                "Recommend immediate refactoring of affected components."
            )

        # Check for specific patterns
        complex_functions = [s for s in smells if s["smell_type"] == "complex_function"]
        if complex_functions:
            recommendations.append(
                f"🔄 {len(complex_functions)} complex functions detected. "
                "Consider decomposing these into smaller, focused functions."
            )

        long_functions = [s for s in smells if s["smell_type"] == "long_function"]
        if long_functions:
            recommendations.append(
                f"📏 {len(long_functions)} long functions detected. "
                "Refactor these to follow single responsibility principle."
            )

        # Proposal-based recommendations
        if proposals:
            high_impact = [p for p in proposals if p["estimated_impact"] > 0.6]
            if high_impact:
                recommendations.append(
                    f"💡 {len(high_impact)} high-impact refactoring opportunities identified. "
                    "These could significantly improve code quality."
                )

        return recommendations

# Integration with main daemon
async def integrate_code_health_monitoring(daemon):
    """Integrate code health monitoring with the main daemon"""
    # Create code health monitor
    code_health_monitor = CodeHealthMonitorDaemon(daemon)

    # Add code health monitoring to the daemon
    daemon.code_health_monitor = code_health_monitor

    # Start monitoring in background
    monitoring_task = asyncio.create_task(code_health_monitor.run_continuous_monitoring())

    return monitoring_task

if __name__ == "__main__":
    # Standalone testing
    import asyncio

    async def test_monitor():
        # Create a mock daemon for testing
        class MockDaemon:
            pass

        monitor = CodeHealthMonitorDaemon(MockDaemon())
        report = await monitor.perform_code_health_scan()
        print("Code Health Report:")
        print(json.dumps(report, indent=2))

    asyncio.run(test_monitor())