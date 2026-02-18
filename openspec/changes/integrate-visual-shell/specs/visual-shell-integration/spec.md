## ADDED Requirements

### Requirement: Visual Shell Integration
The system SHALL integrate the `visual_shell` component into the active compositor.

#### Scenario: Startup
- **WHEN** the compositor starts
- **THEN** it SHALL initialize the Visual Shell wgpu resources sharing the main device/queue
- **AND** load the design tokens

#### Scenario: Update Loop
- **WHEN** the evolution daemon provides new neural state
- **THEN** the compositor SHALL pass this state to the Visual Shell
- **AND** the Visual Shell SHALL generate a new texture frame

#### Scenario: Rendering
- **WHEN** the compositor renders a frame
- **THEN** it SHALL overlay the Visual Shell texture on the output
- **VISUAL** The shell appears as a living, glowing substrate/HUD
