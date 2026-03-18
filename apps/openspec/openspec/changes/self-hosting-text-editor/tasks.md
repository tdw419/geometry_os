# Tasks: Self-Hosting Text Editor

## Phase 1: Text Buffer Core

### Task 1.1: Implement text buffer INSERT
- **Assignee**: buffer-architect
- **File**: `systems/infinite_map_rs/src/synthetic_vram.rs`
- **Test**: `test_text_buffer_insert`
- **Steps**:
  1. Write failing test for INSERT event
  2. Implement Glyph program to handle INSERT
  3. Verify buffer, cursor, buffer_len update correctly
  4. Commit

### Task 1.2: Implement text buffer DELETE
- **Assignee**: buffer-architect
- **File**: `systems/infinite_map_rs/src/synthetic_vram.rs`
- **Test**: `test_text_buffer_delete`
- **Dependencies**: Task 1.1
- **Steps**:
  1. Write failing test for DELETE event
  2. Implement DELETE handler (backspace)
  3. Verify buffer shrinks correctly
  4. Commit

### Task 1.3: Implement cursor movement
- **Assignee**: buffer-architect
- **File**: `systems/infinite_map_rs/src/synthetic_vram.rs`
- **Tests**: `test_text_buffer_cursor_left`, `test_text_buffer_cursor_right`
- **Dependencies**: Task 1.2
- **Steps**:
  1. Write failing tests for CURSOR_LEFT/RIGHT
  2. Implement cursor bounds checking
  3. Verify cursor stays within buffer
  4. Commit

## Phase 2: Glyph Program

### Task 2.1: Create text_editor.glyph skeleton
- **Assignee**: event-router
- **File**: `systems/glyph_stratum/programs/text_editor.glyph`
- **Dependencies**: Task 1.3
- **Steps**:
  1. Create file with memory layout comments
  2. Implement event loop structure
  3. Add dispatch for 6 event types
  4. Verify compiles with compile_glyph.py
  5. Commit

### Task 2.2: Implement all event handlers
- **Assignee**: event-router
- **File**: `systems/glyph_stratum/programs/text_editor.glyph`
- **Dependencies**: Task 2.1
- **Steps**:
  1. Port INSERT handler from test
  2. Port DELETE handler from test
  3. Add CURSOR_LEFT/RIGHT handlers
  4. Add COMPILE stub (copy to 0x3000)
  5. Add RUN stub
  6. Commit

## Phase 3: Assembler Integration

### Task 3.1: Integrate assembler with editor
- **Assignee**: assembler-integrator
- **File**: `systems/glyph_stratum/programs/text_editor.glyph`
- **Test**: `test_editor_compile_simple`
- **Dependencies**: Task 2.2
- **Steps**:
  1. Write failing test for compile
  2. Implement buffer copy to 0x3000
  3. Wire assembler call
  4. Verify output at 0x5000
  5. Commit

## Phase 4: VM Spawning

### Task 4.1: Implement RUN with SPATIAL_SPAWN
- **Assignee**: vm-spawner
- **File**: `systems/glyph_stratum/programs/text_editor.glyph`
- **Test**: `test_edit_compile_execute_loop`
- **Dependencies**: Task 3.1
- **Steps**:
  1. Write failing E2E test
  2. Implement SPATIAL_SPAWN call (opcode 225)
  3. Handle spawn errors
  4. Verify child VM executes
  5. Commit

## Phase 5: Documentation

### Task 5.1: Update sovereignty ladder
- **Assignee**: integration-validator
- **File**: `docs/SOVEREIGNTY_LADDER.md`
- **Dependencies**: Task 4.1
- **Steps**:
  1. Add Milestone 10 section
  2. Document proof and significance
  3. Update "Next Horizon"
  4. Commit

---

## Progress Tracking

| Task | Status | Assignee |
|------|--------|----------|
| 1.1 INSERT | pending | buffer-architect |
| 1.2 DELETE | pending | buffer-architect |
| 1.3 Cursor | pending | buffer-architect |
| 2.1 Skeleton | pending | event-router |
| 2.2 Handlers | pending | event-router |
| 3.1 Assembler | pending | assembler-integrator |
| 4.1 Spawn | pending | vm-spawner |
| 5.1 Docs | pending | integration-validator |
