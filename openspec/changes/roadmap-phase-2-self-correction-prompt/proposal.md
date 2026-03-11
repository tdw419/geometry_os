# Change: roadmap-phase-2-self-correction-prompt

## Problem Statement
Modify `_get_planning_prompt` function in `implementation_agent.py`. The modification requires injecting a conditional instruction block into the system prompt. This logic must check if 'last_error' exists within context (indicating previous execution failure). If true, instructing the LLM to analyze this error message and its prior invalid response output specifically for generating an updated valid JSON action plan.

## Proposed Solution
Agents often fail during task planning due to unforeseen errors. Without explicit guidance on how to react when `last_error` is populated (indicating a failure in previous execution), the model may loop indefinitely or repeat incorrect actions, reducing overall reliability and robustness of autonomous agents handling complex workflows without human intervention.

## Impact Assessment
- **Scope**: Medium complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: None

## Success Criteria
- Update `_get_planning_prompt` method to include error-handling instructions. Implement conditional logic that checks for the presence of `context['last_error']`. If an error exists, append a specific directive instructing the LLM to analyze this context and generate a corrected valid JSON action block.

---
*Generated automatically from roadmap decomposition*
*Change ID: roadmap-phase-2-self-correction-prompt*
*Complexity: Medium*
