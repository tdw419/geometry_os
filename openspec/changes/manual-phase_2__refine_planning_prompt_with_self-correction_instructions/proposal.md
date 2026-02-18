# Change: manual-phase_2__refine_planning_prompt_with_self-correction_instructions

## Problem Statement
Manual implementation of roadmap phase: Modify `implementation_agent.py`. Update `_get_planning_prompt` to include specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invalid response to generate a *corrected* valid JSON action block.

## Proposed Solution
Direct implementation of roadmap requirements for Phase 2: Refine Planning Prompt with Self-Correction Instructions

## Impact Assessment
- **Scope**: Medium complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: None

## Success Criteria
- **Goal**: Phase 2: Refine Planning Prompt with Self-Correction Instructions

**Description**: Modify `implementation_agent.py`. Update `_get_planning_prompt` to include specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invalid response to generate a *corrected* valid JSON action block.

**Key Deliverables**:
- **Objective 2: Enhance LLM Planning Prompt for Self-Correction**
- **Goal:** Instruct the LLM how to respond when asked to correct a previous invalid plan, explicitly referencing the provided `last_error` context.
- **Tasks:**

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_2__refine_planning_prompt_with_self-correction_instructions*
*Complexity: Medium*
