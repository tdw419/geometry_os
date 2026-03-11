# Cognitive Systems Documentation

## Overview

Geometry OS v4.0 introduces advanced cognitive capabilities that enable self-awareness, intent prediction, and autonomous governance. These systems form the "mind" of the operating system.

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                     COGNITIVE SYSTEMS                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  GEOMETRIC      │────▶│  EVOLUTION      │                       │
│   │  NATIVE BROWSER │     │  ENGINE         │                       │
│   └─────────────────┘     └─────────────────┘                       │
│          │                        │                                  │
│          ▼                        ▼                                  │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  MESH           │     │  AUTONOMOUS     │                       │
│   │  CONSCIOUSNESS  │     │  GOVERNANCE     │                       │
│   └─────────────────┘     └─────────────────┘                       │
│          │                        │                                  │
│          ▼                        ▼                                  │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  GLOBAL         │     │  INTENT         │                       │
│   │  AWARENESS      │     │  PREDICTION     │                       │
│   └─────────────────┘     └─────────────────┘                       │
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## Components

### 1. Geometric Native Browser (GNB) - Phase 50

**Purpose**: Native interface to the ASCII Scene Graph, bypassing the HTML/JS stack for zero-latency interaction.

**Location**: `systems/visual_shell/gnb.py`

**Key Features**:
- Dual-Audience perception: Native GPU rendering + ASCII state mirroring
- Zero-latency interaction: Direct Python/Rust bridge
- State-as-Text: All UI transitions logged as ASCII fragments
- Headless mode for AI perception

**Architecture**:
```
┌──────────────┐         ┌──────────────┐
│  WGPU        │◀───────▶│  ASCII       │
│  Renderer    │         │  Scene Graph │
└──────────────┘         └──────────────┘
       │                        │
       ▼                        ▼
┌──────────────┐         ┌──────────────┐
│  Native      │         │  AI          │
│  Window      │         │  Perception  │
└──────────────┘         └──────────────┘
```

**Usage**:
```python
from systems.visual_shell.gnb import GNB

# Launch with native window
browser = GNB(headless=False)
asyncio.create_task(browser.run())

# Headless mode for AI
browser = GNB(headless=True)
asyncio.create_task(browser.run())
```

**State Files**:
- `.geometry/gnb_state.ascii` - Current browser state
- `.geometry/ascii_scene/shell_fragments.ascii` - Window topology
- `.geometry/ascii_scene/shell_state.ascii` - System state

### 2. Evolution Engine - Phase 59

**Purpose**: Self-improvement through feedback loops and experimentation with automatic rollback.

**Location**: `systems/visual_shell/evolution_engine.py`

**Key Features**:
- Safe experiments with automatic rollback
- A/B testing for configuration changes
- Performance regression detection
- Evolution metrics tracking
- Statistical significance analysis

**Experiment Types**:
| Type | Description |
|------|-------------|
| CONFIGURATION | System parameter changes |
| PLACEMENT | Component placement optimization |
| SCALING | Resource scaling experiments |
| MIGRATION | Data migration testing |
| SCHEDULING | Task scheduling optimization |

**Usage**:
```python
from systems.visual_shell.evolution_engine import (
    EvolutionEngine, ExperimentConfig, ExperimentType
)

engine = EvolutionEngine()

# Define experiment
config = ExperimentConfig(
    experiment_type=ExperimentType.CONFIGURATION,
    target_component="memory_drift",
    change_description="Increase cache size to 4096",
    baseline_config={"cache_size": 2048},
    experiment_config={"cache_size": 4096},
    duration_seconds=300,
    rollback_on_degradation=True
)

# Run experiment
result = await engine.run_experiment(config)

if result.status == ExperimentStatus.COMPLETED:
    print(f"Improvement: {result.improvement_percentage:.2f}%")
else:
    print(f"Rolled back: {result.rollback_reason}")
```

**Rollback Reasons**:
- `PERFORMANCE_DEGRADATION` - Metrics dropped below threshold
- `ERROR_RATE_INCREASE` - Error rate exceeded limit
- `COST_OVERRUN` - Resource usage exceeded budget
- `MANUAL_TRIGGER` - Human-initiated rollback
- `TIMEOUT` - Experiment exceeded time limit
- `SAFETY_VIOLATION` - Ouroboros detected fracture

### 3. Autonomous Governance - Phase 61

**Purpose**: Self-regulating system policies without human intervention.

**Location**: `systems/visual_shell/autonomous_governance.py`

**Key Features**:
- Policy creation and enforcement
- Resource allocation optimization
- Conflict resolution
- Adaptive thresholds

### 4. Mesh Consciousness - Phase 62-64

**Purpose**: Distributed awareness and intent prediction across all system components.

#### Phase 62: Global Awareness
**Location**: `systems/visual_shell/mesh_events.py`

Monitors system-wide state and propagates awareness events:
```python
from systems.visual_shell.mesh_events import MeshEventBus

bus = MeshEventBus()

# Subscribe to global events
@bus.on("district_change")
async def handle_district_change(event):
    print(f"District {event.district_id} changed: {event.change_type}")

# Emit awareness event
bus.emit(MeshEvent(
    type="resource_pressure",
    source="memory_drift",
    data={"pressure": 0.85}
))
```

#### Phase 63: Intent Prediction
**Location**: `systems/visual_shell/predictive_glow.py`

Predicts user/system intent based on patterns:
```python
from systems.visual_shell.predictive_glow import IntentPredictor

predictor = IntentPredictor()

# Feed recent actions
predictor.observe(action)

# Get predicted next action
prediction = predictor.predict_next()
print(f"Likely intent: {prediction.intent} (confidence: {prediction.confidence})")
```

#### Phase 64: Self-Reflection
**Location**: `systems/visual_shell/self_reflection.py`

Enables the system to analyze and improve its own behavior:
```python
from systems.visual_shell.self_reflection import SelfReflector

reflector = SelfReflector()

# Analyze recent behavior
analysis = await reflector.analyze_period(
    start_time=time.time() - 3600,  # Last hour
    end_time=time.time()
)

print(f"Behavioral patterns: {analysis.patterns}")
print(f"Suggested improvements: {analysis.improvements}")
```

## Integration Example

```python
# Full cognitive system integration
from systems.visual_shell.gnb import GNB
from systems.visual_shell.evolution_engine import EvolutionEngine
from systems.visual_shell.mesh_events import MeshEventBus
from systems.visual_shell.predictive_glow import IntentPredictor
from systems.evolution_daemon.safety.fracture_detector import FractureDetector

class CognitiveSystem:
    def __init__(self):
        self.browser = GNB(headless=True)
        self.evolution = EvolutionEngine()
        self.event_bus = MeshEventBus()
        self.predictor = IntentPredictor()
        self.fracture_detector = FractureDetector()
        
    async def run(self):
        # Start all subsystems
        await asyncio.gather(
            self.browser.run(),
            self.fracture_detector.run(),
            self._cognitive_loop()
        )
        
    async def _cognitive_loop(self):
        while True:
            # 1. Gather global awareness
            state = await self.browser.get_state()
            
            # 2. Predict intent
            intent = self.predictor.predict_next()
            
            # 3. Propose optimization if safe
            if not self.fracture_detector.is_emergency_frozen():
                await self._maybe_optimize(intent)
                
            await asyncio.sleep(1.0)
```

## File Paths

| Component | Path |
|-----------|------|
| Geometric Native Browser | `systems/visual_shell/gnb.py` |
| Evolution Engine | `systems/visual_shell/evolution_engine.py` |
| Mesh Events | `systems/visual_shell/mesh_events.py` |
| Predictive Glow | `systems/visual_shell/predictive_glow.py` |
| Adaptive Learning | `systems/visual_shell/adaptive_learning.py` |
| Whimsy Injector | `systems/visual_shell/whimsy_injector.py` |

## Testing

```bash
# Run cognitive system tests
python3 -m pytest tests/ -k "gnb or evolution_engine or mesh or predictive" -v

# Specific test suites
python3 -m pytest tests/test_gnb.py -v
python3 -m pytest tests/test_evolution_engine.py -v
python3 -m pytest tests/test_mesh_events.py -v
python3 -m pytest tests/test_predictive_glow.py -v
```

## Performance Targets

| Metric | Target |
|--------|--------|
| Intent Prediction Latency | <50ms |
| Global Awareness Update | 1Hz |
| Experiment Duration | 5-15 minutes |
| Rollback Time | <10 seconds |
| Self-Reflection Cycle | 1 hour |

---

*"The system knows itself. The system improves itself."*
