# Evolution Daemon V13 - Proactive Spatial Integrity

**Status**: ✅ Production Ready (130 tests)
**Implementation Date**: 2026-02-16
**Key Files**: `systems/evolution_daemon/safety/`

## Overview

V13 transforms V12's reactive RTSDoctor into a predictive system that anticipates issues before they occur, plus adds adaptive resource management.

## New Components

### 1. Prognostics Store

**File**: `safety/prognostics_store.py`

SQLite-based storage for historical RTS integrity data:

| Method | Purpose |
|--------|---------|
| `log_integrity_check()` | Store metrics after each check |
| `get_history()` | Retrieve history for a file |
| `get_all_recent_data()` | Get data within time window |
| `get_training_data()` | Format data for ML training |

### 2. Prognostics Engine

**File**: `safety/prognostics_engine.py`

ML-based prediction of future RTS health:

| Method | Purpose |
|--------|---------|
| `train()` | Train LinearRegression model |
| `predict()` | Predict future health score |

**Prediction Logic**:
- Score < 0.5 → `re_generate` recommended
- Score < 0.7 → `defragment` recommended

### 3. Metabolism Monitor

**File**: `safety/metabolism_monitor.py`

Adaptive resource management:

| Threshold | Throttle Level | Behavior |
|-----------|---------------|----------|
| CPU < 60%, MEM > 500MB | NONE | Normal operation |
| CPU 60-80%, MEM 200-500MB | MODERATE | 50% reduced frequency |
| CPU > 80%, MEM < 200MB | AGGRESSIVE | 90% reduced, defer heavy tasks |

## Test Coverage

| Component | Tests |
|-----------|-------|
| V11 Tests | 92 |
| V12 Tests | 15 |
| V13 Data Structures | 4 |
| V13 Prognostics Store | 5 |
| V13 Prognostics Engine | 5 |
| V13 Metabolism Monitor | 6 |
| V13 RTSDoctor Integration | 3 |
| **Total** | **130** |

## Files Added

```
systems/evolution_daemon/safety/
├── prognostics_store.py       # NEW: SQLite historical data
├── prognostics_engine.py      # NEW: ML predictions
└── metabolism_monitor.py      # NEW: Resource monitoring

systems/evolution_daemon/tests/
├── test_v13_data_structures.py  # NEW
├── test_prognostics_store.py    # NEW
├── test_prognostics_engine.py   # NEW
└── test_metabolism_monitor.py   # NEW
```

## Usage

```python
from systems.evolution_daemon.safety import (
    RTSDoctor,
    PrognosticsEngine,
    MetabolismMonitor
)

# With prognostics enabled
doctor = RTSDoctor(prognostics_db_path="prognostics.db")

# Check and log integrity
result = await doctor.check_integrity("file.rts.png", "file.rts.meta.json")

# Predict future health
prediction = doctor.predict_health("file.rts.png", horizon_hours=24)

# Monitor system resources
monitor = MetabolismMonitor()
state = monitor.check()
if monitor.should_defer_task(state, "model_training"):
    # Wait for better conditions
    pass
```

## Dependencies Added

| Package | Version | Purpose |
|---------|---------|---------|
| scikit-learn | >=1.3.0 | Linear regression model |
| psutil | >=5.9.0 | System resource monitoring |

## Design Documents

- [V13 Design](../../docs/plans/2026-02-16-evolution-daemon-v13-design.md)
- [V13 Implementation Plan](../../docs/plans/2026-02-16-evolution-daemon-v13-implementation.md)

---

## WebMCP Integration

**Status**: ✅ Complete

| Tool Name | Purpose | Priority |
|-----------|---------|----------|
| safety_check_rts_integrity | SHA256/Hilbert/entropy checks | High |
| safety_predict_health | ML degradation prediction | High |
| safety_get_metabolism | System resource state | High |
| safety_heal_rts | Trigger RTS healing | Medium |
| safety_get_prognostics | Historical data | Low |

**Key Files**:
- `systems/visual_shell/web/evolution_safety_bridge.js` - Browser-to-Python bridge
- `systems/evolution_daemon/api/safety_http_server.py` - FastAPI HTTP server (port 31338)
- `systems/visual_shell/web/webmcp_bridge.js` - WebMCP tool definitions

**Architecture**:
```
AI Agent → WebMCP → evolution_safety_bridge.js → HTTP :31338 → safety_http_server.py → V13 Components
```

**AdaptiveRateLimiter**:
- Reads `window.EvolutionSafetyBridge.safety_get_metabolism()`
- Reduces rate limits when `throttle_level` is 'moderate' (50%) or 'aggressive' (90%)
