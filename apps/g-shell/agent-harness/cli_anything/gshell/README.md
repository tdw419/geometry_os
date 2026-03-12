# G-Shell: AI-Native Terminal with Spatial Computing

A terminal that bridges standard Linux bash with Geometry OS spatial computing.

## Installation

```bash
# From source
cd apps/g-shell/agent-harness
pip install -e .

# Verify installation
g-shell --version
g-shell --help
```

## Quick Start

```bash
# Start interactive shell session
g-shell shell

# Show current spatial map
g-shell map

# List all tiles
g-shell gls -a

# Spawn a command in a new tile
g-shell spawn vim --tile editor

# Send prompt to AI with terminal context
g-shell ai "analyze my current screen"

# Check system status
g-shell status
```

## JSON Output for AI Agents

All commands support `--json` flag for machine-readable output:

```bash
g-shell --json status
g-shell --json map
g-shell --json gls
```

Example output:
```json
{
  "status": "healthy",
  "geometry_os_root": "/path/to/geometry_os",
  "gnb_state": "exists",
  "terminal_fragment": "exists",
  "tile_count": 5
}
```

## REPL Mode

Interactive command loop:

```bash
g-shell
> map
> spawn vim
> ai "what am I looking at"
> exit
```

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `shell` | Start interactive terminal | `g-shell shell` |
| `map` | Show spatial map | `g-shell map` |
| `spawn` | Spawn command in tile | `g-shell spawn vim` |
| `ai` | Send prompt with context | `g-shell ai "analyze"` |
| `status` | System status | `g-shell status` |
| `gls` | List tiles | `g-shell gls -a` |

## Architecture

```
G-Shell CLI
├── Click CLI (this package)
├── native_geos_terminal.py (PTY wrapper)
├── context_injector.py (AI context injection)
├── geos_commands.py (g map, g spawn, etc.)
└── TerminalTile.js (PixiJS visualization)
```

## Development

```bash
# Run tests
cd apps/g-shell/agent-harness
python -m pytest cli_anything/gshell/tests/ -v

# Build package
pip install build
python -m build

# Publish to PyPI
twine upload dist/*
```

## License

MIT License - See Geometry OS main repository for details.
