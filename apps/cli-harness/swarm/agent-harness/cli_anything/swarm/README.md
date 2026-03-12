# g-swarm: Geometry OS Swarm CLI

CLI for managing the Geometry OS Swarm - AI agent guild management system for coordinating large numbers of AI agents.

## Installation

```bash
# From source
cd apps/cli-harness/swarm/agent-harness
pip install -e .

# Or publish to PyPI
python -m build && twine upload dist/*
```

## Usage

```bash
# Show swarm status
g-swarm status
g-swarm --json status  # JSON output for AI agents

# List active agents
g-swarm agents

# List agent guilds
g-swarm guilds

# Spawn a new agent
g-swarm spawn reasoning --guild cognitive --priority high

# Terminate an agent
g-swarm kill agent_001

# Migrate agent to guild
g-swarm migrate agent_001 sensory

# Broadcast message to swarm
g-swarm broadcast "Hello swarm!" --guild cognitive

# Show swarm metrics
g-swarm metrics
```

## Commands

- `g-swarm status` - Show swarm status
- `g-swarm agents` - List active agents
- `g-swarm guilds` - List agent guilds
- `g-swarm spawn <agent_type>` - Spawn a new agent
- `g-swarm kill <agent_id>` - Terminate an agent
- `g-swarm migrate <agent_id> <guild>` - Migrate agent to guild
- `g-swarm broadcast <message>` - Broadcast message to swarm
- `g-swarm metrics` - Show swarm metrics

All commands support `--json` flag for AI agent compatibility.

## Development

```bash
# Run tests
python -m pytest cli_anything/swarm/tests/
```