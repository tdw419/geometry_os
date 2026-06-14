# Semantic Zoom — Recursive Spatial Navigation

> **Phase 223** | **Commit:** cf63a13c50
> Zoom into a building on the map and you enter the program that lives inside it. Zoom back out and you return to the map. This recursion can nest up to 4 levels deep.

## The Core Idea

Every building on the infinite map is a doorway. The map is not a picture of programs — it IS the programs. A building's pixel coordinates are its identity. When the user zooms to maximum depth, the host detects which building is under the camera center and chain-loads that building's program into the VM, replacing the map entirely. The new program runs as if it was always there.

This makes the map a spatial file system. Position is the directory structure. Zoom is navigation.

## How It Works

### Zoom Levels

| Level | Meaning |
|-------|---------|
| 0–4   | Map zoom. Higher = more magnified. Camera pans with drag. |
| 5     | **Expansion trigger.** VM pauses the map, chain-loads the building's program. |

Zoom is controlled by scroll wheel in fullscreen map mode (scroll up = zoom in, scroll down = zoom out).

### Expansion (zoom in to level 5)

```
1. User scrolls to zoom level 5
2. Host reads camera center from RAM[0x7800..0x7801]
3. Host scans building table (RAM[0x7500]) for nearest building
   (within 2 tiles of camera center)
4. Found? → push return state, chain-load programs/<name>.asm
   Not found? → bounce back to zoom level 4
```

The chain-load replaces the running program entirely. The VM's RAM is overwritten from 0x1000 with the new program's bytecode, PC resets to 0x1000, the instruction cache is flushed, and the halt flag is cleared. The map program is gone — the building's program now owns the screen.

### Collapse (zoom out past level 0)

```
1. User scrolls down at zoom level 0
2. Host checks return stack depth (RAM[0xF030])
3. depth > 0? → decrement depth, chain-load programs/world_desktop.asm
4. depth == 0? → nothing happens (already at root)
```

Collapse always returns to `world_desktop.asm` — the map/launcher. The return stack tracks how deep you are, not what program was running (that's implicit: it's always the map).

## RAM Layout

### Building Table (0x7500)

The building table lives in VM RAM and is populated by the map program (typically `world_desktop.asm` or `boot.asm`).

```
RAM[0x7500 + i*4 + 0]  =  world_x (tile coordinates)
RAM[0x7500 + i*4 + 1]  =  world_y (tile coordinates)
RAM[0x7500 + i*4 + 2]  =  color/type (24-bit RGB)
RAM[0x7500 + i*4 + 3]  =  pointer to name string in RAM
RAM[0x7580]             =  building count (max 32)
```

Each building name is a null-terminated ASCII string stored somewhere in RAM. The name maps directly to `programs/<name>.asm` on disk.

### Handover Area (0xF010)

When the host wants to trigger a chain-load, it writes the program path into RAM and sets a flag:

```
RAM[0xF010..0xF01F]  =  program path as ASCII bytes (e.g. "programs/editor.asm")
RAM[0xF020]           =  trigger flag (1 = load now, host clears after read)
```

The VM checks this flag at the end of every frame boundary. If set, it reads the path string and calls `chain_load()`.

### Return Stack (0xF030)

```
RAM[0xF030]              =  current depth (0 = root map, max 4)
RAM[0xF031 + d*32]       =  saved state for depth d (zoom level, etc.)
```

Maximum nesting depth is 4 levels. Each stack slot holds 32 words for saved state.

### Geosync Trigger (0xF040)

```
RAM[0xF040]  =  backup request (1 = trigger host-side geosync backup)
```

The host main loop monitors this address. If set to 1, it executes `./scripts/geosync.py backup` as a detached process and clears the flag. This allows native apps like `geosync.asm` to trigger full-system snapshots.

## Geosync — Spatial Archive Management

The **geosync** ecosystem provides professional state management inspired by `rsync` (CLI) and `grsync` (GUI).

### 1. The CLI Utility (`scripts/geosync.py`)
A robust Python tool for managing system snapshots from the host terminal.

*   `./scripts/geosync.py backup`: Captures full state, anchors it spatially, and saves metadata (app name, position).
*   `./scripts/geosync.py list`: Displays a table of all backups with their map coordinates and active app.
*   `./scripts/geosync.py restore <name>`: Instantly restores the system to a specific snapshot.
*   `./scripts/geosync.py prune --keep 10`: Deletes old snapshots while keeping the most recent ones.

### 2. The GUI Application (`programs/geosync.asm`)
A native Geometry OS application that provides a visual "grsync" interface.

*   **Snapshot Button:** Triggers a host-side backup by writing to `RAM[0xF040]`.
*   **Visual Inventory:** Scans the building table to show recent snapshots on the map.
*   **Teleportation:** (Future) Allows jumping the camera directly to a historical version.

### Camera & Zoom (0x7800)

```
RAM[0x7800]  =  camera X (tile units)
RAM[0x7801]  =  camera Y (tile units)
RAM[0x7802]  =  frame counter
RAM[0x7808]  =  player X (tile units)
RAM[0x7809]  =  player Y (tile units)
RAM[0x7812]  =  zoom level (written every frame)
RAM[0x7813]  =  map flags (1 = fullscreen map active)
```

## chain_load()

Defined in `src/vm/mod.rs`. This is the mechanism that makes expansion work:

```rust
pub fn chain_load(&mut self, filename: &str) -> bool {
    // 1. Read file from virtual filesystem
    // 2. If .png → decode as PixelPack
    //    If .asm → preprocess + assemble to bytecode
    // 3. Write bytecode into RAM at 0x1000
    // 4. Reset PC to 0x1000
    // 5. Invalidate instruction cache
    // 6. Clear halt flag
    // 7. New program runs on next step
}
```

Supports two file formats:
- **.asm** — Assembly source. Preprocessed (macro expansion), then assembled to bytecode words.
- **.png** — PixelPack-encoded bytecode. Decoded from pixels, then loaded identically.

The old program is completely replaced. There is no sandboxing — the new program has full access to all RAM, all opcodes, and all I/O.

## Control Flow

```
                    ┌─────────────────────┐
                    │   world_desktop.asm  │  ← Map program (root)
                    │   Buildings rendered │
                    │   as colored rects   │
                    └──────────┬──────────┘
                               │ zoom to level 5
                               │ near building "editor"
                               ▼
                    ┌─────────────────────┐
                    │   programs/editor.asm│  ← Building's program
                    │   Full-screen app    │
                    │   Owns the VM        │
                    └──────────┬──────────┘
                               │ zoom out past 0
                               │
                               ▼
                    ┌─────────────────────┐
                    │   world_desktop.asm  │  ← Back to map
                    └─────────────────────┘
```

Nesting example (depth 2):

```
world_desktop.asm
  → zoom into "city" building
    → programs/city.asm (renders a city with buildings)
      → zoom into "bank" building
        → programs/bank.asm (a banking app)
          → zoom out: back to city.asm
            → zoom out: back to world_desktop.asm
```

## Creating New Building Programs

To add a building that users can zoom into:

1. Write `programs/your_app.asm` — any valid GeOS assembly program
2. In the map program, register the building in the table at 0x7500:

```asm
; Register building at tile (120, 80) named "your_app"
MOV RAM[0x7500 + count*4 + 0] 120    ; world_x
MOV RAM[0x7500 + count*4 + 1] 80     ; world_y
MOV RAM[0x7500 + count*4 + 2] 0xFF5533  ; color
MOV RAM[0x7500 + count*4 + 3] name_ptr  ; pointer to "your_app" string
INC RAM[0x7580]                        ; increment building count

:your_app_name .str "your_app"
```

3. Place the building sprite on the map at those coordinates (using RECTF, sprites, etc.)

That's it. When a user zooms into that location, `programs/your_app.asm` loads and runs.

## Source Locations

| Component | File | Lines |
|-----------|------|-------|
| Zoom logic + expansion trigger | `src/main.rs` | ~5060–5160 |
| Building table lookup | `src/main.rs` | ~3127–3172 |
| chain_load() | `src/vm/mod.rs` | ~502–560 |
| Frame-boundary trigger check | `src/vm/mod.rs` | ~954–963 |
| MCP building_enter | `src/mcp_server.rs` | ~1096–1113 |

## Design Notes

**Why RAM handover instead of a direct host call?**
The VM and host run on different layers. The host writes the path and a flag; the VM reads it at a safe point (frame boundary). This avoids corrupting VM state mid-instruction.

**Why .asm and .png?**
.asm files are human-readable and editable in the GeOS canvas. .png files are PixelPack-encoded — they can be generated by tools and carry visual metadata. Both resolve to the same bytecode.

**Why max depth 4?**
Practical limit. Each level needs 32 words of stack space at 0xF030. The handover area (0xF010–0xF020) and return stack (0xF030–0xF0B0) occupy high RAM that programs are unlikely to use. Deeper nesting would need a more complex stack manager.

**What happens to the tile map?**
Each chain-loaded program renders to the 256×256 framebuffer, which blits into the infinite tile map at the camera position. So nested programs paint new tiles into the world — the map grows with every program that runs.
