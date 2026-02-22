## ADDED Requirements

### Requirement: Optical Script Loading
The system SHALL support loading and executing Python scripts from V2 Spatial Brick textures.

#### Scenario: Script Execution
- **WHEN** the engine loads a `.brick` file in the scripts directory
- **THEN** it SHALL unfold the texture to source code
- **AND** execute it using the embedded Python runtime
- **VISUAL** Output appears in the system logs.

#### Scenario: Script Hot Reloading
- **WHEN** a script `.brick` is modified
- **THEN** the engine SHALL re-execute the script
- **VISUAL** New logic behavior applies immediately.
