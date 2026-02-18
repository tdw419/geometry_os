# Proposal: Add Diagnostic Overlay with PAS Score (Phase 31)

## Problem
Geometry OS requires real-time system health monitoring to maintain its ambitious performance targets (<1ms latency, 60 FPS, <10ms evolution protocol overhead). The current tooling ecosystem (RenderDoc, hotspot, bpftrace, btop) provides powerful diagnostics but lacks integration into the visual shell. Developers must switch contexts between the OS interface and external tools, breaking the "Visual-First" principle and making it difficult to correlate visual artifacts with underlying system metrics.

## Solution
Implement a Diagnostic Overlay system that integrates the tooling ecosystem into the Geometry OS Infinite Map. The overlay will:

1. **Aggregate Metrics**: Collect data from multiple diagnostic tools in real-time
2. **Compute PAS Score**: Calculate a unified Performance/Aesthetic/System health score
3. **Visual Integration**: Display diagnostics as a non-intrusive overlay brick in the Infinite Map
4. **Interactive Debugging**: Allow developers to trigger tool-specific actions (RenderDoc capture, perf snapshot) directly from the visual shell

## Impact
- **Architecture**: Adds `systems/diagnostic_overlay` module with tool integration layer
- **Visual**: Introduces a new "Diagnostic Brick" widget type in the Infinite Map
- **Performance**: Minimal overhead (<5% CPU, <10MB RAM) through efficient aggregation
- **Developer Experience**: Unified diagnostic view without context switching
- **Health**: Enables proactive maintenance of PAS Score (>0.95 target)

## Tool Integration Strategy

### Low-Level GPU & Shader Engineering
- **RenderDoc**: Capture on-demand frame snapshots for shader debugging
- **Vulkan Validation Layers**: Runtime validation error aggregation
- **glslc**: Pre-compile shader validation status

### Performance & Kernel Introspection
- **hotspot**: Real-time CPU hotspot visualization
- **bpftrace**: Kernel syscall and dmabuf monitoring
- **KCachegrind**: Call-graph visualization (on-demand)

### Real-time Monitoring
- **btop/glances**: System resource metrics (CPU, RAM, GPU, Network)
- **Custom PAS Calculator**: Unified health scoring algorithm

## Risks
- **Performance Impact**: Aggregation must not degrade <1ms latency target
- **Visual Clutter**: Overlay must remain non-intrusive to the visual-first experience
- **Tool Availability**: Must gracefully handle missing tools (e.g., RenderDoc not installed)

## Validation Strategy
- **PAS Score Stability**: Must maintain >0.95 when overlay is active
- **Performance Overhead**: <5% CPU, <10MB RAM baseline
- **Tool Coverage**: At least 80% of listed tools integrated
- **Visual Integration**: Overlay must be toggleable and spatially positioned
- **WCAG**: Diagnostic information must be accessible (high contrast, readable)

## Success Metrics
1. PAS Score displayed in real-time with <100ms latency
2. All tool metrics aggregated without frame drops
3. Developers can trigger RenderDoc captures from visual shell
4. Overlay integrates seamlessly with existing Infinite Map bricks
5. Zero context switching required for system diagnostics
