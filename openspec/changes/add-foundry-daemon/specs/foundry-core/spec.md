# Foundry Core Specification (DELTA)

## ADDED Requirements

### Requirement: Intent-Driven Manufacturing
The system SHALL provide a mechanism to convert natural language descriptions ("Intents") into executable Hybrid DNA Bricks using a local Large Language Model.

#### Scenario: Basic Code Generation
- **WHEN** a user places a file `spin_cube.md` in `systems/foundry/intents/`
- **AND** the file contains "Create a spinning green cube class"
- **THEN** the Foundry Daemon reads the file
- **AND** sends the prompt to LM Studio
- **AND** extracts the generated Python code
- **AND** creates `systems/builder/queue/spin_cube.rts.png`
- **VISUAL** The file disappears from `intents` and appears in `queue` as a valid image.

#### Scenario: API Awareness
- **WHEN** generating code
- **THEN** the system SHALL prepend the `GeometryOS` API reference context to the system prompt
- **AND** the generated code SHALL be compatible with the embedded Python runtime (no illegal imports)
- **VISUAL** Resulting code runs without `ImportError`.

### Requirement: Local Inference Independence
The system SHALL NOT rely on external internet APIs for code generation.

#### Scenario: Offline Operation
- **WHEN** the internet is disconnected
- **BUT** LM Studio is running locally
- **THEN** the Foundry Daemon functions normally
- **VISUAL** Zero latency from network, full privacy.
