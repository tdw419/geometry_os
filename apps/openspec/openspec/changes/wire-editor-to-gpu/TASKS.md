# Tasks: Wire Self-Hosting Editor to Production GPU

## Phase 1: Shader Alignment

### Task 1.1: Reconcile Opcode 215 in WGSL
- **Assignee**: shader-architect
- **File**: `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`
- **Steps**:
  1. Move `OP2_NOT` from 215 to 240.
  2. Define `const OP_DRAW: u32 = 215u;`.
  3. Update `GLYPH_PROGRAMMING_REFERENCE.md` to reflect the move.
- **AC**: WGSL compiles and 215 is reserved for DRAW.

### Task 1.2: Implement DRAW in WGSL
- **Assignee**: shader-architect
- **File**: `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`
- **Steps**:
  1. Add `case 215u` to the scheduler switch.
  2. Implement 64x64 pixel blit loop.
  3. Ensure it uses `vms[vm_idx].regs` for glyph_id, x, y.
- **AC**: Diagnostic tests show successful blits in diagnostic VRAM view.

## Phase 2: Host Integration

### Task 2.1: Compile and Load Editor
- **Assignee**: compositor-integrator
- **File**: `systems/infinite_map_rs/src/app.rs`
- **Steps**:
  1. Compile `self_hosting_editor.glyph` to `.rts.png`.
  2. Modify `app.rs` to load this as the initial RAM texture.
  3. Ensure VM 0 is initialized at Hilbert index 0.
- **AC**: App starts with the editor binary in the RAM texture.

### Task 2.2: Physical Keyboard Bridge
- **Assignee**: compositor-integrator
- **File**: `systems/infinite_map_rs/src/input_manager.rs`
- **Steps**:
  1. Catch keyboard scancodes in Rust.
  2. Write event payload to VM 0 mailbox at 0x200 (type, char).
- **AC**: Typing causes the editor to render glyphs to the screen segment.

## Phase 3: Sovereignty Validation

### Task 3.1: Full GPU-Native Loop Test
- **Assignee**: substrate-verifier
- **Steps**:
  1. Open the editor on real GPU.
  2. Type a simple Glyph program.
  3. Press F5 (COMPILE) and F6 (RUN).
  4. Verify the new VM starts on the GPU.
- **AC**: Milestone 11 documented in `SOVEREIGNTY_LADDER.md`.
