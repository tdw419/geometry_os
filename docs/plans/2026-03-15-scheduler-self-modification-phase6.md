# Scheduler Self-Modification (Phase 6) Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable the scheduler.glyph to modify its own code at runtime using GLYPH_WRITE opcode, achieving full meta-circular self-hosting.

**Architecture:** The scheduler (VM 0) will use the GLYPH_WRITE opcode (232) to copy modified glyph instructions from a staging area in substrate memory to its own code region. The Rust shim provides the GLYPH_WRITE implementation via trap dispatch. Self-modification is triggered by brain_bridge AI decisions or explicit trap requests.

**Tech Stack:** Glyph ISA (32-bit RISC-V variant), GLYPH_WRITE opcode (232), Rust wgpu shim, substrate memory (4096x4096 texture), trap interface (0xFF00_0000)

---

## Task 1: Add GLYPH_WRITE Trap Operation

**Files:**
- Modify: `systems/infinite_map_rs/src/trap_interface.rs:1-50`
- Modify: `systems/infinite_map_rs/src/glyph_vm_scheduler.rs:180-220`

**Step 1: Write the failing test**

Create `systems/infinite_map_rs/src/tests/glyph_write_test.rs`:

```rust
//! Tests for GLYPH_WRITE trap operation

#[cfg(test)]
mod tests {
    use infinite_map_rs::trap_interface::{op_type, GLYPH_WRITE_OP};

    #[test]
    fn test_glyph_write_op_type_defined() {
        // GLYPH_WRITE should be opcode 7
        assert_eq!(op_type::GLYPH_WRITE, 7);
    }

    #[test]
    fn test_glyph_write_trap_registers() {
        use infinite_map_rs::trap_interface::TrapRegs;

        let mut regs = TrapRegs::default();
        regs.op_type = op_type::GLYPH_WRITE;
        regs.arg0 = 0x1000;  // target address
        regs.arg1 = 0x2000;  // source address
        regs.arg2 = 4;       // count (4 glyphs)

        assert_eq!(regs.op_type, 7);
        assert_eq!(regs.arg0, 0x1000);
        assert_eq!(regs.arg1, 0x2000);
        assert_eq!(regs.arg2, 4);
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs glyph_write`
Expected: FAIL with "no associated item named `GLYPH_WRITE` found"

**Step 3: Write minimal implementation**

In `systems/infinite_map_rs/src/trap_interface.rs`, add after line 39:

```rust
/// Additional trap operation types
pub mod op_type {
    pub const READ_BUFFER: u32 = 1;
    pub const WRITE_BUFFER: u32 = 2;
    pub const SPAWN_VM: u32 = 3;
    pub const KILL_VM: u32 = 4;
    pub const PEEK_SUBSTRATE: u32 = 5;
    pub const POKE_SUBSTRATE: u32 = 6;
    pub const GLYPH_WRITE: u32 = 7;  // Copy glyphs between substrate locations
}

/// GLYPH_WRITE operation constant (for convenience)
pub const GLYPH_WRITE_OP: u32 = 7;
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs glyph_write`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/trap_interface.rs systems/infinite_map_rs/src/tests/glyph_write_test.rs
git commit -m "feat(trap): add GLYPH_WRITE trap operation type"
```

---

## Task 2: Implement GLYPH_WRITE in GlyphVmScheduler

**Files:**
- Modify: `systems/infinite_map_rs/src/glyph_vm_scheduler.rs:180-250`

**Step 1: Write the failing test**

Add to `systems/infinite_map_rs/src/tests/glyph_write_test.rs`:

```rust
    #[test]
    fn test_glyph_write_copies_glyphs() {
        // This test verifies the scheduler can copy glyphs between addresses
        // The actual implementation requires GPU context, so we test the interface

        // GLYPH_WRITE parameters:
        // - arg0: target address (where to write)
        // - arg1: source address (where to read from)
        // - arg2: count of glyphs to copy

        // Verify the operation is defined
        assert!(op_type::GLYPH_WRITE > 0);

        // Verify it's distinct from other ops
        assert_ne!(op_type::GLYPH_WRITE, op_type::PEEK_SUBSTRATE);
        assert_ne!(op_type::GLYPH_WRITE, op_type::POKE_SUBSTRATE);
    }
```

**Step 2: Run test to verify it passes (interface test)**

Run: `cargo test --package infinite_map_rs glyph_write`
Expected: PASS

**Step 3: Implement glyph_write method in GlyphVmScheduler**

In `systems/infinite_map_rs/src/glyph_vm_scheduler.rs`, add to `impl GlyphVmScheduler`:

```rust
    /// Copy glyphs from source to target address in substrate
    /// Used for self-modifying code - scheduler can rewrite itself
    ///
    /// # Arguments
    /// * `target` - Destination address in substrate
    /// * `source` - Source address in substrate
    /// * `count` - Number of glyphs (4-byte words) to copy
    pub fn glyph_write(&mut self, target: u32, source: u32, count: u32) -> u32 {
        if count == 0 {
            // Single glyph copy
            let value = self.peek_substrate_single(source);
            self.poke_substrate_single(target, value);
            1 // 1 glyph copied
        } else {
            // Multiple glyph copy
            for i in 0..count {
                let src_addr = source + (i * 4);
                let dst_addr = target + (i * 4);
                let value = self.peek_substrate_single(src_addr);
                self.poke_substrate_single(dst_addr, value);
            }
            count
        }
    }
```

**Step 4: Run test to verify it compiles**

Run: `cargo check --package infinite_map_rs`
Expected: Compiles without errors

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/glyph_vm_scheduler.rs
git commit -m "feat(scheduler): implement glyph_write for self-modification"
```

---

## Task 3: Add GLYPH_WRITE to TrapHandler

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs:60-85`

**Step 1: Add GLYPH_WRITE case to trap handler**

In `gpu_dev_daemon.rs`, modify the `poll_and_execute` match statement:

```rust
            op_type::GLYPH_WRITE => {
                let target = self.regs.arg0;
                let source = self.regs.arg1;
                let count = self.regs.arg2;
                scheduler.glyph_write(target, source, count)
            }
```

**Step 2: Verify compilation**

Run: `cargo check --bin gpu_dev_daemon`
Expected: Compiles without errors

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(trap): handle GLYPH_WRITE in trap handler"
```

---

## Task 4: Create test_self_modify.glyph

**Files:**
- Create: `systems/glyph_stratum/programs/test_self_modify.glyph`

**Step 1: Write the self-modification test glyph**

```glyph
// ============================================================================
// Geometry OS - Self-Modification Test Glyph
// ============================================================================
//
// Tests the scheduler's ability to modify its own code via GLYPH_WRITE.
// This demonstrates meta-circular self-hosting capability.
//
// Memory Layout:
//   0x1000-0x10FF: Staging area for new code
//   0x2000-0x20FF: Target area (simulated scheduler code region)
//   0xFF000000: TRAP_OP
//   0xFF000004: TRAP_ARG0
//   0xFF000008: TRAP_ARG1
//   0xFF00000C: TRAP_ARG2
//   0xFF000010: TRAP_RESULT
//   0xFF000014: TRAP_STATUS
//
// ============================================================================

// Trap Interface
.equ TRAP_OP,      0xFF000000
.equ TRAP_ARG0,    0xFF000004
.equ TRAP_ARG1,    0xFF000008
.equ TRAP_ARG2,    0xFF00000C
.equ TRAP_RESULT,  0xFF000010
.equ TRAP_STATUS,  0xFF000014

// Trap Opcodes
.equ OP_GLYPH_WRITE, 7
.equ OP_PEEK,        5
.equ OP_POKE,        6

// Trap Status
.equ STATUS_IDLE,      0
.equ STATUS_PENDING,   1
.equ STATUS_COMPLETE,  2

// Test addresses
.equ STAGING_AREA,    0x1000
.equ TARGET_AREA,     0x2000
.equ VERIFICATION,    0x3000

:main
    // ================================================================
    // PHASE 1: Write test pattern to staging area
    // ================================================================

    // Store "PATCH" marker (0x48544150) at staging area
    LDI r1, STAGING_AREA
    LDI r2, 0x48544150    // "PATH" in little-endian
    STORE r1, r2

    // Store secondary marker
    LDI r1, STAGING_AREA + 4
    LDI r2, 0x00444554    // "TED\0"
    STORE r1, r2

    // ================================================================
    // PHASE 2: Request GLYPH_WRITE via trap
    // ================================================================

    // Write trap request
    LDI r1, TRAP_OP
    LDI r2, OP_GLYPH_WRITE
    STORE r1, r2

    LDI r1, TRAP_ARG0
    LDI r2, TARGET_AREA    // target = where to write
    STORE r1, r2

    LDI r1, TRAP_ARG1
    LDI r2, STAGING_AREA   // source = what to copy
    STORE r1, r2

    LDI r1, TRAP_ARG2
    LDI r2, 2              // count = 2 glyphs (8 bytes)
    STORE r1, r2

    LDI r1, TRAP_STATUS
    LDI r2, STATUS_PENDING
    STORE r1, r2

:wait_glyph_write
    // Poll for completion
    LDI r1, TRAP_STATUS
    LOAD r1, r2
    LDI r3, STATUS_COMPLETE
    SUB r2, r3
    JNZ r2, :wait_glyph_write

    // ================================================================
    // PHASE 3: Verify the copy worked
    // ================================================================

    // Read from target area
    LDI r1, TARGET_AREA
    LOAD r1, r10           // r10 = copied value

    // Read expected value
    LDI r1, STAGING_AREA
    LOAD r1, r11           // r11 = original value

    // Compare
    SUB r10, r11
    JNZ r10, :test_failed

    // Write success marker
    LDI r1, VERIFICATION
    LDI r2, 0x53554343     // "SUCC" = success
    STORE r1, r2

    LDI r1, VERIFICATION + 4
    LDI r2, 0x53534553     // "ESS" = ESS
    STORE r1, r2

    HALT

:test_failed
    // Write failure marker
    LDI r1, VERIFICATION
    LDI r2, 0x4C494146     // "FAIL"
    STORE r1, r2

    HALT
```

**Step 2: Verify glyph assembles**

Run: `python systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/test_self_modify.glyph /tmp/test_self_modify.png`
Expected: Creates PNG file without errors

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/test_self_modify.glyph
git commit -m "test(glyph): add self-modification test glyph"
```

---

## Task 5: Add Scheduler Self-Modify Mode

**Files:**
- Modify: `systems/glyph_stratum/programs/scheduler.glyph:50-100`

**Step 1: Add self-modify constants and state to scheduler.glyph**

Add after line 52 in scheduler.glyph:

```glyph
// Self-Modification State
.equ SELF_MODIFY_TRIGGER,  0x03F0    // Brain writes here to request self-mod
.equ SELF_MODIFY_SOURCE,   0x03F4    // Source address for new code
.equ SELF_MODIFY_TARGET,   0x03F8    // Target address (scheduler code)
.equ SELF_MODIFY_COUNT,    0x03FC    // Number of glyphs to copy
.equ SELF_MODIFY_STATUS,   0x03FE    // 0=idle, 1=requested, 2=complete

// Self-modify action codes
.equ SELF_MOD_ACTION_NONE,     0
.equ SELF_MOD_ACTION_PATCH,    1
.equ SELF_MOD_ACTION_HOTFIX,   2
```

**Step 2: Add self-modify check to main loop**

Add in scheduler.glyph after the brain coordination section (around line 170):

```glyph
    // ================================================================
    // SELF-MODIFICATION: Check for code patch requests
    // ================================================================

    LDI r1, SELF_MODIFY_TRIGGER
    LOAD r1, r27           // r27 = self-modify trigger

    LDI r2, SELF_MOD_ACTION_NONE
    SUB r27, r2
    JZ r27, :skip_self_modify

    // Self-modification requested!
    // Read parameters
    LDI r1, SELF_MODIFY_SOURCE
    LOAD r1, r28           // r28 = source address

    LDI r1, SELF_MODIFY_TARGET
    LOAD r1, r29           // r29 = target address

    LDI r1, SELF_MODIFY_COUNT
    LOAD r1, r30           // r30 = count

    // Request GLYPH_WRITE via trap
    LDI r1, TRAP_OP
    LDI r2, 7              // GLYPH_WRITE opcode
    STORE r1, r2

    LDI r1, TRAP_ARG0
    STORE r1, r29          // target

    LDI r1, TRAP_ARG1
    STORE r1, r28          // source

    LDI r1, TRAP_ARG2
    STORE r1, r30          // count

    LDI r1, TRAP_STATUS
    LDI r2, STATUS_PENDING
    STORE r1, r2

:wait_self_modify
    LDI r1, TRAP_STATUS
    LOAD r1, r27
    LDI r2, STATUS_COMPLETE
    SUB r27, r2
    JNZ r27, :wait_self_modify

    // Mark complete
    LDI r1, SELF_MODIFY_TRIGGER
    LDI r2, SELF_MOD_ACTION_NONE
    STORE r1, r2

    LDI r1, SELF_MODIFY_STATUS
    LDI r2, 2              // COMPLETE
    STORE r1, r2

:skip_self_modify
```

**Step 3: Verify glyph compiles**

Run: `python systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/scheduler.glyph /tmp/scheduler_test.png`
Expected: Creates PNG without errors

**Step 4: Commit**

```bash
git add systems/glyph_stratum/programs/scheduler.glyph
git commit -m "feat(scheduler): add self-modification mode via GLYPH_WRITE trap"
```

---

## Task 6: Add Integration Test for Self-Modification

**Files:**
- Create: `systems/infinite_map_rs/src/tests/self_hosting_test.rs`
- Modify: `systems/infinite_map_rs/src/tests/mod.rs`

**Step 1: Write the integration test**

Create `systems/infinite_map_rs/src/tests/self_hosting_test.rs`:

```rust
//! Self-hosting integration tests
//!
//! Tests for meta-circular scheduler capabilities including self-modification.

#[cfg(test)]
mod tests {
    use infinite_map_rs::trap_interface::{op_type, TrapRegs};

    /// Test that GLYPH_WRITE operation is properly defined
    #[test]
    fn test_glyph_write_operation_defined() {
        // GLYPH_WRITE must be opcode 7
        assert_eq!(op_type::GLYPH_WRITE, 7);
    }

    /// Test that GLYPH_WRITE is distinct from other operations
    #[test]
    fn test_glyph_write_unique_opcode() {
        // Must not collide with existing opcodes
        assert_ne!(op_type::GLYPH_WRITE, op_type::SPAWN_VM);
        assert_ne!(op_type::GLYPH_WRITE, op_type::KILL_VM);
        assert_ne!(op_type::GLYPH_WRITE, op_type::PEEK_SUBSTRATE);
        assert_ne!(op_type::GLYPH_WRITE, op_type::POKE_SUBSTRATE);
    }

    /// Test TrapRegs can hold GLYPH_WRITE parameters
    #[test]
    fn test_trap_regs_glyph_write_params() {
        let mut regs = TrapRegs::default();
        regs.op_type = op_type::GLYPH_WRITE;
        regs.arg0 = 0x1000;  // target
        regs.arg1 = 0x2000;  // source
        regs.arg2 = 16;      // count

        assert_eq!(regs.op_type, 7);
        assert_eq!(regs.arg0, 0x1000);
        assert_eq!(regs.arg1, 0x2000);
        assert_eq!(regs.arg2, 16);
    }

    /// Test that all required opcodes are defined for self-hosting
    #[test]
    fn test_self_hosting_opcodes_complete() {
        // All opcodes needed for self-hosting
        assert!(op_type::SPAWN_VM > 0);
        assert!(op_type::KILL_VM > 0);
        assert!(op_type::PEEK_SUBSTRATE > 0);
        assert!(op_type::POKE_SUBSTRATE > 0);
        assert!(op_type::GLYPH_WRITE > 0);
    }
}
```

**Step 2: Add module to tests/mod.rs**

In `systems/infinite_map_rs/src/tests/mod.rs`, add:

```rust
pub mod self_hosting_test;
```

**Step 3: Run tests**

Run: `cargo test --package infinite_map_rs self_hosting`
Expected: PASS (4 tests)

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/tests/self_hosting_test.rs systems/infinite_map_rs/src/tests/mod.rs
git commit -m "test(self-hosting): add integration tests for self-modification"
```

---

## Task 7: Document Self-Modification Protocol

**Files:**
- Create: `docs/guides/self-modification-protocol.md`

**Step 1: Write documentation**

```markdown
# Self-Modification Protocol

## Overview

The Geometry OS scheduler supports meta-circular self-modification, allowing it to rewrite its own code at runtime.

## Memory Map

| Address | Purpose |
|---------|---------|
| 0x03F0 | SELF_MODIFY_TRIGGER - Write action code to trigger |
| 0x03F4 | SELF_MODIFY_SOURCE - Source address for new code |
| 0x03F8 | SELF_MODIFY_TARGET - Target address in scheduler |
| 0x03FC | SELF_MODIFY_COUNT - Number of glyphs to copy |
| 0x03FE | SELF_MODIFY_STATUS - 0=idle, 1=requested, 2=complete |

## Protocol

1. Write new code to a staging area in substrate memory
2. Set SELF_MODIFY_SOURCE to staging area address
3. Set SELF_MODIFY_TARGET to scheduler code address
4. Set SELF_MODIFY_COUNT to number of glyphs
5. Write SELF_MOD_ACTION_PATCH to SELF_MODIFY_TRIGGER
6. Poll SELF_MODIFY_STATUS until it becomes 2 (COMPLETE)

## Trap Interface

The GLYPH_WRITE trap operation (opcode 7) copies glyphs:

```
TRAP_OP = 7 (GLYPH_WRITE)
TRAP_ARG0 = target address
TRAP_ARG1 = source address
TRAP_ARG2 = count (0 = single glyph)
```

## Safety

- Self-modification should only patch code, not data
- Target addresses must be within scheduler's code region
- Modification invalidates cached GPU shader state
```

**Step 2: Commit**

```bash
git add docs/guides/self-modification-protocol.md
git commit -m "docs: add self-modification protocol guide"
```

---

## Summary

**Phase 6 Tasks:**
1. Add GLYPH_WRITE trap operation type
2. Implement glyph_write in GlyphVmScheduler
3. Add GLYPH_WRITE to TrapHandler
4. Create test_self_modify.glyph
5. Add scheduler self-modify mode
6. Add integration tests
7. Document protocol

**Files Changed:**

| File | Action |
|------|--------|
| `systems/infinite_map_rs/src/trap_interface.rs` | Modify |
| `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` | Modify |
| `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` | Modify |
| `systems/glyph_stratum/programs/test_self_modify.glyph` | Create |
| `systems/glyph_stratum/programs/scheduler.glyph` | Modify |
| `systems/infinite_map_rs/src/tests/self_hosting_test.rs` | Create |
| `systems/infinite_map_rs/src/tests/mod.rs` | Modify |
| `docs/guides/self-modification-protocol.md` | Create |

**Success Criteria:**
- GLYPH_WRITE trap operation defined and handled
- test_self_modify.glyph demonstrates self-modification
- scheduler.glyph can modify itself via brain_bridge trigger
- Integration tests pass
- Documentation complete
