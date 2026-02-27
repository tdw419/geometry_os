---
spec: glyph-executor-post-symbolic
phase: requirements
created: 2026-02-26T00:00:00Z
---

# Requirements: GlyphExecutor Post-Symbolic Execution

## Goal

Implement GPU-side holographic decoding of morphological glyph textures, eliminating CPU pre-decode and achieving zero-symbol execution where the GPU decodes instructions directly via dot-product operations.

## User Stories

### US-1: Holographic Instruction Fetch
**As a** GPU compute shader
**I want** to fetch instructions directly from a texture atlas
**So that** I can execute without CPU-side pre-decoding

**Acceptance Criteria:**
- AC-1.1: Shader samples texture at PC coordinates
- AC-1.2: TokenID extracted from G/B channels
- AC-1.3: Dictionary lookup returns RISC-V u32

### US-2: Visual Motherboard Orchestration
**As a** developer
**I want** a GlyphExecutor class that manages the execution substrate
**So that** I can deploy and run holographic kernels easily

**Acceptance Criteria:**
- AC-2.1: deploy(textureUrl, kernelId) creates bind groups
- AC-2.2: execute(kernelId, cycles) dispatches compute
- AC-2.3: readState(kernelId) returns CPU registers

### US-3: Symmetry Metadata Encoding
**As a** morphological encoder
**I want** to encode symmetry information in the alpha channel
**So that** holographic resonance can be validated

**Acceptance Criteria:**
- AC-3.1: Alpha channel encodes symmetry mask (0x80=full, 0x40=h_sym, etc.)
- AC-3.2: Encoder supports tile mode for 16x16 glyph clusters
- AC-3.3: Generated assets include symmetry metadata

### US-4: Continuous Execution Loop
**As a** developer
**I want** continuous execution with UART output callback
**So that** I can see program output in real-time

**Acceptance Criteria:**
- AC-4.1: startContinuous() runs animation frame loop
- AC-4.2: UART output delivered via callback
- AC-4.3: stop() cleanly halts execution

## Functional Requirements

### FR-1: Post-Symbolic Shader
- FR-1.1: Accept glyph atlas texture as binding 0
- FR-1.2: Accept dictionary storage buffer as binding 1
- FR-1.3: Implement sample_token_id(pc) using textureLoad
- FR-1.4: Implement holographic_fetch(pc) returning u32
- FR-1.5: Execute all RISC-V opcodes (LUI, AUIPC, JAL, JALR, BRANCH, LOAD, STORE, OP-IMM, OP, SYSTEM)

### FR-2: GlyphExecutor Class
- FR-2.1: initialize() loads shader and creates pipeline
- FR-2.2: deploy() creates texture, buffers, bind group
- FR-2.3: execute() dispatches compute pass
- FR-2.4: readState() maps and reads state buffer
- FR-2.5: startContinuous() runs animation loop
- FR-2.6: stop() halts execution

### FR-3: Encoder Updates
- FR-3.1: calculate_symmetry_mask() function
- FR-3.2: Tile mode option in encoder
- FR-3.3: Alpha channel = symmetry mask

### FR-4: Integration
- FR-4.1: Test HTML page with Init/Load/Start/Stop buttons
- FR-4.2: UART output display
- FR-4.3: End-to-end verification with hello_syscall.bin

## Non-Functional Requirements

### NFR-1: Performance
- Texture sampling overhead < 1μs per instruction
- Dictionary lookup O(1) via direct indexing

### NFR-2: Compatibility
- WebGPU (Chrome 113+, Firefox 118+)
- ES6 modules
- Python 3.8+ for encoder

### NFR-3: Maintainability
- JSDoc comments on all public methods
- WGSL comments explaining holographic fetch
- Clear separation between standard and post-symbolic paths

## Out of Scope

- Multi-core execution (workgroup dispatch)
- Tier-2 JIT transpilation
- Visual debugger with Infinite Map
- ML-based geometric integrity scoring

## Dependencies

- Existing `visual_cpu_riscv.wgsl` for instruction logic reference
- Existing `riscv_morphological_encoder.py`
- Existing `gpu_execution_system.js` patterns
- `boot-linux-geometry-font` spec (completed)
