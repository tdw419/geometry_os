# Geometry OS Quickstart Guide

> Get up and running with Geometry OS in 10 minutes

## Prerequisites

Before you begin, ensure you have:

- **Python 3.10+** (3.11+ recommended)
- **Rust 1.70+** (for Rust components)
- **Git** for cloning the repository
- **4GB+ RAM** (8GB+ recommended for ML features)
- **GPU** (optional, for hardware acceleration)

### System Dependencies (Linux)

```bash
# Ubuntu/Debian
sudo apt-get install libseat-dev libudev-dev libinput-dev libdrm-dev

# Fedora/RHEL
sudo dnf install libseat-devel libudev-devel libinput-devel libdrm-devel

# Arch Linux
sudo pacman -S libseat libudev libinput libdrm
```

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/tdw419/geometry_os.git
cd geometry_os
```

### 2. Set Up Python Environment

```bash
# Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt  # For development
```

### 3. Configure Environment

```bash
# Copy example environment file
cp .env.example .env

# Edit with your settings
nano .env
```

Required environment variables:

```bash
# LM Studio URL (for cognitive features)
LM_STUDIO_URL=http://localhost:1234/v1

# Service ports
DISTRICT_PORT=8773
TECTONIC_PORT=8772

# Debug mode (optional)
GEOMETRY_OS_DEBUG=1
```

### 4. Build the Project

```bash
# Build all components
make build

# Or build specific components
make build-python
make build-rust  # Requires Rust toolchain
```

## Running Your First Demo

### Option 1: CLI Demo

The fastest way to see Geometry OS in action:

```bash
# Run with 10 agents for 50 rounds
python3 geometry_os_cli.py demo --agents 10 --rounds 50

# Run with verbose output
python3 geometry_os_cli.py demo --agents 5 --rounds 20 --verbose
```

### Option 2: Evolution Daemon

Start the self-improving evolution system:

```bash
# Basic daemon
python3 evolution_daemon_v8.py

# With brain mutations and verbose logging
python3 sisyphus_v4.py --brain --verbose
```

### Option 3: Visual Shell

Launch the visual desktop environment:

```bash
# Start the visual shell server
python3 map_terminal.py

# Or use the headless GUI for testing
python3 headless_gui.py
```

## Running Tests

Verify your installation:

```bash
# Run all tests
make test

# Run with coverage report
make test-coverage

# Run specific test file
pytest tests/test_evolution_daemon.py -v

# Run tests for a specific system
pytest tests/systems/evolution_daemon/ -v
```

## Common First-Time Tasks

### 1. Convert a Binary to RTS Format

```python
from pixel_compiler.converter import PixelCompiler

# Initialize compiler
compiler = PixelCompiler()

# Convert binary to RTS PNG
compiler.binary_to_rts(
    input_path="my_program",
    output_path="my_program.rts.png"
)
```

### 2. Load and Run a PixelBrain Model

```python
from pixel_brain import PixelBrain

# Load model
brain = PixelBrain("gpt_neo_125m_brain.rts.png")

# Run inference
output = brain.infer("Hello, world!")
print(output)
```

### 3. Create a Swarm Agent

```python
from systems.swarm import SwarmNode, AgentConfig

# Configure agent
config = AgentConfig(
    name="my-agent",
    role="worker",
    capabilities=["compute", "storage"]
)

# Create and start agent
node = SwarmNode(config)
node.start()
```

## Next Steps

Now that you have Geometry OS running:

1. **Read the Architecture**: [docs/GPU_OS_ARCHITECTURE.md](docs/GPU_OS_ARCHITECTURE.md)
2. **Explore Advanced Features**: [ADVANCED_FEATURES.md](ADVANCED_FEATURES.md)
3. **Troubleshoot Issues**: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
4. **Contribute**: [CONTRIBUTING.md](CONTRIBUTING.md)

## Quick Reference

### Common Commands

| Command | Description |
|---------|-------------|
| `make build` | Build all components |
| `make test` | Run all tests |
| `make test-coverage` | Run tests with coverage |
| `make lint` | Run code linters |
| `make watch` | Auto-run tests on file changes |
| `make clean` | Clean build artifacts |

### Service Ports

| Service | Port | Description |
|---------|------|-------------|
| District Server | 8773 | Spatial district management |
| Tectonic Server | 8772 | Tectonic bridge service |
| Visual Shell | 8080 | Web-based visual interface |
| MCP Server | 3000 | Model Context Protocol |

### Key Directories

| Directory | Purpose |
|-----------|---------|
| `systems/` | Core systems (34 total) |
| `apps/` | Applications (4 total) |
| `core/` | Python build tools |
| `web/` | Browser runtime |
| `tests/` | Test suite |
| `docs/` | Documentation |

## Getting Help

- **Documentation**: [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)
- **Issues**: https://github.com/tdw419/geometry_os/issues
- **Troubleshooting**: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

---

*Last Updated: 2026-03-11*
*Version: 4.0.1*
