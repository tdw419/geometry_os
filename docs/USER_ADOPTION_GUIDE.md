# User Adoption Guide

> Everything you need to start using Geometry OS effectively

## Welcome to Geometry OS

Geometry OS is a GPU-native, self-hosting operating system where computation happens as visual geometry. This guide will help you get started, understand the core concepts, and become productive quickly.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Core Concepts](#core-concepts)
3. [Your First Project](#your-first-project)
4. [Common Workflows](#common-workflows)
5. [Advanced Usage](#advanced-usage)
6. [Getting Help](#getting-help)

## Getting Started

### Prerequisites Checklist

Before you begin, ensure you have:

- [ ] Python 3.10+ installed (3.11+ recommended)
- [ ] Rust 1.70+ (optional, for Rust components)
- [ ] Git for cloning the repository
- [ ] 4GB+ RAM (8GB+ recommended for ML features)
- [ ] GPU (optional, for hardware acceleration)
- [ ] LM Studio (optional, for cognitive features)

### Installation Steps

1. **Clone and Setup**
   ```bash
   git clone https://github.com/tdw419/geometry_os.git
   cd geometry_os
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

2. **Configure Environment**
   ```bash
   cp .env.example .env
   # Edit .env with your settings
   ```

3. **Build and Test**
   ```bash
   make build
   make test
   ```

4. **Run Your First Demo**
   ```bash
   python3 geometry_os_cli.py demo --agents 10 --rounds 50
   ```

**Expected Time**: 10-15 minutes

### Quick Verification

Verify your installation:

```bash
# Check Python version
python3 --version  # Should be 3.10+

# Check dependencies
pip list | grep pytest  # Should show pytest and plugins

# Run quick test
pytest tests/test_basic.py -v  # Should pass

# Check configuration
cat config.yaml  # Should show default config
```

## Core Concepts

### 1. The Screen IS the Hard Drive

In Geometry OS, visual pixels represent computational state. What you see on screen is the actual memory and computation happening in real-time.

**Example**: A neural network's weights are displayed as a colorful image. Each pixel's color encodes weight values.

### 2. Glyphs as Operations

Programs are written using visual glyphs instead of text:

| Glyph | Meaning | Example |
|-------|---------|---------|
| ⊕ | Add | `a ⊕ b` = a + b |
| ⊖ | Subtract | `a ⊖ b` = a - b |
| ⊗ | Multiply | `a ⊗ b` = a * b |
| → | Store | `value → address` |
| ← | Load | `address ← value` |

### 3. Hilbert Memory Layout

Memory is organized using Hilbert curves - fractal patterns that preserve spatial locality:

```
Traditional:  0  1  2  3  4  5  6  7  (linear)
Hilbert:      0  1  3  2  6  7  5  4  (fractal)
```

**Benefit**: Related data stays visually close, making patterns easier to see.

### 4. Self-Improving System

Geometry OS can modify its own code through:

- **Evolution Daemon**: Automatically improves code over time
- **Dreaming Kernel**: Simulates changes before applying them
- **Ouroboros Safety**: Detects and repairs problems automatically

### 5. Agent Inhabitation

AI agents live within the visual substrate:

- They have visible avatars
- They negotiate for territory
- They form districts and collaborate
- They evolve strategies

## Your First Project

### Project: Create a Simple Evolution

Let's create a simple evolution that optimizes a calculation.

#### Step 1: Create Evolution Configuration

```yaml
# my_evolution.yaml
name: "optimize_calculation"
goal: "minimize computation time"
generations: 100
population_size: 10
mutation_rate: 0.1
```

#### Step 2: Create Target Function

```python
# my_function.py
def calculate(x: float, y: float) -> float:
    """Function to optimize."""
    return x ** 2 + y ** 2
```

#### Step 3: Run Evolution

```python
from systems.evolution_daemon import EvolutionDaemon

daemon = EvolutionDaemon(config="my_evolution.yaml")
daemon.set_target("my_function.calculate")

# Run evolution
result = daemon.evolve()

print(f"Best solution: {result.best_solution}")
print(f"Fitness: {result.best_fitness}")
```

#### Step 4: Visualize Results

```python
from systems.visual_shell import VisualShell

shell = VisualShell()
shell.visualize_evolution(result.history)
shell.show()
```

**Expected Outcome**: You'll see the evolution progress visually, with agents exploring the solution space.

### Project: Convert Binary to Visual Format

Convert any binary file to a visual RTS (Real-Time System) format.

```python
from pixel_compiler.converter import PixelCompiler

compiler = PixelCompiler()

# Convert a binary to visual format
compiler.binary_to_rts(
    input_path="my_program",
    output_path="my_program.rts.png"
)

# The output is a PNG image that contains the binary data
# You can view it, store it, or execute it
```

### Project: Load and Run a Brain

Load a neural network stored in visual format and run inference.

```python
from pixel_brain import PixelBrain

# Load brain from visual format
brain = PixelBrain("models/gpt_neo_125m_brain.rts.png")

# Run inference
output = brain.infer("Hello, world!")
print(output)

# The brain's state is visible as an image
brain.visualize()
```

## Common Workflows

### Workflow 1: Development Cycle

```bash
# 1. Make code changes
vim systems/my_system.py

# 2. Run tests
make test-unit

# 3. Check coverage
make test-coverage
open htmlcov/index.html

# 4. Run linters
make lint

# 5. Test integration
make test-integration

# 6. Commit changes
git add .
git commit -m "feat: add new feature"
```

### Workflow 2: Debugging Issues

```bash
# 1. Enable debug mode
export GEOMETRY_OS_DEBUG=1

# 2. Run with verbose logging
python3 my_script.py --verbose

# 3. Check logs
tail -f logs/geometry_os.log

# 4. Use troubleshooting guide
cat TROUBLESHOOTING.md

# 5. Run diagnostics
python3 -c "from systems.config_hub import get_config_hub; print(get_config_hub().get_all())"
```

### Workflow 3: Performance Optimization

```bash
# 1. Profile your code
python3 -m cProfile -o profile.stats my_script.py

# 2. Analyze profile
python3 -c "
import pstats
p = pstats.Stats('profile.stats')
p.sort_stats('cumulative')
p.print_stats(20)
"

# 3. Use memory profiler
from systems.hypervisor.memory_profiler import MemoryProfiler
profiler = MemoryProfiler()
profiler.start()
# ... your code ...
profiler.stop()
print(profiler.get_stats())

# 4. Optimize based on findings
# 5. Verify improvement
make test-benchmark
```

### Workflow 4: Configuration Management

```bash
# 1. Check current configuration
cat config.yaml

# 2. Override locally
cat > config.local.yaml << EOF
debug_mode: true
log_level: DEBUG
evolution:
  check_interval_seconds: 30
EOF

# 3. Verify configuration
python3 -c "
from systems.config_hub import get_config_hub
hub = get_config_hub()
errors = hub.validate('evolution')
if errors:
    for e in errors:
        print(f'Error: {e}')
else:
    print('Configuration valid')
"

# 4. Deploy to instances (if distributed)
python3 -c "
from systems.config_hub import get_config_hub
hub = get_config_hub()
results = hub.deploy_to_instances(['node-01', 'node-02'])
for node, result in results.items():
    print(f'{node}: {\"OK\" if result.success else result.error}')
"
```

### Workflow 5: Testing Your Code

```bash
# 1. Write test
cat > tests/test_my_feature.py << EOF
import pytest
from systems.my_system import MyFeature

@pytest.mark.unit
def test_my_feature_basic():
    feature = MyFeature()
    result = feature.run()
    assert result is not None

@pytest.mark.integration
async def test_my_feature_async():
    feature = MyFeature()
    result = await feature.run_async()
    assert result.success
EOF

# 2. Run test
pytest tests/test_my_feature.py -v

# 3. Run with coverage
pytest tests/test_my_feature.py --cov=systems.my_system --cov-report=html

# 4. Run in parallel
pytest tests/ -n auto
```

## Advanced Usage

### Custom Evolution Strategies

```python
from systems.evolution_daemon import EvolutionDaemon, EvolutionStrategy

class MyStrategy(EvolutionStrategy):
    def mutate(self, genome):
        # Custom mutation logic
        return mutated_genome
    
    def crossover(self, parent1, parent2):
        # Custom crossover logic
        return child
    
    def select(self, population):
        # Custom selection logic
        return selected

daemon = EvolutionDaemon(strategy=MyStrategy())
daemon.evolve()
```

### Multi-Agent Coordination

```python
from systems.swarm import SwarmCoordinator, Agent

# Create agents
agents = [Agent(f"agent-{i}") for i in range(10)]

# Create coordinator
coordinator = SwarmCoordinator(agents)

# Define task
task = {
    "type": "computation",
    "data": large_dataset,
    "strategy": "divide-and-conquer"
}

# Execute with coordination
result = coordinator.execute(task)
```

### Visual Customization

```python
from systems.visual_shell import VisualShell, Theme

# Custom theme
theme = Theme(
    background="#000000",
    primary="#00ff00",
    secondary="#ff00ff",
    accent="#ffff00"
)

shell = VisualShell(theme=theme)

# Custom rendering
shell.set_rendering_config(
    foveated=True,
    foveal_radius=200,
    antialiasing=True,
    vsync=True
)
```

### Integration with External Systems

```python
from systems.network_boot import NetworkBridge

# Connect to external system
bridge = NetworkBridge(
    host="external-server.com",
    port=8080,
    protocol="https"
)

# Sync state
bridge.sync_state(local_state)

# Subscribe to updates
bridge.subscribe("updates", lambda data: handle_update(data))
```

## Getting Help

### Documentation Resources

| Resource | When to Use |
|----------|-------------|
| [QUICKSTART.md](../QUICKSTART.md) | First time setup |
| [TROUBLESHOOTING.md](../TROUBLESHOOTING.md) | Encountering errors |
| [ADVANCED_FEATURES.md](../ADVANCED_FEATURES.md) | Deep dive into features |
| [docs/TESTING_GUIDE.md](TESTING_GUIDE.md) | Writing and running tests |
| [docs/CONFIGURATION_HUB.md](CONFIGURATION_HUB.md) | Configuration questions |
| [docs/OPENSPEC_FEATURES.md](OPENSPEC_FEATURES.md) | Feature specifications |

### Diagnostic Commands

```bash
# System health check
python3 -c "
from systems.evolution_daemon import EvolutionDaemon
from systems.config_hub import get_config_hub

print('Evolution Daemon:', EvolutionDaemon().get_status())
print('Configuration:', get_config_hub().get_all())
"

# Check dependencies
pip check

# Verify GPU access
python3 -c "
import torch
print('CUDA available:', torch.cuda.is_available())
print('MPS available:', torch.backends.mps.is_available())
"

# Check services
curl http://localhost:1234/v1/models  # LM Studio
curl http://localhost:8773/health      # District Server
```

### Common Issues and Solutions

| Issue | Solution |
|-------|----------|
| Import errors | `pip install -r requirements.txt` |
| Tests failing | Check Python version (3.10+) |
| Slow performance | Enable GPU, use Rust components |
| Memory issues | Reduce batch size, enable memory profiling |
| Configuration errors | Validate with `hub.validate()` |

### Community Resources

- **GitHub Issues**: https://github.com/tdw419/geometry_os/issues
- **Documentation**: [DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)
- **Examples**: `examples/` directory
- **Tests**: `tests/` directory (shows usage patterns)

### Getting Support

1. **Check Documentation**: Search [DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)
2. **Search Issues**: Look for similar problems in GitHub issues
3. **Run Diagnostics**: Use diagnostic commands above
4. **Create Issue**: If unresolved, create a detailed issue with:
   - System information (OS, Python version, etc.)
   - Steps to reproduce
   - Expected vs actual behavior
   - Relevant logs

## Next Steps

Now that you understand the basics:

1. **Explore Examples**: Check the `examples/` directory
2. **Read Advanced Features**: [ADVANCED_FEATURES.md](../ADVANCED_FEATURES.md)
3. **Join Development**: [CONTRIBUTING.md](../CONTRIBUTING.md)
4. **Stay Updated**: [CHANGELOG.md](../CHANGELOG.md)

## Quick Reference Card

### Essential Commands

```bash
make build           # Build all components
make test            # Run all tests
make test-coverage   # Run with coverage
make lint            # Run linters
make watch           # Auto-run tests on changes
```

### Essential Python Imports

```python
from systems.evolution_daemon import EvolutionDaemon
from systems.visual_shell import VisualShell
from systems.config_hub import get_config_hub
from pixel_brain import PixelBrain
from pixel_compiler.converter import PixelCompiler
```

### Essential Environment Variables

```bash
GEOMETRY_OS_DEBUG=1                    # Enable debug mode
LM_STUDIO_URL=http://localhost:1234/v1 # LM Studio server
DISTRICT_PORT=8773                     # District server port
```

### Essential File Locations

| File | Purpose |
|------|---------|
| `config.yaml` | Main configuration |
| `config.local.yaml` | Local overrides |
| `.env` | Environment variables |
| `logs/` | Log files |
| `tests/` | Test suite |

---

*Last Updated: 2026-03-11*
*Version: 1.0.0*
