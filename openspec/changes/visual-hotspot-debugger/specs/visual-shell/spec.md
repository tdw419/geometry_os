# visual-shell: Visual Hotspot Debugger

## Requirement: Real-time Execution Heat Map
The Visual Shell SHALL provide a real-time heat map overlay to visualize execution activity on the Infinite Map.

### Requirement: Heat Aggregation
The backend SHALL aggregate access patterns into a spatial grid.

#### Scenario: Memory Access Tracking
- **WHEN** a memory address is accessed by the RISC-V executor
- **THEN** the system SHALL increment heat in the corresponding 64x64 grid cell
- **AND** the increment amount SHALL be 0.1 (clamped to 1.0)

#### Scenario: Temporal Decay
- **WHEN** the aggregator loop runs (1 Hz)
- **THEN** it SHALL apply a decay factor of 0.95 per second to all cells

#### Scenario: Spatial Diffusion
- **WHEN** the aggregator loop runs
- **THEN** it SHALL apply a 3x3 blur kernel to diffuse heat into neighboring cells
- **VISUAL** Smooth gradients between hot and cold regions

### Requirement: Visual Overlay
The frontend SHALL render the heat map as a semi-transparent overlay.

#### Scenario: Color Gradient
- **WHEN** a cell has heat > 0.05
- **THEN** it SHALL be rendered with a color based on its intensity:
  - 0.0: Blue (transparent)
  - 0.5: Green
  - 1.0: Red (opaque)

#### Scenario: Hotspot Pulsing
- **WHEN** a cell is identified as a hotspot (intensity > 0.7)
- **THEN** the frontend SHALL render a pulsing circular indicator at its location

### Requirement: User Interaction
The user SHALL be able to control and monitor the heat map state.

#### Scenario: Toggle Shortcut
- **WHEN** the user presses `Ctrl+Shift+M`
- **THEN** the heat map visibility SHALL toggle

#### Scenario: HUD Integration
- **WHEN** the Visual Debug Overlay is active (`Ctrl+Shift+V`)
- **THEN** it SHALL display a "🔥 HEAT MAP" section with active hotspot count and average heat
