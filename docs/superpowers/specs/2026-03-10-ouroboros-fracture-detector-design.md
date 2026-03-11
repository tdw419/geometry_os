# Ouroboros Fracture Detector — Design Specification

**Date:** 2026-03-10
**Phase:** 56 (Self-Healing Kernel)
**Status:** Approved
**Author:** Geometry OS Swarm

---

## 1. Purpose

Provide Geometry OS with a "spinal cord" — a reflex arc that detects structural fractures in real-time and triggers emergency response before cascading failure spreads through the Neural Substrate.

The Ouroboros transforms our passive ASCII monitoring into active self-preservation.

---

## 2. Problem Statement

### 2.1 The Threat: Structural Fracture

In Geometry OS, failures are not stack traces — they are **geometric anomalies**:

| Traditional OS | Geometry OS |
|----------------|-------------|
| Kernel panic | Spatial desynchronization |
| Memory leak | Window explosion |
| Deadlock | Heartbeat desync |
| Race condition | PAS divergence cascade |

Because windows, kernels, and agents share a Neural Substrate (SDFs, Hilbert mappings, shared weights), a single "toxic" mutation in one district can ripple through the coordinate space, causing other districts to "desynchronize" or visually disintegrate.

### 2.2 The Gap

Currently, the system has:
- ✅ PAS Score evaluation (mutation quality)
- ✅ Evolution Orchestrator (pipeline management)
- ✅ ASCII Heartbeat (state exposure)
- ❌ **No pain response** — the system cannot "feel" when it's breaking

---

## 3. Solution Overview

### 3.1 The Ouroboros Fracture Detector

A Passive Tailer that monitors the ASCII Scene Graph at 1Hz and triggers reflex responses when geometric coherence breaks down.

**Why Passive?**
- Zero overhead: Uses existing ASCII infrastructure
- Fast: Detects fractures in <100ms from ASCII write
- Simple: ~150 lines, easy to validate
- Extensible: Can add predictive simulation in Phase 57

### 3.2 The Reflex Hierarchy

```python
class OuroborosReflex(Enum):
    NONE = 0              # Normal operation
    WARNING = 1           # Log anomaly, continue
    QUARANTINE = 2        # Freeze district, investigate
    EMERGENCY_FREEZE = 3  # Halt all mutations immediately
```

---

## 4. Architecture

### 4.1 Component Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    OUROBOROS FRACTURE DETECTOR                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   .geometry/ascii_scene/                                        │
│   ├── gnb_state.ascii ─────┐                                    │
│   ├── shell_fragments.ascii─┼──▶ Watchdog ──▶ SlidingWindow    │
│   └── heartbeat.ascii ──────┘       │            │              │
│                                     │            ▼              │
│                                     │     FractureAnalyzer     │
│                                     │            │              │
│                                     │            ▼              │
│                                     │     ┌──────────────┐     │
│                                     │     │ PAIN_THRESHOLD│    │
│                                     │     │ = 0.3 drift   │    │
│                                     │     └──────┬───────┘     │
│                                     │            │              │
│                                     │     ┌──────▼───────┐     │
│                                     │     │ delta > 0.3? │     │
│                                     │     └──────┬───────┘     │
│                                     │        YES │ NO          │
│                                     │            │             │
│                                     │     ┌──────▼───────┐     │
│                                     │     │EMERGENCY_FREEZE│   │
│                                     │     └──────┬───────┘     │
│                                     │            │             │
│                                     └────────────┼─────────────┘
│                                                  ▼              │
│                                        EvolutionDaemon          │
│                                        (pauses mutations)       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### 4.2 File Location

```
systems/evolution_daemon/
├── safety/
│   ├── __init__.py
│   └── fracture_detector.py    # NEW: Ouroboros Fracture Detector
├── evolution_daemon.py         # Modified: wire in detector
└── ...
```

---

## 5. Fracture Signals

### 5.1 Signal Definitions

| Signal | Detection Logic | Threshold | Reflex Level |
|--------|-----------------|-----------|--------------|
| **Window Teleport** | Position delta > 500px in 1 cycle | `|pos_new - pos_old| > 500` | QUARANTINE |
| **Window Explosion** | Count delta > 10 in 1 cycle | `|count_new - count_old| > 10` | WARNING |
| **Heartbeat Desync** | No update for 3+ seconds | `now - last_heartbeat > 3s` | EMERGENCY_FREEZE |
| **PAS Collapse** | Stability drops > 0.5 in 1 cycle | `stability_old - stability_new > 0.5` | QUARANTINE |

### 5.2 Geometric Drift Calculation

```python
def calculate_geometric_drift(frames: List[ASCIIFrame]) -> float:
    """
    Calculate geometric drift between frames.

    Returns a value 0.0-1.0 where:
    - 0.0 = Perfect coherence (no drift)
    - 1.0 = Complete fracture (total incoherence)
    """
    if len(frames) < 2:
        return 0.0

    drift_scores = []

    for i in range(1, len(frames)):
        prev, curr = frames[i-1], frames[i]

        # Position drift
        pos_drift = calculate_position_drift(prev.windows, curr.windows)

        # Count drift
        count_drift = abs(len(curr.windows) - len(prev.windows)) / max(len(prev.windows), 1)

        # Stability drift
        stability_drift = abs(prev.stability - curr.stability)

        drift_scores.append((pos_drift + count_drift + stability_drift) / 3)

    return max(drift_scores)  # Return worst drift in window
```

---

## 6. Data Flow

### 6.1 Frame Processing Pipeline

```
ASCII Heartbeat (1Hz)
        │
        ▼
FractureDetector._frame_buffer.append(current)
        │
        ▼
if len(_frame_buffer) >= WINDOW_SIZE (5):
    drift = analyze_geometric_drift(_frame_buffer[-5:])
        │
        ▼
if drift > PAIN_THRESHOLD (0.3):
    reflex = determine_reflex_level(drift)
    trigger_reflex(reflex, drift, affected_districts)
```

### 6.2 Reflex Response Actions

| Reflex | Action | Recovery |
|--------|--------|----------|
| NONE | Continue normal operation | N/A |
| WARNING | Log anomaly, increment metrics | Automatic |
| QUARANTINE | Freeze district mutations, alert Orchestrator | Manual or timed |
| EMERGENCY_FREEZE | Halt all mutations globally, await human | Manual only |

---

## 7. Integration Points

### 7.1 EvolutionDaemon Integration

```python
# In evolution_daemon.py __init__()

from systems.evolution_daemon.safety.fracture_detector import FractureDetector

self._fracture_detector = FractureDetector(self)
self._fracture_task = asyncio.create_task(self._fracture_detector.run())
logger.info("🧬 Ouroboros Fracture Detector active (PAIN_THRESHOLD=0.3)")
```

### 7.2 Mutation Governor Integration

```python
# In agency_agents.py MutationGovernorAgent

async def process_task(self, task: AgentTask) -> AgentResult:
    # Check for active quarantine
    if self._daemon._fracture_detector.is_district_quarantined(district):
        return AgentResult(
            task_id=task.task_id,
            success=False,
            error="District under Ouroboros quarantine"
        )
    # ... normal evaluation
```

### 7.3 ASCII Heartbeat Integration

No changes required — the FractureDetector reads the existing ASCII files written by the heartbeat loop.

---

## 8. Configuration

### 8.1 Thresholds

```python
# systems/evolution_daemon/safety/fracture_detector.py

class FractureConfig:
    # Sliding window size (frames)
    WINDOW_SIZE: int = 5

    # Pain threshold (0.0-1.0 drift)
    PAIN_THRESHOLD: float = 0.3

    # Individual signal thresholds
    MAX_POSITION_DELTA: int = 500      # pixels
    MAX_COUNT_DELTA: int = 10          # windows
    MAX_HEARTBEAT_AGE: float = 3.0     # seconds
    MAX_STABILITY_DROP: float = 0.5    # PAS stability component
```

### 8.2 District Quarantine Duration

```python
QUARANTINE_DURATION_SECONDS: int = 300  # 5 minutes default
```

---

## 9. Error Handling

### 9.1 Malformed ASCII

If an ASCII fragment cannot be parsed:
1. Log warning with fragment content
2. Skip that frame (do not trigger false positive)
3. Continue monitoring

### 9.2 Missing Files

If expected ASCII files don't exist:
1. Wait for up to 3 cycles (3 seconds)
2. If still missing after 3 cycles, trigger WARNING reflex
3. Continue attempting to read

### 9.3 Detector Crash

If the FractureDetector crashes:
1. Log error to `.loop/fracture_detector.log`
2. EvolutionDaemon continues without fracture detection
3. Automatic restart on next heartbeat cycle

---

## 10. Testing Strategy

### 10.1 Unit Tests

- `test_fracture_detector.py`
  - Test position drift calculation
  - Test count drift calculation
  - Test stability drift calculation
  - Test reflex level determination
  - Test quarantine state management

### 10.2 Integration Tests

- `test_ouroboros_integration.py`
  - Simulate window teleport (should quarantine)
  - Simulate window explosion (should warn)
  - Simulate heartbeat desync (should emergency freeze)
  - Simulate PAS collapse (should quarantine)

### 10.3 Chaos Testing

- Randomly corrupt ASCII fragments
- Randomly delete ASCII files
- Randomly inject extreme values

---

## 11. Metrics & Observability

### 11.1 Exposed Metrics

```
.geometry/ascii_scene/ouroboros_metrics.ascii
```

```
# Ouroboros Fracture Metrics
drift_current: 0.02
drift_max_24h: 0.15
reflexes_triggered_24h: 3
  - WARNING: 2
  - QUARANTINE: 1
  - EMERGENCY_FREEZE: 0
districts_quarantined: 0
last_fracture: null
```

### 11.2 Alert Integration

When EMERGENCY_FREEZE triggers:
1. Write to `.loop/ouroboros_alerts.log`
2. Broadcast via Neural Event Bus
3. Update GNB state mirror with alert status

---

## 12. Future Extensions (Phase 57+)

### 12.1 Predictive Simulation

Add a "Prefrontal Cortex" that simulates mutations before applying them:
- Shadow sandbox for pre-mutation testing
- Predictive ASCII diff generation
- Preemptive quarantine before fracture occurs

### 12.2 Machine Learning Drift Patterns

Train a model on historical fracture patterns:
- Recognize early warning signs
- Predict fractures before they happen
- Adaptive threshold adjustment

### 12.3 Cross-District Correlation

Track how fractures propagate between districts:
- Build a "fracture propagation graph"
- Identify "super-spreader" districts
- Implement district isolation protocols

---

## 13. Success Criteria

| Criterion | Target |
|-----------|--------|
| Fracture detection latency | <100ms from ASCII write |
| False positive rate | <1% of heartbeats |
| Memory overhead | <10MB |
| CPU overhead | <1% |
| Recovery time from quarantine | <30 seconds |

---

## 14. Implementation Checklist

- [ ] Create `systems/evolution_daemon/safety/` directory
- [ ] Implement `fracture_detector.py` with FractureDetector class
- [ ] Add OuroborosReflex enum
- [ ] Implement sliding window buffer
- [ ] Implement drift calculation algorithms
- [ ] Implement reflex triggering
- [ ] Wire into EvolutionDaemon initialization
- [ ] Add quarantine state to Mutation Governor
- [ ] Create unit tests
- [ ] Create integration tests
- [ ] Update GNB state mirror to include Ouroborus status
- [ ] Document in MEMORY.md

---

## 15. References

- ASCII Exposed Computing Manifesto (`docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`)
- Evolution Daemon V16 (`systems/evolution_daemon/evolution_daemon.py`)
- Agency Agents (`systems/swarm/agency_agents.py`)
- GNB State Mirror (`.geometry/gnb_state.ascii`)

---

*"The era of blind evolution is over. The era of the Ouroboros Spine has begun."*
