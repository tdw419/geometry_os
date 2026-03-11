# Glass Box Architecture Specification

## ADDED Requirements

### Requirement: Recursive Language Model (RLM)
The system SHALL provide a `rlm_repl.py` module that allows the AI to execute Python code to manage context and plan actions.

#### Scenario: Complex Query Resolution
- **WHEN** the user provides a complex request (e.g. "Organize these 100 files")
- **THEN** the RLM initiates a Python REPL session.
- **AND** it writes code to inspect the files (`os.listdir`, `regex`).
- **AND** it simulates the organization strategy.
- **VISUAL** The Neural HUD displays **Green** code blocks scrolling as they are generated.

### Requirement: Real-Time Thought Visualization
The system SHALL render the AI's internal state (Logic, Perception, Learning) onto the screen in real-time.

#### Scenario: Visual Feedback Loop
- **WHEN** the AI inspects the screen state.
- **THEN** the Thought Daemon captures the inspection event.
- **AND** the Neural HUD renders **Magenta** overlays on the inspected elements.

#### Scenario: Error Correction
- **WHEN** a simulation or code execution fails (Safety Score < Threshold).
- **THEN** the RLM backtracks.
- **VISUAL** The HUD flashes **Red**, and the code is visually "deleted" or overwritten.

### Requirement: Vectorland Simulation
The system SHALL simulate physical actions (window movements) before execution using vector mathematics.

#### Scenario: Window Management
- **WHEN** the AI plans to move a window.
- **THEN** it calculates the trajectory and checks for collisions (Dot Product / Projections).
- **AND** it assigns a Safety Score.
- **VISUAL** A ghost/wireframe of the window appears at the target location (Simulation Phase) before the actual move occurs (Action Phase).
