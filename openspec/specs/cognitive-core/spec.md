# cognitive-core Specification

## Purpose
TBD - created by archiving change connect-cognitive-daemon-llm. Update Purpose after archive.
## Requirements
### Requirement: Real-Time Generative Reasoning
The `UnifiedCognitiveDaemon` SHALL utilize a local Large Language Model (LM Studio) to effectively reason about user input.

#### Scenario: Intent Analysis
- **WHEN** the user provides a goal (e.g., "Fix the bug")
- **THEN** the system consults the LLM to classify the intent (e.g., "Debug/Repair")
- **AND** assigns a confidence score based on the model's logits (or self-reported confidence)
- **VISUAL** The "Confidence" uniform in the shader reflects the LLM's certainty.

#### Scenario: Fallback
- **WHEN** the LM Studio server is unreachable
- **THEN** the system silently reverts to heuristic/mock logic
- **AND** logs a warning to the console

