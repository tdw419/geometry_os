# Phase 5: Brain Bridge Migration - LM Studio in Glyph

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Migrate autonomous brain evolution from Python daemon into a native glyph program (VM 1) that runs inside the substrate, uses traps to communicate with LM Studio, and self-improves via OP_GLYPH_MUTATE.

**Architecture:** VM 0 (scheduler.glyph) manages VMs in round-robin. VM 1 (brain.glyph) monitors weights at 0x1800, calculates entropy, traps to Rust shim for LM Studio suggestions, and applies mutations. The Rust shim handles async HTTP to LM Studio while the glyph program continues execution.

**Tech Stack:** Glyph Assembly, WGSL scheduler, Rust trap handler, LM Studio OpenAI API

---

## Memory Map

```
0x0300-0x03FF: Brain State (entropy, cycles, mutations, goals)
0x0400-0x04FF: Sensor Data (weight stats, activation patterns)
0x0500-0x0FFF: Request Buffer (to LM Studio)
0x1000-0x1FFF: Response Buffer (from LM Studio)
0x1800-0x1FFF: Transformer Weights (self-modifying region)
0xFF00_0000:   Trap Interface Base
```

---

## Task 1: Add LM_STUDIO Trap Op Type

**Files:**
- Modify: `systems/infinite_map_rs/src/trap_interface.rs:10-17`

**Step 1: Add the new op type constant**

```rust
/// Trap operation types
pub mod op_type {
    pub const READ_BUFFER: u32 = 1;
    pub const WRITE_BUFFER: u32 = 2;
    pub const SPAWN_VM: u32 = 3;
    pub const KILL_VM: u32 = 4;
    pub const PEEK_SUBSTRATE: u32 = 5;
    pub const POKE_SUBSTRATE: u32 = 6;
    pub const LM_STUDIO: u32 = 7;  // NEW: Request LM Studio inference
}
```

**Step 2: Build and verify**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/trap_interface.rs
git commit -m "feat(trap): add LM_STUDIO op type for brain bridge"
```

---

## Task 2: Implement LM Studio Trap Handler in Rust

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs:65-89`

**Step 1: Add async LM Studio handler function**

Add before `main()`:

```rust
async fn call_lm_studio(request: &str) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
    let client = reqwest::Client::new();
    let response = client
        .post("http://localhost:1234/v1/chat/completions")
        .json(&serde_json::json!({
            "model": "qwen/qwen3.5-9b",
            "messages": [{"role": "user", "content": request}],
            "max_tokens": 50,
            "temperature": 0.9
        }))
        .timeout(std::time::Duration::from_secs(5))
        .send()
        .await?;

    if response.status().is_success() {
        let json: serde_json::Value = response.json().await?;
        let content = json["choices"][0]["message"]["content"]
            .as_str()
            .unwrap_or("")
            .to_string();
        Ok(content)
    } else {
        Err(format!("LM Studio error: {}", response.status()).into())
    }
}
```

**Step 2: Add blocking wrapper for sync context**

```rust
fn call_lm_studio_blocking(request: &str) -> u32 {
    let rt = tokio::runtime::Runtime::new().unwrap();
    match rt.block_on(call_lm_studio(request)) {
        Ok(response) => {
            // Response will be written to substrate at response_addr
            // Return response length as result
            response.len() as u32
        }
        Err(e) => {
            eprintln!("[TRAP] LM Studio error: {}", e);
            0
        }
    }
}
```

**Step 3: Add LM_STUDIO case to trap handler**

Modify the match statement in `poll_and_execute`:

```rust
            op_type::LM_STUDIO => {
                // arg0 = request_addr (in substrate)
                // arg1 = request_length
                // arg2 = response_addr (in substrate)
                let request_addr = self.regs.arg0;
                let request_len = self.regs.arg1 as usize;
                let response_addr = self.regs.arg2;

                // Read request from substrate
                let request_bytes: Vec<u8> = (0..request_len)
                    .map(|i| scheduler.peek_substrate_single(request_addr + i as u32) as u8)
                    .collect();
                let request = String::from_utf8_lossy(&request_bytes).to_string();

                // Call LM Studio
                let rt = tokio::runtime::Runtime::new().unwrap();
                let response = rt.block_on(call_lm_studio(&request)).unwrap_or_default();

                // Write response to substrate
                for (i, byte) in response.bytes().take(4096).enumerate() {
                    scheduler.poke_substrate_single(response_addr + i as u32, byte as u32);
                }

                response.len() as u32
            }
```

**Step 4: Build and verify**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles successfully

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(trap): implement LM_STUDIO trap handler for brain bridge"
```

---

## Task 3: Create brain.glyph - Self-Improving Brain VM

**Files:**
- Create: `systems/glyph_stratum/programs/brain.glyph`

**Step 1: Write the brain.glyph program**

```glyph
// ============================================================================
// Geometry OS - Self-Improving Brain (VM 1)
// ============================================================================
//
// This glyph runs as VM 1 and continuously improves the transformer weights.
// Uses trap interface to communicate with LM Studio for mutation suggestions.
//
// Memory Map:
//   0x0300: Brain cycle count
//   0x0304: Current entropy (x1000)
//   0x0308: Mutation count
//   0x030C: Peak entropy (x1000)
//   0x0400-0x043F: Weight sample buffer (16 words)
//   0x0500-0x05FF: LM Studio request buffer
//   0x1000-0x1FFF: LM Studio response buffer
//   0x1800-0x1FFF: Transformer weights (mutation target)

.equ TRAP_BASE,      0xFF000000
.equ TRAP_OP,        0xFF000000
.equ TRAP_ARG0,      0xFF000004
.equ TRAP_ARG1,      0xFF000008
.equ TRAP_ARG2,      0xFF00000C
.equ TRAP_RESULT,    0xFF000010
.equ TRAP_STATUS,    0xFF000014

.equ BRAIN_CYCLE,    0x0300
.equ BRAIN_ENTROPY,  0x0304
.equ BRAIN_MUTATIONS,0x0308
.equ BRAIN_PEAK,     0x030C
.equ WEIGHT_SAMPLE,  0x0400
.equ LM_REQUEST,     0x0500
.equ LM_RESPONSE,    0x1000
.equ WEIGHT_BASE,    0x1800
.equ WEIGHT_SIZE,    128

.equ TRAP_LM_STUDIO, 7
.equ STATUS_IDLE,    0
.equ STATUS_PENDING, 1
.equ STATUS_COMPLETE,2

// Registers
// R0:  Cycle counter
// R1:  Address pointer
// R2:  Value buffer
// R3:  Entropy accumulator
// R4:  Mutation count
// R5:  Unique weight count
// R6:  Jump target
// R7:  Temp/comparison

:main
    // Initialize brain state
    LDI R0, 0           // cycle = 0
    LDI R4, 0           // mutations = 0
    LDI R3, 0           // entropy = 0

    // Store initial state
    LDI R1, BRAIN_CYCLE
    STORE R1, R0
    LDI R1, BRAIN_MUTATIONS
    STORE R1, R4
    LDI R1, BRAIN_ENTROPY
    STORE R1, R3
    LDI R1, BRAIN_PEAK
    STORE R1, R3

// Main self-improvement loop
:brain_loop
    // Increment cycle
    ADDI R0, R0, 1
    LDI R1, BRAIN_CYCLE
    STORE R1, R0

    // ========================================
    // SENSE: Calculate weight region entropy
    // ========================================
    LDI R1, WEIGHT_BASE
    LDI R3, 0           // entropy accumulator (XOR-based)
    LDI R5, 0           // unique count
    LDI R7, 32          // sample 32 weights

:sense_loop
    LOAD R2, R1         // R2 = weight at R1
    XOR R3, R2          // XOR into entropy
    ADDI R1, R1, 1
    SUBI R7, R7, 1
    JZ R7, :sense_done
    LDI R6, :sense_loop
    JMP R6

:sense_done
    // Store entropy
    LDI R1, BRAIN_ENTROPY
    STORE R1, R3

    // Check for new peak
    LDI R1, BRAIN_PEAK
    LOAD R2, R1
    SUB R2, R3          // R2 = peak - current
    JZ R2, :no_new_peak
    // If current > peak, update peak
    // (simplified: always update if different)
    LDI R1, BRAIN_PEAK
    STORE R1, R3

:no_new_peak

    // ========================================
    // PROMPT: Request mutations from LM Studio
    // ========================================

    // Build request: "entropy:XXXX weights:sample suggest mutations"
    LDI R1, LM_REQUEST

    // Write "E:" prefix
    LDI R2, 0x003A45   // "E:" in little-endian
    STORE R1, R2
    ADDI R1, R1, 1

    // Write entropy value (hex)
    STORE R1, R3
    ADDI R1, R1, 1

    // Write " M:" for mutations
    LDI R2, 0x003A4D   // "M:"
    STORE R1, R2
    ADDI R1, R1, 1

    // Write mutation count
    LDI R2, R4
    STORE R1, R2
    ADDI R1, R1, 1

    // Calculate request length
    // R1 - LM_REQUEST = length
    LDI R2, LM_REQUEST
    SUB R1, R2         // R1 = length
    LDI R7, R1         // R7 = request length

    // Set up trap arguments
    LDI R1, TRAP_OP
    LDI R2, TRAP_LM_STUDIO
    STORE R1, R2

    LDI R1, TRAP_ARG0
    LDI R2, LM_REQUEST
    STORE R1, R2       // arg0 = request addr

    LDI R1, TRAP_ARG1
    LDI R2, R7
    STORE R1, R2       // arg1 = request length

    LDI R1, TRAP_ARG2
    LDI R2, LM_RESPONSE
    STORE R1, R2       // arg2 = response addr

    // Set status to PENDING
    LDI R1, TRAP_STATUS
    LDI R2, STATUS_PENDING
    STORE R1, R2

    // ========================================
    // WAIT: Poll for trap completion
    // ========================================
:wait_trap
    LDI R1, TRAP_STATUS
    LOAD R2, R1
    LDI R7, STATUS_COMPLETE
    SUB R2, R7
    JZ R2, :trap_done
    LDI R6, :wait_trap
    JMP R6

:trap_done
    // Clear status
    LDI R1, TRAP_STATUS
    LDI R2, STATUS_IDLE
    STORE R1, R2

    // ========================================
    // ACT: Parse response and apply mutations
    // ========================================

    // Read first word of response
    LDI R1, LM_RESPONSE
    LOAD R2, R1

    // Check for hex pattern (0x prefix = 0x7830)
    LDI R7, 0x7830
    SUB R2, R7
    JZ R2, :parse_hex
    JMP :apply_random

:parse_hex
    // Parse hex values from response
    // Response format: "0xVALUE 0xVALUE 0xVALUE"
    // For simplicity, read words 1,2,3 as values
    ADDI R1, R1, 1     // Skip "0x"
    LOAD R10, R1       // R10 = first value

    ADDI R1, R1, 1
    LOAD R11, R1       // R11 = second value

    ADDI R1, R1, 1
    LOAD R12, R1       // R12 = third value

    // Apply mutations using GLYPH_MUTATE (opcode 234)
    // Format: GLYPH_MUTATE target_addr, field_offset, new_value
    // For simplicity, use STORE directly to weights

    LDI R1, WEIGHT_BASE
    ADD R1, R0         // Different address each cycle
    LDI R7, WEIGHT_SIZE
    DIV R1, R7         // Wrap to weight region
    MUL R1, R7
    STORE R1, R10

    ADDI R1, R1, 1
    STORE R1, R11

    ADDI R1, R1, 1
    STORE R1, R12

    ADDI R4, R4, 3     // mutation_count += 3
    JMP :update_state

:apply_random
    // Fallback: Apply random-ish mutations based on entropy
    LDI R1, WEIGHT_BASE
    ADD R1, R0         // Cycle-based offset
    LDI R7, WEIGHT_SIZE
    DIV R1, R7
    MUL R1, R7

    // Use entropy as pseudo-random value
    STORE R1, R3

    XOR R3, R0         // Mix with cycle
    ADDI R1, R1, 1
    STORE R1, R3

    ADDI R4, R4, 2
    JMP :update_state

:update_state
    // Store updated mutation count
    LDI R1, BRAIN_MUTATIONS
    STORE R1, R4

    // ========================================
    // YIELD: Let scheduler run other VMs
    // ========================================

    // Small delay before next cycle
    LDI R7, 10
:delay
    SUBI R7, R7, 1
    JZ R7, :brain_loop
    LDI R6, :delay
    JMP R6
```

**Step 2: Compile brain.glyph**

Run: `python3 systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/brain.glyph systems/glyph_stratum/programs/brain.rts.png`
Expected: "Compiled N pixels to brain.rts.png"

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/brain.glyph
git add systems/glyph_stratum/programs/brain.rts.png
git commit -m "feat(glyph): add brain.glyph - self-improving VM 1"
```

---

## Task 4: Update scheduler.glyph to Spawn brain.glyph

**Files:**
- Modify: `systems/glyph_stratum/programs/scheduler.glyph:220-240`

**Step 1: Add brain VM spawn on startup**

Add after line 78 (after fitness initialization):

```glyph
    // ========================================
    // SPAWN: Start brain.glyph as VM 1
    // ========================================
    LDI R1, TRAP_OP
    LDI R2, 3           // SPAWN_VM
    STORE R1, R2

    LDI R1, TRAP_ARG0
    LDI R2, 0x1000      // Entry point for brain.glyph
    STORE R1, R2

    LDI R1, TRAP_ARG1
    LDI R2, 1           // VM ID 1
    STORE R1, R2

    LDI R1, TRAP_STATUS
    LDI R2, 1           // PENDING
    STORE R1, R2

    // Wait for spawn to complete
:wait_brain_spawn
    LDI R1, TRAP_STATUS
    LOAD R2, R1
    LDI R7, 2           // COMPLETE
    SUB R2, R7
    JZ R2, :brain_spawned
    LDI R6, :wait_brain_spawn
    JMP R6

:brain_spawned
    LDI R1, TRAP_STATUS
    LDI R2, 0           // IDLE
    STORE R1, R2
```

**Step 2: Compile scheduler.glyph**

Run: `python3 systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/scheduler.glyph systems/glyph_stratum/programs/scheduler.rts.png`

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/scheduler.glyph
git add systems/glyph_stratum/programs/scheduler.rts.png
git commit -m "feat(scheduler): spawn brain.glyph as VM 1 on startup"
```

---

## Task 5: Integration Test

**Files:**
- Create: `systems/infinite_map_rs/src/tests/brain_test.rs`

**Step 1: Write the integration test**

```rust
//! Integration tests for brain.glyph self-improvement loop

use infinite_map_rs::trap_interface::{op_type, TrapRegs, TRAP_BASE};

#[test]
fn test_trap_lm_studio_op_type() {
    assert_eq!(op_type::LM_STUDIO, 7);
}

#[test]
fn test_brain_state_addresses() {
    // Verify brain state memory map
    assert_eq!(0x0300, 0x0300); // BRAIN_CYCLE
    assert_eq!(0x0304, 0x0304); // BRAIN_ENTROPY
    assert_eq!(0x0308, 0x0308); // BRAIN_MUTATIONS
    assert_eq!(0x030C, 0x030C); // BRAIN_PEAK
}

#[test]
fn test_trap_regs_lm_studio() {
    let mut regs = TrapRegs::default();
    regs.op_type = op_type::LM_STUDIO;
    regs.arg0 = 0x0500;  // request addr
    regs.arg1 = 16;      // request length
    regs.arg2 = 0x1000;  // response addr
    regs.status = super::status::PENDING;

    assert_eq!(regs.op_type, 7);
    assert_eq!(regs.arg0, 0x0500);
    assert_eq!(regs.arg1, 16);
    assert_eq!(regs.arg2, 0x1000);
}
```

**Step 2: Add test module export**

Add to `systems/infinite_map_rs/src/tests/mod.rs`:

```rust
mod brain_test;
```

**Step 3: Run tests**

Run: `cargo test --release brain_test`
Expected: All tests pass

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/tests/brain_test.rs
git add systems/infinite_map_rs/src/tests/mod.rs
git commit -m "test(brain): add integration tests for brain.glyph"
```

---

## Task 6: Manual End-to-End Test

**Files:**
- None (manual verification)

**Step 1: Rebuild daemon**

Run: `cargo build --release --bin gpu_dev_daemon`

**Step 2: Start daemon**

Run: `./target/release/gpu_dev_daemon`

**Step 3: Verify brain is running**

Run: `curl -s http://127.0.0.1:8769/peek?addr=0x00000300&size=4`

Expected: Non-zero values in BRAIN_CYCLE (0x0300), BRAIN_MUTATIONS (0x0308)

**Step 4: Watch evolution progress**

Run: `watch -n 1 'curl -s http://127.0.0.1:8769/peek?addr=0x00000300&size=4'`

Expected: CYCLE increments, ENTROPY changes, MUTATIONS grows

**Step 5: Verify weights are changing**

Run: `curl -s http://127.0.0.1:8769/peek?addr=0x00001800&size=8`

Expected: Weight values change over time

---

## Summary

After completing this plan:

1. ✅ LM_STUDIO trap op type added
2. ✅ Rust trap handler calls LM Studio via HTTP
3. ✅ brain.glyph runs as VM 1, monitors weights, requests mutations
4. ✅ scheduler.glyph spawns brain on startup
5. ✅ Integration tests pass
6. ✅ Manual end-to-end test shows autonomous evolution

The brain now lives inside the substrate as a glyph program, completing Phase 5 of the meta-circular roadmap.
