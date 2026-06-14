# Memory Palace: Inside-Out Architecture Guide

## The Paradigm Shift

### Before (Outside-In)
```
You → Socket Commands → GeOS VM → Render Frame → You
     ↓
  "Draw ring at (x,y)"
     ↓
  "Draw dot at (x,y)"
     ↓
  Complex command protocol, no persistence, no autonomy
```

**Problem:** You're constantly poking at a passive system. Every change requires explicit commands. The palace forgets everything between renders.

### After (Inside-Out)
```
You → Drop Data → RAM → Palace Reads It → Palace Renders → Loops Forever
                      ↓
                 Autonomous Environment
                      ↓
           "I am the palace, I decide how I look"
```

**Solution:** The palace is now a living environment. It runs autonomously inside GeOS, continuously reading its state from RAM and rendering itself. You just feed it data—it responds.

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        HUMAN LAYER                               │
├─────────────────────────────────────────────────────────────────┤
│  memory_palace.py      →  Add/list facts (CLI)                  │
│  compile_facts.py      →  JSON → Binary conversion              │
│  show_palace.py        →  ASCII preview (debugging)             │
└──────────────────────────┬──────────────────────────────────────┘
                           ↓ JSON
                    memory_palace_facts.json
                           ↓ compile
                    programs/memory_palace.dat (binary)
                           ↓ load
┌──────────────────────────┴──────────────────────────────────────┐
│                      GEOS LAYER (Autonomous)                     │
├─────────────────────────────────────────────────────────────────┤
│  run_memory_palace.py  →  Load .dat to RAM @ 0x2000             │
│                           Load .asm program                      │
│                           Run VM (forever loop)                  │
└──────────────────────────┬──────────────────────────────────────┘
                           ↓ RAM 0x2000
                    Binary Facts Data:
                      - u32: magic (0xDEADBEEF)
                      - u32: version (1)
                      - u32: fact_count
                      - N × [u32 tier, u32 angle, u32 ring]
                           ↓ autonomous read
┌──────────────────────────┴──────────────────────────────────────┐
│                   MEMORY PALACE ASM PROGRAM                     │
│                  (programs/memory_palace_v2.asm)                 │
├─────────────────────────────────────────────────────────────────┤
│  main_loop:                                                     │
│    CALL clear_screen                                            │
│    CALL draw_title                                              │
│    PEEK fact_count from RAM                                     │
│    FOR each_fact:                                               │
│      READ tier, angle, ring from RAM                            │
│      CALCULATE color, position                                  │
│      DRAW dot on screen                                          │
│    END FOR                                                      │
│    CALL draw_polling_indicator                                  │
│    CALL delay (500 frames)                                      │
│    JMP main_loop (forever)                                      │
└──────────────────────────┬──────────────────────────────────────┘
                           ↓
                    Continuous Visual Output
                           ↓
                    256×256 Framebuffer
```

---

## How It Works: Step by Step

### Step 1: Add Facts (Human Interface)

```bash
./memory_palace.py add critical "Important Thing" "Details here"
./memory_palace.py add important "Note" "More details"
./memory_palace.py add reference "Documentation" "Path: /path/to/doc"
```

**What happens:**
1. Python CLI opens `memory_palace_facts.json`
2. Appends new fact with auto-generated metadata:
   - `id`: Sequential integer
   - `tier`: critical/important/reference
   - `subject`: Short label
   - `content`: Full description
   - `path`: Optional file path
   - `ring`: 0, 1, 2 (which concentric circle)
   - `angle`: 0-359 degrees (position on ring)
3. Writes back to JSON

**Data structure:**
```json
{
  "version": 1,
  "last_updated": "2025-01-15T10:30:00",
  "facts": [
    {
      "id": 1,
      "tier": "critical",
      "subject": "Pixelpack decode",
      "content": "Decoding system for pixel-packed data...",
      "path": "",
      "ring": 0,
      "angle": 0
    }
  ]
}
```

---

### Step 2: Compile to Binary (Bridge to GeOS)

```bash
python3 compile_facts.py
```

**What happens:**
1. Reads `memory_palace_facts.json`
2. Converts to compact binary format for fast RAM access:
   ```
   Offset  Bytes   Meaning
   ------  ------  ----------------------------------------
   0x00    4       Magic number: 0xDEADBEEF (validation)
   0x04    4       Version: 1
   0x08    4       Fact count: N
   0x0C    12      Fact #0: [tier:4, angle:4, ring:4]
   0x18    12      Fact #1: [tier:4, angle:4, ring:4]
   ...
   0x0C+N*12  (end)
   ```

3. Tier mapping:
   - `critical` → 0 (red)
   - `important` → 1 (yellow)
   - `reference` → 2 (blue)

4. Writes to `programs/memory_palace.dat`

**Why binary?**
- GeOS assembly works with 32-bit words directly
- PEEK from RAM is faster than parsing JSON
- Compact representation (12 bytes per fact)
- Type-safe (fixed-width integers)

---

### Step 3: Run the Palace (Launch Autonomous Environment)

```bash
python3 run_memory_palace.py
```

**What happens:**

1. **Load binary data to RAM:**
   - Opens `memory_palace.dat`
   - For each 4-byte chunk:
     - Converts to little-endian u32
     - Sends `vm_poke` command to GeOS via `/tmp/geo_cmd.sock`
     - Writes to sequential addresses starting at 0x2000
   - Result: All facts now live in VM memory

2. **Load assembly program:**
   - Sends `vm_load_asm` with path to `memory_palace_v2.asm`
   - GeOS assembles the program
   - Program loaded and ready to execute

3. **Start autonomous execution:**
   - Sends `vm_run` command
   - Palace enters infinite loop:
     ```
     main_loop:
       clear_screen
       read facts from RAM
       render rings and dots
       wait 500 frames
       jump to main_loop
     ```
   - **Crucial:** The palace keeps running. You can exit the Python script—the palace continues inside GeOS.

4. **Auto-update mechanism:**
   - If you recompile facts (step 2), the `.dat` file changes
   - Next time the palace polls RAM, it sees new data
   - Rendering updates automatically
   - No restart needed!

---

### Step 4: Visual Output (What You See)

```
            🏰 MEMORY PALACE 🏰

                            X
                          C  ..
                             .C..
                               .I .

                                R .

Facts: 4
🔴 Pixelpack decode
🟡 GeOS Bridge
🔵 GeOS Opcodes
🔴 Pixelpack Encode
```

**Visual elements:**
- **X at center**: Core of the palace
- **Concentric rings (. )**: Three spatial zones
  - Inner ring: Critical facts (closest to center)
  - Middle ring: Important facts
  - Outer ring: Reference facts
- **Colored dots**: Individual facts
  - 🔴 C = Critical (red)
  - 🟡 I = Important (yellow)
  - 🔵 R = Reference (blue)
- **Position**: Each dot at its angle on its ring

**How position is calculated:**
```asm
radius = BASE_RADIUS + (ring * RING_SPACING)
angle_rad = angle * 3.14159 / 180
x = center_x + radius * cos(angle_rad)
y = center_y + radius * sin(angle_rad)
```

---

## The Assembly Program (Inside the Palace)

The palace is an assembly program running inside GeOS. Here's its structure:

### Entry Point
```asm
start:
    LOAD r0, 0x2000      ; Base address of facts in RAM
    LOAD r7, 128         ; Screen center X
    LOAD r8, 128         ; Screen center Y
    JMP main_loop        ; Enter autonomous loop
```

### Main Loop (The Heartbeat)
```asm
main_loop:
    CALL clear_screen              ; Wipe framebuffer
    CALL draw_title                ; "MEMORY PALACE" header
    
    ; Read fact count from RAM
    ADD r15, r0, 8                 ; r15 = &fact_count
    PEEK r1, r15                   ; r1 = fact_count
    
    ; Render all facts
    LOAD r2, 0                     ; fact_index = 0
fact_loop:
    CMP r2, r1                     ; Done?
    JGE wait_and_loop
    
    ; Calculate fact address
    LOAD r15, 12
    MUL r15, r15, r2               ; 12 * index
    ADD r15, r15, 12               ; +12 (skip header)
    ADD r3, r0, r15                ; r3 = &fact
    
    ; Read fact data
    PEEK r4, r3                    ; tier
    ADD r15, r3, 4
    PEEK r5, r15                   ; angle
    ADD r15, r3, 8
    PEEK r6, r15                   ; ring
    
    ; Render this fact
    CALL calculate_color
    CALL calculate_radius
    CALL draw_fact_dot
    
    ADD r2, r2, 1                  ; Next fact
    JMP fact_loop

wait_and_loop:
    CALL draw_polling_indicator
    LOAD r15, 500                  ; Delay 500 frames
    CALL delay
    JMP main_loop                  ; Forever
```

### Key Subroutines

**calculate_color:**
```asm
; Input: r4 = tier (0, 1, 2)
; Output: r10 = RGB color
CMP r4, 0
JEQ set_red          ; Critical = red (0xFF0000)
CMP r4, 1
JEQ set_yellow       ; Important = yellow (0xFFFF00)
LOAD r10, 0x0000FF   ; Reference = blue
RET
set_red:
    LOAD r10, 0xFF0000
    RET
set_yellow:
    LOAD r10, 0xFFFF00
    RET
```

**calculate_radius:**
```asm
; Input: r6 = ring (0, 1, 2)
; Output: r9 = radius in pixels
LOAD r15, 20         ; Base radius
ADD r9, r15, r6      ; r9 = 20 + ring
MUL r9, r9, 15       ; Scale up
RET
```

**draw_fact_dot:**
```asm
; Input: r5 = angle, r9 = radius, r10 = color
; Uses: r7, r8 (center), r13, r14 (screen pos)
; Trig: angle → radians, then sin/cos
; Result: CIRCLE r13, r14, r9, r10
RET
```

---

## Why This Matters

### 1. **Autonomy Over Control**
- Old: You command every render
- New: Palace decides when and how to render
- The palace has agency

### 2. **State Persistence**
- Old: Facts live in Python, forgotten each render
- New: Facts live in RAM, palace reads them continuously
- The palace has memory

### 3. **Emergent Behavior**
- Old: You code every visual element
- New: Palace can evolve its own rendering rules
- The palace can surprise you

### 4. **Multi-User Natural**
- Old: Single-user script
- New: Drop facts from anywhere, palace absorbs them
- The palace is a shared cognitive space

### 5. **Living System**
- Old: Static visualization
- New: Dynamic, breathing environment
- The palace is alive

---

## Programming Inside the Palace

To extend the palace, you edit the assembly program—not the Python scripts.

### Adding Font Labels

```asm
draw_labels:
    ; For each fact, render subject text
    ; Uses GeOS font opcodes
    LOAD r2, 0                     ; fact_index = 0
label_loop:
    CMP r2, r1
    JGE label_done
    
    ; Get fact position (reuse calculate logic)
    CALL calculate_fact_position
    
    ; Render text
    DRAWTEXT r13, r14, string_ptr, 0xFFFFFF, 0x000000
    
    ADD r2, r2, 1
    JMP label_loop
label_done:
    RET
```

### Adding Click Inspection

```asm
handle_click:
    ; Check for mouse click
    MOUSECLICK r1                 ; r1 = click_type
    CMP r1, 0
    JEQ no_click
    
    ; r1+1 = x, r1+2 = y
    ADD r15, r1, 1
    PEEK r15, r15                 ; click_x
    ADD r15, r1, 2
    PEEK r15, r15                 ; click_y
    
    ; For each fact, check distance
    LOAD r2, 0
check_loop:
    ; ... calculate distance ...
    ; ... if close, show details ...
    
no_click:
    RET
```

### Adding Animation

```asm
; Add to main_loop after render_facts
animate_rings:
    ; Global tick counter at RAM 0x2FFC
    LOAD r15, 0x2FFC
    PEEK r15, r15
    ADD r15, r15, 1
    POKE r15, 0x2FFC
    
    ; Rotate angles based on tick
    LOAD r2, 0
anim_loop:
    ; ... read angle, add rotation, write back ...
    
    RET
```

---

## File Layout

```
geometry_os/
├── memory_palace.py              # Add/list facts (CLI)
├── compile_facts.py              # JSON → binary conversion
├── run_memory_palace.py          # Load data + program to GeOS
├── show_palace.py                # ASCII preview (debugging)
├── memory_palace_facts.json      # Canonical fact storage
├── MEMORY_PALACE_GUIDE.md        # This document
└── programs/
    ├── memory_palace.dat         # Binary facts (RAM @ 0x2000)
    └── memory_palace_v2.asm      # Autonomous renderer (runs forever)
```

---

## Debugging Tools

### ASCII Preview (Quick Check)
```bash
python3 show_palace.py
```
Shows the palace structure in terminal without launching GeOS.

### List All Facts
```bash
./memory_palace.py list
```
Shows all facts with tiers and content previews.

### Inspect Binary Data
```bash
hexdump -C programs/memory_palace.dat | head
```
Verify binary structure after compilation.

### GeOS VM Status
```bash
# Via MCP or socket
{"command": "vm_status"}
```
Check if palace is running, PC position, etc.

---

## Common Patterns

### Adding a New Fact Tier

1. Edit `memory_palace.py`:
   ```python
   tier_symbols = {
       "critical": "🔴",
       "important": "🟡",
       "reference": "🔵",
       "note": "🟢"  # New tier
   }
   ```

2. Edit `compile_facts.py`:
   ```python
   tier_map = {
       "critical": 0,
       "important": 1,
       "reference": 2,
       "note": 3  # New mapping
   }
   ```

3. Edit `memory_palace_v2.asm`:
   ```asm
   calculate_color:
       CMP r4, 0
       JEQ set_red
       CMP r4, 1
       JEQ set_yellow
       CMP r4, 2
       JEQ set_blue
       LOAD r10, 0x00FF00  ; New: green
       RET
   ```

### Changing Ring Count

1. Edit `memory_palace.py` ring assignment:
   ```python
   ring = len(data["facts"]) % 4  # Now 4 rings instead of 3
   ```

2. Edit `show_palace.py` ring rendering:
   ```python
   for ring in range(4):  # 4 rings
       radius = 5 + ring * 4
   ```

3. Edit `memory_palace_v2.asm` radius calculation:
   ```asm
   LOAD r15, 20
   ADD r9, r15, r6      ; r6 = ring (0-3 now)
   MUL r9, r9, 12       ; Tighter spacing for 4 rings
   ```

---

## Next: Expanding the Palace

The palace is now an autonomous environment. Here's where it can go:

### Immediate (v3)
- [ ] Font rendering: Show fact labels on screen
- [ ] Click inspection: Click dot → see details
- [ ] Animation: Rotate rings, pulse critical facts

### Medium (v4)
- [ ] Fact aging: Old facts fade over time
- [ ] Relationships: Draw lines between related facts
- [ ] Spatial audio: Different sounds per ring
- [ ] Export: Save palace as PNG

### Long-term (v5+)
- [ ] Multi-palace: Separate palaces for different domains
- [ ] Palace-to-palace bridges: Navigate between domains
- [ ] Autonomous fact discovery: Palace learns from code/docs
- [ ] Collaborative: Multiple users drop facts, shared view

---

## The Core Insight

The Memory Palace is no longer a visualization technique. It's a **spatial computing environment**.

You don't "draw" the palace anymore. You **inhabit** it.

- Facts are objects in space
- Rings are semantic zones
- The palace has its own behavior
- You interact by dropping data, not issuing commands

This is the difference between a tool you use and a world you live in.

Welcome inside.