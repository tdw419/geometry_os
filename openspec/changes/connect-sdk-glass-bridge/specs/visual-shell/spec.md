## ADDED Requirements

### Requirement: Visual Bridge API
The system SHALL provide a mechanism for external processes to programmatically control visual memory artifacts.

#### Scenario: Scripted Visualization
- **WHEN** a Python script sends an `ALLOC_TOWER` command via the bridge
- **THEN** the Glass RAM compositor must render a new 3D structure at the specified Hilbert coordinate
- **VISUAL** The structure appears immediately with the requested color and dimensions
