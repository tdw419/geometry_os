---
name: geos-fonts
description: Use when the user asks to "render text", "use fonts", "add a label", "display text", "generate font atlas", "GlyphStratum opcodes", "spatial programs", "geos-font", "font is a program", "executable glyphs", "spatial JIT", "RISC-V to glyph", "bare metal", "DMA-BUF", "hardware VCC", "scanout attestation", "DrmGlyphExecutor", "native glyphs", "self-hosting glyphs", "meta-glyph", or mentions typography/labels in Geometry OS context.
category: Architecture/UI
---

# GEOS Fonts & GlyphStratum Architecture

In Geometry OS, the concept of a "font" extends beyond typography. A glyph is not just a visual shape; it is the fundamental unit of computation. **The screen is the CPU, every font is a program, and every character is executable.** 

This skill covers the deep "Glyph-as-Compute" architectural vision, spatial execution, and high-performance text rendering.

## When to Use

- Executing or debugging GlyphStratum spatial programs
- Transpiling architectures (e.g., RISC-V to Glyph microcode)
- Managing spatial JIT compilation loops
- Generating opcode atlases for WebGPU/WGPU execution
- Rendering standard text labels and terminal outputs
- **Spatial Auditing**: Verifying the structural health of glyph programs via visual patterns.

## The "Font is a Program" Paradigm

Geometry OS replaces traditional linear instructions with a 2D spatial execution model:
1. **GlyphStratum**: The runtime where opcodes are visually represented as glyphs.
2. **Spatial JIT**: The process of reading a 2D grid of glyphs, compiling them spatially, and executing them on the GPU substrate (`glyph_vm.wgsl`).
3. **RISC-V to Glyph**: Compiling standard binaries into 2D font layouts where locality dictates cache efficiency and execution flow (`riscv_to_spatial_jit.py`).
4. **Visual Morphology**: Program logic is determined by the *spatial relationship* (distance, orientation, proximity) between glyphs.

## The Semantic Stack (Strata)

Programs are organized into a vertical hierarchy of strata, each with a specific purpose:

| Stratum | Order | Purpose |
|---------|-------|---------|
| **SUBSTRATE** | 0 | Raw data, literals, constants, and base textures. |
| **MEMORY** | 1 | Variables, assignments, parameters, and state storage. |
| **LOGIC** | 2 | Function calls, operations, loops, and control flow. |
| **SPEC** | 3 | Specifications, invariants, and validation logic. |
| **INTENT** | 4 | High-level goals, module entry points, and primary objectives. |

## Pixel-to-Instruction Mapping (B-Channel)

The `glyph_vm.wgsl` execution engine decodes the visual state using the **B (Blue)** channel to identify the opcode family:

| B-Channel Value | Sector | Opcode Family | Purpose |
|-----------------|--------|---------------|---------|
| **0.0 - 0.2** | 0 | `OP_DATA` | Embedding, raw substrate access. |
| **0.2 - 0.4** | 1 | `OP_CALL` | Attention, logic execution, function invocation. |
| **0.4 - 0.6** | 2 | `OP_LOAD` | FFN (Feed-Forward), memory retrieval. |
| **0.6 - 0.8** | 3 | `OP_STORE` | Norm, memory mutation, state updates. |
| **0.8 - 1.0** | 4 | `OP_NOP` | No operation, spatial padding. |

**Other Channels:**
- **R (Red)**: **Activation/Magnitude** - The raw value or weight of the instruction.
- **G (Green)**: **Entropy/Condition** - The uncertainty or conditional probability of execution.
- **A (Alpha)**: **Visibility** - Usually 1.0 (opaque) for visual shell presence.

## Core Capabilities

### 1. GlyphStratum Integration (The Substrate)

Manage the executable font grids:
- `systems/glyph_stratum/generate_font_atlas.py`: Generates the `.raw` and `.json` texture atlases mapping opcodes to their visual representation.
- `systems/glyph_stratum/glyph_api.py`: Interaction layer for spatial execution grids. Provides `GlyphBuilder` for programmatic creation of spatial logic.
- `systems/glyph_stratum/glyph_editor.html`: The visual workspace for writing and debugging spatial programs.

### 2. Traditional Text & Atlas Management

For conventional UI labels and console output:
- `geos-font list-fonts`: List available system fonts.
- `geos-font load --name=monospace`: Load a font context.
- `geos-font render "Hello" --font=monospace --size=14 --json`: Render text to RGBA pixels.
- `geos-font metrics "Hello" --json`: Get exact typographic dimensions without rendering.

## Procedure: Writing a Spatial Program

### Step 1: Atlas Generation
Before spatial execution, the system needs to know what the computational glyphs look like:
```bash
python3 systems/glyph_stratum/generate_font_atlas.py
```
*This binds your executable opcodes to specific pixel patterns in `opcode_atlas.raw`.*

### Step 2: Spatial Layout (The Code)
Programs are JSON matrices mapping opcodes to 2D coordinates. Use `GlyphBuilder` in Python to generate these:
```python
from glyph_stratum.core.stratum import Stratum, Opcode
from systems.glyph_stratum.glyph_api import GlyphBuilder

builder = GlyphBuilder("addition")
builder.substrate("A", 5).substrate("B", 10)
# Spatial relationship (proximity) defines the 'ADD' operation
```

**Example JSON (.glyph):**
```json
{
  "name": "Addition",
  "glyphs": {
    "0": { "stratum": "INTENT", "opcode": "MODULE", "metadata": { "deps": [1] } },
    "1": { "stratum": "LOGIC", "opcode": "CALL", "metadata": { "deps": [2, 3], "rationale": "+" } },
    "2": { "stratum": "MEMORY", "opcode": "DATA", "metadata": { "invariants": {"value": 3} } }
  }
}
```

### Step 3: Spatial JIT / Execution
The system "reads" the visual layout and executes the data flow based on **Hilbert curve spatial locality**. This ensures that "hot" glyphs are spatially adjacent, maximizing cache hits in the 2D execution loop.

## Visual Consistency Contract (VCC)

The VCC ensures glyphs are identical across all three execution layers:

| Layer | Technology | File | Validation |
|-------|------------|------|------------|
| **Foundry** | Python/FreeType | `systems/fonts/font_renderer.py` | GlyphMetrics JSON |
| **Shell** | TypeScript/PixiJS | `systems/visual_shell/` | Atlas WebP hash |
| **Kernel** | Rust/WGPU/DRM | `systems/infinite_map_rs/` | Hardware Hash (VRAM) |

### VCC Commands

```bash
# Generate contract (automatic during atlas generation)
python3 systems/glyph_stratum/generate_font_atlas.py

# Validate all layers (including Hardware Attestation)
python3 -m systems.vcc.cli validate

# Check contract status
python3 -m systems.vcc.cli status
```

### Hardware Attestation (Bare Metal)

Geometry OS supports **Hardware-Enforced VCC** where the GPU is the source of truth, bypassing CPU tampering entirely.

**Components:**
| Component | Path | Purpose |
|-----------|------|---------|
| `HardwareVCC` | `systems/infinite_map_rs/src/backend/drm/vcc_compute.rs` | GPU-side atlas hashing |
| `vcc_hash.wgsl` | `systems/infinite_map_rs/src/backend/drm/shaders/vcc_hash.wgsl` | FNV-1a + MurmurHash3 compute shader |
| `DmaBuf` | `systems/infinite_map_rs/src/backend/drm/dmabuf.rs` | Zero-copy VRAM access with `verify_vcc()` |
| `Scanout` | `systems/infinite_map_rs/src/backend/drm/scanout.rs` | Display attestation with `attest_display()` |
| `DrmGlyphExecutor` | `systems/infinite_map_rs/src/backend/drm/glyph_executor.rs` | Atomic verify-and-execute |

**Atomic Verify-and-Execute:**
```rust
// The GPU verifies the visual substrate BEFORE executing any glyph program
let result = executor.execute_attested(
    &atlas_buffer,
    width, height,
    contract_hash,
    inputs,
    output_size,
)?;

if !result.executed {
    // VERIFICATION FAILED - Execution was BLOCKED
    // The atlas hash didn't match the VCC contract
}
```

**CLI Integration:**
```bash
# Hardware validation (prefers GPU attestation, falls back to software)
python3 -m systems.vcc.cli validate --prefer-hardware

# Software-only validation
python3 -m systems.vcc.cli validate --no-hardware
```

## Bare Metal Glyph Execution

### Native Glyph Windowing

Windows in Geometry OS are **Autonomous Spatial Programs** - not pixel buffers:

| Traditional | Geometry OS |
|-------------|-------------|
| Window = RGBA pixel buffer | Window = Grid of executable glyphs |
| Compositor = CPU buffer blender | Compositor = Spatial instruction dispatcher (GPU) |
| Interaction = Event loop in app code | Interaction = Opcode branching (JZ, JMP) in glyph programs |

**Key Files:**
- `docs/superpowers/specs/2026-03-12-native-glyph-windowing-design.md` - Full design
- `systems/infinite_map_rs/src/backend/drm/shaders/glyph_microcode.wgsl` - WGSL bootloader

**New Opcodes for Windowing (216-218):**
| Opcode | Name | Purpose |
|--------|------|---------|
| 216u | `ADD_MEM` | Memory-to-memory addition (drag delta) |
| 217u | `SUB_MEM` | Memory-to-memory subtraction |
| 218u | `INT_DISPATCH` | Hit-test mouse against region table |

### Self-Hosting Vision (Future)

The ultimate goal: **The VCC system itself runs as glyphs verifying glyphs.**

```
Phase 1: EXTERNAL (Python/Rust) - Current
├── VCC written in traditional languages
├── Validates glyph programs
└── Generates contracts

Phase 2: TRANSITIONAL
├── VCC glyph program validates other glyphs
├── Bootstrapped from external seed
└── System becomes partially self-hosting

Phase 3: NATIVE
├── All verification runs as spatial glyphs
├── "The screen verifies itself"
└── External code only for debugging
```

**The Meta-Glyph Problem:** How does the VCC glyph verify itself?
- Fixed-point: Known hash baked into GPU substrate
- Hierarchical: Hardware ROM validates first-layer VCC
- Quorum: Multiple VCC programs cross-validate

## Troubleshooting

### "Invalid Opcode Visual"
**Cause**: The spatial JIT cannot map a rendered glyph back to an opcode.
**Fix**: Regenerate the font atlas (`generate_font_atlas.py`) and ensure your shader pipeline matches `opcode_positions.json`.

### "PAS Alignment Error"
**Cause**: Low Phase Alignment Stability. The program's spatial layout is scattered, causing cache misses.
**Fix**: Use the `riscv_to_spatial_jit.py` Hilbert mapping to re-orient the program.

## Related Skills
- `pixelrts-convert` - For encoding glyph programs into bootable RTS containers
- `riscv-encode` - Transpiling standard architectures into Hilbert/spatial layouts
- `visual-shell-debug` - Debugging the WebGPU rendering of the GlyphStratum
- `genome-validate` - Evolving glyph programs via genetic mutation of the spatial layout
