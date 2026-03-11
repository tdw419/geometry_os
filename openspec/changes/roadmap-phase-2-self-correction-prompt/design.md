# Design: roadmap-phase-2-self-correction-prompt

## Architecture Overview
Enhance Planning Prompt with Self-Correction Instructions for Implementation Agent

## Component Design
Modify `_get_planning_prompt` function in `implementation_agent.py`. The modification requires injecting a conditional instruction block into the system prompt. This logic must check if 'last_error' exists within context (indicating previous execution failure). If true, instructing the LLM to analyze this error message and its prior invalid response output specifically for generating an updated valid JSON action plan.

## Implementation Plan
Agents often fail during task planning due to unforeseen errors. Without explicit guidance on how to react when `last_error` is populated (indicating a failure in previous execution), the model may loop indefinitely or repeat incorrect actions, reducing overall reliability and robustness of autonomous agents handling complex workflows without human intervention.

## Component Details
### Update `_get_planning_prompt` method to include error-handling instructions. Implement conditional logic that checks for the presence of `context['last_error']`. If an error exists, append a specific directive instructing the LLM to analyze this context and generate a corrected valid JSON action block.

- _get_planning_prompt successfully returns prompts containing self-correction instructions when 'last_error' is present in input data.

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
*Change ID: roadmap-phase-2-self-correction-prompt*
