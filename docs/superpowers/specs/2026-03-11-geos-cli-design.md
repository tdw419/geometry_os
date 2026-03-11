# GEOS CLI Design Specification

> The Neural Bridge between symbolic terminals and the geometric Infinite Map

## Overview

`geos` is a conversational CLI that transforms the autopilot experience from log-watching to active collaboration. The human acts as the "Frontal Lobe" providing intent; the autopilot (Evolution Daemon) handles the "Motor Cortex" operations.

## Architecture

```
geos/                          # New package in project root
├── __init__.py
├── cli.py                     # Entry point, argument parsing
├── chat/
│   ├── __init__.py
│   ├── repl.py                # Prompt_toolkit REPL loop
│   └── context.py             # System state gathering for context
├── commands/
│   ├── chat.py                # geos chat
│   ├── map.py                 # geos map --ascii
│   ├── status.py              # geos status
│   └── inspect.py             # geos inspect <hilbert_addr>
└── backends/
    ├── pixelbrain.py          # PixelBrain/LM Studio integration
    └── hilbert.py             # Hilbert decoder, ASCII renderer
```

## Commands

### `geos chat`

Conversational REPL powered by PixelBrain.

**Capabilities (v0.1):**
- **State Querying**: "what's the evolution cycle count?", "which agents are active?", "show dopamine levels"
- **Intent Steering**: "focus on memory optimization", "pause tectonic for 5 minutes"
- **ASCII Map Render**: Visualize districts, agents, hotspots in terminal
- **Hilbert Inspector**: Decode .rts.png containers, inspect raw state at addresses

**Example Session:**
```
$ geos chat
geos> what's the current evolution cycle?
Cycle 47. 3 mutations pending validation. Dopamine: 0.72

geos> focus on shader optimization for the next 10 cycles
Updated Master Stage priority queue. Shader mutations now at 0.8 weight.

geos> show me the map
┌──────────────────────────────┐
│  ▓▓░░░▓▓▓▓░░░░░▓▓▓░░░░░░▓▓  │ ← Evolution Hot Zone
│  ░░░▓▓░░░░▓▓▓▓░░░▓▓▓░░░░░  │
│  ▓▓░░░░░▓▓░░░░▓▓░░░▓▓▓▓░░  │ ← Tectonic District
│  ░░▓▓▓▓░░░░▓▓░░░░░░░░▓▓▓▓  │
└──────────────────────────────┘
Active: 12 agents | Mutations: 3 pending | Fractures: 0

geos> why did mutation 47.2 fail?
Dreaming Kernel predicted race condition in trap_enter (PAS: 0.32). Rolled back.

geos> exit
```

### `geos map --ascii`

Render current visual state as ASCII art.

```
$ geos map --ascii --zoom 2
┌────────────────────────────────┐
│  Agent Density     │  Mutation │
│  ▓▓▓▓▓░░░▓▓▓░░░░  │  Heat     │
│  ░░░░▓▓▓░░░▓▓▓▓▓  │  ▓▓▓▓░░  │
│  ▓▓░░░░░▓▓░░░░▓▓  │  ░░▓▓▓▓  │
└────────────────────────────────┘
```

Options:
- `--view thoughts|districts|mutations` - What layer to render
- `--zoom N` - Zoom level (1-4)
- `--watch` - Live update every 2 seconds

### `geos status`

Quick health check.

```
$ geos status
┌─────────────────────────────────┐
│ GEOMETRY OS STATUS              │
├─────────────────────────────────┤
│ Evolution Cycle: 47             │
│ Active Agents: 12               │
│ Pending Mutations: 3            │
│ Fractures: 0                    │
│ Dopamine: 0.72 │ Acetylcholine: 0.45
│ LM Studio: ✓ Connected          │
│ Visual Shell: ✓ Running         │
└─────────────────────────────────┘
```

### `geos inspect <address>`

Inspect a specific Hilbert sector.

```
$ geos inspect 0x8000 --format rts
Address: 0x8000 (Hilbert sector 32768)
Type: Mutation Container
Size: 4096 bytes
Entropy: 0.87 (high)

Raw (first 64 bytes):
7f 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52
00 00 00 40 00 00 00 40 08 06 00 00 00 aa 00 14
...
```

## Backend Integration

### PixelBrain Integration

The chat REPL uses the existing PixelBrain/LM Studio integration:

```python
# geos/backends/pixelbrain.py
from systems.visual_shell.pixel_brain import PixelBrain

class ChatBackend:
    def __init__(self):
        self.brain = PixelBrain()

    def query(self, user_input: str, context: dict) -> str:
        system_prompt = self._build_system_prompt(context)
        return self.brain.infer(system_prompt, user_input)

    def _build_system_prompt(self, context: dict) -> str:
        return f"""You are the Geometry OS Neural Bridge.
Current system state:
- Evolution Cycle: {context['cycle']}
- Active Agents: {context['agents']}
- Pending Mutations: {context['mutations']}
- Fractures: {context['fractures']}

Respond concisely. For queries about visual state, use ASCII art."""
```

### Hilbert Decoder

For `geos inspect` and ASCII map rendering:

```python
# geos/backends/hilbert.py
from native.hilbert import hilbert_decode, hilbert_encode

class HilbertInspector:
    def decode_sector(self, address: int) -> dict:
        """Decode a Hilbert sector to human-readable form."""
        coords = hilbert_decode(address, order=2)
        # Read from .rts.png at coords
        return self._parse_rts_container(coords)

    def render_ascii(self, view: str, zoom: int) -> str:
        """Render the map as ASCII art."""
        # Sample the visual shell state
        # Convert to ASCII using density characters
        pass
```

## Implementation Phases

### Phase 1: Core CLI (v0.1)
- [ ] `geos/__init__.py` and `geos/cli.py` entry point
- [ ] `geos status` command
- [ ] `geos chat` REPL with PixelBrain backend
- [ ] Basic context gathering (cycle count, agents, mutations)

### Phase 2: Visualization (v0.2)
- [ ] `geos map --ascii` renderer
- [ ] Hilbert decoder integration
- [ ] `geos inspect` command

### Phase 3: Autopilot Integration (v0.3)
- [ ] `geos autopilot start/stop/status`
- [ ] Intent steering (update priority queue via chat)
- [ ] Fracture alerts in REPL

### Phase 4: Advanced (v0.4+)
- [ ] Persistent context across sessions
- [ ] Multi-terminal support
- [ ] Agent delegation (`geos spawn`, `geos direct`)

## Dependencies

- `prompt_toolkit` - REPL with history, autocomplete
- `rich` - Terminal formatting (tables, colors)
- Existing: `PixelBrain`, `hilbert` native library

## Success Criteria

- [ ] `geos chat` responds to natural language queries
- [ ] `geos status` shows accurate system state
- [ ] `geos map --ascii` renders meaningful visualization
- [ ] All commands work with LM Studio connected
- [ ] Graceful degradation when LM Studio unavailable

## File Structure

```
geos/
├── __init__.py           # Version, exports
├── cli.py                # argparse setup, main()
├── chat/
│   ├── __init__.py
│   ├── repl.py           # REPL class with prompt_toolkit
│   └── context.py        # gather_system_context()
├── commands/
│   ├── __init__.py
│   ├── chat.py           # cmd_chat()
│   ├── map.py            # cmd_map()
│   ├── status.py         # cmd_status()
│   └── inspect.py        # cmd_inspect()
└── backends/
    ├── __init__.py
    ├── pixelbrain.py     # ChatBackend class
    └── hilbert.py        # HilbertInspector class
```

## Entry Point

```python
# geos/cli.py
import argparse
from geos.commands import chat, map, status, inspect

def main():
    parser = argparse.ArgumentParser(description="Geometry OS Neural Bridge")
    subparsers = parser.add_subparsers(dest="command")

    # geos chat
    subparsers.add_parser("chat", help="Conversational REPL")

    # geos status
    subparsers.add_parser("status", help="System health check")

    # geos map
    p_map = subparsers.add_parser("map", help="ASCII map visualization")
    p_map.add_argument("--ascii", action="store_true")
    p_map.add_argument("--view", choices=["thoughts", "districts", "mutations"])
    p_map.add_argument("--zoom", type=int, default=1)
    p_map.add_argument("--watch", action="store_true")

    # geos inspect
    p_inspect = subparsers.add_parser("inspect", help="Inspect Hilbert sector")
    p_inspect.add_argument("address", help="Hilbert address (e.g., 0x8000)")
    p_inspect.add_argument("--format", choices=["rts", "raw"], default="rts")

    args = parser.parse_args()

    if args.command == "chat":
        chat.run()
    elif args.command == "status":
        status.run()
    elif args.command == "map":
        map.run(args)
    elif args.command == "inspect":
        inspect.run(args)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
```

---

*Created: 2026-03-11*
*Status: Design Approved*
