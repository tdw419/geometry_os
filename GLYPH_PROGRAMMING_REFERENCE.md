# Geometry OS Glyph Programming Reference

## Overview
This document serves as a comprehensive reference for glyph programming in Geometry OS, covering the Glyph VM architecture, instruction set, memory model, and development practices.

## Glyph VM Architecture

### Core Components
- **VM State**: Each VM has PC, registers (128), stack (64 entries), and state flags
- **Memory Model**: 4096×4096 .rts.png texture as unified memory space
- **Execution Model**: Time-sliced, pre-emptive multi-tasking via GPU compute shader
- **Spatial MMU**: Each VM has base_addr and bound_addr for memory protection

### VM States
- `VM_STATE_INACTIVE (0)`: VM slot is free
- `VM_STATE_RUNNING (1)`: VM is executing instructions
- `VM_STATE_HALTED (2)`: VM has encountered HALT instruction or error
- `VM_STATE_WAITING (3)`: VM is waiting for event or resource

### Constants (from glyph_vm_scheduler.wgsl)
- `MAX_VMS: u32 = 8u` - Maximum concurrent VMs
- `MAX_CYCLES_PER_VM: u32 = 1024u` - Cycles per VM per frame
- `STACK_SIZE: u32 = 64u` - Stack entries per VM
- `REG_COUNT: u32 = 128u` - General purpose registers
- `GRID_SIZE: u32 = 4096u` - .rts.png dimension (4096×4096 pixels)

## Memory Layout

Each pixel in the .rts.png texture represents one Glyph instruction:
- **Red channel (R)**: Opcode (8 bits)
- **Green channel (G)**: Stratum/register source 1 (8 bits)
- **Blue channel (B)**: Register source 2 / immediate low (8 bits)
- **Alpha channel (A)**: Register destination / immediate high (8 bits)

### Addressing
- Linear address: `address = y * GRID_SIZE + x` (Hilbert curve mapping preferred)
- Hilbert curve functions available: `hilbert_d2xy()` and `hilbert_xy2d()`
- Memory access via `mem_read(addr)` and `mem_write(addr, value)` helpers

## Instruction Set

### Logic Stratum (Foundation) - Opcodes 0-15
| Opcode | Mnemonic | Description | Format |
|--------|----------|-------------|--------|
| 0 | NOP | No Operation | - |
| 1 | LDI | Load Immediate 32-bit | Uses 2 pixels |
| 2 | MOV | Move Register | R[B] = R[A] |
| 3 | LOAD | Load from Memory | R[B] = mem[R[A]] |
| 4 | STORE | Store to Memory | mem[R[A]] = R[B] |
| 5 | ADD | Addition | R[B] = R[A] + R[B] |
| 6 | SUB | Subtraction | R[B] = R[A] - R[B] |
| 9 | JMP | Jump | PC = R[A] (or immediate) |
| 10 | BRANCH | Conditional Branch | if cond: PC = next_pixel |
| 11 | CALL | Call Subroutine | Push PC+1, PC = R[A] |
| 12 | RETURN | Return from Subroutine | PC = pop stack |
| 13 | HALT | Halt Execution | Set VM state to HALTED |
| 14 | DATA | Passive Data | Skip (PC++) |
| 15 | LOOP | Loop Stub | Skip (PC++) |

### AI-Native / Bitwise Stratum - Opcodes 128-255
| Opcode | Mnemonic | Description | Format |
|--------|----------|-------------|--------|
| 128 | AND | Bitwise AND | R[B] = R[A] & R[B] |
| 129 | OR | Bitwise OR | R[B] = R[A] \| R[B] |
| 130 | XOR | Bitwise XOR | R[B] = R[A] ^ R[B] |
| 131 | SHL | Shift Left | R[B] = R[A] << (R[B] & 31) |
| 132 | SHR | Shift Right | R[B] = R[A] >> (R[B] & 31) |
| 133 | SAR | Shift Arithmetic Right | R[B] = R[A] >> (R[B] & 31) (sign-ext) |

### Memory-Based Opcodes - Opcodes 200-227
*(Encoding: R=opcode, G=dst, B=src1, A=src2)*
| Opcode | Mnemonic | Description |
|--------|----------|-------------|
| 200 | NOP2 | No Operation |
| 201 | ADD2 | mem[dst] = mem[src1] + mem[src2] |
| 202 | SUB2 | mem[dst] = mem[src1] - mem[src2] |
| 203 | MUL2 | mem[dst] = mem[src1] * mem[src2] |
| 204 | DIV2 | mem[dst] = mem[src1] / mem[src2] |
| 205 | LOAD2 | mem[dst] = mem[src1] |
| 206 | STORE2 | mem[dst] = src1 (immediate) |
| 207 | LOADIMM2 | mem[dst] = 32-bit immediate (next pixel) |
| 208 | JUMP2 | PC = dst |
| 209 | JUMPZ2 | if mem[dst]==0: PC = src1 else PC++ |
| 210 | JUMPNZ2 | if mem[dst]!=0: PC = src1 else PC++ |
| 211 | CMP2 | mem[dst] = (mem[src1]==mem[src2]) ? 1 : 0 |
| 212 | AND2 | mem[dst] = mem[src1] & mem[src2] |
| 213 | OR2 | mem[dst] = mem[src1] \| mem[src2] |
| 214 | XOR2 | mem[dst] = mem[src1] ^ mem[src2] |
| 215 | NOT2 | mem[dst] = ~mem[src1] |
| 216 | SHL2 | mem[dst] = mem[src1] << (mem[src2] & 31) |
| 217 | SHR2 | mem[dst] = mem[src1] >> (mem[src2] & 31) |
| 218 | CALL2 | push PC+1, PC = dst |
| 219 | RET2 | pop PC |
| 220 | PUSH2 | mem[sp++] = mem[dst] |
| 221 | POP2 | mem[dst] = mem[--sp] |
| 222 | READ2 | mem[dst] = mem[src1] (alias for LOAD) |
| 223 | WRITE2 | mem[dst] = mem[src1] (alias for STORE via memory) |
| 224 | SYNC2 | memory barrier (no-op in single-threaded) |

### Floating Point Opcodes (Emulated)
| Opcode | Mnemonic | Description |
|--------|----------|-------------|
| 228 | FADD2 | mem[dst] = f32(src1) + f32(src2) |
| 229 | FMUL2 | mem[dst] = f32(src1) * f32(src2) |

### AI-Native / Substrate Opcodes
| Opcode | Mnemonic | Description |
|--------|----------|-------------|
| 225 | SPATIAL_SPAWN | Create new VM from free slot |
| 226 | GLYPH_MUTATE | AI-native weight update (Hebbian learning) |
| 227 | YIELD | Yield CPU to scheduler |
| 228 | GET_INPUT | Get next input event from VRAM queue |
| 232 | GLYPH_WRITE | Write glyph(s) into RAM (self-modifying code) |
| 233 | ATTENTION_FOCUS | Mark active regions for sparse execution |

## Special Registers and Memory Areas

### VM Structure (in shader)
```rust
struct VmState {
    vm_id: u32,        // VM identifier (0-7)
    state: u32,        // VM_STATE_*
    parent_id: u32,    // Parent VM ID (0xFF = no parent)
    entry_point: u32,  // Initial PC (Hilbert index)
    base_addr: u32,    // Spatial MMU: Start Hilbert index
    bound_addr: u32,   // Spatial MMU: End Hilbert index (0 = unrestricted)
    pc: u32,           // Program counter
    cycles: u32,       // Cycles executed this frame
    halted: u32,       // Halt flag
    regs: [u32; 128],  // General purpose registers
    stack: [u32; 64],  // Stack for CALL/RET
    stack_ptr: u32,    // Stack pointer
}
```

### Scheduler State
```rust
struct SchedulerState {
    frame: u32,                    // Frame counter
    active_count: u32,             // Number of running VMs
    spawn_count: u32,              // Number of VMs spawned
    attention_mask: [u32; 8],      // Bitmask for sparse execution (8 VMS)
}
```

## Memory Access Helpers (from shader)

### Spatial Bounds Checking
```rust
fn check_spatial_bounds(vm_idx: u32, addr: u32) -> bool {
    let vm = vms[vm_idx];
    addr >= vm.base_addr && (vm.bound_addr == 0u || addr <= vm.bound_addr)
}
```

### Memory Read/Write
```rust
fn mem_read(addr: u32) -> u32 {
    let coords = d2xy(GRID_SIZE, addr);
    textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y))).r
}

fn mem_write(addr: u32, value: u32) {
    let coords = d2xy(GRID_SIZE, addr);
    let val = vec4<u32>(value & 0xFFu, (value >> 8u) & 0xFFu, (value >> 16u) & 0xFFu, (value >> 24u) & 0xFFu);
    textureStore(ram, vec2<i32>(i32(coords.x), i32(coords.y)), val);
}
```

### Hilbert Curve Functions
```rust
fn d2xy(n: u32, d: u32) -> vec2<u32> {
    // Convert Hilbert index to (x, y) coordinates
    // Implementation omitted for brevity
}

fn xy2d(n: u32, x: u32, y: u32) -> u32 {
    // Convert (x, y) coordinates to Hilbert index
    // Implementation omitted for brevity
}
```

## Glyph File Format

### Text Format (.glyph)
Each line represents one pixel (instruction):
```
<opcode> <stratum> <p1> <p2> [; comment]
```
Values can be decimal or hexadecimal (0x prefix).

Example:
```
; Simple program that adds 5 + 3
LDI 0 5 0      ; Load immediate 5 into R0
LDI 1 3 0      ; Load immediate 3 into R1
ADD 0 0 1      ; R0 = R0 + R1
STORE 0 0 100  ; Store R0 to memory address 100
HALT 0 0 0 0   ; Halt execution
```

### Binary Format (.rts.png)
- RGBA8 texture where each pixel is one instruction
- Width × Height = GRID_SIZE × GRID_SIZE = 4096 × 4096
- Red: Opcode, Green: Stratum, Blue: P1, Alpha: P2
- NOP instructions (opcode=0) are typically filtered out

## Development Workflow

### 1. Writing Glyph Code
Create .glyph files with instruction mnemonics or raw values.

### 2. Compiling to Texture
Use the glyph compiler:
```bash
python compile_glyph.py input.glyph output.rts.png
# Or with mcp2cli:
mcp2cli --mcp http://127.0.0.1:8769 crystallize --input program.glyph --output program.rts.png
```

### 3. Loading into VM
Spawn a VM with your glyph:
```bash
mcp2cli --mcp http://127.0.0.1:8769 vm_spawn \
  --vm_id 1 \
  --glyph_file program.rts.png \
  --window_x 100 --window_y 100 --window_w 800 --window_h 600
```

### 4. Debugging and Inspection
Check VM state:
```bash
mcp2cli --mcp http://127.0.0.1:8769 gpu_vmstate --vm 1
```

Peek at memory:
```bash
mcp2cli --mcp http://127.0.0.1:8769 mem_peek --addr 0x000064 --size 4  ; Address 100
```

### 5. Hot-Patching
Modify running instructions:
```bash
mcp2cli --mcp http://127.0.0.1:8769 glyph_patch \
  --vm_id 1 \
  --address 0x000008 \
  --opcode 0x05  ; ADD \
  --stratum 0 \
  --p1 0 \
  --p2 1
```

## AI-Native Programming

### Hebbian Learning (GLYPH_MUTATE)
Opcode 226 implements spike-timing dependent plasticity:
```text
OP_GLYPH_MUTATE: p1=act_reg, p2=addr_reg
activation = regs[p1]
post_act = regs[(p1 + 1) % 128]
weight_addr = regs[p2]
current_weight = mem_read(weight_addr)
learning_rate = 1
delta = activation * post_act * learning_rate / 256
new_weight = if current_weight > 0x80000000 then current_weight - delta else current_weight + delta
mem_write(weight_addr, new_weight)
```

### Attention Focusing
Opcode 233 enables sparse execution:
```text
OP_ATTENTION_FOCUS: stratum=start_addr, p1=end_addr, p2=vm_id
if p2 >= MAX_VMS: return  ; Bounds check
mask_idx = p2 / 32
bit_idx = p2 % 32
if bit_idx < 32:
    scheduler.attention_mask[mask_idx/32] |= ~(1 << bit_idx)
```

## Spatial Programming

### Hilbert Curve Mapping
Programs are laid out in Hilbert curve order for spatial locality:
- Consecutive instructions are placed adjacently in 2D space
- Improves GPU cache coherence for 2D access patterns
- Functions `hilbert_d2xy()` and `hilbert_xy2d()` convert between linear and 2D addresses

### Spatial MMU
Each VM has memory protection via base_addr and bound_addr:
- VM can only access memory between these bounds
- bound_addr = 0 means unrestricted access
- Violations set VM state to HALTED

## Substrate Communication

### Trap Interface (0xFF000000)
Single memory location for host<->glyph communication:
- Glyph writes request to 0xFF000000
- Trap shim processes request
- Trap shim writes result back to 0xFF000000
- Glyph reads response

### Event Queue
Input events stored in VRAM queue:
- MOUSE_MOVE, MOUSE_DOWN, MOUSE_UP
- KEY_DOWN, KEY_UP
- WINDOW_FOCUS, WINDOW_DRAG
- Retrieved via GET_INPUT opcode (228)

## Best Practices

### 1. Instruction Encoding
- Use immediates sparingly (they consume 2 pixels)
- Prefer register-register operations
- Bundle related operations to reduce jumps

### 2. Memory Access
- Check spatial bounds before memory access
- Use Hilbert curve for data layout to improve locality
- Consider memory coalescing for adjacent accesses

### 3. VM Management
- Start with VM ID 0 for system tasks (Window Manager)
- Use SPATIAL_SPAWN (opcode 225) for dynamic VM creation
- Monitor cycle counts to prevent hogging resources
- Use YIELD (opcode 227) to cooperate with scheduler

### 4. Debugging
- Use HALT (opcode 13) strategically for breakpoints
- Monitor VM state via gpu_vmstate tool
- Use ATTENTION_FOCUS for profiling active regions
- Store debug context in development memory (0x100000+)

### 5. Self-Modifying Code
- Use GLYPH_WRITE (opcode 232) for JIT compilation
- Be careful with instruction cache coherency
- Consider using separate code/data regions

## Examples

### Example 1: Infinite Loop
```glyph
; Infinite loop at address 0x0000
LOOP 0 0 0 0  ; PC++
; Actually, LOOP is a stub, so we need:
JMP 0 0 0 0   ; PC = PC (infinite loop)
```

### Example 2: Fibonacci Sequence
```glyph
; Calculate Fibonacci numbers and store in memory
LDI 0 0 0      ; R0 = 0 (fib(0))
LDI 1 1 0      ; R1 = 1 (fib(1))
LDI 2 1 0      ; R2 = 1 (counter)
LDI 3 20 0     ; R3 = 20 (loop limit)
LDI 4 100 0    ; R4 = 100 (start address)

fib_loop:
    STORE 0 4 0    ; mem[R4] = R0
    ADD 0 0 1      ; R0 = R0 + R1
    MOV 1 0 0      ; R1 = R0 (previous fib)
    SUB 0 2 1      ; R2 = R2 - 1
    JUMPZ 0 2 0 fib_done  ; if R2==0, exit
    JUMP 0 0 0 fib_loop   ; repeat

fib_done:
    HALT 0 0 0 0
```

### Example 3: Trap Usage (Print Character)
```glyph
; Print 'A' (ASCII 65) via trap
LDI 0 65 0      ; R0 = 65
STORE 0 0 -1    ; mem[0xFFFFFFFF] = R0 (trap interface)
; Trap handler reads mem[0xFFFFFFFF], prints char, writes result
LDI 0 0 -1      ; R0 = mem[0xFFFFFFFF] (get result)
HALT 0 0 0 0
```

### Example 4: Context Switching
```glyph
; Save context to memory
LDI 0 0 0       ; R0 = vm_id
LDI 1 0 pc_addr ; R1 = address to save PC
STORE 0 1 0     ; mem[pc_addr] = vm_id
LDI 0 pc 0      ; R0 = PC
STORE 0 1 1     ; mem[pc_addr+1] = PC
; ... save registers ...
; Restore context from other location
```

## Toolchain

### Compilation
- `compile_glyph.py`: Converts .glyph to .rts.png
- Supports labels, constants, macros
- Output optimizations (dense mode removes NOPs)

### Decompilation
- Visual inspection via .rts.png viewers
- Future: `decompile_glyph.py` tool

### Simulation
- `gpu_vmstate`: Query VM registers, PC, state
- `mem_peek`: Inspect instruction and data memory
- `daemon_status`: Check Ouroboros HAL daemon

### Debugging
- `glyph_patch`: Hot-patch running instructions
- `vm_spawn/spawn`: Dynamic VM creation
- Benchmark tools for performance analysis

## Resources

### Files in Repository
- `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl` - GPU compute shader
- `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` - Rust GPU interface
- `systems/glyph_boot/src/shaders/glyph_vm_scheduler.wgsl` - Boot variant
- `systems/glyph_boot/src/scheduler.rs` - Boot scheduler
- `apps/mcp2cli/src/geos_mcp_server.py` - MCP server with glyph tools
- `compile_glyph.py` - Glyph to texture compiler
- `systems/glyph_stratum/programs/` - Example glyph programs

### Related Documentation
- `memory.md` - Session context tracking
- `MEMORY_MAP.md` - GPU memory layout for mcp2cli
- `GLYPH_PROGRAMMING_REFERENCE.md` - This file
- `skills/glyph-expert/SKILL.md` - Expert skill definition

## Next Steps for Development

1. **Extend Instruction Set**: Consider adding new opcodes for specific AI operations
2. **Implement MMU**: Hardware-assisted translation for virtual memory
3. **Enhanced Debugging**: Single-step, breakpoints, watchpoints
4. **OS Services**: File system, networking, graphics primitives
5. **AI Acceleration**: Specialized tensor operation opcodes
6. **Networking**: Inter-VM communication protocols
7. **Persistence**: Snapshotting and VM migration capabilities

This reference provides the foundation for programming the Geometry OS substrate at the glyph level, enabling everything from low-level system operations to high-level AI-native applications.