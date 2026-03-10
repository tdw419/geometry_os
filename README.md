# Geometry OS

> The screen IS the hard drive. State as visual geometry. Computation as pixels.

## Overview

Geometry OS is an autonomous operating system where PixelBrain (an AI entity) inhabits a visual substrate called the Infinite Map. Agents negotiate for territory, form districts, evolve strategies, and modify their own code.

## Quick Start

```bash
# Check system status
python3 geometry_os_cli.py status

# Run demo
python3 geometry_os_cli.py demo --agents 10 --rounds 50

# Start servers
python3 geometry_os_cli.py serve --district --tectonic
```

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                     GEOMETRY OS                                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐              │
│   │   AGENTS    │───▶│  DISTRICTS  │───▶│   PLATES    │              │
│   └─────────────┘    └─────────────┘    └─────────────┘              │
│          │                                     │                               │
│          ▼                                     ▼                               │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐              │
│   │  TRAINING  │    │  EVOLUTION  │    │   FORGE    │              │
│   └─────────────┘    └─────────────┘    └─────────────┘              │
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │              VISUAL SHELL (PixiJS)                            │  │
│   │  District Heatmap | Ghost Layer | Memory Drift    │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────┘
```

## Systems

| System | Description | Tests |
|--------|-------------|-------|
| `tectonic/` | Multi-agent spatial negotiation | 135 |
| `arena/` | Training simulation arena | 40 |
| `strategy/` | Strategy profiles for agents | 23 |
| `learner/` | Strategy learning from results | 32 |
| `plate/` | Tectonic plate data structures | 27 |
| `district/` | District formation clustering | 40 |
| `visual/` | Heatmap and ghost layer | 22 |
| `foundry/` | Self-modification system | 99 |
| `memory_drift/` | Gravitational KV-cache | 72 |
| `pixel_brain/` | Live LLM inference | 34 |
| `evolution_daemon/` | Autonomous evolution | 36 |
| **Total** | | **719** |

## Commands

| Command | Description |
|---------|-------------|
| `status` | Show system status |
| `agents --create N` | Create N agents |
| `districts --form N` | Form N districts |
| `train --rounds N` | Run training rounds |
| `evolve --rounds N` | Run evolution cycle |
| `demo` | Run full demo |
| `serve` | Start servers |

## Ports

| Service | Port | Description |
|---------|------|-------------|
| District Server | 8773 | WebSocket for districts |
| Tectonic Server | 8772 | WebSocket for negotiations |
| Visual Shell | 8080 | PixiJS Infinite Map |

## Configuration

Set environment variables:
```bash
export LM_STUDIO_URL=http://localhost:1234/v1
export DISTRICT_PORT=8773
export TECTONIC_PORT=8772
```

## License

MIT
