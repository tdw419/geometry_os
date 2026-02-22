# Evolution Daemon V13 Design: Proactive Spatial Integrity

**Date**: 2026-02-16
**Status**: Approved
**Approach**: Predictive RTS Healing + Adaptive Resource Allocation

## Overview

V13 transforms V12's reactive RTSDoctor into a predictive system that anticipates issues before they occur, plus adds adaptive resource management to make the daemon a good OS citizen.

**Two Core Features**:

| Feature | Purpose | Benefit |
|---------|---------|---------|
| **Predictive RTS Healing** | Forecast RTS degradation | Heal before problems occur |
| **Adaptive Resource Allocation** | Monitor system resources | Be a good OS citizen |

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    Evolution Daemon V13                          │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                   Metabolism Monitor                         ││
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────────────┐ ││
│  │  │ CPU     │  │ Memory  │  │ GPU     │  │ Adaptation      │ ││
│  │  │ Monitor │  │ Monitor │  │ Monitor │  │ Engine          │ ││
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────────────┘ ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                      RTSDoctor V13                           ││
│  │  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  ││
│  │  │ Integrity   │───▶│ Historical  │───▶│ Prognostics     │  ││
│  │  │ Checks      │    │ Data Store  │    │ Engine          │  ││
│  │  │ (SHA256,    │    │ (SQLite)    │    │                 │  ││
│  │  │ Hilbert,    │    └─────────────┘    └────────┬────────┘  ││
│  │  │ Entropy)    │                                │           ││
│  │  └─────────────┘                                ▼           ││
│  │                                         ┌─────────────────┐  ││
│  │                                         │ Proactive       │  ││
│  │                                         │ Healing Actions │  ││
│  │                                         └─────────────────┘  ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
```

## Component 1: Predictive RTS Healing

### The Prognostics Engine

A new component within RTSDoctor that predicts future RTS file health.

### Data Collection

The RTSDoctor will log integrity check results to a SQLite database:

| Feature | Type | Purpose |
|---------|------|---------|
| timestamp | DATETIME | Track degradation over time |
| file_path | TEXT | Identify which files degrade |
| file_size | INTEGER | Correlate size with issues |
| modification_count | INTEGER | Track write frequency |
| file_age_days | REAL | Age of the file |
| hilbert_locality | REAL | Spatial coherence score |
| mean_entropy | REAL | Data randomness |

### Prediction Model

- **Algorithm**: Linear regression (scikit-learn) - lightweight, interpretable
- **Training**: Retrain every 24 hours using latest historical data
- **Prediction**: Forecast health score for next 24 hours
- **Action**: If predicted score < threshold → schedule proactive healing

### Proactive Healing Actions

| Predicted Issue | Action |
|-----------------|--------|
| Low Hilbert locality | Schedule defragmentation during low-activity |
| Entropy anomaly | Schedule re-generation from source |
| High degradation rate | Alert + increase monitoring frequency |

## Component 2: Adaptive Resource Allocation

### The "Metabolism" Monitor

A background component that adapts daemon behavior to system load.

### Monitored Resources

| Resource | Library | Metric |
|----------|---------|--------|
| CPU | psutil | System-wide utilization % |
| Memory | psutil | Available MB |
| GPU | nvidia-ml-py (optional) | GPU utilization % |

### Adaptive Mechanisms

| Condition | Response |
|-----------|----------|
| **CPU/GPU > 80%** | Reduce evolution cycle frequency, defer model training |
| **Memory < 200MB** | Pause memory-intensive tasks, aggressive GC |
| **Normal** | Full operation |

### Throttle Levels

| Level | CPU Threshold | Evolution Frequency | Model Training |
|-------|---------------|---------------------|----------------|
| None | <60% | Normal | Allowed |
| Moderate | 60-80% | 50% reduced | Deferred |
| Aggressive | >80% | 90% reduced | Blocked |

## Integration with V12

| Component | V12 Location | V13 Change |
|-----------|--------------|------------|
| RTSDoctor | `safety/rts_doctor.py` | Add PrognosticsEngine class |
| Data Store | N/A | New `safety/prognostics_store.py` |
| Metabolism | N/A | New `safety/metabolism_monitor.py` |
| Main Loop | `evolution_daemon.py` | Consult Metabolism before tasks |

## File Structure

```
systems/evolution_daemon/safety/
├── rts_doctor.py              # Extended with PrognosticsEngine
├── prognostics_store.py       # NEW: SQLite historical data
├── metabolism_monitor.py      # NEW: Resource monitoring
└── data_structures.py         # Add HealthPrediction type

systems/evolution_daemon/tests/
├── test_prognostics_engine.py # NEW: Prediction tests
├── test_metabolism_monitor.py # NEW: Resource tests
└── test_v13_integration.py    # NEW: Full pipeline tests
```

## Test Strategy

| Component | Tests | Approach |
|-----------|-------|----------|
| Prognostics Engine | 8 | Mock data, verify predictions |
| Metabolism Monitor | 6 | Mock psutil, verify throttling |
| Integration | 4 | Full pipeline with simulated load |
| **Total V13** | **18** | |

## Success Criteria

| Metric | Target |
|--------|--------|
| Prediction accuracy | >80% on held-out data |
| Resource adaptation | <5s response to load changes |
| V12 regression | All 107 tests still pass |
| Total tests | 125+ |

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| scikit-learn | >=1.3.0 | Linear regression model |
| psutil | >=5.9.0 | System resource monitoring |

## Future Enhancements (Post-V13)

1. **GPU Monitoring**: Add nvidia-ml-py for NVIDIA GPU metrics
2. **Advanced Models**: Upgrade to gradient boosting for better predictions
3. **Multi-daemon Coordination**: Multiple daemons coordinate resource usage
4. **Cloud Telemetry**: Report health metrics to central dashboard

## References

- [Evolution Daemon V12 Design](./2026-02-16-evolution-daemon-v12-design.md)
- [Evolution Daemon V11 Design](./2026-02-16-evolution-daemon-v11-safety-design.md)
