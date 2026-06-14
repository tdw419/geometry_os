# Memory Palace v2: Inside-Out Architecture

## Vision: Program INSIDE the Memory Palace

The Memory Palace is no longer something you poke at from outside. It's a living environment that runs autonomously inside GeOS, reading data and rendering itself.

## Architecture

```
You: memory_palace.py → facts.json → compile_facts.py → memory_palace.dat
                                                           ↓
                                                   RAM at 0x2000
                                                           ↓
                                             memory_palace_v2.asm (autonomous)
                                                           ↓
                                                      Visual rendering
                                                           ↓
                                                    (loops forever)
```

## How It Works

### 1. Add Facts (Outside)

```bash
# Add facts to the palace
./memory_palace.py add critical "Important Thing" "Details here"
./memory_palace.py add important "Note" "More details"
./memory_palace.py add reference "Documentation" "Path: /path/to/doc"

# List all facts
./memory_palace.py list
```

### 2. Compile to Binary

```bash
# Convert facts.json to binary format for GeOS
python3 compile_facts.py

# Output: programs/memory_palace.dat
# Format: u32 magic, u32 version, u32 count, then N×[u32 tier, u32 angle, u32 ring]
```

### 3. Run the Palace (Inside GeOS)

```bash
# Load binary data + assembly program and run
python3 run_memory_palace.py

# The palace will:
# - Load facts.dat into RAM at 0x2000
# - Run memory_palace_v2.asm
# - Read facts from RAM
# - Render rings with dots based on tier/angle/ring
# - Poll every 500 frames
# - Loop forever, auto-updating when you recompile facts
```

### 4. See It (ASCII Preview)

```bash
# Quick ASCII preview
python3 show_palace.py
```

## What You See

- **Red dots (C)**: Critical facts - inner ring
- **Yellow dots (I)**: Important facts - middle ring
- **Blue dots (R)**: Reference facts - outer ring
- **Position**: Each dot placed at its angle on its ring
- **Rings**: Concentric circles showing spatial organization

## The Breakthrough

**Before**: External socket poking, complex commands, no autonomy

**After**:
- Palace runs FOREVER inside GeOS
- You just drop JSON data, it picks it up
- Program INSIDE the palace (assembly code lives there)
- File-based bridge, no socket complexity
- Spatial computing: memory as visual architecture

## Programming Inside the Palace

The palace is now an environment you write code FOR, not AT. To add features:

1. Edit `programs/memory_palace_v2.asm`
2. Add new subroutines (e.g., `draw_labels`, `handle_click`, `animate_rotation`)
3. Reload and run

Example: Add label rendering
```asm
draw_labels:
    ; For each fact, render its subject as text
    ; Uses GeOS font opcodes
    RET
```

Example: Add click inspection
```asm
handle_click:
    ; Check if click is near a fact dot
    ; Show fact details on screen
    RET
```

## File Layout

```
geometry_os/
├── memory_palace.py           # Add/list facts
├── compile_facts.py           # JSON → binary
├── run_memory_palace.py       # Load + run
├── show_palace.py             # ASCII preview
├── memory_palace_facts.json   # Canonical data
└── programs/
    ├── memory_palace.dat      # Binary facts (for GeOS)
    └── memory_palace_v2.asm   # Autonomous renderer
```

## Next Steps

To expand the palace's capabilities:

1. **Font rendering** - Add label display for each fact
2. **Click inspection** - Click a dot to see details
3. **Animation** - Rotate rings, pulse critical facts
4. **File watcher** - Auto-reload facts.dat when changed
5. **Export** - Save palace state as image

The Memory Palace is now a living spatial environment. Welcome inside.