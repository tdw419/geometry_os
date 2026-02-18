# Design: Diagnostic Overlay System

## Principles
1. **Non-Intrusive Integration**: Diagnostics enhance, never obstruct, the visual-first experience
2. **Unified Health Scoring**: PAS Score provides single-glance system health assessment
3. **Tool Agnostic**: Gracefully degrades when tools are unavailable
4. **Real-Time Responsiveness**: All metrics update within <100ms of system state changes

## Visual Language
- **Aesthetics**: Glassmorphic overlay with high-contrast data visualization
- **Typography**: JetBrains Mono (monospace) for metrics, Inter for labels
- **Color Palette**:
  - PAS >0.95: Emerald Green (#10B981)
  - PAS 0.85-0.95: Amber (#F59E0B)
  - PAS <0.85: Crimson Red (#DC2626)
  - Neutral: Slate-400 (#94A3B8)
- **Layout**: Spatial brick positioned in corner of Infinite Map, collapsible to minimal indicator

## Technical Architecture

### Component Hierarchy
```
systems/diagnostic_overlay/
├── mod.rs                    # Main module entry
├── pas_calculator.rs         # PAS Score computation
├── tool_adapters/
│   ├── mod.rs
│   ├── renderdoc.rs          # RenderDoc integration
│   ├── hotspot.rs            # hotspot/perf integration
│   ├── bpftrace.rs           # bpftrace integration
│   ├── btop.rs               # btop/glances metrics
│   └── vulkan_validation.rs  # Vulkan validation layer aggregation
├── overlay_renderer.rs       # WGSL shader for overlay rendering
└── metrics_aggregator.rs     # Unified metric collection
```

### PAS Score Algorithm

The PAS (Performance/Aesthetic/System) Score is a weighted composite:

```
PAS = (Performance × 0.4) + (Aesthetic × 0.3) + (System × 0.3)

Where:
- Performance: Frame rate stability, latency, GPU utilization
- Aesthetic: Visual coherence, shader validation, texture integrity
- System: Memory health, kernel stability, evolution protocol health
```

**Performance Metrics** (0.0-1.0):
- Frame Rate: `min(actual_fps / target_fps, 1.0)` (target: 60 FPS)
- Latency: `max(0, 1 - (actual_latency_ms - target_latency_ms) / target_latency_ms)` (target: <1ms)
- GPU Utilization: `1 - |0.7 - gpu_util| / 0.3` (optimal: 70%)

**Aesthetic Metrics** (0.0-1.0):
- Shader Validation: `1 - (validation_errors / max_errors)`
- Texture Integrity: `intact_textures / total_textures`
- Visual Coherence: Neural state entropy normalized

**System Metrics** (0.0-1.0):
- Memory Health: `1 - (memory_pressure / max_pressure)`
- Kernel Stability: `1 - (kernel_warnings / max_warnings)`
- Evolution Protocol: `1 - (protocol_errors / max_errors)`

### Tool Integration Layer

#### RenderDoc Adapter
- **Trigger**: User action or automatic on frame drop
- **Capture**: Freeze current wgpu frame and export to RenderDoc format
- **Analysis**: Extract draw call statistics, texture bindings, shader stages
- **Overhead**: Only during capture (negligible otherwise)

#### Hotspot/Perf Adapter
- **Collection**: Continuous sampling at 100Hz (configurable)
- **Aggregation**: Top 10 hotspots with % CPU time
- **Visualization**: Heatmap overlay on code regions (if source available)
- **Overhead**: <1% CPU impact

#### bpftrace Adapter
- **Monitors**:
  - `dmabuf` allocation/deallocation
  - `uffd` (Userfaultfd) page faults
  - Wayland protocol messages
  - Evolution daemon socket activity
- **Output**: Event count histogram, latency distribution
- **Overhead**: <0.5% kernel overhead

#### btop/glances Adapter
- **Metrics**: CPU, RAM, GPU, Network, Disk I/O
- **Sampling**: 1-second intervals (configurable)
- **History**: Rolling 60-second window for trend visualization
- **Overhead**: Negligible (reads from /proc)

#### Vulkan Validation Layer Adapter
- **Collection**: Parse validation layer output
- **Aggregation**: Error count by category (synchronization, memory, shader)
- **Visualization**: Color-coded severity indicators
- **Overhead**: Only when validation enabled

### Overlay Rendering

The overlay is rendered as a WGSL shader brick in the Infinite Map:

```wgsl
// Simplified example
@group(0) @binding(0) var<uniform> pas_score: f32;
@group(0) @binding(1) var<storage> metrics: array<Metrics>;

@fragment
fn main(@builtin(position) frag_coord: vec4<f32>) -> @location(0) vec4<f32> {
    let position = frag_coord.xy / screen_size;
    let in_brick = is_in_diagnostic_brick(position);
    
    if (!in_brick) {
        return vec4<f32>(0.0, 0.0, 0.0, 0.0); // Transparent
    }
    
    let color = pas_color(pas_score);
    return vec4<f32>(color, 0.9); // Glassmorphic alpha
}
```

### Data Flow

```
[Tool Adapters] → [Metrics Aggregator] → [PAS Calculator] → [Overlay Renderer] → [Infinite Map]
     ↓                    ↓                    ↓                    ↓
  Raw Metrics      Unified Metrics      PAS Score (0-1)    WGSL Brick
  (JSON)           (Struct)             (f32)              (Texture)
```

### Performance Budget

- **CPU Overhead**: <5% total
- **Memory Overhead**: <10MB baseline
- **GPU Overhead**: <2% GPU time (overlay rendering)
- **Latency**: <100ms from metric change to visual update
- **Frame Impact**: Zero frame drops when overlay is visible

### Graceful Degradation

When a tool is unavailable:

1. **RenderDoc**: Disable capture button, show "Not installed" indicator
2. **hotspot**: Use fallback `/proc/stat` parsing
3. **bpftrace**: Show kernel metrics only via `/proc`
4. **btop**: Use direct `/proc` reading
5. **Vulkan Validation**: Show "Validation disabled" status

PAS Score is recalculated with available metrics only, weighting adjusted proportionally.

## Mockup Description

A semi-transparent glass brick (300x200px) positioned in the top-right corner of the Infinite Map:

```
┌─────────────────────────────┐
│  PAS: 0.97 ●                │  ← Overall score with color indicator
│  ─────────────────────────  │
│  Perf: 0.98  Aesth: 0.96   │  ← Component scores
│  Sys: 0.97                  │
│  ─────────────────────────  │
│  FPS: 60  Lat: 0.8ms        │  ← Key metrics
│  GPU: 72%  RAM: 48MB        │
│  ─────────────────────────  │
│  [Capture] [Perf] [BPF]    │  ← Tool action buttons
└─────────────────────────────┘
```

Collapsible to minimal indicator: "PAS: 0.97" with color dot.

## Impact Analysis

- **Geometric Integrity**:
  - **PAS Score**: Target >0.95 (maintained by design)
  - **Symmetry**: High (overlay is symmetric, non-intrusive)
  - **Complexity**: Medium (requires tool integration layer)

- **Performance**:
  - **Frame Rate**: No impact (rendered in same pass as Infinite Map)
  - **Latency**: <100ms update latency
  - **Memory**: <10MB baseline

- **Developer Experience**:
  - **Context Switching**: Eliminated (all diagnostics in visual shell)
  - **Debugging**: Accelerated (RenderDoc capture from UI)
  - **Monitoring**: Continuous (real-time PAS Score)

## Security Considerations

- **Tool Execution**: Only allow whitelisted tools from trusted paths
- **Privilege Escalation**: bpftrace requires CAP_BPF/CAP_PERFMON - use dedicated user
- **Data Exposure**: No sensitive data in overlay (metrics only)
- **Socket Communication**: Validate all evolution daemon messages

## Future Extensions

1. **Historical Trends**: Store PAS Score history for time-series analysis
2. **Predictive Alerts**: ML model to predict PAS degradation before it occurs
3. **Remote Monitoring**: Stream metrics to external dashboard
4. **Automated Recovery**: Trigger corrective actions when PAS drops below threshold
5. **Spatial Diagnostics**: 3D visualization of kernel/dmabuf state
