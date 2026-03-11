# Ouroboros Fracture Detector

## Overview

The Ouroboros Fracture Detector is the "spinal cord" of Geometry OS - a real-time reflex arc that monitors the system for structural fractures and triggers emergency responses before cascading failures can spread through the Neural Substrate. Named after the serpent that eats its own tail, Ouroboros represents a closed-loop system that can detect and heal its own injuries.

The detector operates as a passive tailer at 1Hz, monitoring the ASCII Scene Graph to detect geometric anomalies that indicate system fractures.

## Key Components

### 1. FractureDetector Class
The core monitoring component that:
- Captures ASCII snapshots at 1Hz
- Maintains a sliding window of frames
- Calculates geometric drift between frames
- Triggers appropriate reflex responses

### 2. OuroborosReflex Enum
Defines four levels of response urgency:
- **NONE (0)**: Normal operation, no fracture detected
- **WARNING (1)**: Log anomaly, continue operation
- **QUARANTINE (2)**: Freeze affected districts, investigate
- **EMERGENCY_FREEZE (3)**: Halt all mutations immediately

### 3. FractureConfig Class
Configuration settings for the detector:
- `WINDOW_SIZE`: 5 frames for sliding window analysis
- `PAIN_THRESHOLD`: 0.3 (geometric drift trigger point)
- `MAX_POSITION_DELTA`: 500px window teleport threshold
- `MAX_COUNT_DELTA`: 10 window explosion threshold
- `MAX_HEARTBEAT_AGE`: 3.0 second heartbeat desync threshold
- `MAX_STABILITY_DROP`: 0.5 PAS collapse threshold
- `QUARANTINE_DURATION_SECONDS`: 300 (5 minutes default)

## Fracture Signals

The detector monitors for four primary fracture signals:

| Signal | Detection Logic | Threshold | Reflex Level |
|--------|-----------------|-----------|--------------|
| **Window Teleport** | Position delta > 500px in 1 cycle | `|pos_new - pos_old| > 500` | QUARANTINE |
| **Window Explosion** | Count delta > 10 in 1 cycle | `|count_new - count_old| > 10` | WARNING |
| **Heartbeat Desync** | No update for 3+ seconds | `now - last_heartbeat > 3s` | EMERGENCY_FREEZE |
| **PAS Collapse** | Stability drops > 0.5 in 1 cycle | `stability_old - stability_new > 0.5` | QUARANTINE |

### Geometric Drift Calculation

The system calculates a normalized drift score (0.0-1.0) based on:
- **Position Drift**: Euclidean distance between window positions
- **Count Drift**: Change in number of windows (normalized)
- **Stability Drift**: Change in PAS stability score

```python
drift = (position_drift + count_drift + stability_drift) / 3
```

## Usage Example

### Basic Monitoring
```python
from systems.evolution_daemon.safety.fracture_detector import FractureDetector

# Initialize with daemon (for emergency freeze capability)
detector = FractureDetector(daemon)

# Start monitoring loop
import asyncio
asyncio.create_task(detector.run())
```

### District Quarantine Management
```python
# Check if district is quarantined
if detector.is_district_quarantined("visual_shell"):
    # Skip mutations for this district
    pass

# Manual quarantine for maintenance
detector.quarantine_district("temp_district")

# Release after repair
detector.release_district("temp_district")
```

### Emergency Handling
```python
# Check emergency freeze status
if detector.is_emergency_frozen():
    # System mutations halted
    print("System in emergency freeze - manual intervention required")
    # Manual clearance after investigation
    detector.clear_emergency_freeze()
```

## File Paths

### Configuration and State
- `systems/evolution_daemon/safety/fracture_detector.py` - Main implementation
- `.geometry/ascii_scene/gnb_state.ascii` - System heartbeat data
- `.geometry/ascii_scene/shell_fragments.ascii` - Window position data
- `.geometry/ascii_scene/ouroboros_metrics.ascii` - Real-time metrics
- `.loop/ouroboros_alerts.log` - Fracture event log

### Data Structures
- `systems/evolution_daemon/safety/data_structures.py` - ASCIIFrame and FractureEvent
- `systems/evolution_daemon/safety/__init__.py` - Package exports

### Integration Points
- `systems/evolution_daemon/evolution_daemon.py` - Detector initialization
- `systems/swarm/agency_agents.py` - Mutation governor quarantine checks

## Monitoring and Metrics

The detector exports real-time metrics in ASCII format:

```ascii
# Ouroboros Fracture Metrics
drift_current: 0.02
drift_max_24h: 0.15
reflexes_triggered_24h: 3
  - WARNING: 2
  - QUARANTINE: 1
  - EMERGENCY_FREEZE: 0
districts_quarantined: 0
emergency_frozen: false
last_fracture: null
```

### Alert Logging
Fracture events are logged with timestamp, reflex level, drift score, signal type, and affected districts:

```log
[2026-03-10T12:34:56.789] REFLEX=QUARANTINE DRIFT=0.452 SIGNAL=window_teleport DISTRICTS=visual_shell
```

## Performance Characteristics

- **Detection Latency**: <100ms from ASCII write
- **Memory Overhead**: <10MB (5 frames × ~2MB each)
- **CPU Overhead**: <1% (1Hz monitoring loop)
- **False Positive Rate**: <1% of heartbeats

## Error Handling

The detector gracefully handles:
- Malformed ASCII files (skips without triggering false positives)
- Missing files (waits up to 3 cycles before WARNING)
- Detector crashes (logs to fracture_detector.log, continues monitoring)

## Future Enhancements

### Predictive Simulation (Phase 57+)
- Shadow sandbox for pre-mutation testing
- Predictive ASCII diff generation
- Preemptive quarantine before fractures occur

### Machine Learning Drift Patterns
- Recognize early warning signs
- Predict fractures before they happen
- Adaptive threshold adjustment

### Cross-District Correlation
- Track fracture propagation between districts
- Identify "super-spreader" districts
- Implement district isolation protocols

## Testing

The system is thoroughly tested with:
- Unit tests for drift calculations
- Integration tests for all fracture signals
- Chaos tests for robustness
- 69+ test cases covering all scenarios

---

*"The era of blind evolution is over. The era of the Ouroboros Spine has begun."*