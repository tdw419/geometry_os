# Tasks: roadmap-phase-2-self-correction-prompt

- [x] **Task 1**: Update `_get_planning_prompt` method to include error-handling instructions. Implement conditional logic that checks for the presence of `context['last_error']`. If an error exists, append a specific directive instructing the LLM to analyze this context and generate a corrected valid JSON action block.
  - **Acceptance Criteria**:
    - _get_planning_prompt successfully returns prompts containing self-correction instructions when 'last_error' is present in input data.
  - **Estimated Effort**: Medium


## Summary
- **Total Tasks**: 1
- **Estimated Complexity**: Medium
- **Dependencies**: None

---
*Generated automatically from roadmap decomposition*
*Change ID: roadmap-phase-2-self-correction-prompt*
*Last Updated: 2026-01-26T05:01:32.428164*
