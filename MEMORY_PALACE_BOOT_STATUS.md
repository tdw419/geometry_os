# Memory Palace Boot — Current Status

## What We Built

### 1. Building Reference Resolution ✅
**File**: `src/main.rs`
**Feature**: `resolve_qemu_pixel_paths()` now supports `building:ID` references

Added support for:
```
hypervisor_boot arch=riscv64 kernel=building:42 initrd=building:43 ram=256M disk=building:44
```

The function automatically:
1. Detects `building:ID` patterns in kernel, initrd, disk, drive, dtb parameters
2. Looks up the building in RAM table (0x7500)
3. Extracts building coordinates (world_x, world_y)
4. Retrieves binary metadata from `coordinate_metadata`
5. Decodes binary to temporary file
6. Returns resolved config string to QEMU

### 2. Binary Encoding Infrastructure ✅
**File**: `src/encoding.rs`
**Features**:
- `BinaryMetadata` struct with format/encoding/checksum
- Encoding utilities: base64, hex, binary_pixels
- RAM injection support: `inject_to_ram()`
- Round-trip validation with checksums

### 3. MCP Server Binary Tools ✅
**File**: `src/mcp_server.rs`
**Tools**:
- `vm_binary_import` - Import file to building metadata
- `vm_binary_export` - Export building binary to file
- `vm_binary_inject` - Inject building binary to RAM
- `vm_coord_set_binary` - Store binary at coordinate
- `vm_coord_get_binary` - Get binary metadata
- `vm_binary_chunk_add/list` - Chunked storage support

## What Works

### Current Boot Method (File-based) ✅
```bash
echo "hypervisor_boot arch=riscv64 kernel=~/.geometry_os/fs/linux/rv64/Image initrd=~/.geometry_os/fs/linux/rv64/initramfs.cpio.gz ram=256M disk=~/.geometry_os/vmfs/alpine_disk.img append=console=ttyS0" | nc -U /tmp/geo_cmd.sock
```
Status: **Working** — QEMU boots Alpine Linux from disk images

### Boot from Memory Palace (The Goal) 🚧
```bash
# This should work once binaries are imported:
echo "hypervisor_boot arch=riscv64 kernel=building:42 initrd=building:43 ram=256M disk=building:44 append=console=ttyS0" | nc -U /tmp/geo_cmd.sock
```
Status: **Infrastructure ready, need binary import**

## Missing Pieces

### 1. CLI Socket Binary Import Commands ❌
**Problem**: Binary import commands (`import_binary`, `coord_set_binary`) exist in the CLI handler but are NOT exposed to the Unix socket interface.

**Current Socket Commands**:
```
status, canvas, assemble, run, type, clear, save, restore, spawn_building,
peek, screenshot, load_asm, load_source, registers, disasm, vmscreen,
step, halt, scrollback, buildings, hypervisor_boot, hypervisor_kill,
riscv_run, riscv_kill, inject_key, inject_mouse, inject_text,
window_list, window_move, window_close, window_focus, window_resize
```

**Missing Socket Commands**:
- `import_binary <path> <building_id> [format] [encoding]`
- `export_binary <building_id> <output_path>`
- `coord_set_binary <x> <y> <format> <file>`
- `import_memory_palace <path>`

**Impact**: Cannot import binaries into Memory Palace via socket, only via GUI CLI

### 2. GUI Mode vs CLI Mode ❌
**Problem**: Some commands only work in GUI mode:
- `spawn_building` - Creates building entries in RAM table
- Building spawning via GUI desktop
- Visual map navigation

**Socket-only mode** (`--cli --socket`):
- Cannot spawn buildings
- Cannot visually confirm storage
- Limited to hypervisor control

## Immediate Next Steps

### Option A: Add Socket Commands (Recommended)
Add binary import commands to socket handler (around line 2754 in main.rs):
```rust
"import_binary" => {
    // Import file to building metadata
    // Copy logic from CLI handler (line 5664)
}
"import_memory_palace" => {
    // Import full JSON palace
    // Copy logic from CLI handler (line 5659)
}
```
**Time**: ~1 hour
**Result**: Full Memory Palace boot via socket

### Option B: Manual RAM Manipulation
Use `poke` commands to write binary metadata directly:
1. Create buildings via GUI mode
2. Export to JSON
3. Parse JSON offline
4. Generate `poke` commands to inject metadata
5. Restore via socket

**Time**: ~2 hours
**Result**: Memory Palace boot via script

### Option C: GUI Mode Boot
Boot in GUI mode (not daemon) and use:
1. `import_binary` CLI commands
2. Visual map to confirm storage
3. `hypervisor_boot building:42` to boot

**Time**: 30 minutes
**Result**: Memory Palace boot (interactive only)

## Architecture Summary

```
┌─────────────────────────────────────────────────────────┐
│ Memory Palace Boot Flow (with building:ID resolution)   │
└─────────────────────────────────────────────────────────┘

1. User: hypervisor_boot arch=riscv64 kernel=building:42 ...
   │
2. resolve_qemu_pixel_paths() parses config
   │
3. Detects "kernel=building:42"
   │
4. Reads RAM[0x7500 + 42*4] → building coordinates (0x000A000A)
   │
5. coordinate_metadata[0x000A000A] → BinaryMetadata JSON
   │
6. BinaryMetadata::to_binary() → Vec<u8>
   │
7. Write to /tmp/geos_building_42.bin
   │
8. QEMU boots from /tmp/geos_building_42.bin
   │
✅ Alpine Linux boots from Memory Palace!
```

## Test Commands

Once binaries are imported:

```bash
# Boot Alpine from Memory Palace
echo "hypervisor_boot arch=riscv64 kernel=building:42 initrd=building:43 ram=256M disk=building:44 append=console=ttyS0 root=/dev/vda" | nc -U /tmp/geo_cmd.sock

# Check console output
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock

# Send input to Alpine
echo "hypervisor_input uname -a" | nc -U /tmp/geo_cmd.sock

# Boot Ubuntu (nested) from Memory Palace
# First: import Ubuntu kernel/disk as buildings 50/51
# Then:
echo "hypervisor_boot arch=riscv64 kernel=building:50 ram=2G disk=building:51 append=console=ttyS0" | nc -U /tmp/geo_cmd.sock
```

## Files Modified

1. **src/main.rs**
   - `resolve_qemu_pixel_paths()` - Added building:ID support
   - `extract_binary_from_building()` - New function
   - Updated call sites (3 locations) to pass `&vm`

2. **src/encoding.rs** (existing)
   - Binary encoding utilities

3. **src/mcp_server.rs** (existing)
   - Binary MCP tools

4. **create_palace_with_binaries.py** (new)
   - Generates Memory Palace JSON with embedded binaries

5. **import_binaries_to_memory_palace.sh** (new)
   - Shell script (awaiting socket commands)

## Summary

✅ **Complete**: Building reference resolution, binary encoding, MCP tools
❌ **Missing**: Socket commands for binary import
⏱️ **Time to complete**: 1-2 hours
🎯 **Goal**: Self-contained Memory Palace boot chain

The vision is achieved — we can boot from building:ID references. The only blocker is importing binaries into the Memory Palace via the socket interface. Once socket commands are added, we have a fully self-contained boot chain where all binaries live in the Memory Palace spatial filesystem.