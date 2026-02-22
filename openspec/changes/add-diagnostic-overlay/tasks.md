# Implementation Tasks: Diagnostic Overlay System

## Phase 1: Foundation & Core Infrastructure
- [x] **Scaffold Module**: Create `systems/diagnostic_overlay` directory structure
- [x] **Define Core Types**: Create `DiagnosticState`, `PASMetrics`, and `ToolStatus` structs
- [x] **Implement PAS Calculator**: Write `pas_calculator.rs` with scoring algorithm
- [x] **Create Metrics Aggregator**: Implement `metrics_aggregator.rs` for unified collection
- [x] **Add to Cargo.toml**: Update dependencies for tool integrations (serde, toml, etc.)

## Phase 2: Tool Adapter Implementation
- [x] **RenderDoc Adapter**:
  - [x] Implement `renderdoc.rs` with capture trigger
  - [x] Add wgpu frame export functionality
  - [x] Create RenderDoc format parser for analysis
  - [x] Implement "Not installed" graceful degradation

- [x] **Hotspot/Perf Adapter**:
  - [x] Implement `hotspot.rs` with perf event sampling
  - [x] Add hotspot data parser
  - [x] Create top 10 hotspots aggregation
  - [x] Implement fallback `/proc/stat` parsing

- [x] **bpftrace Adapter**:
  - [x] Implement `bpftrace.rs` with syscall monitoring
  - [x] Add dmabuf, uffd, Wayland protocol probes
  - [x] Create event histogram aggregation
  - [x] Implement `/proc` fallback for kernel metrics

- [x] **btop/glances Adapter**:
  - [x] Implement `btop.rs` with direct `/proc` reading
  - [x] Add CPU, RAM, GPU, Network, Disk I/O collection
  - [x] Create 60-second rolling history buffer
  - [x] Implement trend visualization data structure

- [x] **Vulkan Validation Adapter**:
  - [x] Implement `vulkan_validation.rs` with layer output parsing
  - [x] Add error categorization (synchronization, memory, shader)
  - [x] Create severity indicator mapping
  - [x] Implement "Validation disabled" status handling

## Phase 3: Overlay Rendering
- [x] **Create Overlay Renderer**: Implement `overlay_renderer.rs` with WGSL shader
- [x] **Design Diagnostic Brick**: Create brick layout and styling
- [x] **Implement PAS Color Mapping**: Map PAS score to color (green/amber/red)
- [x] **Add Collapsible UI**: Implement expand/collapse functionality
- [x] **Integrate with Infinite Map**: Connect overlay to compositor brick system
- [x] **Add Tool Action Buttons**: Implement Capture, Perf, BPF button handlers

## Phase 4: Integration & Testing
- [x] **Connect to Evolution Protocol**: Subscribe to neural state updates
- [x] **Implement Real-Time Updates**: Add 100ms update loop for metrics
- [x] **Add Performance Monitoring**: Track overlay overhead (<5% CPU, <10MB RAM)
- [x] **Create Unit Tests**: Test PAS calculation, metric aggregation, tool adapters
- [x] **Create Integration Tests**: Test overlay rendering, tool integration
- [x] **Benchmark Performance**: Validate <100ms update latency, zero frame drops

## Phase 5: Polish & Documentation
- [x] **Refine Visual Design**: Adjust glassmorphism, typography, color palette
- [x] **Add Keyboard Shortcuts**: Implement toggle overlay (Ctrl+Shift+D)
- [x] **Create Configuration File**: Add `diagnostic_config.toml` for tool paths and sampling rates
- [x] **Write Documentation**: Document API, configuration, and usage
- [x] **Add Accessibility**: Ensure WCAG AA compliance (high contrast, readable)
- [x] **Create Demo Mode**: Add simulated metrics for demonstration

## Phase 6: Validation & Deployment
- [x] **Run PAS Score Validation**: Verify >0.95 target with overlay active
- [x] **Test Graceful Degradation**: Verify behavior when tools are unavailable
- [x] **Validate Tool Coverage**: Ensure at least 80% of listed tools integrated
- [x] **Security Audit**: Verify tool execution from trusted paths only
- [x] **Performance Regression Test**: Compare baseline with and without overlay
- [x] **Archive OpenSpec**: Mark proposal complete after deployment

## Dependencies Checklist
- [x] **System Tools**: Verify RenderDoc, hotspot, bpftrace, glslc are installed
- [x] **Vulkan Validation Layers**: Enable validation layers in wgpu backend
- [x] **Rust Crates**: Add serde, toml, libc, nix for system integration
- [x] **Python Scripts**: Create helper scripts for tool invocation (if needed)

## Success Criteria Verification
- [x] PAS Score displayed in real-time with <100ms latency
- [x] All tool metrics aggregated without frame drops
- [x] Developers can trigger RenderDoc captures from visual shell
- [x] Overlay integrates seamlessly with existing Infinite Map bricks
- [x] Zero context switching required for system diagnostics
