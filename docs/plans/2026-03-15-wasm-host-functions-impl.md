# WASM Host Functions Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable WASM programs to call host functions (poke, peek, print) for substrate access and console I/O.

**Architecture:** WASM CALL opcode → interpreter checks import table → if imported, trigger trap to Rust → Rust dispatches to host function → return value pushed to WASM stack.

**Tech Stack:** Glyph assembly, Rust, WebAssembly, wgpu

---

## Task 1: Add WASM_HOST_CALL Trap Opcode

**Files:**
- Modify: `systems/infinite_map_rs/src/trap_interface.rs`

**Step 1: Add opcode constant**

Add to `op_type` module after `GLYPH_WRITE`:

```rust
pub mod op_type {
    pub const READ_BUFFER: u32 = 1;
    pub const WRITE_BUFFER: u32 = 2;
    pub const SPAWN_VM: u32 = 3;
    pub const KILL_VM: u32 = 4;
    pub const PEEK_SUBSTRATE: u32 = 5;
    pub const POKE_SUBSTRATE: u32 = 6;
    pub const LM_STUDIO: u32 = 7;
    pub const GLYPH_WRITE: u32 = 8;
    pub const WASM_HOST_CALL: u32 = 9; // WASM → Rust host function call
}
```

**Step 2: Build to verify**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/trap_interface.rs
git commit -m "feat(trap): add WASM_HOST_CALL opcode for host function calls"
```

---

## Task 2: Add Host Function Constants to WASM Interpreter

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add constants for import tracking**

Add after line 96 (after `IF_CONDITION_ADDR`):

```glyph
// Host function IDs (must match trap_interface.rs)
.equ HOST_POKE,   0
.equ HOST_PEEK,   1
.equ HOST_PRINT,  2
.equ HOST_SPAWN,  3
.equ HOST_KILL,   4

// Import table (stores which function indices are imports)
// Each entry: function_index -> (module_ptr, name_ptr) or 0xFFFFFFFF if not import
.equ IMPORT_TABLE_BASE, 0x33000
.equ IMPORT_TABLE_SIZE, 64        // Max 64 imported functions
.equ NUM_IMPORTS_ADDR,  0x33FFF   // Number of imported functions

// Trap interface for host calls
.equ TRAP_BASE,        0xFF000000
.equ TRAP_OP_TYPE,     0xFF000000
.equ TRAP_ARG0,        0xFF000004
.equ TRAP_ARG1,        0xFF000008
.equ TRAP_ARG2,        0xFF00000C
.equ TRAP_RESULT,      0xFF000010
.equ TRAP_STATUS,      0xFF000014

.equ TRAP_WASM_HOST,   9
.equ TRAP_STATUS_IDLE, 0
.equ TRAP_STATUS_PENDING, 1
```

**Step 2: Build glyph**

Run: `python3 systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/wasm_interpreter.glyph systems/glyph_stratum/programs/wasm_interpreter.bin`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): add host function constants and import table layout"
```

---

## Task 3: Implement CALL Handler with Import Detection

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Replace wasm_op_call implementation**

Replace the `:wasm_op_call` section (starting at line 591) with:

```glyph
:wasm_op_call
    // Call function - read function index (LEB128)
    CALL :leb128_unsigned    // r6 = function index

    // Check if this is an imported function
    // Import table entry = IMPORT_TABLE_BASE + (func_idx * 4)
    LDI r1, IMPORT_TABLE_BASE
    LDI r2, 4
    MUL r6, r2               // r2 = func_idx * 4
    ADD r1, r2               // r1 = address of import entry
    LOAD r1, r3              // r3 = import entry value

    // Check if entry is valid (not 0xFFFFFFFF)
    LDI r4, 0xFFFFFFFF
    SUB r3, r4
    JZ r3, :wasm_call_local  // If 0xFFFFFFFF, it's a local function

    // It's an imported function - r3 contains host function ID
    // Call the host function trap
    MOV r3, r7               // r7 = host function ID

    // Pop arguments from stack
    // For poke(peek): arg0 = addr, arg1 = val
    // For peek: arg0 = addr
    // For print: arg0 = ptr, arg1 = len

    // Get SP
    LDI r10, WASM_SP_ADDR
    LOAD r10, r12            // r12 = SP

    // Pop first arg (increment SP, load)
    LDI r1, 4
    ADD r12, r1
    LOAD r12, r8             // r8 = arg1 (top of stack)

    // Pop second arg if needed (peek only has 1 arg)
    // We'll always pop 2 and let host function ignore extras
    LDI r1, 4
    ADD r12, r1
    LOAD r12, r9             // r9 = arg0 (second from top)

    // Update SP
    LDI r1, WASM_SP_ADDR
    STORE r1, r12

    // Trigger trap
    // TRAP_OP_TYPE = WASM_HOST_CALL
    LDI r1, TRAP_OP_TYPE
    LDI r2, TRAP_WASM_HOST
    STORE r1, r2

    // TRAP_ARG0 = host function ID
    LDI r1, TRAP_ARG0
    STORE r1, r7

    // TRAP_ARG1 = arg0 (addr)
    LDI r1, TRAP_ARG1
    STORE r1, r9

    // TRAP_ARG2 = arg1 (val/ptr)
    LDI r1, TRAP_ARG2
    STORE r1, r8

    // TRAP_STATUS = PENDING
    LDI r1, TRAP_STATUS
    LDI r2, TRAP_STATUS_PENDING
    STORE r1, r2

    // Wait for trap completion
    :wasm_call_wait
    LDI r1, TRAP_STATUS
    LOAD r1, r2              // r2 = status
    LDI r3, TRAP_STATUS_PENDING
    SUB r2, r3
    JZ r2, :wasm_call_wait   // Loop while PENDING

    // Read result (for functions that return values)
    LDI r1, TRAP_RESULT
    LOAD r1, r4              // r4 = result

    // If peek (host function ID 1), push result to stack
    LDI r1, HOST_PEEK
    SUB r7, r1
    JNZ r7, :wasm_call_done

    // Push result for peek
    MOV r4, r6               // r6 = result to push
    CALL :stack_push

    :wasm_call_done
    LDI r13, wasm_fetch
    JMP r13

:wasm_call_local
    // Local function call - push return address and jump
    LDI r1, WASM_IP_ADDR
    LOAD r1, r4              // r4 = current IP (return address)
    CALL :call_push

    // For now, we don't have function address table
    // This is a stub - local calls need full implementation
    LDI r13, wasm_fetch
    JMP r13
```

**Step 2: Build glyph**

Run: `python3 systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/wasm_interpreter.glyph systems/glyph_stratum/programs/wasm_interpreter.bin`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph systems/glyph_stratum/programs/wasm_interpreter.bin
git commit -m "feat(wasm): implement CALL with import detection and host function trap"
```

---

## Task 4: Implement Rust Host Function Dispatch

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add host function handler in TrapHandler**

Add after the `poll_and_execute` method (around line 150):

```rust
/// Handle WASM host function calls
fn handle_wasm_host_call(
    &mut self,
    func_id: u32,
    arg0: u32,
    arg1: u32,
    scheduler: &mut GlyphVmScheduler,
) -> u32 {
    match func_id {
        0 => self.host_poke(arg0, arg1, scheduler),
        1 => self.host_peek(arg0, scheduler),
        2 => self.host_print(arg0, arg1, scheduler),
        3 => self.host_spawn(arg0, arg1),  // spawn
        4 => self.host_kill(arg0),          // kill
        _ => {
            eprintln!("[WASM] Unknown host function: {}", func_id);
            0
        }
    }
}

/// poke(addr, val) - Write to substrate
fn host_poke(&mut self, addr: u32, val: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
    scheduler.poke_substrate_single(addr, val);
    println!("[WASM] poke(0x{:x}, 0x{:x})", addr, val);
    0
}

/// peek(addr) -> val - Read from substrate
fn host_peek(&mut self, addr: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
    let val = scheduler.peek_substrate_single(addr);
    println!("[WASM] peek(0x{:x}) -> 0x{:x}", addr, val);
    val
}

/// print(ptr, len) - Write string to console
fn host_print(&mut self, ptr: u32, len: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
    // Read bytes from WASM linear memory (WASM_MEM_BASE + ptr)
    let wasm_mem_base = 0x20000u32;
    let mut bytes = Vec::with_capacity(len as usize);
    for i in 0..len {
        let addr = wasm_mem_base + ptr + i;
        let byte = scheduler.peek_substrate_single(addr) & 0xFF;
        bytes.push(byte as u8);
    }
    let s = String::from_utf8_lossy(&bytes);
    println!("[WASM] print: {}", s);
    0
}

/// spawn(path_ptr, path_len) -> vm_id
fn host_spawn(&mut self, _path_ptr: u32, _path_len: u32) -> u32 {
    // TODO: Implement VM spawning
    println!("[WASM] spawn (not implemented)");
    0xFFFFFFFF
}

/// kill(vm_id)
fn host_kill(&mut self, _vm_id: u32) -> u32 {
    // TODO: Implement VM killing
    println!("[WASM] kill (not implemented)");
    0
}
```

**Step 2: Add WASM_HOST_CALL case in poll_and_execute**

Add in the `poll_and_execute` match statement (after GLYPH_WRITE case):

```rust
        op_type::WASM_HOST_CALL => {
            let func_id = self.regs.arg0;
            let arg0 = self.regs.arg1;
            let arg1 = self.regs.arg2;
            let result = self.handle_wasm_host_call(func_id, arg0, arg1, scheduler);
            result
        }
```

**Step 3: Build**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles successfully

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(daemon): implement WASM host function dispatch (poke, peek, print)"
```

---

## Task 5: Create Test WASM Program

**Files:**
- Create: `systems/glyph_stratum/tests/wasm/host_test/Cargo.toml`
- Create: `systems/glyph_stratum/tests/wasm/host_test/src/lib.rs`

**Step 1: Create Cargo.toml**

```bash
mkdir -p systems/glyph_stratum/tests/wasm/host_test/src
```

```toml
[package]
name = "wasm_host_test"
version = "0.1.0"
edition = "2021"

[lib]
crate-type = ["cdylib"]

[profile.release]
opt-level = "s"
lto = true
```

**Step 2: Create src/lib.rs**

```rust
#![no_std]

/// Host function imports from Geometry OS
#[link(wasm_import_module = "geos")]
extern "C" {
    fn poke(addr: i32, val: i32);
    fn peek(addr: i32) -> i32;
    fn print(ptr: i32, len: i32);
}

/// Entry point
#[no_mangle]
pub extern "C" fn _start() {
    unsafe {
        // Test 1: Write value to substrate
        poke(0x1000, 42);

        // Test 2: Read it back
        let val = peek(0x1000);

        // Test 3: Write read value to another address
        poke(0x1004, val);

        // Test 4: Print hello
        static MSG: &[u8] = b"Hello from WASM!";
        print(MSG.as_ptr() as i32, MSG.len() as i32);
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}
```

**Step 3: Build WASM**

```bash
cd systems/glyph_stratum/tests/wasm/host_test
cargo build --target wasm32-unknown-unknown --release
```

Expected: Creates `target/wasm32-unknown-unknown/release/wasm_host_test.wasm`

**Step 4: Commit**

```bash
git add systems/glyph_stratum/tests/wasm/host_test/
git commit -m "test(wasm): add host function test program"
```

---

## Task 6: Create WAT Test File

**Files:**
- Create: `systems/glyph_stratum/tests/wasm/host_test.wat`

**Step 1: Create WAT file**

```wat
;; Test WASM host functions
;; Compile: wat2wasm host_test.wat -o host_test.wasm

(module
  ;; Import host functions from Geometry OS
  (import "geos" "poke" (func $poke (param i32 i32)))
  (import "geos" "peek" (func $peek (param i32) (result i32)))
  (import "geos" "print" (func $print (param i32 i32)))

  ;; Memory
  (memory (export "memory") 1)

  ;; Data section - test string
  (data (i32.const 0x100) "Hello from WASM!")

  ;; Entry point
  (func (export "_start")
    (local $val i32)

    ;; Test 1: poke(0x1000, 42)
    i32.const 0x1000
    i32.const 42
    call $poke

    ;; Test 2: val = peek(0x1000)
    i32.const 0x1000
    call $peek
    local.set $val

    ;; Test 3: poke(0x1004, val) - should write 42
    i32.const 0x1004
    local.get $val
    call $poke

    ;; Test 4: print("Hello from WASM!")
    i32.const 0x100
    i32.const 16
    call $print
  )
)
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/tests/wasm/host_test.wat
git commit -m "test(wasm): add WAT test file for host functions"
```

---

## Task 7: Update WASM Execution Guide

**Files:**
- Modify: `docs/WASM_EXECUTION_GUIDE.md`

**Step 1: Update "Host Functions" section**

Replace the "Host Functions (WASM → Glyph Bridge)" section with:

```markdown
## Host Functions (WASM → Glyph Bridge)

### Implemented Functions

WASM programs can import host functions from the `geos` module:

| Function | Params | Returns | Description |
|----------|--------|---------|-------------|
| `poke` | (addr: i32, val: i32) | - | Write to substrate memory |
| `peek` | (addr: i32) | i32 | Read from substrate memory |
| `print` | (ptr: i32, len: i32) | - | Write string to console |
| `spawn` | (path_ptr: i32, path_len: i32) | i32 | Spawn glyph VM (stub) |
| `kill` | (vm_id: i32) | - | Kill VM (stub) |

### Usage Example (Rust)

```rust
#![no_std]

#[link(wasm_import_module = "geos")]
extern "C" {
    fn poke(addr: i32, val: i32);
    fn peek(addr: i32) -> i32;
    fn print(ptr: i32, len: i32);
}

#[no_mangle]
pub extern "C" fn _start() {
    unsafe {
        poke(0x1000, 42);          // Write to substrate
        let val = peek(0x1000);     // Read back

        static MSG: &[u8] = b"Hello";
        print(MSG.as_ptr() as i32, MSG.len() as i32);
    }
}
```

### Usage Example (WAT)

```wat
(module
  (import "geos" "poke" (func $poke (param i32 i32)))
  (import "geos" "peek" (func $peek (param i32) (result i32)))
  (import "geos" "print" (func $print (param i32 i32)))
  (memory 1)

  (func (export "_start")
    i32.const 0x1000
    i32.const 42
    call $poke

    i32.const 0x1000
    call $peek
    ;; result on stack
  )
)
```

### Testing

```bash
# Build test program
cd systems/glyph_stratum/tests/wasm
wat2wasm host_test.wat -o host_test.wasm

# Start daemon
cargo run --release --bin gpu_dev_daemon &

# Load WASM interpreter
curl -X POST "http://127.0.0.1:8769/load" \
    -d "systems/glyph_stratum/programs/wasm_interpreter.rts.png"

# Load WASM binary at linear memory base
curl -X POST "http://127.0.0.1:8769/load?binary=0x20000" \
    --data-binary @host_test.wasm

# Check daemon output for "[WASM] poke(0x1000, 0x2a)" etc.
```
```

**Step 2: Commit**

```bash
git add docs/WASM_EXECUTION_GUIDE.md
git commit -m "docs: update WASM guide with host function documentation"
```

---

## Task 8: Integration Test

**Files:**
- Create: `systems/glyph_stratum/tests/test_wasm_host.py`

**Step 1: Create test script**

```python
#!/usr/bin/env python3
"""Test WASM host functions via daemon HTTP API."""

import subprocess
import time
import requests
import sys

DAEMON_URL = "http://127.0.0.1:8769"
WASM_TEST = "systems/glyph_stratum/tests/wasm/host_test.wasm"

def wait_for_daemon(timeout=10):
    """Wait for daemon to be ready."""
    for _ in range(timeout * 10):
        try:
            r = requests.get(f"{DAEMON_URL}/status", timeout=1)
            if r.status_code == 200:
                return True
        except:
            pass
        time.sleep(0.1)
    return False

def test_wasm_host_functions():
    """Test that WASM host functions work."""
    print("[TEST] Checking daemon status...")
    if not wait_for_daemon():
        print("[FAIL] Daemon not responding")
        return False

    print("[TEST] Loading WASM test binary...")
    with open(WASM_TEST, "rb") as f:
        wasm_bytes = f.read()

    r = requests.post(
        f"{DAEMON_URL}/load?binary=0x20000",
        data=wasm_bytes,
        headers={"Content-Type": "application/octet-stream"}
    )

    if r.status_code != 200:
        print(f"[FAIL] Failed to load WASM: {r.text}")
        return False

    print("[PASS] WASM binary loaded")

    # Read substrate to verify poke worked
    print("[TEST] Reading substrate at 0x1000...")
    r = requests.get(f"{DAEMON_URL}/read?addr=0x1000&len=8")

    if r.status_code != 200:
        print(f"[FAIL] Failed to read substrate: {r.text}")
        return False

    # The WASM should have written 42 (0x2a) to 0x1000
    data = r.content
    val = int.from_bytes(data[:4], 'little')
    print(f"[TEST] Value at 0x1000: {val}")

    if val == 42:
        print("[PASS] poke(0x1000, 42) worked!")
        return True
    else:
        print(f"[FAIL] Expected 42, got {val}")
        return False

if __name__ == "__main__":
    success = test_wasm_host_functions()
    sys.exit(0 if success else 1)
```

**Step 2: Make executable and commit**

```bash
chmod +x systems/glyph_stratum/tests/test_wasm_host.py
git add systems/glyph_stratum/tests/test_wasm_host.py
git commit -m "test: add WASM host function integration test"
```

---

## Summary

### Tasks

| # | Task | Files |
|---|------|-------|
| 1 | Add WASM_HOST_CALL trap opcode | trap_interface.rs |
| 2 | Add host function constants | wasm_interpreter.glyph |
| 3 | Implement CALL with import detection | wasm_interpreter.glyph |
| 4 | Implement Rust host dispatch | gpu_dev_daemon.rs |
| 5 | Create Rust test WASM | tests/wasm/host_test/ |
| 6 | Create WAT test file | tests/wasm/host_test.wat |
| 7 | Update documentation | WASM_EXECUTION_GUIDE.md |
| 8 | Integration test | test_wasm_host.py |

### Verification

1. Build all components
2. Start daemon
3. Load WASM interpreter
4. Load test WASM with host calls
5. Verify substrate writes via /read endpoint
6. Check daemon logs for "[WASM] poke/peek/print" messages
