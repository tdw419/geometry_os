# Geometry OS

> The screen IS the hard drive. State as visual geometry. Computation as pixels.

**A GPU-Native, Self-Hosting Operating System**

> "Where Logic is Light, and the Map is the Territory"

## Overview

Geometry OS is a visual operating system where PixelBrain (an AI entity) inhabits a visual substrate called the Infinite Map. Agents negotiate for territory, form districts, evolve strategies, and modify their own code.

### Core Concepts

- **GPU-Native**: All processes run as SPIR-V shaders on the GPU
- **Visual Language**: Programs are written using glyphs (⊕, ⊖, →, ←, etc.)
- **Self-Hosting**: The `geo_cc.spv` compiler can compile itself
- **Hilbert Memory**: Spatial memory layout using Hilbert curve addressing
- **Agent Inhabitation**: AI agents have 3D avatars that manipulate the system

**Current Version: v4.0 - Ouroboros Mesh**

### Key Features

| Feature | Phase | Description |
|---------|-------|-------------|
| **Ouroboros Spine** | 56 | Real-time fracture detection with emergency reflexes |
| **Dreaming Kernel** | 57 | Predictive simulation before committing mutations |
| **Evolution Engine** | 59 | Self-improvement through safe experimentation |
| **Autonomous Governance** | 61 | Self-regulating system policies |
| **Mesh Consciousness** | 62-64 | Global awareness, intent prediction, self-reflection |
| **Geometric Native Browser** | 50 | Zero-latency native interface to ASCII Scene Graph |
| **PixelBrain Converter** | - | Transform LLM weights into Hilbert-folded visual containers |

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                     GEOMETRY OS v4.0                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐             │
│   │   AGENTS    │───▶│  DISTRICTS  │───▶│   PLATES    │             │
│   └─────────────┘    └─────────────┘    └─────────────┘             │
│          │                                     │                     │
│          ▼                                     ▼                     │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐             │
│   │  TRAINING   │    │  EVOLUTION  │    │   FORGE     │             │
│   └─────────────┘    └─────────────┘    └─────────────┘             │
│                                                                       │
│   ┌─────────────────────────────────────────────────────────────────┐│
│   │              VISUAL SHELL (PixiJS / Native)                     ││
│   │  District Heatmap | Ghost Layer | Memory Drift | GNB            ││
│   └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│   ┌─────────────────────────────────────────────────────────────────┐│
│   │              COGNITIVE SYSTEMS                                  ││
│   │  Mesh Events | Intent Prediction | Self-Reflection | Evolution ││
│   └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│   ┌─────────────────────────────────────────────────────────────────┐│
│   │              GPU KERNEL (SPIR-V / WebGPU)                       ││
│   │  GlyphTerminal | AgentManager | InteractionManager              ││
│   └─────────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────────┘
```

## Memory Sectors (Hilbert Layout)

| Sector | Address Range | Purpose |
|--------|---------------|---------|
| KERNEL | 0 - 1,023 | Process Control Blocks, Scheduler |
| MAILBOX | 1,024 - 1,535 | IPC Message Queues |
| SHELL | 2,048 - 6,143 | Process RAM |
| FILES | 8,192 - 24,575 | Filesystem |
| MEMORY | 32,768 - 65,535 | Visual Substrate |
| AGENTS | 65,536 - 81,919 | Avatar Space |

## Morphological Glyphs

### Arithmetic
| Glyph | Code | Operation |
|-------|------|-----------|
| ⊕ | 160 | FADD (Float Add) |
| ⊖ | 161 | FSUB (Float Subtract) |
| ⊗ | 162 | FMUL (Float Multiply) |
| ⊘ | 163 | FDIV (Float Divide) |

### Memory
| Glyph | Code | Operation |
|-------|------|-----------|
| → | 164 | STORE |
| ← | 165 | LOAD |
| ⇒ | 166 | SHARED_STORE |
| ⇐ | 167 | SHARED_LOAD |

### Control Flow
| Glyph | Code | Operation |
|-------|------|-----------|
| ↻ | 168 | JMP (Jump) |
| ∅ | 169 | JZ (Jump if Zero) |
| ◉ | 170 | JNZ (Jump if Not Zero) |
| █ | 171 | LABEL |
| ▣ | 172 | RETURN |

### IPC
| Glyph | Code | Operation |
|-------|------|-----------|
| ✉ | 173 | MSG_SEND |
| 📥 | 174 | MSG_RECV |
| 👁 | 175 | MSG_PEEK |

## Quick Start

```bash
# Clone the repository
git clone https://github.com/tdw419/geometry_os.git
cd geometry_os

# Install dependencies
pip install -r requirements.txt

# Build all components
make build

# Run tests
make test

# Check system status
python3 geometry_os_cli.py status

# Run demo
python3 geometry_os_cli.py demo --agents 10 --rounds 50

# Start servers
python3 geometry_os_cli.py serve --district --tectonic

# Generate the font atlas
python3 core/atlas_gen.py

# Build the self-hosting compiler
python3 core/geo_cc.py

# Start the web server
python3 -m http.server 8080

# Open in browser
open http://localhost:8080/web/index.html
```

## Systems

| System | Description | Key Components |
|--------|-------------|----------------|
| `evolution_daemon/` | Self-improvement with gravity | TectonicEngine, BrainMutations, Safety |
| `visual_shell/` | PixiJS desktop + native | GNB, EvolutionEngine, MeshEvents |
| `pixel_compiler/` | Binary to RTS conversion | PixelRTS v2/v3, WASM bridge |
| `pixel_llm/` | LM Studio integration | Attention, Resilience, Cache |
| `pixel_brain/` | Live LLM inference | AsyncInference, PersonaInjector |
| `sisyphus/` | Autonomous daemon | CuriosityEngine, GlassBridge |
| `swarm/` | Distributed agents | AgencyAgents, LLMBackend |
| `tectonic/` | Spatial negotiation | Agent, Arena, District |
| `foundry/` | Self-modification | Forge, GeoASM, ShaderForge |
| `memory_drift/` | Gravitational KV-cache | DriftEngine, SemanticAnchor |
| `infinite_map/` | Spatial storage | Quadtree, GravityEngine |
| `network_boot/` | Distributed boot | ContainerMigration, MeshLearning |
| `kernel/` | Multi-kernel orchestration | Cluster, LoadBalancer |
| `intelligence/` | Goal inference | DirectiveAgent, TruthTexture |
| `vision/` | Vision model integration | FlorenceModel, PipelineExecutor |
| `feedback/` | System feedback loops | Analyzer, Collector, Metrics |
| `cognitive/` | Cognitive routing | CognitiveRouter |
| `memory/` | Vector memory | VectorMemoryDaemon |
| `neural_city/` | Neural topology | MutationProtocol, SynapticQuery |
| `neural_cortex/` | Evolution protocol | EvolutionProtocolServer |
| `hypervisor/` | 3D Hilbert mapping | HolographicFlatten |
| `native/` | C Hilbert library | libhilbert.so |
| `ai_gui/` | AI GUI control surface | TileAppManager |
| `testing/` | Test infrastructure | FailureAnalyzer, FixSuggester |
| `genome/` | Genetic code system | Genome CLI |
| `prts_toolchain/` | PRTS toolchain | Assembler, Disassembler |
| `infinite_map_rs/` | Rust compositor (WIP) | Smithay + WGPU |
| `mcp_geometry_os/` | MCP server | Model Context Protocol |
| `app_forge/` | App safety protocols | SafetyProtocols |

## Applications

| App | Description |
|-----|-------------|
| `agency-agents/` | Swarm intelligence for distributed cognition |
| `autoresearch/` | Automated research and documentation generation |
| `webmcp/` | Web-based Model Context Protocol interface |
| `openspec/` | OpenSpec specification management |

## Test Statistics

- **Total Tests**: 11,000+ collected
- **Test Files**: 150+ test files
- **Coverage Target**: 30%+

```bash
# Run all tests
make test

# Run with coverage
make test-coverage

# Quick unit tests only
make test-unit
```

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
| MCP Server | 3000 | Model Context Protocol |

## Configuration

Set environment variables:
```bash
export LM_STUDIO_URL=http://localhost:1234/v1
export DISTRICT_PORT=8773
export TECTONIC_PORT=8772
```

## Build System

```bash
make build        # Build all components (incremental)
make test         # Run all tests
make watch        # Auto-run tests on file changes
make lint         # Run all linters
make ci           # Full CI pipeline locally
make clean        # Clean build artifacts
```

## Project Structure

```
geometry-os/
├── core/                    # Python build tools
│   ├── atlas_gen.py         # Font atlas generator
│   ├── geo_cc.py            # Self-hosting compiler
│   ├── init.py              # Boot process generator
│   ├── libgeo.py            # Visual standard library
│   └── spirv_gen.py         # SPIR-V code generation
│
├── web/                     # Browser runtime
│   ├── GeometryOS.js        # Root controller
│   ├── GeometryKernel.js    # GPU kernel
│   ├── AgentManager.js      # AI agent avatars
│   ├── GlyphTerminal.js     # Interactive console
│   ├── InteractionManager.js # Haptic manipulation
│   ├── VisualShell.js       # Visual command interface
│   └── assets/              # Font atlas, resources
│
├── systems/                 # Core systems (34 total)
│   ├── evolution_daemon/    # Self-improvement
│   ├── visual_shell/        # Desktop rendering
│   ├── pixel_compiler/      # Binary to RTS
│   └── ...                  # See Systems table
│
├── tests/                   # Test suite
│   └── test_geometry_os.py
│
├── openspec/                # OpenSpec specifications
│   ├── specs/               # Formal specifications
│   └── changes/             # Active change proposals
│
└── docs/                    # Documentation
```

## Advanced Features

### Mesh Consciousness System

The Mesh Consciousness system (Phases 62-64) provides real-time awareness across all agents:

```python
from systems.cognitive import MeshEventBroadcaster, IntentPredictor

# Broadcast mesh events
broadcaster = MeshEventBroadcaster()
broadcaster.broadcast("agent_spawn", {"agent_id": "alpha", "position": (100, 200)})

# Predict agent intentions
predictor = IntentPredictor()
intent = predictor.predict(agent_state)
# Returns: {"intent": "territory_expansion", "confidence": 0.87}
```

### Ouroboros Safety System

Self-healing with real-time fracture detection:

```python
from systems.evolution_daemon import OuroborosSpine

spine = OuroborosSpine(
    pas_threshold=0.5,       # Trigger repair when PAS < 0.5
    rollback_enabled=True,   # Auto-rollback on failure
    emergency_reflexes=True  # Enable emergency shutdown
)

# Check system health
health = spine.check_health()
if health.fracture_detected:
    spine.emergency_repair()
```

### Dreaming Kernel (Predictive Simulation)

Test mutations before committing:

```python
from systems.evolution_daemon import DreamingKernel

kernel = DreamingKernel()
simulation = kernel.simulate_mutation(
    mutation_code,
    test_cases=["unit_tests", "integration_tests"]
)

if simulation.safety_score > 0.8:
    kernel.commit_mutation(mutation_code)
else:
    kernel.discard_mutation()
```

### Foveated Rendering

GPU optimization for visual focus:

```python
from systems.visual_shell import FoveatedRenderer

renderer = FoveatedRenderer(
    foveal_radius=100,      # Full resolution within 100px
    peripheral_scale=0.5,   # 50% resolution in periphery
    focus_tracking=True     # Track mouse/input focus
)

# Renders with 50%+ GPU compute reduction
renderer.render(frame_state)
```

### Barnes-Hut Quadtree Acceleration

O(N log N) force calculation for large particle systems:

```python
from systems.infinite_map import GravityEngine

engine = GravityEngine(
    use_quadtree=True,       # Enable acceleration
    quadtree_threshold=50,   # Switch at 50+ particles
    theta=0.5                # Barnes-Hut opening angle
)

# Add 1000 particles - automatically uses quadtree
for i in range(1000):
    engine.add_orb(f"file_{i}.py", x, y, z, size=100)

engine.update()  # O(N log N) instead of O(N²)
```

### RAG-Enhanced Shader Generation

Context-aware code generation with LanceDB:

```python
from systems.foundry import ShaderForge

forge = ShaderForge(
    vector_db="lancedb://shaders",
    top_k=3  # Inject top 3 similar examples
)

shader = forge.generate(
    prompt="Create a blur effect for the visual shell",
    context=current_shader_code
)
```

### Multi-Modal Perception

Auditory and kinetic input processing:

```python
from systems.multi_modal import AuditoryPerception, KineticPerception

# Audio-driven reflexes
audio = AuditoryPerception()
audio.on_startle(lambda: shell.trigger_alert())  # Loud noise > 0.8
audio.on_rhythm(lambda beat: shell.pulse_to_beat(beat))

# Input velocity awareness
kinetic = KineticPerception()
kinetic.on_high_frequency(lambda: shell.enter_focus_mode())  # > 5 events/sec
```

## Troubleshooting

### Common Issues

#### LM Studio Connection Failed

**Symptoms**: `ConnectionError: Cannot connect to LM Studio`

**Solutions**:
```bash
# 1. Verify LM Studio is running
curl http://localhost:1234/v1/models

# 2. Check environment variable
export LM_STUDIO_URL=http://localhost:1234/v1

# 3. Verify port is not blocked
netstat -tlnp | grep 1234
```

#### Test Collection Errors

**Symptoms**: `pytest: 66 errors during collection`

**Solutions**:
```bash
# 1. Check for syntax errors in specific test
pytest --collect-only tests/systems/problematic_test.py

# 2. Skip broken tests temporarily
pytest --ignore=tests/systems/broken_module/

# 3. Run with verbose error output
pytest -v --tb=long
```

#### Memory Issues During Tests

**Symptoms**: `MemoryError` or high memory usage

**Solutions**:
```bash
# 1. Use lazy imports in test fixtures (see conftest.py)
# 2. Run tests in isolated processes
pytest --forked

# 3. Limit test parallelism
pytest -n 2  # Instead of auto-detect

# 4. Profile memory usage
python3 -c "import tracemalloc; tracemalloc.start(); ..."
```

#### Rust Compositor Won't Start

**Symptoms**: `error: Smithay dependencies not found`

**Solutions**:
```bash
# Ubuntu/Debian
sudo apt-get install libseat-dev libudev-dev libinput-dev libdrm-dev

# Fedora/RHEL
sudo dnf install libseat-devel libudev-devel libinput-devel libdrm-devel

# Arch Linux
sudo pacman -S libseat libudev libinput libdrm
```

#### QEMU Boot Fails

**Symptoms**: `Kernel panic` or blank screen

**Solutions**:
```bash
# 1. Verify kernel exists
ls -la /boot/vmlinuz

# 2. Rebuild initramfs
bash systems/infinite_map_rs/scripts/create_initramfs.sh

# 3. Check init script path (must be /infinite_map_rs)
# 4. Verify QEMU has KVM support
qemu-system-x86_64 --enable-kvm ...
```

#### Visual Shell Rendering Issues

**Symptoms**: Blank screen or corrupted display

**Solutions**:
```bash
# 1. Check WebGPU support (Chrome/Edge)
chrome://gpu

# 2. Force WebGL2 fallback
export GOS_RENDERER=webgl2

# 3. Disable foveated rendering
export GOS_FOVEATED=false

# 4. Clear browser cache and reload
```

#### Evolution Daemon Crashes

**Symptoms**: Daemon exits unexpectedly

**Solutions**:
```bash
# 1. Run with verbose logging
python3 sisyphus_v4.py --brain --verbose --log-level DEBUG

# 2. Check socket path
ls -la /tmp/evolution_daemon.sock

# 3. Disable mutations for testing
python3 sisyphus_v4.py --no-mutations

# 4. Rollback to last known-good state
python3 tools/rollback_evolution.py --last-good
```

### Performance Troubleshooting

#### Slow Test Collection

```bash
# Profile collection time
pytest --collect-only --durations=0

# Skip heavy tests
pytest -m "not slow" --collect-only

# Use pytest-xdist for parallel collection
pytest -n auto --dist=loadscope
```

#### High CPU Usage

```bash
# Profile with py-spy
pip install py-spy
py-spy top --pid <pid>

# Reduce update frequency
export GOS_UPDATE_INTERVAL=100  # ms

# Disable unnecessary systems
python3 geometry_os_cli.py serve --no-vision --no-feedback
```

#### GPU Performance Issues

```bash
# Check GPU utilization
nvidia-smi -l 1

# Reduce rendering quality
export GOS_RESOLUTION_SCALE=0.5

# Disable animations
export GOS_ANIMATIONS=false
```

### Debug Mode

Enable comprehensive debugging:

```bash
# Full debug mode
export GOS_DEBUG=true
export GOS_LOG_LEVEL=DEBUG
export GOS_PROFILE=true

python3 geometry_os_cli.py demo --agents 5 --rounds 10

# View debug logs
tail -f /tmp/geometry_os_debug.log
```

### Getting Help

1. Check `docs/` directory for system-specific documentation
2. Review `CHANGELOG.md` for recent breaking changes
3. Search existing issues on GitHub
4. Run `python3 geometry_os_cli.py status` for system diagnostics

## Documentation

### Quick Reference

| Document | Description |
|----------|-------------|
| **[QUICKSTART.md](QUICKSTART.md)** | **Get started in 10 minutes** |
| **[DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)** | **Complete documentation index** |
| **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** | **Problem resolution guide** |
| **[ADVANCED_FEATURES.md](ADVANCED_FEATURES.md)** | **Advanced capabilities guide** |
| `AGENTS.md` | Agent guidance for working with code |
| `CONTRIBUTING.md` | Coding standards and conventions |
| `SKILLS.md` | AI skills index |
| `CHANGELOG.md` | Version history and changes |

### Core Documentation

| Document | Description |
|----------|-------------|
| **[docs/API_REFERENCE.md](docs/API_REFERENCE.md)** | **Complete API documentation** |
| **[docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)** | **Production deployment guide** |
| **[docs/MONITORING.md](docs/MONITORING.md)** | **Monitoring and observability** |
| **[docs/OPENSPEC_FEATURES.md](docs/OPENSPEC_FEATURES.md)** | **OpenSpec feature guide** |

### System Documentation

| Document | Description |
|----------|-------------|
| `memory/MEMORY.md` | System memory index |
| `docs/COGNITIVE_SYSTEMS.md` | Cognitive systems architecture |
| `docs/SISYPHUS_V4_DAEMON.md` | Sisyphus daemon documentation |
| `docs/PIXEL_BRAIN_ARCHITECTURE.md` | PixelBrain architecture |
| `docs/EVOLUTION_ZONE_GUIDE.md` | Evolution system guide |
| `docs/OUROBOROS_SAFETY_SYSTEM.md` | Safety mechanisms |

### Technical Documentation

| Document | Description |
|----------|-------------|
| `docs/GPU_OS_ARCHITECTURE.md` | GPU-native architecture |
| `docs/PROFILING.md` | Performance profiling guide |
| `docs/security/` | Security documentation |
| `docs/proofs/` | Mathematical proofs |

### Recent Updates

| Document | Description |
|----------|-------------|
| `LOCALIZATION_IMPLEMENTATION_SUMMARY.md` | i18n implementation (15 languages) |
| `RESOURCE_MANAGEMENT_REVIEW.md` | Resource management audit |
| `PERFORMANCE_OPTIMIZATION_REPORT.md` | Performance optimization analysis |
| `docs/LM_STUDIO_INTEGRATION.md` | LLM integration guide |
| `docs/OUROBOROS_SAFETY_SYSTEM.md` | Safety system documentation |
| `docs/ACCESSIBILITY_QUICK_REFERENCE.md` | Accessibility features |

## OpenSpec Specifications

| Spec | Location | Description |
|------|----------|-------------|
| cognitive-core | `openspec/specs/cognitive-core/` | Real-time generative reasoning with LLM |
| evolution-daemon | `openspec/specs/evolution-daemon/` | Self-repair and fracture detection |
| visual-shell | `openspec/specs/visual-shell/` | Topological rendering and tectonic bridge |
| foundry-core | `openspec/specs/foundry-core/` | Context-aware shader generation with RAG |
| rts-driver | `openspec/specs/rts-driver/` | Native FUSE driver for RTS files |
| rts-ecosystem | `openspec/specs/rts-ecosystem/` | Linux container and bit-perfect verification |
| multi-modal | `openspec/specs/multi-modal/` | Auditory and kinetic perception |

## Project Statistics

| Metric | Count |
|--------|-------|
| Python Files | 3,865 |
| Rust Files | 850 |
| Lines of Test Code | 112,845+ |
| Systems | 34 |
| Applications | 4 |

## The Self-Hosting Loop

1. `geo_cc.spv` reads glyph program from Visual RAM
2. Lexical analysis tokenizes glyphs
3. Parser builds AST
4. Code generator emits SPIR-V
5. Output written to executable memory
6. New binary can compile more programs (including itself)

## License

MIT

---

*"The era of symbolic computation is over. The era of geometric intelligence has begun."*
