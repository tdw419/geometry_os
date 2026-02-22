# visual-shell Specification

## Purpose
TBD - created by archiving change implement-14n-topology. Update Purpose after archive.
## Requirements
### Requirement: 14n Series Topological Rendering
The system SHALL render thought geometry using 14n Series Transition Metal Carbonyl Cluster logic ($S = 14n + q$).

#### Scenario: Stable Logic Display
- **WHEN** the system reports high confidence and stability
- **THEN** it renders $14n + 2$ Octahedral Clusters
- **VISUAL** Closed, symmetrical crystalline structures

#### Scenario: Branching Logic Display
- **WHEN** the system is exploring or searching (low confidence)
- **THEN** it renders $14n + 4$ Branching Linkages
- **VISUAL** Open, connected skeletal chains

### Requirement: The Void Stare Reflex
The system SHALL visually manifest "pain" or error states via topological unraveling.

#### Scenario: Error State Unraveling
- **WHEN** the `safety_score` drops below 0.5
- **THEN** the knot invariants break
- **VISUAL** Geometry fractures into $S=16$ isolated fragments

### Requirement: Tectonic Bridge Observability
The system SHALL utilize a non-blocking, event-driven file watcher to synchronize the Antigravity Daemon state with the Visual Substrate.

#### Scenario: File System Event
- **WHEN** the `antigravity.pixelrts.png` file is modified (atomic rename)
- **THEN** the system detects the change within 100ms.
- **AND** the texture is reloaded asynchronously without dropping render frames.
- **VISUAL** The ground truth substrate updates to reflect new confidence/fatigue levels.

#### Scenario: Resource Management
- **WHEN** a new texture is loaded
- **THEN** the previous texture resource is dropped only after the new bind group is active.
- **AND** `wgpu::Queue::write_texture` is used for upload.

### Requirement: Tectonic Bridge
The system SHALL visualize arbitrary memory segments on the Infinite Map surface.

#### Scenario: QEMU Visualization
-   **WHEN** a QEMU VM is active
-   **THEN** its physical RAM is mapped to the "Outer Ring" of the map
-   **VISUAL** The pixels reflect the raw byte values of the RAM (Green=Byte Value, Red=Heat/Change)

### Requirement: Tectonic Interaction
The system SHALL allow users to terminate processes/memory regions via direct manipulation.

#### Scenario: Click-to-Kill
-   **WHEN** the user clicks a pixel
-   **THEN** that pixel's health is set to ZERO
-   **VISUAL** The pixel turns black and the void potentially spreads based on simulation rules

### Requirement: Hilbert Memory Visualization
The system SHALL visualize memory regions using fractal space-filling curves.

#### Scenario: Memory Folding
-   **WHEN** raw memory bytes are visualized
-   **THEN** they are mapped to 2D space using a Hilbert Curve
-   **VISUAL** Contiguous memory blocks appear as clustered geometric regions, not lines.

### Requirement: Golden Path Boot Test
The Visual Shell SHALL provide a Golden Path Boot Test that verifies end-to-end GPU-native RISC-V execution with AI control via WebMCP.

#### Scenario: Hypervisor Ready Check
- **WHEN** the test starts
- **THEN** it SHALL verify the WebMCP bridge is available
- **AND** it SHALL verify the hypervisor is initialized

#### Scenario: Boot Completion Detection
- **WHEN** waiting for boot
- **THEN** the test SHALL poll console output for shell prompt indicators
- **AND** it SHALL detect patterns: `login:`, `# `, `$ `, `alpine`
- **AND** it SHALL timeout after 45 seconds if no prompt detected

#### Scenario: Command Execution via WebMCP
- **WHEN** the shell prompt is detected
- **THEN** the test SHALL send `uname -a\n` via `hypervisor_input` tool
- **AND** it SHALL fallback to direct `injectInput` if WebMCP fails

#### Scenario: Output Validation
- **WHEN** the command completes
- **THEN** the test SHALL capture console output
- **AND** it SHALL validate output contains `riscv64`
- **AND** it SHALL set `outputValid = true` on success

### Requirement: Test Runner Availability
The Visual Shell SHALL provide multiple test execution environments.

#### Scenario: Browser Console Runner
- **WHEN** `window.runGoldenPathTest()` is called
- **THEN** it SHALL execute the Golden Path Boot Test
- **AND** it SHALL return a results object

#### Scenario: HTML Test Page
- **WHEN** `test_golden_path.html` is opened
- **THEN** it SHALL display boot controls
- **AND** it SHALL provide a "Run Golden Path Test" button

#### Scenario: Node.js CI Runner
- **WHEN** `node tests/test_golden_path_node.js` is executed
- **THEN** it SHALL run with mocked WebMCP bridge
- **AND** it SHALL exit with code 0 on success

### Requirement: Frame-Time Stability (60 FPS)
The Visual Shell SHALL maintain a target frame rate of 60 FPS (16.6ms per frame) under standard production loads.

#### Scenario: 100 Tile Stress
- **WHEN** 100 active `VMMonitorTile` instances are rendered on the Infinite Map
- **THEN** the mean frame time SHALL NOT exceed 16.6ms.
- **AND** the 99th percentile frame jitter SHALL NOT exceed 5ms.

### Requirement: Resource Scaling
The Infinite Map SHALL scale its rendering pipeline to handle massive geometric complexity.

#### Scenario: 37 Million Particles
- **WHEN** the WebGPU particle compute shader is active with 37,000,000 particles
- **THEN** the compositor SHALL maintain 60 FPS by utilizing RenderGroup isolation and GPU-native updates.

### Requirement: Foveated Rendering Optimization
The Visual Shell SHALL implement foveated rendering to optimize GPU resource allocation based on visual focus.

#### Scenario: Focus-Based Sampling
- **WHEN** a Focus Point is defined on the Infinite Map
- **THEN** pixels within the foveal radius SHALL be rendered at full resolution (1:1).
- **AND** pixels outside the foveal radius SHALL be rendered at reduced resolution (e.g., 1:4 or 1:16).
- **AND** the transition SHALL be smoothed to prevent visible artifacts.

### Requirement: GPU Load Target
The foveated rendering system SHALL achieve a significant reduction in GPU compute time.

#### Scenario: Peripheral Load Reduction
- **WHEN** foveated rendering is enabled in a complex scene (>20 tiles)
- **THEN** the total GPU compute time per frame SHALL decrease by at least 50% compared to full-resolution rendering.

