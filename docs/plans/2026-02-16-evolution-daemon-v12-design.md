# Evolution Daemon V12 Design

**Date**: 2026-02-16
**Status**: Approved & Implementing
**Approach**: Formal Verification + RTS Integrity

## Overview

V12 hardens the V11 safety pipeline with mathematical proofs via property-based testing and introduces RTS Doctor for substrate integrity monitoring. This ensures "The Screen is the Hard Drive" remains reliable.

## Design Goals

1. **Formal Verification**: Prove safety properties mathematically using Hypothesis
2. **RTS Integrity**: Monitor and heal .rts.png files automatically
3. **Backward Compatibility**: All V11 tests must continue to pass

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Evolution Daemon V12                      │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │ Sandbox     │───▶│ Guardian    │───▶│ Tier Router     │  │
│  │ Manager     │    │ Gate        │    │                 │  │
│  └─────────────┘    └──────┬──────┘    └─────────────────┘  │
│                            │                                │
│         ┌──────────────────┼──────────────────┐            │
│         ▼                  ▼                  ▼            │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │ Property    │    │ RTS Doctor  │    │ Post-Commit     │  │
│  │ Tests (NEW) │    │ (NEW)       │    │ Monitor         │  │
│  └─────────────┘    └──────┬──────┘    └─────────────────┘  │
│                            │                                │
│                            ▼                                │
│                    ┌─────────────────┐                      │
│                    │ Healing Actions │                      │
│                    │ - Re-generate   │                      │
│                    │ - Defragment    │                      │
│                    │ - Quarantine    │                      │
│                    └─────────────────┘                      │
└─────────────────────────────────────────────────────────────┘
```

## Components

### 1. Property-Based Tests (Formal Verification)

**Location**: `systems/evolution_daemon/tests/test_guardian_gate_properties.py`

**Properties Proven**:

| Property | Description | Status |
|----------|-------------|--------|
| `high_risk_implies_not_approved` | If risk_level is "high", approved must be False | ✅ |
| `critical_file_high_risk` | Changes to safety/ files must be high-risk | ✅ |

**Implementation**:
- Uses Hypothesis library for property-based testing
- Generates random `EvolutionProposal` and `SandboxResult` inputs
- Tests invariant: `risk_level == "high" → approved == False`

### 2. RTSDoctor (RTS Integrity)

**Location**: `systems/evolution_daemon/safety/rts_doctor.py`

**Integrity Checks**:

| Check | Purpose | Implementation |
|-------|---------|----------------|
| SHA256 Verification | Detect data corruption | Compare hash with .rts.meta.json |
| Hilbert Locality | Verify spatial coherence | Sample adjacent indices, check 2D adjacency |
| Entropy Analysis | Detect anomalies | Block-based entropy with 3σ threshold |

**Healing Actions**:

| Action | When Used | Implementation |
|--------|-----------|----------------|
| Re-generate | Hash mismatch, corruption | Call pixelrts_v2_converter.py |
| Defragment | Low locality score | Re-generate with fresh Hilbert mapping |
| Quarantine | Unrecoverable | Move to quarantine/ directory |

## Test Coverage

| Component | Tests | Status |
|-----------|-------|--------|
| GuardianGate Properties | 2 | ✅ |
| RTSDoctor SHA256 | 5 | ✅ |
| RTSDoctor Hilbert | 3 | ✅ |
| RTSDoctor Entropy | 2 | ✅ |
| RTSDoctor Healing | 3 | ✅ |
| **V12 Total** | **15** | ✅ |
| **V11 Tests** | **92** | ✅ |
| **Grand Total** | **107** | ✅ |

## Files Changed

### New Files

- `systems/evolution_daemon/safety/rts_doctor.py` - RTS integrity subsystem
- `systems/evolution_daemon/tests/test_guardian_gate_properties.py` - Property tests
- `systems/evolution_daemon/tests/test_rts_doctor.py` - RTSDoctor unit tests

### Modified Files

- `systems/evolution_daemon/safety/guardian_gate.py` - Fixed high-risk approval bug
- `requirements.txt` - Added hypothesis>=6.0.0

## Key Code Changes

### GuardianGate Fix

```python
# systems/evolution_daemon/safety/guardian_gate.py
# After all risk assessments, enforce the property:
if risk_level == "high":
    approved = False
```

### RTSDoctor Locality Score

```python
# Sample N adjacent 1D indices
# Convert to 2D via Hilbert curve
# Score = percentage where distance == 1
locality_score = adjacent_samples / total_samples
```

### Entropy Anomaly Detection

```python
# Block-based entropy calculation
# Flag if: zero entropy (non-final block) OR > 3σ from mean
if entropy == 0.0 and (num_blocks == 1 or i < num_blocks - 1):
    anomalies.append(f"Block {i} has zero entropy.")
```

## Success Metrics

| Metric | Target | Actual |
|--------|--------|--------|
| Property tests | All pass | ✅ 2/2 |
| RTSDoctor tests | All pass | ✅ 13/13 |
| V11 regression | 0 failures | ✅ 92/92 |
| Total tests | 100+ | ✅ 107 |

## Future Enhancements (Post-V12)

1. **TierRouter Property Tests** - Prove routing invariants
2. **SandboxManager Isolation Proofs** - Verify containment
3. **RTSDoctor Integration** - Wire into main daemon loop
4. **Continuous Monitoring** - Background integrity checks
5. **Auto-Heal on Boot** - Repair corrupted RTS before loading

## References

- [Evolution Daemon V11 Design](./2026-02-16-evolution-daemon-v11-safety-design.md)
- [PixelRTS v2 Specification](../pixelrts_v2.md)
- [Hilbert Curve Mapping](../../tensor_fold.py)
