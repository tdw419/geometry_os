# GEOS CLI Quickstart

The `geos` CLI is the Neural Bridge between your terminal and Geometry OS.

## Installation

```bash
# From project root
python3 geos/cli.py --help

# Or using the module
python3 -m geos.cli --help
```

## Commands

### geos status

Quick health check:

```bash
python3 geos status
```

Output:
```
==================================================
GEOMETRY OS STATUS
==================================================

✅ LM Studio: Connected (14 models)
   Primary: qwen2.5-coder-7b-instruct

✅ Sisyphus: Checkpoint found
   Task: cognitive_restoration
   Cycle: 47

✅ Systems: 34 modules
   ai_gui, app_forge, cognitive, config_hub, evolution...

==================================================
```

### geos chat

Conversational REPL:

```bash
python3 geos chat
```

```
==================================================
GEOS CHAT - Geometry OS Neural Bridge
==================================================

✅ PixelBrain: Connected

Commands: exit, quit, help
--------------------------------------------------
geos> what's the evolution cycle count?
Evolution cycle: 47

geos> show active agents
Active agents: 12

geos> exit
Goodbye!
```

### geos map

ASCII visualization:

```bash
python3 geos map --view districts --zoom 2
python3 geos map --watch  # Live updates every 2 seconds
```

Output:
```
┌────────────────────────────────────────┐
│..-:--*+-+#:-.:===*=:++%=#+.+=+#+#=+:*..│
│=*#==*#-%=-+=*:*#.+.++#:+-=#:*=-=-+*+.* │
│*-+.=+=.- ++:.=%::-+*=-==.==**:*%+=.*--+│
└────────────────────────────────────────┘
Active: 12 agents | Mutations: 3 pending | View: districts
```

Options:
- `--view thoughts|districts|mutations` - What layer to render
- `--zoom N` - Zoom level (1-4)
- `--watch` - Live update every 2 seconds

### geos inspect

Hilbert sector inspection:

```bash
python3 geos inspect 0x8000
python3 geos inspect 32768 --format raw
```

Output:
```
==================================================
HILBERT SECTOR INSPECTION
==================================================
Address: 0x8000 (32768)
Coordinates: (0, 128)
Size: 16 bytes

Type: Mutation Container
Entropy: 0.87 (high)
==================================================
```

## Requirements

- Python 3.11+
- `prompt_toolkit>=3.0.0` (for chat REPL with history)
- LM Studio running on localhost:1234 (for full AI responses)
- PixelBrain service initialized (optional, uses fallback mode otherwise)

## Architecture

```
geos/
├── cli.py           # Entry point (argparse)
├── commands/        # Individual commands
│   ├── status.py    # System health check
│   ├── chat.py      # REPL launcher
│   ├── map.py       # ASCII visualization
│   └── inspect.py   # Sector inspection
├── chat/
│   ├── repl.py      # REPL implementation
│   └── context.py   # System state gathering
└── backends/
    ├── pixelbrain.py # ChatBackend class
    └── hilbert.py    # HilbertRenderer, HilbertInspector
```

## Integration Points

- **PixelBrainService**: Used for conversational AI responses
- **Sisyphus Checkpoint**: Reads `.loop/checkpoint.json` for cycle info
- **Evolution State**: Reads `.geometry/evolution_state.json` for mutations
- **Districts**: Reads `.geometry/districts.json` for agent counts
