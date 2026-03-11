# Ouroboros Safety System

## Overview

The Ouroboros Safety System is a multi-layered protection framework for Geometry OS that enables safe autonomous evolution. Named after the serpent that eats its own tail, it represents a closed-loop system that can detect and heal its own injuries.

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                     OUROBOROS SAFETY SYSTEM                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  FRACTURE       │────▶│  REFLEX         │                       │
│   │  DETECTOR       │     │  RESPONSE       │                       │
│   └─────────────────┘     └─────────────────┘                       │
│          │                        │                                  │
│          ▼                        ▼                                  │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  DREAM ENGINE   │     │  SANDBOX        │                       │
│   │  (Predictive)   │     │  MANAGER        │                       │
│   └─────────────────┘     └─────────────────┘                       │
│          │                        │                                  │
│          ▼                        ▼                                  │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  TRAUMA LOG     │     │  MUTATION       │                       │
│   │  (Learning)     │     │  JOURNAL        │                       │
│   └─────────────────┘     └─────────────────┘                       │
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## Components

### 1. Fracture Detector (Phase 56)

**Purpose**: Real-time monitoring of the ASCII Scene Graph to detect structural fractures before cascading failures.

**Location**: `systems/evolution_daemon/safety/fracture_detector.py`

**Key Features**:
- 1Hz passive tailing of ASCII Scene Graph
- Sliding window analysis (5 frames)
- Four fracture signal types:
  - **Window Teleport**: Position delta > 500px
  - **Window Explosion**: Count delta > 10
  - **Heartbeat Desync**: No update for 3+ seconds
  - **PAS Collapse**: Stability drops > 0.5

**Reflex Levels**:
| Level | Code | Action |
|-------|------|--------|
| NONE | 0 | Normal operation |
| WARNING | 1 | Log anomaly, continue |
| QUARANTINE | 2 | Freeze affected districts |
| EMERGENCY_FREEZE | 3 | Halt all mutations |

**Usage**:
```python
from systems.evolution_daemon.safety.fracture_detector import FractureDetector

detector = FractureDetector(daemon)
asyncio.create_task(detector.run())

# Check quarantine status
if detector.is_district_quarantined("visual_shell"):
    # Skip mutations
    pass
```

### 2. Dream Engine (Phase 57)

**Purpose**: Predictive simulation engine that tests mutations in a shadow substrate before committing to the real system.

**Location**: `systems/evolution_daemon/safety/dream_engine.py`

**Key Features**:
- Shadow Substrate (`.geometry/dream_scene/`)
- Single "Dream Frame" simulation per mutation
- Preemptive reflex scoring
- Integration with SandboxManager

**Usage**:
```python
from systems.evolution_daemon.safety.dream_engine import DreamEngine
from systems.evolution_daemon.safety.sandbox_manager import SandboxManager

sandbox = SandboxManager()
dream = DreamEngine(sandbox)

# Run predictive simulation
dream_frame, reflex_score = await dream.simulate_dream(proposal)

if reflex_score < 0.3:
    # Safe to proceed
    pass
else:
    # High risk - reject mutation
    pass
```

### 3. Trauma Log

**Purpose**: Records "Genetic Trauma" - code patterns that caused fractures in dreams, preventing the system from repeating mistakes.

**Location**: `systems/evolution_daemon/safety/trauma_log.py`

**Key Features**:
- Persistent storage in `.loop/genetic_trauma.jsonl`
- Records proposal ID, reflex score, target files, fracture signal
- Queryable history for mutation filtering

**Usage**:
```python
from systems.evolution_daemon.safety.trauma_log import TraumaLog, GeneticTrauma

log = TraumaLog()

# Record a traumatic mutation
trauma = GeneticTrauma(
    proposal_id="mut_123",
    timestamp=time.time(),
    reflex_score=0.85,
    target_files=["systems/visual_shell/api/visual_bridge.py"],
    diff_summary="Removed critical validation",
    fracture_signal="window_teleport"
)
log.record_trauma(trauma)

# Query recent traumas
recent = log.get_recent_trauma(limit=100)
```

### 4. Sandbox Manager

**Purpose**: Creates isolated execution environments for testing mutations safely.

**Location**: `systems/evolution_daemon/safety/sandbox_manager.py`

**Key Features**:
- Isolated Python environments
- Diff application and rollback
- Resource limits and timeouts
- Dream mode execution

**Usage**:
```python
from systems.evolution_daemon.safety.sandbox_manager import SandboxManager

sandbox = SandboxManager()

# Create sandbox for proposal
sandbox_path = await sandbox.create_sandbox(proposal)

# Apply and test
await sandbox.apply_diff(sandbox_path, diff_content)
result = await sandbox.run_dream_frame(sandbox_path, dream_scene_path)

# Cleanup
await sandbox.cleanup(sandbox_path)
```

## Integration Points

### Evolution Daemon

The Ouroboros system integrates with the Evolution Daemon:

```python
# In evolution_daemon.py
from safety.fracture_detector import FractureDetector
from safety.dream_engine import DreamEngine
from safety.trauma_log import TraumaLog

class EvolutionDaemon:
    def __init__(self):
        self.fracture_detector = FractureDetector(self)
        self.dream_engine = DreamEngine(self.sandbox_manager)
        self.trauma_log = TraumaLog()
        
    async def apply_mutation(self, proposal):
        # 1. Check trauma log
        if self._is_traumatic(proposal):
            return MutationResult.REJECTED
            
        # 2. Run dream simulation
        _, reflex = await self.dream_engine.simulate_dream(proposal)
        if reflex > 0.3:
            self.trauma_log.record_trauma(...)
            return MutationResult.REJECTED
            
        # 3. Apply with fracture monitoring
        self.fracture_detector.enable_monitoring()
        result = await self._apply(proposal)
        
        return result
```

### Mutation Governor

Agency agents check quarantine status before proposing mutations:

```python
# In agency_agents.py
def propose_mutation(self, target):
    if self.fracture_detector.is_district_quarantined(target.district):
        return None  # Skip quarantined districts
        
    # Proceed with proposal
    return Mutation(...)
```

## File Paths

| Component | Path |
|-----------|------|
| Fracture Detector | `systems/evolution_daemon/safety/fracture_detector.py` |
| Dream Engine | `systems/evolution_daemon/safety/dream_engine.py` |
| Trauma Log | `systems/evolution_daemon/safety/trauma_log.py` |
| Sandbox Manager | `systems/evolution_daemon/safety/sandbox_manager.py` |
| Data Structures | `systems/evolution_daemon/safety/data_structures.py` |
| ASCII Scene | `.geometry/ascii_scene/` |
| Dream Scene | `.geometry/dream_scene/` |
| Trauma Records | `.loop/genetic_trauma.jsonl` |
| Ouroboros Metrics | `.geometry/ascii_scene/ouroboros_metrics.ascii` |
| Alert Log | `.loop/ouroboros_alerts.log` |

## Performance Characteristics

| Metric | Value |
|--------|-------|
| Detection Latency | <100ms from ASCII write |
| Memory Overhead | <10MB (5 frames × ~2MB) |
| CPU Overhead | <1% (1Hz monitoring) |
| False Positive Rate | <1% of heartbeats |
| Dream Simulation | ~500ms per mutation |

## Testing

The Ouroboros system has comprehensive test coverage:

```bash
# Run all safety tests
python3 -m pytest tests/ -k "fracture or dream or trauma or sandbox" -v

# Specific test suites
python3 -m pytest tests/test_fracture_detector.py -v      # 69 tests
python3 -m pytest tests/test_dream_engine.py -v           # 25 tests
python3 -m pytest tests/test_trauma_log.py -v             # 18 tests
python3 -m pytest tests/test_sandbox_manager.py -v        # 42 tests
```

## Future Enhancements

### Phase 58+: Predictive Simulation
- Multi-frame dream sequences
- Cascading failure prediction
- Cross-district correlation analysis

### Phase 60+: Machine Learning Integration
- Pattern recognition for early warning signs
- Adaptive threshold adjustment
- Predictive quarantine

---

*"The era of blind evolution is over. The era of the Ouroboros Spine has begun."*
