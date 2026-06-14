# Editor Save/Load Commands

## Overview

The Geometry OS editor now supports saving and loading source files using the Memory Palace spatial file system via the FILEOPEN, FILEREAD, and FILEWRITE opcodes.

## Commands

### Save (Esc+S)

1. Press Escape followed by 'S' (case-insensitive)
2. Enter a single digit for the ring (0-9)
3. Enter a single digit for the angle (0-9)
4. The editor opens a file at the specified Memory Palace coordinates and writes the current buffer
5. Shows "OK" in green on success, "ERR" in red on failure

### Load (Esc+L)

1. Press Escape followed by 'L' (case-insensitive)
2. Enter a single digit for the ring (0-9)
3. Enter a single digit for the angle (0-9)
4. The editor opens a file at the specified Memory Palace coordinates and reads up to 2000 bytes into the buffer
5. Shows "OK" in green on success, "ERR" in red on failure
6. The cursor is reset to the beginning of the buffer

## Implementation Details

### Memory Layout

- `0x3000` - Prompt message buffer (for "Ring:", "Angle:", "OK", "ERR")
- `0x5000` - Dynamic opcode construction area
- `0x0800..0x3FFF` - Editor text buffer (byte-addressed via STOREB)

### File Operation Opcodes

- `FILEOPEN r15, r14` (0x0D) - Opens file at ring/angle coordinates, returns fd in r0
- `FILEWRITE r15, r11, r14` (0x0F) - Writes r14 bytes from r11 to file descriptor r15
- `FILEREAD r15, r11, r5` (0x0E) - Reads up to r5 bytes from file descriptor r15 into r11

### Key Technique

The editor uses self-modifying code to call file opcodes:
1. Constructs the 3-4 word opcode sequence at address 0x5000
2. Executes `JMP 0x5000` to run the file operation
3. Returns to the main editor flow via the HALT instruction

### Register Usage During Save/Load

- `r15` - Holds file descriptor after FILEOPEN
- `r14` - Holds angle value during input, buffer length during save
- `r11` - Source buffer base (0x0800), constant
- `r10` - Buffer write pointer
- `r5` - Temporary for address calculations, length during load
- `r6, r7` - Temporary for opcode construction
- `r2` - Temporary for TEXT calls

## Limitations

- Single-digit coordinates only (0-9)
- Maximum load size: 2000 bytes
- Files are opened in read/write mode by default
- Error handling shows generic "ERR" message without details

## Future Enhancements

1. Multi-digit coordinate input
2. Error message with specific reason (ENOENT, EACCES, etc.)
3. File list command (Esc+?)
4. Append mode (Esc+A for append vs Esc+S for overwrite)
5. File size display

## Testing

The editor tests verify:
- Assembly succeeds with new save/load code
- Editor runs without crashes
- Save/load operations complete (actual file I/O requires VMFS setup)

## Example Usage

```
1. Start editor
2. Type some assembly code
3. Press Escape, then 'S'
4. Enter '2' for ring
5. Enter '45' for angle
6. See "OK" - file saved to ~/zion/memory/ring_2/angle_45/
7. Modify code
8. Press Escape, then 'L'
9. Enter '2' for ring
10. Enter '45' for angle
11. See "OK" - original code restored
```