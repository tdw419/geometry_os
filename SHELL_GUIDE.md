# Memory Palace Shell Guide (Phase 461)

## Overview

The Memory Palace Shell is a keyboard-driven interactive environment for exploring and manipulating the Memory Palace. It provides commands for navigation, memory inspection, data loading, and program execution - all designed to make the palace feel like a living space you can walk through.

## Vision: Program INSIDE the Palace

The shell is not just a debugging tool - it's the primary interface for working with the Memory Palace. The palace runs autonomously inside GeOS, and the shell is how you interact with it from the outside.

## Starting the Shell

```bash
# From CLI mode
cargo run --bin geos

# Or in TUI mode (when implemented)
Press 's' to enter shell mode
```

## Quick Tour

```bash
# Start by learning what regions exist
geos:center > regions
Palace Regions:
===============
  center          0x0000 - 0x0FFF | Core system area - VM state, canvas buffer
  inner_ring      0x1000 - 0x1FFF | Critical facts - highest tier information
  middle_ring     0x2000 - 0x2FFF | Important facts - medium tier information
  outer_ring      0x3000 - 0x3FFF | Reference facts - lowest tier information
  program_area    0x4000 - 0x4FFF | Assembly programs and subroutines
  data_area       0x5000 - 0x5FFF | Temporary data and scratch space

# Navigate to a region
geos:center > goto inner_ring
Moved to: inner_ring (0x1000 - 0x1FFF)
  Critical facts - highest tier information

# List memory contents (defaults to current region)
geos:inner_ring > ls
Memory at 0x1000:
0x1000: 00000000 00000000 00000000 00000000
0x1010: 00000000 00000000 00000000 00000000
...

# Peek at specific addresses
geos:inner_ring > peek 0x1000 4
0x1000: 0x0 (0)
0x1004: 0x0 (0)
0x1008: 0x0 (0)
0x100C: 0x0 (0)

# Write values to memory
geos:inner_ring > poke 0x1000 0xDEADBEEF 0xCAFEBABE
Wrote 0xDEADBEEF to 0x1000
Wrote 0xCAFEBABE to 0x1004

# Run a program
geos:inner_ring > run 0x1000
Running from 0x1000...

# Step through execution
geos:inner_ring > step 5
Stepped 5 times. PC=0x1014 Halted=false

# Check registers
geos:inner_ring > reg
Registers:
==========
  r 0: 0x00000000 (          0)   r 1: 0x00000000 (          0)   r 2: 0x00000000 (          0)   r 3: 0x00000000 (          0)
  r 4: 0x00000000 (          0)   r 5: 0x00000000 (          0)   r 6: 0x00000000 (          0)   r 7: 0x00000000 (          0)
  r 8: 0x00000000 (          0)   r 9: 0x00000000 (          0)  r10: 0x00000000 (          0)  r11: 0x00000000 (          0)
  r12: 0x00000000 (          0)  r13: 0x00000000 (          0)  r14: 0x00000000 (          0)  r15: 0x00000000 (          0)
  r16: 0x00000000 (          0)  r17: 0x00000000 (          0)  r18: 0x00000000 (          0)  r19: 0x00000000 (          0)
  r20: 0x00000000 (          0)  r21: 0x00000000 (          0)  r22: 0x00000000 (          0)  r23: 0x00000000 (          0)
  r24: 0x00000000 (          0)  r25: 0x00000000 (          0)  r26: 0x00000000 (          0)  r27: 0x00000000 (          0)
  r28: 0x00000000 (          0)  r29: 0x00000000 (          0)  r30: 0x00000000 (          0)  r31: 0x00000000 (          0)

  PC:  0x00001014
  Halted: false

# See where you are
geos:inner_ring > where
Current region: inner_ring (0x1000 - 0x1FFF)
  Critical facts - highest tier information

# View command history
geos:inner_ring > history
Command history (last 10):
  0: regions
  1: goto inner_ring
  2: ls
  3: peek 0x1000 4
  4: poke 0x1000 0xDEADBEEF 0xCAFEBABE
  5: run 0x1000
  6: step 5
  7: reg
  8: where
  9: history

# Load data from file
geos:inner_ring > load facts.dat 0x2000
Loaded 48 words from facts.dat to 0x2000

# Dump memory to file
geos:inner_ring > dump 0x1000 16 backup.bin
Dumped 64 bytes from 0x1000 to backup.bin

# Clear state
geos:inner_ring > clear ram
RAM cleared
geos:inner_ring > clear all
All VM state cleared

# Get help
geos:center > help
Memory Palace Shell Commands:
================================
  help            ["?", "h"]                       | Show all available commands
  goto            ["cd", "go"]                     | Navigate to a region: goto <region_name>
  where           ["pwd", "loc"]                   | Show current region and address range
  ls              ["list", "dir"]                  | List memory contents: ls [addr] [count]
  peek            ["p", "read"]                    | Peek at memory: peek <addr> [count]
  poke            ["w", "write"]                   | Write to memory: poke <addr> <value>...
  load            ["ld"]                           | Load data into RAM: load <file> [addr]
  run             ["exec"]                         | Run from PC or address: run [addr]
  step            ["s"]                            | Single-step the VM: step [count]
  reg             ["regs", "r"]                    | Show all registers: reg
  pc              ["rip"]                          | Show or set PC: pc [addr]
  clear           ["cls"]                          | Clear VM state: clear [canvas|ram|all]
  history         ["hist"]                         | Show command history: history [count]
  regions         ["areas"]                        | List all palace regions
  dump            ["export"]                       | Dump memory to file: dump <addr> <count> <file>
```

## Command Reference

### Navigation

**`goto <region_name>`** or **`cd <region_name>`** or **`go <region_name>`**
- Navigate to a palace region
- Prompts update to show current location
- Example: `goto middle_ring`

**`where`** or **`pwd`** or **`loc`**
- Show current region and address range
- Example: `where`

**`regions`** or **`areas`**
- List all palace regions
- Example: `regions`

### Memory Inspection

**`ls [addr] [count]`** or **`list [addr] [count]`** or **`dir [addr] [count]`**
- List memory contents as hex dump
- Defaults to current region if no address specified
- Default count is 16 words
- Example: `ls 0x2000 32`

**`peek <addr> [count]`** or **`p <addr> [count]`** or **`read <addr> [count]`**
- Peek at memory at specific address
- Returns address, hex value, and decimal value
- Default count is 1 word
- Example: `peek 0x1000 8`

### Memory Manipulation

**`poke <addr> <value>...`** or **`w <addr> <value>...`** or **`write <addr> <value>...`**
- Write one or more values to memory starting at address
- Values can be hex (0x...) or decimal
- Example: `poke 0x1000 0xDEADBEEF 255`

### Data Operations

**`load <file> [addr]`** or **`ld <file> [addr]`**
- Load data from file into RAM
- Auto-detects binary (u32 words) vs text (assembly)
- Default address is 0x2000
- Example: `load facts.dat 0x2000`

**`dump <addr> <count> <file>`** or **`export <addr> <count> <file>`**
- Dump memory region to binary file
- Example: `dump 0x1000 64 backup.bin`

### Execution Control

**`run [addr]`** or **`exec [addr]`**
- Start VM execution from PC or specified address
- Example: `run 0x1000`

**`step [count]`** or **`s [count]`**
- Single-step VM execution
- Default count is 1 step
- Example: `step 10`

**`pc [addr]`** or **`rip [addr]`**
- Show or set program counter
- Example: `pc 0x1000`

### State Inspection

**`reg`** or **`regs`** or **`r`**
- Show all 32 registers plus PC and halted state
- Example: `reg`

### State Management

**`clear [canvas|ram|all]`** or **`cls [canvas|ram|all]`**
- Clear VM state components
- Default is "all"
- Example: `clear ram`

**`history [count]`** or **`hist [count]`**
- Show command history
- Default count is 10
- Example: `history 20`

### Help

**`help`** or **`?`** or **`h`**
- Show all available commands with aliases and descriptions
- Example: `help`

## Palace Regions

The Memory Palace is divided into logical regions:

- **center** (0x0000-0x0FFF): Core system area - VM state, canvas buffer
- **inner_ring** (0x1000-0x1FFF): Critical facts - highest tier information
- **middle_ring** (0x2000-0x2FFF): Important facts - medium tier information
- **outer_ring** (0x3000-0x3FFF): Reference facts - lowest tier information
- **program_area** (0x4000-0x4FFF): Assembly programs and subroutines
- **data_area** (0x5000-0x5FFF): Temporary data and scratch space

## Integration with Other Tools

### Socket Interface

The shell can be controlled via the Unix socket at `/tmp/geo_cmd.sock`:

```bash
echo "ls 0x1000" | nc -U /tmp/geo_cmd.sock
echo "goto inner_ring" | nc -U /tmp/geo_cmd.sock
```

### MCP Tools

The shell exposes MCP tools for external agent control:

- `mcp_geo_vm_canvas`: Get canvas text content
- `mcp_geo_vm_registers`: Read all 32 registers
- `mcp_geo_vm_poke`: Write words to RAM
- `mcp_geo_vm_run`: Toggle VM execution

## Tips and Best Practices

1. **Always know where you are** - Use `where` frequently to check your current region
2. **Use regions as mental maps** - The palace regions are your navigational landmarks
3. **History is your friend** - Use `history` to repeat commands and see your session flow
4. **Clear when debugging** - Use `clear` to reset state when experiments go wrong
5. **Dump before experiments** - Save state with `dump` before risky operations
6. **Step, don't run** - Use `step` for debugging, `run` for production

## Example Workflow

```bash
# 1. Navigate to program area
geos:center > goto program_area

# 2. Load new program
geos:program_area > load my_program.asm 0x4000

# 3. Inspect the code
geos:program_area > ls 0x4000 32

# 4. Set PC and run
geos:program_area > pc 0x4000
geos:program_area > step 100

# 5. Check results
geos:program_area > reg

# 6. Save state
geos:program_area > dump 0x4000 64 my_save.bin

# 7. Move to data area
geos:program_area > goto data_area

# 8. Check what the program wrote
geos:data_area > ls
```

## Future Enhancements

- **Autocomplete**: Tab completion for commands, regions, and addresses
- **Visual rendering**: ASCII art visualization of palace rings
- **Breakpoints**: Set execution breakpoints
- **Watch expressions**: Monitor memory locations during execution
- **Macro recording**: Record and replay command sequences
- **Color output**: Syntax highlighting and color-coded regions

## Related Documentation

- MEMORY_PALACE_V2.md: Architecture overview
- ROADMAP.md: Development roadmap
- programs/memory_palace_v2.asm: Palace rendering program

---

The shell is the gateway to the Memory Palace. Use it to explore, experiment, and understand the spatial computing environment.