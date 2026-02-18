# Change: manual-__objective_3__provide_actionable_error_feedback

## Problem Statement
Manual implementation of roadmap phase: 1. **Distinguish failure types in error messages:** "No JSON block found in response" → Prompt structure issue "JSON syntax error, repair failed" → Model capability issue "Invalid action structure" → Planning logic issue 2. **Update `context['last_error']` with specific guidance:** ```python context['last_error'] = ( f"Planning failed: {error_type}\n" f"Root cause: {root_cause}\n" f"Guidance: {specific_fix_instruction}" ) ```

## Proposed Solution
Direct implementation of roadmap requirements for # Objective 3: Provide Actionable Error Feedback

## Impact Assessment
- **Scope**: Medium complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: None

## Success Criteria
- **Goal**: # Objective 3: Provide Actionable Error Feedback

**Description**: 1. **Distinguish failure types in error messages:** "No JSON block found in response" → Prompt structure issue "JSON syntax error, repair failed" → Model capability issue "Invalid action structure" → Planning logic issue 2. **Update `context['last_error']` with specific guidance:** ```python context['last_error'] = ( f"Planning failed: {error_type}\n" f"Root cause: {root_cause}\n" f"Guidance: {specific_fix_instruction}" ) ```

**Key Deliverables**:
- *Goal:** Make the agent smarter about WHY its planning failed.
- *Tasks:**

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-__objective_3__provide_actionable_error_feedback*
*Complexity: Medium*
