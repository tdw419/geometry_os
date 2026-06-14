# g-sisyphus: Geometry OS Sisyphus Daemon CLI

CLI for controlling the Geometry OS Sisyphus Daemon - responsible for continuous self-improvement, optimization, and performance tuning.

## Installation

```bash
# From source
cd apps/cli-harness/sisyphus/agent-harness
pip install -e .

# Or publish to PyPI
python -m build && twine upload dist/*
```

## Usage

```bash
# Show sisyphus daemon status
g-sisyphus status
g-sisyphus --json status  # JSON output for AI agents

# List improvement cycles
g-sisyphus cycles

# Trigger an improvement cycle
g-sisyphus trigger

# Run optimization pass
g-sisyphus optimize

# Show performance metrics
g-sisyphus metrics

# List current improvement goals
g-sisyphus goals

# Set a new improvement goal
g-sisyphus set-goal --description "Reduce latency" --target "25%" --priority high
```

## Commands

- `g-sisyphus status` - Show sisyphus daemon status
- `g-sisyphus cycles` - List improvement cycles
- `g-sisyphus trigger` - Trigger an improvement cycle
- `g-sisyphus optimize` - Run optimization pass
- `g-sisyphus metrics` - Show performance metrics
- `g-sisyphus goals` - List current improvement goals
- `g-sisyphus set-goal` - Set a new improvement goal

All commands support `--json` flag for AI agent compatibility.

## Development

```bash
# Run tests
python -m pytest cli_anything/sisyphus/tests/
```