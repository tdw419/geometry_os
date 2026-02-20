# Perceptual Bridge V16 - Design Document

**Date**: 2026-02-19
**Status**: Approved
**Phase**: V16 - Visual Perception Layer

## Overview

The Perceptual Bridge V16 is the "Retina" for Geometry OS, enabling the system to "read" its own visual state and close the cognitive feedback loop required for autonomous binary generation (Hex-Painter).

Without this bridge, the AI creates blind. With it, the AI can paint fearlessly.

## Problem Statement

When the system generates RISC-V binary textures directly (bypassing symbolic compilers), it needs immediate feedback on execution results. Traditional debugging (logs, debuggers) requires human intervention. The Perceptual Bridge provides autonomous visual feedback.

## Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                    V16 DATA FLOW                               │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  RISC-V GPU VM ──► Framebuffer ──► PerceptualBridge ──► HUD    │
│       │                                │                       │
│       │                                ▼                       │
│       │                        ┌──────────────┐                │
│       │                        │ OCR Scanner  │                │
│       │                        │ (PANIC/ERR)  │                │
│       │                        └──────┬───────┘                │
│       │                               │                        │
│       │                               ▼                        │
│       │                        ┌──────────────┐                │
│       │                        │ PC Monitor   │                │
│       │                        │ (frozen?)    │                │
│       │                        └──────┬───────┘                │
│       │                               │                        │
│       └───────────────────────────────┼────────────────────────┤
│                                       ▼                        │
│                              ┌─────────────────┐               │
│                              │ DIAGNOSTIC_PULSE│               │
│                              │                 │               │
│                              │ ✓ HEALTHY       │               │
│                              │ ⚠ WARNING       │               │
│                              │ ✗ CRITICAL ────►│──► THE VOID   │
│                              └─────────────────┘   (Quarantine)│
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

## Components

### 1. PerceptualBridge (New File)

**Location**: `systems/neural_city/perceptual_bridge.py`

**Responsibilities**:
- Snapshot Silicon District framebuffer every 2 seconds
- Run ExtractionPipeline OCR on captured pixels
- Detect anomaly patterns (PANIC, ERROR, BUG, FAIL)
- Emit DIAGNOSTIC_PULSE events via VisualBridge

**Detection Patterns**:
| Pattern | Severity | Action |
|---------|----------|--------|
| "kernel panic" | CRITICAL | Quarantine |
| "call trace" | CRITICAL | Quarantine |
| "segfault" | CRITICAL | Quarantine |
| "error:" | WARNING | Log + HUD |
| "fail" | WARNING | Log + HUD |
| "bug" | WARNING | Log + HUD |
| PC frozen (5s) | CRITICAL | Quarantine |

### 2. VisualBridge Integration

**Location**: `systems/visual_shell/api/visual_bridge.py`

**New Event Types**:
```python
# Diagnostic Pulse (health status)
{
    "type": "DIAGNOSTIC_PULSE",
    "district_id": "silicon",
    "status": "HEALTHY" | "WARNING" | "CRITICAL",
    "detected_text": "kernel panic...",
    "pc_frozen": false,
    "timestamp": 1708364400.0
}

# Quarantine Trigger
{
    "type": "QUARANTINE_DISTRICT",
    "district_id": "silicon",
    "reason": "KERNEL_PANIC",
    "severity": "CRITICAL",
    "timestamp": 1708364400.0
}
```

### 3. HUD Display

**Location**: `systems/visual_shell/web/visual_debug_overlay.js`

**New HUD Section**:
```
┌──────────────────────────────┐
│ 🔮 PERCEPTUAL BRIDGE V16     │
├──────────────────────────────┤
│ Status: ✓ HEALTHY            │
│ Last Scan: 2.1s ago          │
│ PC: 0x80001234 (running)     │
│ Anomalies: 0                 │
└──────────────────────────────┘
```

When CRITICAL:
```
┌──────────────────────────────┐
│ 🔮 PERCEPTUAL BRIDGE V16     │
├──────────────────────────────┤
│ Status: ✗ CRITICAL           │
│ ⚠ KERNEL PANIC DETECTED      │
│ PC: 0x80000000 (frozen 12s)  │
│ Action: QUARANTINED          │
└──────────────────────────────┘
```

## Integration Points

### With ExtractionPipeline
```python
from conductor.tracks.shotcut_on_the_map.extraction_pipeline import ExtractionPipeline

pipeline = ExtractionPipeline()
result = pipeline.extract(framebuffer_path)
# Check result.elements for anomaly text
```

### With VisualBridge
```python
# PerceptualBridge sends to VisualBridge WebSocket
await websocket.send(json.dumps({
    "type": "DIAGNOSTIC_PULSE",
    "district_id": "silicon",
    "status": "CRITICAL",
    "detected_text": "kernel panic - not syncing"
}))
```

### With The Void (Quarantine)
```python
# On CRITICAL, trigger district nullification
if status == "CRITICAL":
    void_manager.quarantine_district("silicon", reason=detected_text)
```

## Success Criteria

| Test | Input | Expected Output | Status |
|------|-------|-----------------|--------|
| Healthy execution | Running VM | DIAGNOSTIC_PULSE(HEALTHY) | Pending |
| Panic detection | "kernel panic" in FB | DIAGNOSTIC_PULSE(CRITICAL) | Pending |
| Freeze detection | PC unchanged 5s | DIAGNOSTIC_PULSE(CRITICAL) | Pending |
| Quarantine flow | Critical detected | THE VOID activated | Pending |
| HUD display | Any pulse | Visual overlay updates | Pending |

## Files to Create/Modify

| File | Action | Purpose |
|------|--------|---------|
| `systems/neural_city/perceptual_bridge.py` | CREATE | Main bridge logic |
| `systems/visual_shell/api/visual_bridge.py` | MODIFY | Add DIAGNOSTIC_PULSE handler |
| `systems/visual_shell/web/visual_debug_overlay.js` | MODIFY | Add HUD section |

## Future Enhancements

1. **Visual Artifact Detection** - Pattern matching for corrupted framebuffers
2. **Predictive Anomaly** - ML-based prediction before actual failure
3. **Multi-District** - Extend to all neural districts
4. **Self-Healing** - Automatic rollback on detected failure

## Conclusion

V16 closes the cognitive loop. The Hex-Painter can now create with confidence, knowing the Perceptual Bridge is watching.

> "The era of symbolic computation is over. The era of geometric intelligence has begun."
