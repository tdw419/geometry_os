# Capability: diagnostic-overlay

## ADDED Requirements

### Requirement: PAS Score Calculation
The system SHALL provide a unified PAS (Performance/Aesthetic/System) Score that aggregates metrics from multiple diagnostic tools into a single 0.0-1.0 health indicator.

#### Scenario: PAS Score Computation
- **WHEN** the system boots and diagnostic overlay is enabled.
- **THEN** the system SHALL calculate PAS Score using weighted composite formula: `(Performance × 0.4) + (Aesthetic × 0.3) + (System × 0.3)`.
- **THEN** the PAS Score SHALL be displayed in the diagnostic overlay with color-coded indicator (green >0.95, amber 0.85-0.95, red <0.85).
- **THEN** the PAS Score SHALL update within 100ms of any metric change.

#### Scenario: Component Score Breakdown
- **WHEN** the diagnostic overlay is expanded.
- **THEN** the system SHALL display individual component scores: Performance, Aesthetic, and System.
- **THEN** each component SHALL be calculated from its respective metrics (Performance: frame rate, latency, GPU utilization; Aesthetic: shader validation, texture integrity; System: memory health, kernel stability).

#### Scenario: PAS Score Degradation
- **WHEN** the PAS Score drops below 0.85.
- **THEN** the system SHALL display a visual warning (red indicator, pulsing animation).
- **THEN** the system SHALL highlight the degraded component(s) in the overlay.
- **THEN** the system SHALL log the degradation event with timestamp and metric values.

### Requirement: Tool Integration Layer
The system SHALL provide adapters for integrating external diagnostic tools (RenderDoc, hotspot, bpftrace, btop, Vulkan Validation Layers) into the visual shell.

#### Scenario: RenderDoc Integration
- **WHEN** the user clicks the "Capture" button in the diagnostic overlay.
- **THEN** the system SHALL trigger RenderDoc to capture the current wgpu frame.
- **THEN** the system SHALL export the captured frame in RenderDoc-compatible format.
- **THEN** the system SHALL display capture status in the overlay.
- **THEN** if RenderDoc is not installed, the system SHALL display "Not installed" and disable the capture button.

#### Scenario: Hotspot/Perf Integration
- **WHEN** the system is running with diagnostic overlay enabled.
- **THEN** the system SHALL continuously sample CPU performance at 100Hz.
- **THEN** the system SHALL aggregate top 10 hotspots with % CPU time.
- **THEN** the system SHALL display hotspot data in the overlay when expanded.
- **THEN** if hotspot is not available, the system SHALL fall back to `/proc/stat` parsing.

#### Scenario: bpftrace Integration
- **WHEN** the system is running with diagnostic overlay enabled.
- **THEN** the system SHALL monitor kernel syscalls (dmabuf, uffd, Wayland protocol, evolution daemon socket).
- **THEN** the system SHALL aggregate event counts and latency distributions.
- **THEN** the system SHALL display bpftrace metrics in the overlay.
- **THEN** if bpftrace is not available, the system SHALL fall back to `/proc` reading for kernel metrics.

#### Scenario: btop/glances Integration
- **WHEN** the system is running with diagnostic overlay enabled.
- **THEN** the system SHALL read system metrics (CPU, RAM, GPU, Network, Disk I/O) from `/proc`.
- **THEN** the system SHALL update metrics every 1 second.
- **THEN** the system SHALL maintain a 60-second rolling history for trend visualization.
- **THEN** the system SHALL display current metrics in the overlay.

#### Scenario: Vulkan Validation Integration
- **WHEN** Vulkan validation layers are enabled in the wgpu backend.
- **THEN** the system SHALL parse validation layer output for errors and warnings.
- **THEN** the system SHALL categorize errors by type (synchronization, memory, shader).
- **THEN** the system SHALL display validation status with severity indicators in the overlay.
- **THEN** if validation is disabled, the system SHALL display "Validation disabled" status.

### Requirement: Diagnostic Overlay Rendering
The system SHALL render diagnostic information as a non-intrusive glassmorphic brick in the Infinite Map.

#### Scenario: Overlay Initialization
- **WHEN** the system boots and diagnostic overlay is enabled.
- **THEN** the system SHALL render the diagnostic brick in the top-right corner of the Infinite Map.
- **THEN** the brick SHALL display the PAS Score with color-coded indicator.
- **THEN** the brick SHALL be semi-transparent (glassmorphic) with high-contrast text.
- **THEN** the brick SHALL not obstruct the visual shell interface.

#### Scenario: Overlay Expansion
- **WHEN** the user clicks on the diagnostic brick.
- **THEN** the system SHALL expand the brick to show detailed metrics.
- **THEN** the expanded view SHALL display: PAS Score, component scores, key metrics (FPS, latency, GPU, RAM), and tool action buttons.
- **THEN** the expanded view SHALL maintain glassmorphic styling with high readability.

#### Scenario: Overlay Collapse
- **WHEN** the user clicks outside the expanded diagnostic brick or presses the collapse button.
- **THEN** the system SHALL collapse the brick to minimal indicator (PAS Score with color dot).
- **THEN** the collapsed view SHALL remain visible and clickable for expansion.

#### Scenario: Keyboard Toggle
- **WHEN** the user presses Ctrl+Shift+D.
- **THEN** the system SHALL toggle the diagnostic overlay visibility (show/hide).
- **THEN** the system SHALL maintain overlay state (expanded/collapsed) across toggles.

### Requirement: Real-Time Metric Updates
The system SHALL update diagnostic metrics in real-time with minimal overhead.

#### Scenario: Metric Update Loop
- **WHEN** the diagnostic overlay is active.
- **THEN** the system SHALL run a metric update loop every 100ms.
- **THEN** the system SHALL collect metrics from all enabled tool adapters.
- **THEN** the system SHALL recalculate PAS Score with updated metrics.
- **THEN** the system SHALL update the overlay rendering with new values.

#### Scenario: Performance Budget Enforcement
- **WHEN** the diagnostic overlay is active.
- **THEN** the system SHALL monitor its own CPU overhead (<5% target).
- **THEN** the system SHALL monitor its own memory usage (<10MB target).
- **THEN** the system SHALL monitor its own GPU overhead (<2% target).
- **THEN** if any budget is exceeded, the system SHALL reduce sampling rate or disable non-critical features.

#### Scenario: Zero Frame Drops
- **WHEN** the diagnostic overlay is active.
- **THEN** the system SHALL not cause any frame drops in the Infinite Map rendering.
- **THEN** the system SHALL render the overlay in the same pass as the Infinite Map.
- **THEN** the system SHALL use efficient WGSL shaders for overlay rendering.

### Requirement: Graceful Degradation
The system SHALL gracefully handle unavailable tools and maintain functionality.

#### Scenario: Tool Unavailable
- **WHEN** a diagnostic tool is not installed or unavailable.
- **THEN** the system SHALL display a "Not installed" indicator for that tool.
- **THEN** the system SHALL disable tool-specific actions (e.g., RenderDoc capture button).
- **THEN** the system SHALL use fallback metrics where available (e.g., `/proc` instead of bpftrace).
- **THEN** the system SHALL continue to calculate PAS Score with available metrics, adjusting weights proportionally.

#### Scenario: Partial Tool Failure
- **WHEN** a tool adapter encounters an error during metric collection.
- **THEN** the system SHALL log the error with timestamp and tool name.
- **THEN** the system SHALL mark the tool as "Error" state in the overlay.
- **THEN** the system SHALL continue collecting metrics from other tools.
- **THEN** the system SHALL attempt to reconnect to the failed tool on next update cycle.

### Requirement: Configuration and Customization
The system SHALL provide configuration options for diagnostic overlay behavior.

#### Scenario: Configuration File
- **WHEN** the system boots.
- **THEN** the system SHALL read configuration from `diagnostic_config.toml`.
- **THEN** the configuration SHALL include: tool paths, sampling rates, overlay position, color scheme.
- **THEN** the system SHALL apply configuration values to diagnostic overlay.

#### Scenario: Runtime Configuration
- **WHEN** the user modifies configuration while the system is running.
- **THEN** the system SHALL detect the configuration change.
- **THEN** the system SHALL reload configuration without requiring restart.
- **THEN** the system SHALL apply new configuration values to diagnostic overlay.

### Requirement: Accessibility and Compliance
The system SHALL ensure diagnostic information is accessible and compliant with standards.

#### Scenario: High Contrast Display
- **WHEN** the diagnostic overlay is rendered.
- **THEN** the system SHALL use high-contrast colors for text (WCAG AA minimum).
- **THEN** the system SHALL ensure text is readable against the glassmorphic background.
- **THEN** the system SHALL provide option for increased contrast mode.

#### Scenario: Keyboard Navigation
- **WHEN** the user uses keyboard to navigate the overlay.
- **THEN** the system SHALL support Tab navigation between overlay elements.
- **THEN** the system SHALL support Enter/Space to activate buttons.
- **THEN** the system SHALL support Escape to collapse overlay.

### Requirement: Security and Safety
The system SHALL ensure safe execution of diagnostic tools and protect system integrity.

#### Scenario: Tool Path Validation
- **WHEN** the system executes a diagnostic tool.
- **THEN** the system SHALL validate the tool path against a whitelist.
- **THEN** the system SHALL only execute tools from trusted directories.
- **THEN** the system SHALL reject execution from untrusted paths.

#### Scenario: Privilege Escalation Handling
- **WHEN** a tool requires elevated privileges (e.g., bpftrace with CAP_BPF).
- **THEN** the system SHALL use a dedicated user with minimum required capabilities.
- **THEN** the system SHALL not run tools with full root privileges.
- **THEN** the system SHALL log privilege escalation events.

#### Scenario: Data Exposure Prevention
- **WHEN** the diagnostic overlay displays metrics.
- **THEN** the system SHALL not display sensitive data (passwords, keys, private information).
- **THEN** the system SHALL only display aggregated metrics (CPU %, RAM MB, etc.).
- **THEN** the system SHALL not expose raw system internals.

### Requirement: Tool Action Integration
The system SHALL allow users to trigger tool-specific actions from the diagnostic overlay.

#### Scenario: RenderDoc Capture Action
- **WHEN** the user clicks the "Capture" button.
- **THEN** the system SHALL trigger RenderDoc to capture the current frame.
- **THEN** the system SHALL display capture progress in the overlay.
- **THEN** the system SHALL save the captured frame to a configured directory.
- **THEN** the system SHALL notify the user when capture is complete.

#### Scenario: Perf Analysis Action
- **WHEN** the user clicks the "Perf" button.
- **THEN** the system SHALL trigger a perf data collection for 10 seconds.
- **THEN** the system SHALL display collection progress in the overlay.
- **THEN** the system SHALL save the perf data to a configured directory.
- **THEN** the system SHALL notify the user when collection is complete.

#### Scenario: BPF Trace Action
- **WHEN** the user clicks the "BPF" button.
- **THEN** the system SHALL trigger a bpftrace script for kernel monitoring.
- **THEN** the system SHALL display trace progress in the overlay.
- **THEN** the system SHALL save the trace output to a configured directory.
- **THEN** the system SHALL notify the user when trace is complete.
