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

### Requirement: Keyboard Navigation
The Visual Shell SHALL provide comprehensive keyboard navigation across all user interfaces.

#### Scenario: Grid Navigation
- **WHEN** a tile grid is focused
- **THEN** arrow keys SHALL navigate between tiles
- **AND** Home/End keys SHALL navigate to first/last tile
- **AND** Enter/Space SHALL activate the focused tile

#### Scenario: Tab Navigation
- **WHEN** a tab list is focused
- **THEN** left/right arrow keys SHALL navigate between tabs
- **AND** Enter/Space SHALL select the focused tab
- **AND** Tab SHALL move focus to the tab panel content

#### Scenario: List Navigation
- **WHEN** a list or listbox is focused
- **THEN** up/down arrow keys SHALL navigate between items
- **AND** Enter/Space SHALL select the focused item
- **AND** Home/End keys SHALL navigate to first/last item

#### Scenario: Form Navigation
- **WHEN** a form is focused
- **THEN** Tab SHALL navigate between form fields
- **AND** all fields SHALL be reachable via keyboard
- **AND** form submission SHALL be possible via Enter key

#### Scenario: Skip Links
- **WHEN** the page loads
- **THEN** skip links SHALL be the first focusable elements
- **AND** skip links SHALL provide navigation to main content regions
- **AND** skip links SHALL become visible on focus

### Requirement: Screen Reader Compatibility
The Visual Shell SHALL provide screen reader compatibility across all user interfaces.

#### Scenario: ARIA Landmarks
- **WHEN** the page loads
- **THEN** main content areas SHALL have ARIA landmark roles
- **AND** each landmark SHALL have a unique accessible name
- **AND** landmarks SHALL follow a logical hierarchy

#### Scenario: Live Region Announcements
- **WHEN** dynamic content changes
- **THEN** changes SHALL be announced via ARIA live regions
- **AND** critical updates SHALL use assertive priority
- **AND** non-critical updates SHALL use polite priority

#### Scenario: Accessible Names
- **WHEN** an interactive element is rendered
- **THEN** it SHALL have an accessible name via aria-label or aria-labelledby
- **AND** the name SHALL describe the element's purpose
- **AND** state changes SHALL be reflected in the accessible name

#### Scenario: Focus Indicators
- **WHEN** an element receives keyboard focus
- **THEN** a visible focus indicator SHALL be displayed
- **AND** the indicator SHALL have a minimum contrast ratio of 3:1
- **AND** the indicator SHALL not be obscured by other elements

### Requirement: Accessibility Preferences
The Visual Shell SHALL support user accessibility preferences.

#### Scenario: High Contrast Mode
- **WHEN** high contrast mode is enabled
- **THEN** all text SHALL maintain a minimum contrast ratio of 4.5:1
- **AND** focus indicators SHALL remain visible
- **AND** all interactive elements SHALL be distinguishable

#### Scenario: Reduced Motion
- **WHEN** reduced motion is preferred
- **THEN** non-essential animations SHALL be disabled
- **AND** essential animations SHALL be reduced to minimal duration
- **AND** transitions SHALL not cause motion sickness

#### Scenario: System Preferences
- **WHEN** the system detects OS accessibility settings
- **THEN** it SHALL automatically apply corresponding preferences
- **AND** it SHALL respond to changes in system preferences
- **AND** user overrides SHALL take precedence

### Requirement: Keyboard Shortcuts
The Visual Shell SHALL provide discoverable keyboard shortcuts.

#### Scenario: Shortcuts Help
- **WHEN** the user presses "?"
- **THEN** a keyboard shortcuts dialog SHALL appear
- **AND** shortcuts SHALL be grouped by category
- **AND** the dialog SHALL be dismissible via Escape

#### Scenario: Quick Navigation
- **WHEN** the user presses navigation shortcuts
- **THEN** focus SHALL move to the corresponding region
- **AND** the move SHALL be announced to screen readers
- **AND** shortcuts SHALL work regardless of current focus

#### Scenario: Display Toggles
- **WHEN** the user presses display shortcuts (h, m)
- **THEN** high contrast mode or reduced motion SHALL toggle
- **AND** the change SHALL be announced
- **AND** the preference SHALL be persisted

### Requirement: Focus Management
The Visual Shell SHALL provide proper focus management for dynamic content.

#### Scenario: Modal Dialogs
- **WHEN** a modal dialog opens
- **THEN** focus SHALL move to the dialog
- **AND** focus SHALL be trapped within the dialog
- **AND** focus SHALL return to the trigger element when closed

#### Scenario: Dynamic Content
- **WHEN** new content is added to the page
- **THEN** focus SHALL be managed appropriately
- **AND** new interactive elements SHALL be focusable
- **AND** removed elements SHALL not retain focus

#### Scenario: Error Focus
- **WHEN** a form validation error occurs
- **THEN** focus SHALL move to the first error
- **AND** the error SHALL be announced
- **AND** the user SHALL be able to correct the error via keyboard

