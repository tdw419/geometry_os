---
spec: the-motherboard
phase: research
created: 2026-02-26
generated: auto
---

# Research: The Motherboard

## Executive Summary

Feasibility: **High**. All prerequisites exist - WebGPU shader (`visual_cpu_riscv_morph.wgsl`), atlas texture, PixiJS InfiniteMap. Implementation requires bridging PixiJS visual layer to WebGPU execution via a GlyphExecutor module.

## Codebase Analysis

### Existing Patterns

| Pattern | File | Relevance |
|---------|------|-----------|
| Class-based modules | `infinite_map.js:17` | `class InfiniteMap` - follow this pattern |
| WebGPU integration | `display/webgpu_renderer.js` | WebGPU init patterns |
| Shader loading | `wgsl_hot_loader.js:17` | `class WGSLHotLoader` - hot reload shaders |
| CPU state management | `visual_cpu_riscv_morph.wgsl:16` | 46 registers per core in `cpu_states` buffer |
| Holographic decoding | `visual_cpu_riscv_morph.wgsl:87` | Hadamard-based decode from texture |
| Symmetry validation | `visual_cpu_riscv_morph.wgsl:35` | Geometric audit before execution |

### Dependencies

| Dependency | Location | Purpose |
|------------|----------|---------|
| PixiJS v8 | CDN | Visual rendering layer |
| WebGPU API | Browser native | GPU compute execution |
| `universal_font.rts.png` | `web/assets/` | Glyph atlas texture |
| `visual_cpu_riscv_morph.wgsl` | `web/shaders/` | RISC-V execution shader |

### Constraints

1. **WebGPU browser support** - Requires Chrome 113+ or equivalent
2. **46 registers per core** - Shader expects `REGS_PER_CORE = 46u`
3. **16x16 glyph size** - `GLYPH_SIZE = 16u` in shader
4. **Max 64 cores** - Practical limit for workgroup size
5. **Geometric fraud detection** - Shader halts on symmetry violations

## Shader Interface Analysis

```wgsl
// Bindings required (from visual_cpu_riscv_morph.wgsl)
@group(0) @binding(0) var rts_texture: texture_2d<f32>;     // Atlas
@group(0) @binding(1) var<storage, read_write> system_memory; // 1MB heap
@group(0) @binding(2) var<storage, read_write> cpu_states;    // Core states

// CPU State Layout (46 u32 per core)
// [0-31]: x0-x31 registers
// [32]: PC (program counter)
// [33-37]: status/cycle counters
// [38]: CSR_HALT flag
// [39-45]: reserved
```

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, just need bridge |
| Effort Estimate | M | ~10 tasks, mostly integration |
| Risk Level | Low | No new shader code, pure JS bridge |

## Key Technical Decisions

1. **GlyphExecutor as bridge layer** - Separate class, not mixed into InfiniteMap
2. **Auto-execution via setInterval** - Not requestAnimationFrame (decouple from render)
3. **Visual feedback via sprite properties** - alpha, scale, tint (no custom shaders needed)
4. **Core assignment by registration order** - Simple modulo `maxCores`

## Recommendations

1. Start with GlyphExecutor skeleton (Task 1.1)
2. Implement WebGPU buffer setup (Task 1.2)
3. Add glyph registration (Task 1.3)
4. Create execution loop (Task 1.4)
5. Integrate with InfiniteMap (Task 1.5)
6. Build test page for validation (Task 2.1)
