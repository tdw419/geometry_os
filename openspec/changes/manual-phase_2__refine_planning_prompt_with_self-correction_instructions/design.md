# Design: manual-phase_2__refine_planning_prompt_with_self-correction_instructions

## Architecture Overview
Manual Implementation: Phase 2: Refine Planning Prompt with Self-Correction Instructions

## Component Design
Manual implementation of roadmap phase: Modify `implementation_agent.py`. Update `_get_planning_prompt` to include specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invalid response to generate a *corrected* valid JSON action block.

## Implementation Plan
Direct implementation of roadmap requirements for Phase 2: Refine Planning Prompt with Self-Correction Instructions

## Component Details
### **Goal**: Phase 2: Refine Planning Prompt with Self-Correction Instructions

**Description**: Modify `implementation_agent.py`. Update `_get_planning_prompt` to include specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invalid response to generate a *corrected* valid JSON action block.

**Key Deliverables**:
- **Objective 2: Enhance LLM Planning Prompt for Self-Correction**
- **Goal:** Instruct the LLM how to respond when asked to correct a previous invalid plan, explicitly referencing the provided `last_error` context.
- **Tasks:**

- All requirements for 'Phase 2: Refine Planning Prompt with Self-Correction Instructions' are implemented and functional.

## Testing Strategy
- Unit tests for all components
- Integration tests for system interactions
- Acceptance tests based on success criteria

## Performance Considerations
- Estimated complexity: Medium
- Parallel execution where possible
- Resource optimization for autonomous execution

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_2__refine_planning_prompt_with_self-correction_instructions*
