# Glyph-to-Metal: Unified Architecture Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan.

**Goal:** Replace human-made languages with AI-evolved glyphs, progressing from Rust/WGSL to bare metal GPU execution.

**Architecture:** The infinite map IS a glyph program. The screen IS the program. Everything renders via executable glyphs on GPU.

**Tech Stack:** Rust (minimal seed), WGSL (synthetic silicon), Glyphs (AI-evolved), DRM/KMS (direct GPU), eventually bare metal

---

## Current State: Glyph-Native Architecture

### What's Complete

| Component | Status | Description |
|-----------|--------|-------------|
| `glyph_compiler` | ✅ Phase 1 | Rust crate compiling glyphs → SPIR-V |
| `glyph_evolution.py` | ✅ Phase 2 | AI-driven program evolution |
| `infinite_map.glyph` | ✅ | The infinite map AS a glyph program |
| `window_manager.glyph` | ✅ | Window manager as glyphs |
| New opcodes 230-236 | ✅ | Camera, Hilbert, Tile, Zoom, Pan |
| Autoresearch runner | ✅ | Overnight evolution infrastructure |

### The Transformation

```
BEFORE (Rust-heavy):
┌─────────────────────────────────────────┐
│  Rust (infinite_map_rs/)                │
│  ├── Camera system (hundreds of lines)  │
│  ├── Hilbert curve math                 │
│  ├── Tile loading/eviction              │
│  └── Rendering pipeline                 │
├─────────────────────────────────────────┤
│  WGSL shaders (minimal)                 │
└─────────────────────────────────────────┘

AFTER (Glyph-native):
┌─────────────────────────────────────────┐
│  Rust (~50 lines)                       │
│  └── init_gpu() + execute_frame()       │
├─────────────────────────────────────────┤
│  WGSL Scheduler (synthetic silicon)     │
│  └── Fetch-Decode-Execute loop          │
├─────────────────────────────────────────┤
│  infinite_map.glyph (THE MAP ITSELF)    │
│  ├── OP_CAMERA: Render viewport         │
│  ├── OP_HILBERT_D2XY: Spatial math      │
│  ├── OP_ZOOM/OP_PAN: Navigation         │
│  └── OP_TILE_LOAD/EVICT: Memory mgmt    │
└─────────────────────────────────────────┘
```

---

## Opcode Architecture

### Core Opcodes (200-227) - From champion_shader.wgsl

| Range | Category | Opcodes |
|-------|----------|---------|
| 200-203 | Arithmetic | ADD_M, SUB_M, MUL_M, DIV_M |
| 204-207 | Memory | LD, ST, MOV, CLR |
| 208-211 | Control | JMP, JZ, CALL_M, RET_M |
| 212, 215 | System | HALT, DRAW |
| 216-218 | Extended | ADD_MEM, SUB_MEM, INT_DISPATCH |
| 220-227 | AI-Native | BRANCH_PROB, CONFIDENCE, ALTERNATE, ATTENTION, MUTATE, SPAWN, EMBEDDING |

### Infinite Map Opcodes (230-236) - NEW

| Opcode | Name | Purpose |
|--------|------|---------|
| 230 | OP_CAMERA | Render viewport from Hilbert space |
| 231 | OP_HILBERT_D2XY | Convert D → (X,Y) |
| 232 | OP_HILBERT_XY2D | Convert (X,Y) → D |
| 233 | OP_TILE_LOAD | Load tile region |
| 234 | OP_TILE_EVICT | Evict tile region |
| 235 | OP_ZOOM | Set zoom level |
| 236 | OP_PAN | Pan camera by delta |

---

## Evolution Infrastructure

### Autoresearch Programs

| Program | Target | Metric |
|---------|--------|--------|
| `program_glyph_lang.md` | 120 FPS, 1M GIPS | Glyph execution speed |
| `program_ai_native_glyphs.md` | 1M GIPS probabilistic | BRANCH_PROB optimization |
| `program_spirv_compiler.md` | Self-hosted compilation | SPIR-V validity |

### Running Evolution

```bash
# Quick test (100 generations)
python3 apps/autoresearch/run_spirv_evolution.py

# Overnight mode (1000 generations)
python3 apps/autoresearch/run_spirv_evolution.py --overnight
```

### Results Logging

- `apps/autoresearch/spirv_results.tsv` - All experiments
- `apps/autoresearch/best_program.json` - Best evolved program
- `apps/autoresearch/evolution_dashboard.md` - Progress dashboard

---

## Remaining Phases

### Phase 2: DRM/KMS Direct Execution

**Goal:** Execute SPIR-V directly via DRM, no WebGPU.

**Key Tasks:**
1. Complete DRM device enumeration
2. Implement SPIR-V → AMDGPU/Intel command buffers
3. DMA-BUF zero-copy to display

**Files to Modify:**
- `systems/infinite_map_rs/src/backend/drm/mod.rs`
- `systems/infinite_map_rs/src/glass_ram/kms_scanout.rs`

### Phase 3: Custom Kernel Module

**Goal:** `geometry_os.ko` exposes glyph execution interface.

**Key Tasks:**
1. Create kernel module exposing `/dev/geometry_os`
2. Implement ioctl for glyph program submission
3. Direct GPU MMIO access

### Phase 4: Bare Metal Boot

**Goal:** Geometry OS boots directly, no Linux.

**Key Tasks:**
1. UEFI bootloader
2. GPU initialization from PCI
3. Glyph substrate as native memory

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Glyph compiles to valid SPIR-V | `test_glyph_to_spirv_compilation` passes |
| Evolution improves programs | Fitness trend increases over generations |
| No WGSL in glyph programs | Programs contain only opcodes 200-236 |
| Infinite map runs as glyph | `infinite_map.glyph` renders viewport |
| Self-hosting achieved | Glyphs compile glyphs |

---

## Key Files

| Path | Purpose |
|------|---------|
| `systems/glyph_compiler/` | Rust glyph → SPIR-V compiler |
| `systems/evolution_daemon/glyph_evolution.py` | Evolution logic |
| `systems/glyph_stratum/programs/infinite_map.glyph` | The map AS glyph |
| `systems/glyph_stratum/programs/window_manager.glyph` | Window manager AS glyph |
| `apps/autoresearch/run_spirv_evolution.py` | Overnight evolution runner |
| `docs/GLYPH_NATIVE_INFINITE_MAP.md` | Full architecture |

---

*Plan updated: 2026-03-14*
*Previous: glyph-to-metal Phase 1-4*
*New: Glyph-native unified architecture*
