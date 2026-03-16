# WASM Host Functions Design

**Date:** 2026-03-15
**Status:** Approved

## Goal

Enable WASM programs running on Geometry OS to call host functions for substrate access, console I/O, and VM control.

## Background

WASM programs currently run in isolation - they can only compute and access their linear memory. This limits their usefulness. By adding host function imports, WASM programs gain the same capabilities as the MCP/CLI tools.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  WASM Program (Rust/C/AssemblyScript compiled to .wasm)    │
│                                                             │
│  call $poke(0x1000, 42)  ──────────────────┐              │
│                                            │              │
└────────────────────────────────────────────│──────────────┘
                                             │
                                             ▼
┌─────────────────────────────────────────────────────────────┐
│  wasm_interpreter.glyph (running on Glyph VM)              │
│                                                             │
│  CALL opcode detected                       │              │
│  ┌─────────────────────────────────────────┐ │              │
│  │ Import Table (in WASM binary):          │ │              │
│  │   func 0: "geos" "poke" → HOST_CALL    │ │              │
│  │   func 1: "geos" "peek" → HOST_CALL    │ │              │
│  │   func 2: "geos" "print" → HOST_CALL   │ │              │
│  │   func 3: local function               │ │              │
│  └─────────────────────────────────────────┘ │              │
│                      │                      │              │
│                      ▼                      │              │
│            Is imported? ──Yes──► TRAP to Rust              │
│                      │No                                   │
│                      ▼                      │              │
│            Local function call              │              │
└─────────────────────────────────────────────────────────────┘
                                             │
                                             ▼
┌─────────────────────────────────────────────────────────────┐
│  gpu_dev_daemon.rs (Rust trap handler)                     │
│                                                             │
│  op_type::WASM_HOST_CALL:                                   │
│    arg0 = function_id (0=poke, 1=peek, 2=print, ...)       │
│    arg1 = param1                                            │
│    arg2 = param2                                            │
│    result = return value                                    │
└─────────────────────────────────────────────────────────────┘
```

## Host Function Table

| ID | Module | Name | Params | Returns | Description |
|----|--------|------|--------|---------|-------------|
| 0 | `geos` | `poke` | (addr: i32, val: i32) | - | Write to substrate |
| 1 | `geos` | `peek` | (addr: i32) | i32 | Read from substrate |
| 2 | `geos` | `print` | (ptr: i32, len: i32) | - | Write to UART/console |
| 3 | `geos` | `spawn` | (path_ptr: i32, path_len: i32) | i32 | Spawn glyph VM |
| 4 | `geos` | `kill` | (vm_id: i32) | - | Kill VM |

## Memory Layout

```
WASM Linear Memory (relative addressing):
0x0000 - 0x00FF    Reserved for host function scratch
0x0100 - 0xEFFF    User program data
0xF000 - 0xFFFF    Stack (grows down)

Substrate addresses use absolute addressing via poke/peek.
```

## WASM Import Format

Standard WebAssembly import syntax:

```wat
(module
  (import "geos" "poke" (func $poke (param i32 i32)))
  (import "geos" "peek" (func $peek (param i32) (result i32)))
  (import "geos" "print" (func $print (param i32 i32)))

  (func (export "_start")
    ;; Write value 42 to substrate address 0x1000
    i32.const 0x1000
    i32.const 42
    call $poke

    ;; Read it back
    i32.const 0x1000
    call $peek

    ;; Print "Hello" (string at offset 0x100)
    i32.const 0x100
    i32.const 5
    call $print
  )
)
```

## Rust Usage

```rust
#![no_std]

#[link(wasm_import_module = "geos")]
extern "C" {
    fn poke(addr: i32, val: i32);
    fn peek(addr: i32) -> i32;
    fn print(ptr: i32, len: i32);
}

#[no_mangle]
pub fn _start() {
    unsafe {
        // Write to substrate
        poke(0x1000, 42);

        // Read back
        let val = peek(0x1000);

        // Print message
        static MSG: &[u8] = b"Hello";
        print(MSG.as_ptr() as i32, MSG.len() as i32);
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}
```

## Implementation Approach

### 1. Trap Interface Extension

Add `WASM_HOST_CALL` opcode to `trap_interface.rs`:

```rust
pub mod op_type {
    pub const WASM_HOST_CALL: u32 = 9; // WASM → Rust host function call
}
```

### 2. WASM Interpreter Modifications

In `wasm_interpreter.glyph`:
- Track import section during WASM parsing
- On CALL opcode, check if function index is imported
- If imported, trigger trap with function ID and args
- Wait for trap completion, push return value to stack

### 3. Rust Host Function Dispatch

In `gpu_dev_daemon.rs`:
- Handle `WASM_HOST_CALL` trap type
- Dispatch based on function_id
- Implement poke, peek, print, spawn, kill

## Success Criteria

- [ ] WASM program can call `poke` to write substrate memory
- [ ] WASM program can call `peek` to read substrate memory
- [ ] WASM program can call `print` to output via HTTP/console
- [ ] Rust test program compiles and runs successfully
- [ ] Existing WASM programs without imports still work

## Estimated Effort

| Component | Time |
|-----------|------|
| Trap interface extension | 15 min |
| WASM interpreter import handling | 2-3 hours |
| Rust host function dispatch | 1-2 hours |
| Test WASM program | 1 hour |
| Testing and debugging | 1-2 hours |

**Total: 5-8 hours**

## References

- `docs/WASM_EXECUTION_GUIDE.md` - WASM execution overview
- `apps/mcp2cli/src/geos_cli.py` - Existing CLI tools to mirror
- `systems/infinite_map_rs/src/trap_interface.rs` - Current trap ops
