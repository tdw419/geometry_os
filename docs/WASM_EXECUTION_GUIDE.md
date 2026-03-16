# Running Existing Languages on Geometry OS

> **The Strategy:** Use WebAssembly (WASM) as the universal execution layer. Any language that compiles to WASM can run on the GPU substrate.

## Overview

Geometry OS enables running existing programming languages on GPU hardware through a WASM interpreter implemented in Glyph assembly. This approach leverages mature toolchains (Rust, C/C++, AssemblyScript, etc.) instead of building language-specific infrastructure.

```
┌─────────────────────────────────────────────────────────────────┐
│                    LANGUAGE EXECUTION STACK                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Source Code (Rust, C, AssemblyScript, Go, etc.)              │
│        │                                                        │
│        ▼                                                        │
│   ┌─────────────────┐                                          │
│   │  WASM Toolchain │  (cargo, emscripten, wasm-pack)          │
│   │  (existing)     │                                          │
│   └────────┬────────┘                                          │
│            │                                                    │
│            ▼                                                    │
│   ┌─────────────────┐                                          │
│   │  WASM Binary    │  (*.wasm - portable bytecode)            │
│   │  (portable)     │                                          │
│   └────────┬────────┘                                          │
│            │                                                    │
│            ▼                                                    │
│   ┌─────────────────────────────────────────────────────────┐  │
│   │  wasm_interpreter.glyph                                  │  │
│   │  (Glyph assembly running on Glyph VM)                    │  │
│   │                                                          │  │
│   │  • LEB128 decoding                                       │  │
│   │  • Stack-based execution                                 │  │
│   │  • Control flow (block/loop/if/br)                       │  │
│   │  • Memory operations                                     │  │
│   │  • Function calls                                        │  │
│   └────────┬────────────────────────────────────────────────┘  │
│            │                                                    │
│            ▼                                                    │
│   ┌─────────────────┐                                          │
│   │  Glyph VM       │  (WebGPU compute shader)                │
│   │  (GPU native)   │                                          │
│   └────────┬────────┘                                          │
│            │                                                    │
│            ▼                                                    │
│   ┌─────────────────┐                                          │
│   │  GPU Substrate  │  (Hilbert-addressed texture memory)     │
│   │  (hardware)     │                                          │
│   └─────────────────┘                                          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Why WASM?

| Criterion | WASM Approach | Alternative (port interpreters) |
|-----------|---------------|--------------------------------|
| Language coverage | 20+ languages | One per interpreter |
| Toolchain maturity | Excellent (cargo, emcc) | Varies |
| Implementation effort | One interpreter | Many interpreters |
| Performance | Near-native bytecode | Depends on interpreter |
| Ecosystem | Growing rapidly | Fragmented |

## Memory Layout

The WASM interpreter uses a fixed memory map within the Glyph VM's address space:

```
Address Range          Purpose                    Size
─────────────────────────────────────────────────────────────
0x00000 - 0x1FFFF      Reserved for Glyph VM       128 KB
0x20000 - 0x2FFFF      WASM Linear Memory           64 KB (1 page)
0x30000                WASM_SP (operand stack ptr)  4 bytes
0x30004                WASM_IP (instruction ptr)    4 bytes
0x30008                WASM_BP (base ptr for locals)4 bytes
0x3000C                WASM_STATUS register         4 bytes
0x30010                WASM_STACK_TOP (cached)      4 bytes
0x31000                BLOCK_STACK_COUNT            4 bytes
0x31004+               Block stack entries          12 bytes each
0x31020                IF_CONDITION (for else)      4 bytes
0x40000+               WASM interpreter code        varies
```

### Block Stack Entry Format (12 bytes)

```
Offset  Size    Field
─────────────────────────────
0       4       block_type (0=block, 1=loop, 2=if)
4       4       start_addr (IP at block entry)
8       4       stack_height (SP at block entry)
```

## Supported WASM Features

### MVP Subset (Implemented)

**Value Types:**
- `i32` (32-bit signed/unsigned integers)

**Control Flow:**
| Opcode | Name | Description |
|--------|------|-------------|
| 0x00 | unreachable | Trap (error) |
| 0x01 | nop | No operation |
| 0x02 | block | Begin block |
| 0x03 | loop | Begin loop |
| 0x04 | if | Conditional |
| 0x05 | else | Else branch |
| 0x0B | end | End block |
| 0x0C | br | Unconditional branch |
| 0x0D | br_if | Conditional branch |
| 0x0F | return | Return from function |
| 0x10 | call | Function call |

**Variables:**
| Opcode | Name | Description |
|--------|------|-------------|
| 0x20 | local.get | Push local variable |
| 0x21 | local.set | Set local variable |

**Memory:**
| Opcode | Name | Description |
|--------|------|-------------|
| 0x28 | i32.load | Load from memory |
| 0x36 | i32.store | Store to memory |

**Arithmetic:**
| Opcode | Name | Description |
|--------|------|-------------|
| 0x41 | i32.const | Push constant |
| 0x6A | i32.add | Addition |
| 0x6B | i32.sub | Subtraction |
| 0x6C | i32.mul | Multiplication |
| 0x6D | i32.div_s | Signed division |
| 0x71 | i32.and | Bitwise AND |
| 0x72 | i32.or | Bitwise OR |
| 0x73 | i32.xor | Bitwise XOR |

**Comparison:**
| Opcode | Name | Description |
|--------|------|-------------|
| 0x45 | i32.eqz | Equal to zero |
| 0x46 | i32.eq | Equal |
| 0x47 | i32.ne | Not equal |
| 0x48 | i32.lt_s | Less than (signed) |
| 0x4A | i32.gt_s | Greater than (signed) |
| 0x4C | i32.le_s | Less or equal (signed) |
| 0x4E | i32.ge_s | Greater or equal (signed) |

### Not Yet Implemented

- `f32`, `f64` (floating point)
- `i64` (64-bit integers)
- Tables and indirect calls
- Multiple memories
- Bulk operations
- SIMD

## How to Compile and Run

### Step 1: Write Your Program

**Rust example** (`src/lib.rs`):

```rust
#![no_std]

#[no_mangle]
pub fn test() {
    let mut i: i32 = 0;
    unsafe {
        // Store values at memory addresses
        core::ptr::write_volatile(0x20000 as *mut i32, 0);

        while i < 10 {
            core::ptr::write_volatile(0x20000 as *mut i32, i);
            i += 1;
        }
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}
```

**AssemblyScript example**:

```typescript
// Compile with: asc test.ts -o test.wasm --optimize
export function test(): void {
  let i: i32 = 0;
  while (i < 10) {
    store<i32>(0, i);  // Store at address 0 (maps to 0x20000)
    i++;
  }
}
```

### Step 2: Compile to WASM

**Rust:**
```bash
cargo build --target wasm32-unknown-unknown --release
# Output: target/wasm32-unknown-unknown/release/your_program.wasm
```

**AssemblyScript:**
```bash
asc test.ts -o test.wasm --optimize
```

**C/C++ (emscripten):**
```bash
emcc test.c -o test.wasm -O2 --no-entry
```

### Step 3: Load into Geometry OS

**Using the CLI (recommended):**

```bash
# Start the GPU daemon
cargo run --release --bin gpu_dev_daemon &

# Load the WASM interpreter (if not already loaded)
geos_cli.py substrate-load systems/glyph_stratum/programs/wasm_interpreter.rts.png

# Load your WASM binary
geos_cli.py wasm-load your_program.wasm --base 0x20000

# Run and read result
geos_cli.py wasm-run --entry 0x20000 --read-result
```

**Using raw HTTP API:**

```bash
# Start the GPU daemon
cargo run --release --bin gpu_dev_daemon &

# Load the WASM interpreter (if not already loaded)
curl -X POST "http://127.0.0.1:8769/load" \
    -d "systems/glyph_stratum/programs/wasm_interpreter.rts.png"

# Load your WASM binary at the WASM linear memory base
curl -X POST "http://127.0.0.1:8769/load?binary=0x20000" \
    --data-binary @your_program.wasm

# Set entry point (interpreter expects this at WASM_IP_ADDR)
curl "http://127.0.0.1:8769/poke?addr=0x30004&value=0x20000"

# Read output from WASM memory
curl "http://127.0.0.1:8769/read?addr=0x20000&len=64"
```

## Example: Counter Loop

This test program demonstrates loops, conditionals, and memory operations:

```wat
;; systems/glyph_stratum/tests/wasm/simple_loop.wat
(module
  (memory 1)

  (func (export "test")
    (local $i i32)

    ;; i = 0
    i32.const 0
    local.set $i

    ;; Loop until i >= 10
    (block $exit
      (loop $continue
        ;; if i >= 10, exit
        local.get $i
        i32.const 10
        i32.ge_s
        br_if $exit

        ;; memory[0] = i
        i32.const 0
        local.get $i
        i32.store

        ;; i++
        local.get $i
        i32.const 1
        i32.add
        local.set $i

        ;; continue
        br $continue
      )
    )
  )
)
```

Compile and run:
```bash
cd systems/glyph_stratum/tests/wasm
make
# Load test.wasm and run...
```

## Implementation Details

### LEB128 Decoding

WASM uses LEB128 encoding for variable-length integers. The interpreter implements unsigned decoding:

```
result = 0
shift = 0
loop:
    byte = read_byte()
    result |= (byte & 0x7F) << shift
    if (byte & 0x80) == 0:
        break
    shift += 7
return result
```

### Stack Machine

The interpreter uses a stack-based execution model:

```
Operand Stack (grows down from 0x2FFFC):
          ┌───────────┐
0x2FFFC:  │   free    │ ← SP
          ├───────────┤
          │   value   │
          ├───────────┤
          │   value   │
          ├───────────┤
          │   ...     │
          └───────────┘
```

### Block Stack for Control Flow

Control flow uses a block stack to track nested structures:

```
Block Stack (at 0x31000+):
          ┌───────────────────┐
Entry N:  │ type | addr | sp  │
          ├───────────────────┤
Entry N-1:│ type | addr | sp  │
          ├───────────────────┤
          │       ...         │
          └───────────────────┘
```

Branch instructions (`br`, `br_if`) pop blocks to find targets and restore stack height.

## Debugging

### Status Register Values

| Value | Status |
|-------|--------|
| 0 | Halted (normal termination) |
| 1 | Running |
| 2 | Error (trap or invalid opcode) |

### Reading VM State

```bash
# Check status
curl "http://127.0.0.1:8769/read?addr=0x3000C&len=4"

# Read instruction pointer
curl "http://127.0.0.1:8769/read?addr=0x30004&len=4"

# Read operand stack pointer
curl "http://127.0.0.1:8769/read?addr=0x30000&len=4"

# Read block stack count
curl "http://127.0.0.1:8769/read?addr=0x31000&len=4"
```

## Limitations (MVP)

  1. **No floating point** - Only integer operations
  2. **No 64-bit integers** - i32 only
  3. **No indirect calls** - No function tables
  4. **Limited memory** - 64KB (1 page) only
  5. **No imports** - No host functions yet
  6. **IF/ELSE skipping** - Requires forward END scanning (stubbed)

## Host Functions (WASM → Glyph Bridge)

To enable practical programs, WASM needs to call Geometry OS services:

### Current Status
- No host function interface implemented yet
- WASM programs are currently limited to pure computation

### Planned Interface
Host functions will be exposed as WASM imports:
```
(module
  (import "glyph" "uart_write" (func $uart_write (param i32 i32)))
  (import "glyph" "get_timer" (func $get_timer (result i32)))
  ;; etc.
)
```

### Calling Convention
- Parameters passed via linear memory (standard WASM calling convention)
- Results returned in registers or via memory pointers
- Function signatures defined in Glyph using standard WASM types

### Example: UART Output
```wat
;; Write a byte to UART
(i32.const 0x0200)    ;; UART_OUT address
(i32.const 65)        ;; ASCII 'A'
(call $glyph_uart_write)
```

### Implementation Plan
1. Define host function table in Glyph memory
2. Implement `call_import` opcode handler
3. Export standard functions: UART, timers, framebuffer access
4. Provide Glyph-compatible wrappers for common libc functions

## WASI Support

WebAssembly System Interface provides standardized system calls:

### Current Status
- No WASI support implemented
- Limits portability of existing Rust/C programs

### Planned Subset
Initial implementation will target:
- `fd_write` → UART/console output
- `fd_read` → UART/console input (when available)
- `proc_exit` → Program termination
- `clock_time_get` → System timer
- `random_get` → Hardware RNG (when available)

### Benefits
- Enables running unmodified Rust `println!` and C `printf`
- Allows file-like abstractions over GPU resources
- Provides standard interface for filesystem, networking, etc.
- Compatible with wasi-sdk and existing toolchains

### Implementation Approach
1. Map WASI file descriptors to Geometry OS resources
   - fd 0 (stdin) → UART input
   - fd 1 (stdout) → UART output
   - fd 2 (stderr) → UART output
2. Implement core WASI functions as host imports
3. Provide libc overlay that translates to WASI syscalls

## Example: Hello World with Host Functions

Once host functions are implemented, a "Hello World" program would look like:

```wat
(module
  (import "glyph" "uart_write" (func $uart_write (param i32 i32)))
  (import "glyph" "uart_flush" (func $uart_flush))
  
  (func $hello
    ;; Write "Hello" to UART
    i32.const 0x0200      ;; UART_OUT address
    i32.const 72          ;; 'H'
    call $uart_write
    i32.const 0x0200
    i32.const 101         ;; 'e'
    call $uart_write
    i32.const 0x0200
    i32.const 108         ;; 'l'
    call $uart_write
    i32.const 0x0200
    i32.const 108         ;; 'l'
    call $uart_write
    i32.const 0x0200
    i32.const 111         ;; 'o'
    call $uart_write
    call $uart_flush
  )
  
  (start $hello)
)
```

This would compile and run to output "Hello" to the UART console.

## References

  - **WASM Spec**: https://webassembly.github.io/spec/core/
  - **Opcode Reference**: https://webassembly.github.io/spec/core/appendix/index-instructions.html
  - **Interpreter Source**: `systems/glyph_stratum/programs/wasm_interpreter.glyph`
  - **Design Doc**: `docs/plans/2026-03-15-wasm-subset-design.md`
  - **Block Stack Plan**: `docs/plans/2026-03-15-wasm-block-stack.md`

  ---

  *"One interpreter, twenty languages, infinite GPU."*
