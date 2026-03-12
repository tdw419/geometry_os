# g-evolve: Geometry OS Evolution Daemon CLI

CLI for controlling the Geometry OS Evolution Daemon - responsible for self-repair, fracture detection, and AI brain mutations.

## Installation

```bash
# From source
cd apps/cli-harness/evolution_daemon/agent-harness
pip install -e .

# Or publish to PyPI
python -m build && twine upload dist/*
```

## Usage

```bash
# Show evolution daemon status
g-evolve status
g-evolve --json status  # JSON output for AI agents

# Trigger an evolution cycle
g-evolve trigger

# List recent mutations
g-evolve mutations

# Show evolution configuration
g-evolve config

# Show evolution logs
g-evolve log
```

## Commands

- `g-evolve status` - Show evolution daemon status
- `g-evolve trigger` - Trigger an evolution cycle
- `g-evolve mutations` - List recent mutations
- `g-evolve config` - Show evolution configuration
- `g-evolve log` - Show evolution logs

All commands support `--json` flag for AI agent compatibility.

## Development

```bash
# Run tests
python -m pytest cli_anything/evolution_daemon/tests/
```