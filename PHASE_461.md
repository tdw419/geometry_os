# Phase 461: Memory Palace Shell Tools and Keyboard Navigation

## Status: COMPLETE

**Goal:** Create a keyboard-driven interactive shell for exploring and manipulating the Memory Palace. The shell provides commands for navigation, memory inspection, data loading, and program execution - making the palace feel like a living space you can walk through.

## Vision: Program INSIDE the Palace

The shell is not just a debugging tool - it's the primary interface for working with the Memory Palace. The palace runs autonomously inside GeOS, and the shell is how you interact with it from the outside. This aligns with the "inside-out architecture" from MEMORY_PALACE_V2.md.

## Deliverables

- [x] **Shell command framework**
  - [x] `461.d1.1` Shell command parser and dispatcher
    - Parse command lines into command name and arguments
    - Match commands by name or aliases
    - Route to handler functions
    - Command history tracking (last 100 commands)
    _Files: src/shell.rs_
  - [x] `461.d1.2` ShellState structure
    - Shared VM state across threads
    - Current region tracking
    - Command history
    - RISC-V handle for guest OS control
    _Files: src/shell.rs_
  - [x] `461.d1.3` Command result enum
    - Ok(String) for successful output
    - Error(String) for error messages
    - Continue for multi-step operations
    _Files: src/shell.rs_
  _~400 LOC, 1 unit test_

- [x] **Navigation commands**
  - [x] `461.d2.1` Region-based navigation
    - `goto <region>`: Navigate to palace region
    - Aliases: `cd`, `go`
    - Updates prompt to show current location
    _Files: src/shell.rs_
  - [x] `461.d2.2` Region query
    - `where`: Show current region and address range
    - `regions`: List all palace regions
    - Aliases: `pwd`, `loc` for where; `areas` for regions
    _Files: src/shell.rs_
  _~150 LOC, 2 unit tests_

- [x] **Memory inspection and manipulation**
  - [x] `461.d3.1` Memory peek/poke
    - `peek <addr> [count]`: Read memory values
    - `poke <addr> <value>...`: Write memory values
    - `ls [addr] [count]`: Hex dump memory region
    - Aliases: `p`, `read` for peek; `w`, `write` for poke; `list`, `dir` for ls
    _Files: src/shell.rs_
  - [x] `461.d3.2` Register inspection
    - `reg`: Show all 32 registers + PC
    - `pc [addr]`: Show or set program counter
    - Aliases: `regs`, `r` for reg; `rip` for pc
    _Files: src/shell.rs_
  - [x] `461.d3.3` Data load/dump
    - `load <file> [addr]`: Load data into RAM
    - `dump <addr> <count> <file>`: Dump memory to file
    - Aliases: `ld` for load; `export` for dump
    _Files: src/shell.rs_
  _~250 LOC, 2 unit tests_

## Palace Regions

The Memory Palace is divided into logical regions for spatial organization:

- **center** (0x0000-0x0FFF): Core system area - VM state, canvas buffer
- **inner_ring** (0x1000-0x1FFF): Critical facts - highest tier information
- **middle_ring** (0x2000-0x2FFF): Important facts - medium tier information
- **outer_ring** (0x3000-0x3FFF): Reference facts - lowest tier information
- **program_area** (0x4000-0x4FFF): Assembly programs and subroutines
- **data_area** (0x5000-0x5FFF): Temporary data and scratch space

## Command Summary

| Command | Aliases | Description |
|---------|---------|-------------|
| help | ?, h | Show all available commands |
| goto | cd, go | Navigate to a region |
| where | pwd, loc | Show current region |
| ls | list, dir | List memory contents |
| peek | p, read | Peek at memory |
| poke | w, write | Write to memory |
| load | ld | Load data into RAM |
| run | exec | Run from PC or address |
| step | s | Single-step the VM |
| reg | regs, r | Show all registers |
| pc | rip | Show or set PC |
| clear | cls | Clear VM state |
| history | hist | Show command history |
| regions | areas | List all palace regions |
| dump | export | Dump memory to file |

## Example Session

```bash
# Start shell
$ cargo run --bin geos
Memory Palace Shell v0.1
Type 'help' for commands, 'exit' to quit

geos:center > regions
Palace Regions:
===============
  center          0x0000 - 0x0FFF | Core system area - VM state, canvas buffer
  inner_ring      0x1000 - 0x1FFF | Critical facts - highest tier information
  middle_ring     0x2000 - 0x2FFF | Important facts - medium tier information
  outer_ring      0x3000 - 0x3FFF | Reference facts - lowest tier information
  program_area    0x4000 - 0x4FFF | Assembly programs and subroutines
  data_area       0x5000 - 0x5FFF | Temporary data and scratch space

geos:center > goto inner_ring
Moved to: inner_ring (0x1000 - 0x1FFF)
  Critical facts - highest tier information

geos:inner_ring > ls
Memory at 0x1000:
0x1000: 00000000 00000000 00000000 00000000
0x1010: 00000000 00000000 00000000 00000000
...

geos:inner_ring > poke 0x1000 0xDEADBEEF
Wrote 0xDEADBEEF to 0x1000

geos:inner_ring > peek 0x1000
0x1000: 0xDEADBEEF (3735928559)

geos:inner_ring > reg
Registers:
==========
  r 0: 0x00000000 (          0)   r 1: 0x00000000 (          0)   r 2: 0x00000000 (          0)   r 3: 0x00000000 (          0)
  ...
  PC:  0x00000000
  Halted: true

geos:inner_ring > exit
Goodbye!
```

## Integration

The shell module is integrated into lib.rs:

```rust
pub mod shell;
```

It provides:
- `ShellState`: Global state structure
- `execute_command()`: Command dispatcher
- `run_interactive_shell()`: Interactive loop
- `get_commands()`: Command registry
- `get_regions()`: Palace regions

## Testing

Unit tests verify:
- Command parsing and dispatch
- Region navigation
- Help command output
- Unknown command error handling

Run tests with:
```bash
cargo test shell
```

## Documentation

Complete user guide available in SHELL_GUIDE.md, including:
- Command reference with examples
- Palace region descriptions
- Integration with socket and MCP interfaces
- Tips and best practices
- Example workflows

## Technical Notes

- Thread-safe state uses Mutex for concurrent access
- Command history limited to 100 entries to avoid memory bloat
- Hex addresses accept both 0x prefix and plain hex
- Memory boundaries enforced (0x8000 max)
- Region addresses align with Memory Palace v2 architecture

## Future Enhancements

- Tab completion for commands, regions, addresses
- Visual ASCII art rendering of palace rings
- Breakpoint setting and execution control
- Watch expressions for memory monitoring
- Macro recording and replay
- Color-coded output for different data types
- Integration with TUI mode (press 's' to enter shell)

## Related Documentation

- SHELL_GUIDE.md: Complete user guide
- MEMORY_PALACE_V2.md: Architecture overview
- src/shell.rs: Implementation

---

Phase 461 transforms the Memory Palace from a passive data structure into an interactive, explorable environment. The shell provides a natural keyboard interface for spatial computing.