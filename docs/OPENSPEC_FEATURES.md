# Geometry OS OpenSpec Features Guide

> Comprehensive guide to OpenSpec-specified features

## Table of Contents

- [Overview](#overview)
- [Cognitive Core](#cognitive-core)
- [Evolution Daemon](#evolution-daemon)
- [Visual Shell](#visual-shell)
- [Foundry Core](#foundry-core)
- [Multi-Modal Perception](#multi-modal-perception)
- [RTS Driver](#rts-driver)
- [RTS Ecosystem](#rts-ecosystem)

---

## Overview

Geometry OS implements several major features specified in OpenSpec format. Each specification defines requirements, scenarios, and visual manifestations for the feature.

### Specification Locations

| Spec | Location | Status |
|------|----------|--------|
| cognitive-core | `openspec/specs/cognitive-core/spec.md` | ✅ Implemented |
| evolution-daemon | `openspec/specs/evolution-daemon/spec.md` | ✅ Implemented |
| visual-shell | `openspec/specs/visual-shell/spec.md` | ✅ Implemented |
| foundry-core | `openspec/specs/foundry-core/spec.md` | ✅ Implemented |
| multi-modal | `openspec/specs/multi-modal/spec.md` | ✅ Implemented |
| rts-driver | `openspec/specs/rts-driver/spec.md` | ✅ Implemented |
| rts-ecosystem | `openspec/specs/rts-ecosystem/spec.md` | ✅ Implemented |

---

## Cognitive Core

### Overview

The Cognitive Core provides real-time generative reasoning powered by local Large Language Models (LM Studio).

### Features

#### Real-Time Generative Reasoning

The `UnifiedCognitiveDaemon` uses LM Studio to reason about user input and classify intents.

```python
from systems.cognitive import UnifiedCognitiveDaemon

# Initialize cognitive daemon
cognitive = UnifiedCognitiveDaemon(
    lm_studio_url="http://localhost:1234/v1"
)

# Analyze user intent
result = cognitive.analyze_intent("Fix the bug in parser.py")
print(f"Intent: {result.category}")  # Output: Debug/Repair
print(f"Confidence: {result.confidence}")  # Output: 0.85
```

### Scenarios

#### Intent Analysis

| When | Then | And |
|------|------|-----|
| User provides a goal | System consults LLM to classify intent | Assigns confidence score based on logits |

**Visual Manifestation**: The "Confidence" uniform in shaders reflects the LLM's certainty.

#### Fallback Behavior

| When | Then | And |
|------|------|-----|
| LM Studio is unreachable | System reverts to heuristic/mock logic | Logs warning to console |

### Configuration

```yaml
# .geometry/config.yaml
cognitive:
  lm_studio_url: http://localhost:1234/v1
  timeout: 30
  fallback_enabled: true
  cache_enabled: true
```

### API Reference

```python
class UnifiedCognitiveDaemon:
    def __init__(self, lm_studio_url: str):
        """Initialize with LM Studio URL."""
        
    def analyze_intent(self, input: str) -> IntentAnalysis:
        """Analyze user input and return intent classification."""
        
    def get_confidence(self) -> float:
        """Get current confidence score (0.0-1.0)."""
```

---

## Evolution Daemon

### Overview

The Evolution Daemon provides autonomous self-improvement through brain mutations, fracture detection, and automated repair.

### Features

#### RTS Driver Detection

Automatically detects and uses the high-performance Rust driver when available.

```python
# The daemon checks for the Rust driver on startup
# If found: "✅ High-Performance RTS Driver Detected"
# Self-healing is much faster with native driver
```

#### Visual Fracture Detection

Monitors Phase Alignment Stability (PAS) score to detect system fractures.

```python
from systems.evolution_daemon import EvolutionDaemon

daemon = EvolutionDaemon(
    pas_threshold=0.5  # Trigger repair when PAS < 0.5
)

# The daemon continuously monitors PAS score
# When PAS drops below threshold, repair is triggered
```

#### Autonomous Self-Repair

When fractures are detected, the daemon automatically attempts repair.

```python
# Repair workflow:
# 1. Detect PAS score drop
# 2. Identify probable cause (recent file modification)
# 3. Revert to last known-good state via git
# 4. Verify repair success
# 5. Resume normal operation
```

### Scenarios

#### PAS Score Drop

| When | Then |
|------|------|
| PAS score drops below 0.5 | Ouroboros Repair Cycle is triggered |

#### Automated Rollback

| When | And | Then |
|------|-----|------|
| Repair cycle triggered | Recent file identified as probable cause | File reverted to last known-good state |

### Configuration

```yaml
# .geometry/config.yaml
evolution:
  pas_threshold: 0.5
  gravity_strength: 0.1
  repair_enabled: true
  rts_driver_path: systems/rts_fuse/rts_rs/target/release/rts_rs
```

---

## Visual Shell

### Overview

The Visual Shell provides topological rendering of thought geometry with advanced accessibility features, including the Native Glyph Shell (G-Shell) for state-native terminal operations.

### Native Glyph Shell (G-Shell)

The G-Shell is a state-native terminal that bridges standard Linux shell workflows with Geometry OS's spatial/AI-native architecture.

**Key Features:**
- **AI Context Injection** - Terminal state automatically visible to AI assistants
- **Geometry OS Commands** - `g` prefix commands for spatial operations
- **GNB Synchronization** - Terminal screen exported to Geometric Neural Buffer
- **GPU-Accelerated Rendering** - WGSL compute shaders for glyph rendering

**Performance Optimizations:**
- Numba JIT compilation (27.8x average speedup)
- Packed integer color representation
- Pre-computed Hilbert curve lookup tables
- Parallel batch processing

**Shell Variants:**
| Variant | File | Purpose |
|---------|------|---------|
| Standard | `geos_terminal.py` | Basic PTY wrapper |
| Native | `native_geos_terminal.py` | State-native with GNB |
| Enhanced | `enhanced_glyph_shell.py` | UI with command palette |

**Documentation:** [docs/NATIVE_GLYPH_SHELL.md](NATIVE_GLYPH_SHELL.md)

### Features

#### 14n Series Topological Rendering

Renders thought geometry using transition metal carbonyl cluster logic.

| State | Formula | Visual |
|-------|---------|--------|
| Stable Logic | $14n + 2$ | Octahedral Clusters (closed, symmetrical) |
| Exploratory | $14n + 4$ | Branching Linkages (open, skeletal) |

```python
from systems.visual_shell import VisualShell

shell = VisualShell()

# When confidence is high, renders stable octahedral clusters
shell.set_confidence(0.9)  # High confidence -> stable geometry

# When confidence is low, renders branching linkages
shell.set_confidence(0.3)  # Low confidence -> exploratory geometry
```

#### Void Stare Reflex

Visual manifestation of error states through topological unraveling.

| When | Then | Visual |
|------|------|--------|
| Safety score < 0.5 | Knot invariants break | Geometry fractures into S=16 isolated fragments |

#### Tectonic Bridge

Non-blocking file watcher for synchronizing state with Visual Substrate.

```python
# Features:
# - Detects file changes within 100ms
# - Reloads textures asynchronously
# - No dropped render frames
# - Uses wgpu::Queue::write_texture for uploads
```

#### Hilbert Memory Visualization

Maps memory regions using fractal space-filling curves.

```python
from systems.visual_shell.hilbert import HilbertMapper

mapper = HilbertMapper(order=8)

# Map 1D memory addresses to 2D visualization
x, y = mapper.map(address=0x1000)

# Contiguous memory blocks appear as clustered geometric regions
# Not linear lines
```

#### Foveated Rendering

Optimizes GPU resource allocation based on visual focus.

```python
shell = VisualShell(
    foveated=True,
    foveal_radius=200  # pixels
)

# Set focus point
shell.set_focus(x=960, y=540)

# Full resolution within foveal radius
# Reduced resolution (1:4 or 1:16) in peripheral regions
# Smooth transition to prevent artifacts
# 50%+ GPU compute time reduction
```

### Performance Requirements

| Scenario | Requirement |
|----------|-------------|
| 100 Tile Stress | Mean frame time ≤ 16.6ms, 99th percentile jitter ≤ 5ms |
| 37M Particles | 60 FPS with RenderGroup isolation |
| Foveated Rendering | 50%+ GPU compute time reduction |

### Accessibility Features

#### Keyboard Navigation

| Context | Keys |
|---------|------|
| Grid | Arrow keys, Home/End, Enter/Space |
| Tabs | Left/Right arrows, Enter/Space |
| Lists | Up/Down arrows, Home/End |
| Forms | Tab, Enter |

#### Screen Reader Support

- ARIA landmarks with unique names
- Live region announcements
- Accessible names for interactive elements
- Visible focus indicators (3:1 contrast)

#### Accessibility Preferences

| Preference | Behavior |
|------------|----------|
| High Contrast | 4.5:1 minimum contrast |
| Reduced Motion | Non-essential animations disabled |
| System Preferences | Auto-detect and apply |

### Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `?` | Show shortcuts dialog |
| `h` | Toggle high contrast |
| `m` | Toggle reduced motion |
| `Escape` | Close dialogs |

---

## Foundry Core

### Overview

The Foundry Core provides context-aware shader generation using RAG (Retrieval-Augmented Generation).

### Features

#### Context-Aware Shader Generation

Uses LanceDB vector database to retrieve relevant code context.

```python
from systems.foundry import FoundryDaemon

foundry = FoundryDaemon(
    vector_db="lancedb://./data/code_vectors"
)

# Create intent file
foundry.create_intent(
    name="blur_effect",
    description="Apply gaussian blur to texture"
)

# The daemon:
# 1. Queries vector database for similar code
# 2. Retrieves top 3 results
# 3. Injects context into LLM prompt
# 4. Generates shader using existing patterns
```

### Scenarios

#### RAG Context Injection

| When | Then | And |
|------|------|-----|
| User creates `.intent` file | Daemon queries vector database | Top 3 results injected into LLM prompt |

**Visual Manifestation**: Generated shaders use helper functions from retrieved context.

#### Graceful Degradation

| When | Then | And |
|------|------|-----|
| Vector database unavailable | Daemon proceeds with context-free generation | Logs warning "RAG disabled" |

### Configuration

```yaml
# .geometry/config.yaml
foundry:
  vector_db:
    type: lancedb
    path: ./data/code_vectors
    embedding_model: sentence-transformers/all-MiniLM-L6-v2
  llm:
    provider: lm_studio
    url: http://localhost:1234/v1
  fallback_enabled: true
```

---

## Multi-Modal Perception

### Overview

Multi-Modal Perception provides auditory and kinetic input awareness.

### Features

#### Auditory Perception

Audio-driven visual reflexes for immersive experiences.

| Trigger | Threshold | Reflex | Visual |
|---------|-----------|--------|--------|
| Loud Noise | Volume > 0.8, delta > 0.5/frame | `StartleReflex` | 50% brightness reduction, void_stare for 200ms |
| Beat Detection | 20-100Hz peaks | `PulseReflex` | Scale modulation 1.0→1.02 in phase |

```python
from systems.multi_modal import AuditoryPerception

audio = AuditoryPerception(
    startle_threshold=0.8,
    beat_frequency_range=(20, 100)
)

# Startle reflex triggers on loud noises
# Pulse reflex syncs with detected beats
```

#### Kinetic Perception

User input velocity awareness for adaptive behavior.

| Trigger | Threshold | Reflex | Visual |
|---------|-----------|--------|--------|
| High Input Rate | > 5 events/sec | `FocusReflex` | Reduced entropy, red dominance (alertness) |

```python
from systems.multi_modal import KineticPerception

kinetic = KineticPerception(
    focus_threshold=5.0  # events per second
)

# When user is typing/clicking rapidly:
# - Entropy reduces (sharpening)
# - Red dominance increases (excitement/alertness)
```

### Configuration

```yaml
# .geometry/config.yaml
multi_modal:
  auditory:
    enabled: true
    startle_threshold: 0.8
    beat_range_hz: [20, 100]
  kinetic:
    enabled: true
    focus_threshold: 5.0
```

---

## RTS Driver

### Overview

High-performance native FUSE driver for RTS (Real-Time System) files.

### Features

- 10x+ performance improvement over Python (50MB/s vs 2-5MB/s)
- Hilbert-compatible with Python reference implementation
- Crash recovery with data preservation

### Usage

```bash
# Build Rust driver
cd systems/rts_fuse/rts_rs
cargo build --release

# Mount RTS file
./target/release/rts_rs mount /path/to/file.rts.png /mnt/rts

# Access as regular filesystem
ls /mnt/rts
cat /mnt/rts/data.bin
```

---

## RTS Ecosystem

### Overview

Complete ecosystem for RTS file creation, verification, and execution.

### Features

#### Embedded Linux Container Support

Wrap Linux Kernel and Initrd into PixelRTS container.

```python
from pixel_compiler import RTSPackager

packager = RTSPackager()

# Create bootable RTS container
packager.create_container(
    kernel="vmlinuz",
    initrd="initramfs.cpio.gz",
    output="linux_boot.rts.png"
)
```

#### Bit-Perfect Roundtrip Verification

SHA256 hash verification for PNG↔Binary conversion.

```python
from pixel_compiler import PixelCompiler

compiler = PixelCompiler()

# Convert and verify
compiler.binary_to_rts("program", "program.rts.png")
assert compiler.verify_roundtrip("program")  # SHA256 verification
```

#### Hilbert Spatial Locality

1D sequence locality preserved in 2D visual mapping.

```python
# Memory addresses close in 1D appear close in 2D
# Improves cache locality for spatial operations
# Preserves data relationships visually
```

---

## Integration Examples

### Complete System Integration

```python
from systems.evolution_daemon import EvolutionDaemon
from systems.visual_shell import VisualShell
from systems.cognitive import UnifiedCognitiveDaemon
from systems.foundry import FoundryDaemon

# Initialize all systems
evolution = EvolutionDaemon(pas_threshold=0.5)
visual = VisualShell(foveated=True)
cognitive = UnifiedCognitiveDaemon()
foundry = FoundryDaemon()

# Start evolution daemon
evolution.start()

# Set up visual feedback
visual.on_pas_change(lambda score: 
    print(f"PAS Score: {score}")
)

# Connect cognitive to visual
cognitive.on_intent(lambda intent:
    visual.set_confidence(intent.confidence)
)

# Run main loop
while True:
    visual.render()
    evolution.run_cycle()
```

---

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Cognitive fallback active | LM Studio not running | Start LM Studio server |
| Slow RTS operations | Python driver | Build and use Rust driver |
| Visual artifacts | Foveated rendering | Increase foveal radius |
| Low PAS score | System instability | Check evolution logs |

### Diagnostic Commands

```bash
# Check cognitive system
curl http://localhost:1234/v1/models

# Verify RTS driver
ls -la systems/rts_fuse/rts_rs/target/release/rts_rs

# Check PAS score
python3 -c "from systems.evolution_daemon import EvolutionDaemon; d = EvolutionDaemon(); print(d.get_status())"
```

---

## See Also

- [API Reference](API_REFERENCE.md)
- [Advanced Features Guide](../ADVANCED_FEATURES.md)
- [Troubleshooting Guide](../TROUBLESHOOTING.md)
- [OpenSpec Quick Reference](OPENSPEC_QUICKREF.md)

---

*Last Updated: 2026-03-11*
*Version: 4.0.1*
