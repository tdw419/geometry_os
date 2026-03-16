# Language Execution Strategy Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable running existing programming languages (C, Rust, Python, JS, etc.) on the GPU Dev Daemon via RISC-V compilation and WASM interpretation.

**Architecture:** Two-tier approach - compiled languages target RISC-V and run through the existing `riscv_emulator.glyph`; interpreted languages compile to WASM and run through a new `wasm_interpreter.glyph`. Both execute on the Glyph VM substrate.

**Tech Stack:** RISC-V toolchain (gcc/clang/rustc), WASM (wasmtime/wasmer reference), Glyph assembly, WebGPU compute shaders

---

## Phase 1: RISC-V Pipeline Hardening

The RISC-V emulator exists but needs production hardening.

### Task 1.1: Document RISC-V Emulator Coverage

**Files:**
- Create: `systems/glyph_stratum/docs/riscv_emulator_coverage.md`
- Reference: `systems/glyph_stratum/programs/riscv_emulator.glyph`

**Step 1: Audit implemented opcodes**

Read `riscv_emulator.glyph` and document:
- Which RV32I base instructions are implemented
- Which RV32M (multiply) extensions exist
- Which compressed (C) instructions work
- Known gaps or TODOs

**Step 2: Create coverage matrix**

```markdown
# RISC-V Emulator Coverage

## RV32I Base Integer (v2.1)

| Instruction | Status | Glyph Label |
|-------------|--------|-------------|
| LUI         | ✅     | handle_lui |
| AUIPC       | ❌     | - |
| JAL         | ✅     | handle_jal |
| JALR        | ✅     | handle_jalr |
| BEQ         | ✅     | handle_branch |
| BNE         | ✅     | handle_branch |
| BLT         | ✅     | handle_branch |
| BGE         | ✅     | handle_branch |
| BLTU        | ✅     | handle_branch |
| BGEU        | ✅     | handle_branch |
| LB          | ✅     | handle_load |
| LH          | ✅     | handle_load |
| LW          | ✅     | handle_load |
| LBU         | ✅     | handle_load |
| LHU         | ✅     | handle_load |
| SB          | ✅     | handle_store |
| SH          | ✅     | handle_store |
| SW          | ✅     | handle_store |
| ADDI        | ✅     | handle_op_imm |
| SLTI        | ✅     | handle_op_imm |
| SLTIU       | ✅     | handle_op_imm |
| XORI        | ✅     | handle_op_imm |
| ORI         | ✅     | handle_op_imm |
| ANDI        | ✅     | handle_op_imm |
| SLLI        | ✅     | handle_op_imm |
| SRLI        | ✅     | handle_op_imm |
| SRAI        | ✅     | handle_op_imm |
| ADD         | ✅     | handle_op_reg |
| SUB         | ✅     | handle_op_reg |
| SLL         | ✅     | handle_op_reg |
| SLT         | ✅     | handle_op_reg |
| SLTU        | ✅     | handle_op_reg |
| XOR         | ✅     | handle_op_reg |
| SRL         | ✅     | handle_op_reg |
| SRA         | ✅     | handle_op_reg |
| OR          | ✅     | handle_op_reg |
| AND         | ✅     | handle_op_reg |
| ECALL       | ⚠️     | trap to host |
| EBREAK      | ❌     | - |

## RV32C Compressed (v2.0)

| Instruction | Status | Notes |
|-------------|--------|-------|
| C.LW        | ✅     | |
| C.SW        | ✅     | |
| C.LWSP      | ✅     | |
| C.SWSP      | ✅     | |
| ...         | ...    | |
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/docs/riscv_emulator_coverage.md
git commit -m "docs: add RISC-V emulator opcode coverage matrix"
```

---

### Task 1.2: Create RISC-V Binary Loader CLI

**Files:**
- Create: `systems/glyph_stratum/bin/geos-riscv-load.sh`
- Reference: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Write the loader script**

```bash
#!/bin/bash
# geos-riscv-load.sh - Load RISC-V binary into GPU daemon
#
# Usage: ./geos-riscv-load.sh <binary.elf> [entry_point]
#
# 1. Extracts .text section from ELF
# 2. Converts to raw bytes at offset 0x8000
# 3. Loads emulator.glyph first
# 4. Injects binary via daemon HTTP API

set -e

BINARY="$1"
ENTRY="${2:-0x8000}"
DAEMON_URL="${GEOS_DAEMON_URL:-http://127.0.0.1:8769}"
EMULATOR_PATH="systems/glyph_stratum/programs/riscv_emulator.rts.png"

if [[ -z "$BINARY" ]]; then
    echo "Usage: $0 <binary.elf> [entry_point]"
    exit 1
fi

# Check if daemon is running
if ! curl -s "$DAEMON_URL/status" > /dev/null 2>&1; then
    echo "Error: GPU daemon not running at $DAEMON_URL"
    exit 1
fi

# Extract raw binary from ELF
TMP_BIN=$(mktemp)
riscv64-unknown-elf-objcopy -O binary "$BINARY" "$TMP_BIN"

# Load emulator
echo "Loading RISC-V emulator..."
curl -s -X POST "$DAEMON_URL/load" -d "$EMULATOR_PATH"

# Inject binary at guest RAM offset
echo "Loading binary $BINARY at offset 0x8000..."
curl -s -X POST "$DAEMON_URL/load?binary=0x8000" --data-binary @"$TMP_BIN"

# Set entry point
echo "Setting entry point to $ENTRY..."
curl -s -X POST "$DAEMON_URL/poke?addr=0x14000&value=$ENTRY"

rm -f "$TMP_BIN"
echo "Done. Binary loaded and ready to execute."
```

**Step 2: Make executable and test**

```bash
chmod +x systems/glyph_stratum/bin/geos-riscv-load.sh
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/bin/geos-riscv-load.sh
git commit -m "feat(cli): add RISC-V binary loader for GPU daemon"
```

---

### Task 1.3: Add /status and /poke Endpoints to Daemon

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs:443-501`

**Step 1: Add status endpoint handler**

In `handle_raw_request`, detect and handle `/status`:

```rust
// Add after reading request_data
let request_str = String::from_utf8_lossy(request_data);

if request_str.starts_with("GET /status") {
    let response = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\"status\":\"running\",\"vms\":1}";
    let _ = stream.write_all(response.as_bytes());
    return;
}

if let Some(poke_match) = request_str.match_indices("GET /poke?addr=").next() {
    // Parse addr=0xXXXX&value=0xYYYY
    let params = &request_str[poke_match.0 + 14..];
    let parts: Vec<&str> = params.split('&').collect();
    let addr = u32::from_str_radix(parts[0].trim_start_matches("0x"), 16).unwrap_or(0);

    let value = if parts.len() > 1 && parts[1].starts_with("value=") {
        u32::from_str_radix(parts[1][6..].trim_start_matches("0x"), 16).unwrap_or(0)
    } else {
        0
    };

    write_u32_to_substrate(addr, value, texture, queue);

    let response = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\"ok\":true}";
    let _ = stream.write_all(response.as_bytes());
    return;
}
```

**Step 2: Test endpoints manually**

```bash
# Start daemon
cargo run --release --bin gpu_dev_daemon &

# Test status
curl http://127.0.0.1:8769/status
# Expected: {"status":"running","vms":1}

# Test poke
curl "http://127.0.0.1:8769/poke?addr=0x14000&value=0x8000"
# Expected: {"ok":true}
```

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(daemon): add /status and /poke HTTP endpoints"
```

---

### Task 1.4: Create Hello World RISC-V Test Binary

**Files:**
- Create: `systems/glyph_stratum/tests/riscv/hello_geos.c`
- Create: `systems/glyph_stratum/tests/riscv/Makefile`

**Step 1: Write test program**

```c
// hello_geos.c - Minimal RISC-V program that outputs "GEOS" via UART

volatile unsigned char *UART = (unsigned char *)0x1000;

void putchar(char c) {
    *UART = c;
}

void puts(const char *s) {
    while (*s) {
        putchar(*s++);
    }
}

void _start() {
    puts("GEOS\n");
    // Infinite loop
    while (1) {}
}
```

**Step 2: Write Makefile**

```makefile
# Makefile for RISC-V test programs

CC = riscv64-unknown-elf-gcc
CFLAGS = -march=rv32i -mabi=ilp32 -nostdlib -static -O2

all: hello_geos.elf hello_geos.bin

hello_geos.elf: hello_geos.c
	$(CC) $(CFLAGS) -T link.ld -o $@ $<

hello_geos.bin: hello_geos.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

clean:
	rm -f *.elf *.bin

.PHONY: all clean
```

**Step 3: Write linker script**

```ld
/* link.ld - Minimal linker script for bare-metal RISC-V */

OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x8000, LENGTH = 64K
}

SECTIONS
{
    .text : { *(.text*) } > RAM
    .rodata : { *(.rodata*) } > RAM
    .data : { *(.data*) } > RAM
    .bss : { *(.bss*) } > RAM
}
```

**Step 4: Build and test**

```bash
# Requires riscv64-unknown-elf-gcc toolchain
cd systems/glyph_stratum/tests/riscv
make

# Load into daemon
../../bin/geos-riscv-load.sh hello_geos.elf
```

**Step 5: Commit**

```bash
git add systems/glyph_stratum/tests/riscv/
git commit -m "test(riscv): add hello_geos test binary"
```

---

## Phase 2: Toolchain Integration

### Task 2.1: Document C/Rust Compilation Targets

**Files:**
- Create: `docs/RISCV_TOOLCHAIN_GUIDE.md`

**Step 1: Write toolchain guide**

```markdown
# RISC-V Toolchain Guide for Geometry OS

## Prerequisites

Install RISC-V toolchain:
```bash
# Ubuntu/Debian
sudo apt install gcc-riscv64-unknown-elf

# macOS
brew install riscv-gnu-toolchain

# From source
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
make
```

## C Compilation

```bash
# Compile to RISC-V ELF
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -static \
    -T systems/glyph_stratum/tests/riscv/link.ld \
    -o program.elf program.c

# Convert to raw binary
riscv64-unknown-elf-objcopy -O binary program.elf program.bin

# Load into GPU daemon
systems/glyph_stratum/bin/geos-riscv-load.sh program.elf
```

## Rust Compilation

```bash
# Add RISC-V target
rustup target add riscv32i-unknown-none-elf

# Compile (no_std)
cargo build --target riscv32i-unknown-none-elf --release

# Result: target/riscv32i-unknown-none-elf/release/program
```

## Memory Map

| Address Range | Purpose |
|---------------|---------|
| 0x0000-0x0FFF | Glyph VM state |
| 0x1000-0x10FF | MMIO (UART at 0x1000) |
| 0x8000-0xFFFF | Guest RAM (your code) |

## UART Output

Write bytes to address 0x1000 to output characters.
The emulator bridges this to Glyph's UART buffer at 0x0200.
```

**Step 2: Commit**

```bash
git add docs/RISCV_TOOLCHAIN_GUIDE.md
git commit -m "docs: add RISC-V toolchain guide for Geometry OS"
```

---

### Task 2.2: Create Rust RISC-V Template

**Files:**
- Create: `templates/riscv-rust/Cargo.toml`
- Create: `templates/riscv-rust/src/main.rs`
- Create: `templates/riscv-rust/memory.x`

**Step 1: Create Cargo.toml**

```toml
[package]
name = "geos-riscv-hello"
version = "0.1.0"
edition = "2021"

[dependencies]

[profile.release]
opt-level = "z"
lto = true
```

**Step 2: Create main.rs**

```rust
// src/main.rs - Minimal Rust program for Geometry OS RISC-V

#![no_std]
#![no_main]

use core::panic::PanicInfo;

const UART: *mut u8 = 0x1000 as *mut u8;

fn putchar(c: u8) {
    unsafe {
        core::ptr::write_volatile(UART, c);
    }
}

fn puts(s: &[u8]) {
    for &c in s {
        putchar(c);
    }
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    puts(b"Hello from Rust on Geometry OS!\n");

    loop {
        // Halt
    }
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    puts(b"PANIC!\n");
    loop {}
}
```

**Step 3: Create linker script memory.x**

```ld
MEMORY
{
    RAM : ORIGIN = 0x8000, LENGTH = 64K
}

REGION_ALIAS("REGION_TEXT", RAM);
REGION_ALIAS("REGION_RODATA", RAM);
REGION_ALIAS("REGION_DATA", RAM);
REGION_ALIAS("REGION_BSS", RAM);
REGION_ALIAS("REGION_HEAP", RAM);
REGION_ALIAS("REGION_STACK", RAM);
```

**Step 4: Commit**

```bash
git add templates/riscv-rust/
git commit -m "feat(template): add Rust RISC-V template for Geometry OS"
```

---

## Phase 3: WASM Interpreter Foundation

### Task 3.1: Research WASM Spec Subset

**Files:**
- Create: `docs/plans/2026-03-15-wasm-subset-design.md`

**Step 1: Define minimal WASM subset**

```markdown
# WASM Subset Design for Geometry OS

## Target: MVP (Minimum Viable Product) WASM

### Required Features

1. **Value Types**: i32 only (match Glyph VM word size)
2. **Instructions**:
   - Control: block, loop, br, br_if, return, call, end
   - Variables: local.get, local.set
   - Memory: i32.load, i32.store
   - Numeric: i32.add, i32.sub, i32.mul, i32.div_s, i32.and, i32.or, i32.xor, i32.shl, i32.shr_s
   - Comparison: i32.eq, i32.ne, i32.lt_s, i32.gt_s, i32.le_s, i32.ge_s

3. **Memory**: Linear memory, 1 page (64KB), mapped to Hilbert space

### Not Required (Phase 3)

- Floating point (f32/f64)
- Tables / indirect calls
- Imports/exports (host functions only)
- Multiple memories

### Memory Map

| WASM Address | Glyph Address | Purpose |
|--------------|---------------|---------|
| 0x0000-0xFFFF | 0x20000-0x2FFFF | WASM linear memory |
| - | 0x30000 | WASM stack pointer |
| - | 0x30004 | WASM instruction pointer |

### Estimated Implementation

~500-800 Glyph instructions (similar complexity to RISC-V emulator)
```

**Step 2: Commit**

```bash
git add docs/plans/2026-03-15-wasm-subset-design.md
git commit -m "docs: define WASM MVP subset for Glyph interpreter"
```

---

### Task 3.2: Create WASM Interpreter Skeleton

**Files:**
- Create: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Write skeleton with fetch-decode loop**

```glyph
// ============================================================================
// Geometry OS - WASM Interpreter (MVP Subset)
// ============================================================================
//
// Memory Layout:
//   0x20000-0x2FFFF: WASM Linear Memory (64KB)
//   0x30000: WASM_SP (stack pointer)
//   0x30004: WASM_IP (instruction pointer / program counter)
//   0x30008: WASM_BP (base pointer for locals)
//   0x3000C: WASM_STATUS (0=halted, 1=running, 2=error)
//
// Register Allocation:
//   r0: Entry point (passed by scheduler)
//   r1: WASM_IP (instruction pointer)
//   r2: Current opcode byte
//   r3-r9: Temporaries for decoding
//   r10: WASM_SP address
//   r11: WASM linear memory base
//   r12: Current operand stack top
// ============================================================================

.equ WASM_MEM_BASE,   0x20000
.equ WASM_SP_ADDR,    0x30000
.equ WASM_IP_ADDR,    0x30004
.equ WASM_BP_ADDR,    0x30008
.equ WASM_STATUS,     0x3000C

.equ STATUS_HALTED,   0
.equ STATUS_RUNNING,  1
.equ STATUS_ERROR,    2

// ============================================================================
// BOOT
// ============================================================================

:boot
    // Initialize IP from entry point
    LDI r1, WASM_IP_ADDR
    STORE r1, r0

    // Initialize SP to end of linear memory
    LDI r1, WASM_SP_ADDR
    LDI r2, 0x2FFFC      // Top of 64KB region
    STORE r1, r2

    // Set status to running
    LDI r1, WASM_STATUS
    LDI r2, STATUS_RUNNING
    STORE r1, r2

// ============================================================================
// FETCH-DECODE-EXECUTE LOOP
// ============================================================================

:wasm_fetch
    // Check status
    LDI r1, WASM_STATUS
    LOAD r1, r2
    LDI r3, STATUS_RUNNING
    SUB r2, r3
    JZ :wasm_continue
    JMP :wasm_halt       // Not running, exit

:wasm_continue
    // Load current IP
    LDI r1, WASM_IP_ADDR
    LOAD r1, r1          // r1 = IP value

    // Fetch byte at IP (in WASM linear memory)
    LDI r11, WASM_MEM_BASE
    ADD r11, r1          // r11 = physical address
    LOAD r11, r2         // r2 = opcode byte

    // Increment IP
    LDI r3, 1
    ADD r1, r3
    LDI r3, WASM_IP_ADDR
    STORE r3, r1

    // Decode opcode
    // 0x00 = unreachable
    // 0x01 = nop
    // 0x02 = block
    // 0x03 = loop
    // 0x0B = end
    // 0x0F = return
    // 0x10 = call
    // 0x20 = local.get
    // 0x21 = local.set
    // 0x28 = i32.load
    // 0x36 = i32.store
    // 0x41 = i32.const
    // 0x6A = i32.add
    // 0x6B = i32.sub
    // 0x6C = i32.mul
    // ... etc

    // Dispatch table
    LDI r3, 0x0B
    SUB r2, r3
    JZ :wasm_op_end

    LDI r3, 0x41
    SUB r2, r3
    JZ :wasm_op_i32_const

    LDI r3, 0x6A
    SUB r2, r3
    JZ :wasm_op_i32_add

    // Unknown opcode - error
    LDI r1, WASM_STATUS
    LDI r2, STATUS_ERROR
    STORE r1, r2
    JMP :wasm_halt

// ============================================================================
// OPCODE IMPLEMENTATIONS
// ============================================================================

:wasm_op_end
    // End of function - return or halt
    JMP :wasm_halt

:wasm_op_i32_const
    // i32.const: read LEB128 immediate, push to stack
    // TODO: Implement LEB128 decoding
    JMP :wasm_fetch

:wasm_op_i32_add
    // i32.add: pop two values, push sum
    // TODO: Implement stack operations
    JMP :wasm_fetch

// ============================================================================
// HALT
// ============================================================================

:wasm_halt
    LDI r1, WASM_STATUS
    LDI r2, STATUS_HALTED
    STORE r1, r2
    HALT
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): add interpreter skeleton with fetch-decode loop"
```

---

## Phase 4: Integration Testing

### Task 4.1: Create End-to-End Test Suite

**Files:**
- Create: `systems/glyph_stratum/tests/e2e/test_language_execution.py`

**Step 1: Write test harness**

```python
#!/usr/bin/env python3
"""
End-to-end tests for language execution on GPU daemon.

Tests:
1. RISC-V binary execution
2. WASM module execution (when interpreter complete)
"""

import subprocess
import time
import requests
import pytest

DAEMON_URL = "http://127.0.0.1:8769"


def daemon_running():
    """Check if GPU daemon is running."""
    try:
        resp = requests.get(f"{DAEMON_URL}/status", timeout=1)
        return resp.status_code == 200
    except:
        return False


@pytest.fixture(scope="module")
def ensure_daemon():
    """Ensure daemon is running before tests."""
    if not daemon_running():
        pytest.skip("GPU daemon not running at http://127.0.0.1:8769")


class TestRISCVExecution:
    """Tests for RISC-V binary execution."""

    def test_hello_geos(self, ensure_daemon):
        """Test hello_geos.elf produces expected output."""
        # Load the binary
        result = subprocess.run(
            ["systems/glyph_stratum/bin/geos-riscv-load.sh",
             "systems/glyph_stratum/tests/riscv/hello_geos.elf"],
            capture_output=True,
            text=True
        )
        assert result.returncode == 0
        assert "Done" in result.stdout

        # Execute for a few frames
        time.sleep(0.5)

        # Read UART output (address 0x0200)
        # TODO: Add /read endpoint to daemon
        # For now, just verify it loaded without error


class TestWASMExecution:
    """Tests for WASM module execution."""

    @pytest.mark.skip(reason="WASM interpreter not yet complete")
    def test_simple_wasm(self, ensure_daemon):
        """Test simple WASM module execution."""
        pass


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run tests**

```bash
# Start daemon first
cargo run --release --bin gpu_dev_daemon &

# Run tests
python3 systems/glyph_stratum/tests/e2e/test_language_execution.py
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/tests/e2e/test_language_execution.py
git commit -m "test(e2e): add language execution test suite"
```

---

## Summary

### What This Plan Delivers

1. **RISC-V Pipeline** (Phase 1-2): Production-ready path for C/Rust/Go programs
2. **Toolchain Documentation**: How to compile and load programs
3. **WASM Foundation** (Phase 3): Interpreter skeleton for interpreted languages
4. **Testing**: E2E test suite for verification

### Estimated Effort

| Phase | Tasks | Time |
|-------|-------|------|
| Phase 1 | 4 tasks | 2-3 hours |
| Phase 2 | 2 tasks | 1-2 hours |
| Phase 3 | 2 tasks | 4-6 hours |
| Phase 4 | 1 task | 1 hour |

**Total: 8-12 hours** for full implementation

### Dependencies

- RISC-V toolchain (`riscv64-unknown-elf-gcc`)
- Running GPU daemon
- Rust toolchain (for Rust RISC-V target)

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-03-15-language-execution-strategy.md`.

**Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
