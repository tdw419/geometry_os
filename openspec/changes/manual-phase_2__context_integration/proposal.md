# Change: manual-phase_2__context_integration

## Problem Statement
Manual implementation of roadmap phase: Modify `implementation_agent.py`. Update `_get_planning_prompt` to accept the new structured code context (file path, line number, code snippet) as part of its `context` dictionary. Reformat the prompt to clearly present the failed test description, the specific file involved, the exact code snippet around the failure, and the detailed error message. The prompt should explicitly instruct the LLM to analyze this information to generate its tool calls. Ensure the example JSON in the prompt aligns with the new, more targeted approach, potentially showing a `read_file` on the problematic file followed by a `replace` with specific changes based on the context.

## Proposed Solution
Direct implementation of roadmap requirements for Phase 2: Context Integration

## Impact Assessment
- **Scope**: Medium complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: None

## Success Criteria
- **Goal**: Phase 2: Context Integration

**Description**: Modify `implementation_agent.py`. Update `_get_planning_prompt` to accept the new structured code context (file path, line number, code snippet) as part of its `context` dictionary. Reformat the prompt to clearly present the failed test description, the specific file involved, the exact code snippet around the failure, and the detailed error message. The prompt should explicitly instruct the LLM to analyze this information to generate its tool calls. Ensure the example JSON in the prompt aligns with the new, more targeted approach, potentially showing a `read_file` on the problematic file followed by a `replace` with specific changes based on the context.

**Key Deliverables**:
- **Objective 2: Integrate Intelligent Context into Planning Prompt**
- **Goal:** Modify the `_get_planning_prompt` method to dynamically incorporate the precisely gathered code context, guiding the LLM to focus on the problematic area and formulate a relevant fix.
- **Tasks:**

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_2__context_integration*
*Complexity: Medium*
