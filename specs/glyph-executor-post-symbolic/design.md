---
spec: glyph-executor-post-symbolic
phase: design
created: 2026-02-26T00:00:00Z
---

# Technical Design: GlyphExecutor Post-Symbolic Execution

## Overview

The GlyphExecutor acts as the "visual motherboard" orchestrating GPU-side holographic decoding. Unlike the traditional flow where CPU decodes morphological textures to Uint32Array before GPU upload, post-symbolic execution keeps the texture as the source of truth and decodes on-demand via GPU texture sampling.

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                     POST-SYMBOLIC EXECUTION FLOW                    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────────────┐   │
│  │ .rts.png    │     │ .meta.json  │     │ GlyphExecutor.js    │   │
│  │ (texture)   │     │ (dict)      │     │ (motherboard)       │   │
│  └──────┬──────┘     └──────┬──────┘     └──────────┬──────────┘   │
│         │                   │                        │              │
│         ▼                   ▼                        ▼              │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────────────┐   │
│  │ GPU Texture │     │ GPU Buffer  │     │ Compute Pipeline    │   │
│  │ (atlas)     │     │ (dict)      │     │                     │   │
│  └──────┬──────┘     └──────┬──────┘     └──────────┬──────────┘   │
│         │                   │                        │              │
│         └───────────────────┼────────────────────────┘              │
│                             ▼                                       │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │            visual_cpu_riscv_post_symbolic.wgsl                │ │
│  │  ┌─────────────────────────────────────────────────────────┐  │ │
│  │  │ holographic_fetch(pc):                                   │  │ │
│  │  │   1. Convert PC to tile coordinates                      │  │ │
│  │  │   2. textureLoad(glyph_atlas, coords)                    │  │ │
│  │  │   3. TokenID = (pixel.g << 8) | pixel.b                  │  │ │
│  │  │   4. return atlas_dictionary[TokenID]                    │  │ │
│  │  └─────────────────────────────────────────────────────────┘  │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Components

### 1. visual_cpu_riscv_post_symbolic.wgsl

**Purpose:** Compute shader that fetches instructions holographically

**Bindings:**
| Binding | Type | Description |
|---------|------|-------------|
| 0 | texture_2d<f32> | Glyph atlas (RGBA8) |
| 1 | storage, read | Dictionary (TokenID -> u32) |
| 2 | storage, read_write | System memory (128MB) |
| 3 | storage, read_write | CPU state (registers, PC, CSRs) |

**Key Functions:**
```wgsl
fn sample_token_id(pc: u32) -> u32 {
    let tile_idx = pc / 4u;
    let tile_x = (tile_idx % ATLAS_WIDTH_TILES) * GLYPH_SIZE;
    let tile_y = (tile_idx / ATLAS_WIDTH_TILES) * GLYPH_SIZE;
    let tex_coords = vec2<i32>(i32(tile_x + 8u), i32(tile_y + 8u));
    let pixel = textureLoad(glyph_atlas, tex_coords, 0);
    return (u32(pixel.g * 255.0) << 8u) | u32(pixel.b * 255.0);
}

fn holographic_fetch(pc: u32) -> u32 {
    let token_id = sample_token_id(pc);
    return atlas_dictionary[token_id];
}
```

### 2. GlyphExecutor.js

**Purpose:** JavaScript class orchestrating the execution substrate

**Key Methods:**
| Method | Description |
|--------|-------------|
| `initialize()` | Load shader, create pipeline |
| `deploy(textureUrl, kernelId)` | Load texture/dict, create buffers |
| `execute(kernelId, cycles)` | Dispatch compute pass |
| `readState(kernelId)` | Map and read CPU state |
| `startContinuous(kernelId, cycles, onOutput)` | Animation loop |
| `stop(kernelId)` | Halt execution |
| `validateResonance(tileX, tileY)` | Check symmetry mask |

### 3. Updated riscv_morphological_encoder.py

**Purpose:** Generate holographic assets with symmetry metadata

**New Functions:**
```python
def calculate_symmetry_mask(glyph_pixels: List[int]) -> int:
    """Returns symmetry mask: 0x80=full, 0x40=h_sym, 0x20=v_sym, 0x10=r_sym"""
    ...
```

**New Options:**
- `--tile-mode`: Enable 16x16 glyph cluster encoding
- Alpha channel = symmetry mask (0xFF = fully executable)

## Data Flow

```
1. Encoder generates hello_holographic.rts.png + .meta.json
   - Each pixel: R=charset, G/B=TokenID, A=symmetry_mask

2. GlyphExecutor.deploy() loads both files
   - Creates GPU texture from .rts.png
   - Creates GPU buffer from dictionary

3. Compute shader executes:
   - main() reads PC from cpu_states[base + 32]
   - holographic_fetch(pc) samples texture, looks up dictionary
   - Instruction decoded and executed
   - PC incremented, cycle complete

4. Continuous loop:
   - requestAnimationFrame triggers execute()
   - UART memory region checked for output
   - Callback delivers output to UI
```

## File Structure

```
systems/visual_shell/web/
├── GlyphExecutor.js                    # NEW: Motherboard class
├── test_glyph_executor.html            # NEW: Test page
├── shaders/
│   └── visual_cpu_riscv_post_symbolic.wgsl  # NEW: Post-symbolic shader
├── assets/
│   ├── hello_holographic.rts.png       # NEW: Test asset
│   └── hello_holographic.rts.png.meta.json  # NEW: Dictionary
└── riscv_morphological_loader.js       # EXISTING: CPU-side loader

riscv_morphological_encoder.py          # MODIFY: Add symmetry
```

## Error Handling

| Error | Handling |
|-------|----------|
| Texture fetch fails | Throw descriptive error |
| Dictionary lookup OOB | Return NOP (0x00000013) |
| Shader compilation fails | Log to console, show error |
| Invalid symmetry mask | Trust encoder metadata |

## Test Strategy

### Unit Tests
- Shader compilation verification
- GlyphExecutor method existence
- Encoder symmetry calculation

### Integration Tests
- deploy() creates valid bind group
- execute() dispatches without errors
- readState() returns valid state

### E2E Tests
- test_glyph_executor.html runs in browser
- UART output shows expected text
- Stop button halts execution

## Technical Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Texture vs Buffer | Texture | Visual debuggability, future rendering |
| Dictionary on GPU | Yes | Avoid CPU round-trips |
| Alpha for symmetry | Yes | Reuses existing channel |
| 16x16 tiles | Yes | Matches morphological synthesizer |

## References

- docs/plans/2026-02-26-glyph-executor-post-symbolic.md
- apps/openspec/openspec/teams/glyph-executor-team.yaml
- systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
