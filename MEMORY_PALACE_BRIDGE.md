# Memory Palace Bridge

## Architecture: Self-Hosting Spatial Environment

The Memory Palace runs INSIDE GeOS as an autonomous program that polls for updates. You don't poke at it from outside - you drop data in, it picks it up.

## How It Works

```
memory_palace.py (YOU call this)
         ↓
   facts.json (shared data)
         ↓
   memory_palace_autonomous.asm (runs forever in GeOS)
         ↓
   Visual palace rendering
```

## Usage

### Add facts from outside

```bash
# Add a critical fact
./memory_palace.py add critical "Important Thing" "Details here"

# Add an important fact
./memory_palace.py add important "Note" "More details"

# List all facts
./memory_palace.py list

# Clear all
./memory_palace.py clear
```

### Run the Memory Palace inside GeOS

```bash
# Load and run (from GeOS CLI)
geos> load programs/memory_palace_autonomous.asm
geos> run

# Or via VM:
geos> vm_load_asm programs/memory_palace_autonomous.asm
geos> vm_run
```

The palace will:
- Poll facts.json every 1000 frames
- Render dots on rings based on facts
- Red circle = critical (ring 0)
- Yellow circle = important (ring 1)
- Blue circle = reference (ring 2)
- Loop forever, auto-updating when facts.json changes

## Next Steps

To make it truly autonomous, add:
1. File watcher in GeOS to trigger re-render on file change
2. JSON parser in GeOS to read actual facts from facts.json (currently uses RAM)
3. Font rendering for fact labels
4. Interactive selection (click a dot to see details)

## Why This Bridge Works

- **No socket complexity**: Simple file sharing
- **Autonomous**: Palace runs forever, you just drop data
- **Inside-out programming**: You write code INSIDE the palace, not external scripts poking at it
- **Extensible**: Add facts from Python, cron jobs, other agents
- **Visual feedback**: See updates immediately in the palace rendering