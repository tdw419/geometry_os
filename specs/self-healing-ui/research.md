---
spec: self-healing-ui
phase: research
created: 2026-02-20T16:00:00Z
generated: auto
---

# Research: self-healing-ui

## Executive Summary

HealerAgent implementation is highly feasible. All infrastructure exists: Perceptual Bridge V16 (DIAGNOSTIC_PULSE producer), Visual Bridge (WebSocket hub on port 8768), AnomalyDetector (pattern matching), and WordPress integration (audit logging). Implementation requires new HealerAgent class subscribing to existing events, decision logic, and WordPress publishing. Estimated effort: Small (4-6 hours).

## Codebase Analysis

### Existing Patterns

**Perceptual Bridge V16** (`systems/neural_city/perceptual_bridge.py`)
- Produces DIAGNOSTIC_PULSE events with HEALTHY/WARNING/CRITICAL status
- AnomalyDetector scans text using regex patterns
- Broadcasts via WebSocket to Visual Bridge

**Visual Bridge** (`systems/visual_shell/api/visual_bridge.py`)
- Central hub on port 8768
- Already routes DIAGNOSTIC_PULSE events (lines 207-234)
- Broadcasts QUARANTINE_DISTRICT on CRITICAL status
- Pattern: `_broadcast()` to all connected clients

**AnomalyDetector** (`systems/neural_city/perceptual_bridge.py:40-113`)
```python
CRITICAL_PATTERNS = [
    r"kernel\s+panic",
    r"segfault",
    r"segmentation\s+fault",
    r"not\s+syncing",
]

WARNING_PATTERNS = [
    r"error\s*:",
    r"failed",
    r"warning\s*:",
]
```

**WordPress Publishing** (`wordpress_zone/publish_to_wp.py`)
- `publish_to_wordpress(title, content, post_type)` available
- Sends visual pulse to Visual Bridge after publish
- HTTP POST to `http://localhost:8080/ai-publisher.php`

### Dependencies

| Dependency | Status | Usage |
|------------|--------|-------|
| `websockets` | Installed | WebSocket client for HealerAgent |
| `asyncio` | Stdlib | Async event handling |
| `wordpress_zone.publish_to_wp` | Available | Audit logging |

### Constraints

1. **Reaction threshold**: Must react within 1 second of CRITICAL pulse
2. **Safety**: `auto_reboot=False` by default (prevent data loss)
3. **Event filtering**: Only process DIAGNOSTIC_PULSE type
4. **WordPress availability**: Graceful degradation if WordPress down

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | **High** | All infrastructure exists |
| Effort Estimate | **Small** | 5 tasks, ~45 min each per plan |
| Risk Level | **Low** | Pattern established by PerceptualBridge |

### Risk Breakdown

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| WebSocket disconnect | Medium | Low | Reconnect loop with backoff |
| WordPress timeout | Medium | Low | Graceful fallback, log error |
| Action execution latency | Low | High | Profile and optimize critical path |
| Duplicate heal actions | Low | Medium | Track healing history, debounce |

## Integration Architecture

```
┌────────────────────┐  DIAGNOSTIC_PULSE   ┌─────────────────┐
│ PerceptualBridge   │ ──────────────────► │  Visual Bridge  │
│ (silicon district) │                     │  (port 8768)    │
└────────────────────┘                     └────────┬────────┘
                                                    │
                                           subscribe
                                                    │
                                                    ▼
                                           ┌─────────────────┐
                                           │  HealerAgent    │
                                           │  (swarm/)       │
                                           └────────┬────────┘
                                                    │
                        ┌───────────────────────────┼───────────────────────────┐
                        │                           │                           │
                        ▼                           ▼                           ▼
                 ┌─────────────┐            ┌─────────────┐            ┌─────────────┐
                 │   ANALYZE   │            │ QUARANTINE  │            │   REBOOT    │
                 │  (segfault) │            │ (panic)     │            │  (frozen)   │
                 └──────┬──────┘            └──────┬──────┘            └──────┬──────┘
                        │                           │                           │
                        └───────────────────────────┼───────────────────────────┘
                                                    │
                                                    ▼
                                           ┌─────────────────┐
                                           │   WordPress     │
                                           │  (audit trail)  │
                                           └─────────────────┘
```

## Decision Logic

HealerAgent decision matrix based on CRITICAL patterns:

| Pattern Match | Action | Rationale |
|---------------|--------|-----------|
| `kernel panic` | QUARANTINE | Prevent cascade to other districts |
| `not syncing` | QUARANTINE | System unstable, isolate |
| `segfault` | ANALYZE | May be recoverable, capture state |
| `segmentation fault` | ANALYZE | Memory error, needs investigation |
| `frozen` + auto_reboot=True | REBOOT | Deadlock, restart needed |
| `frozen` + auto_reboot=False | QUARANTINE | Deadlock, safe isolation |
| Unknown CRITICAL | QUARANTINE | Safe default |

## Technical Details

### DIAGNOSTIC_PULSE Event Schema

```json
{
    "type": "DIAGNOSTIC_PULSE",
    "district_id": "silicon",
    "status": "CRITICAL",
    "matched_pattern": "kernel panic",
    "detected_text": "Kernel panic - not syncing: VFS",
    "timestamp": 1708400000.0
}
```

### Healing Result Schema

```json
{
    "action": "quarantine",
    "district_id": "silicon",
    "reason": "Kernel panic detected: kernel panic",
    "timestamp": 1708400000.5,
    "success": true,
    "details": {
        "elapsed_seconds": 0.127,
        "detected_text": "Kernel panic..."
    }
}
```

### WebSocket Subscription Flow

1. HealerAgent connects to `ws://localhost:8768`
2. Sends subscription: `{"type": "subscribe", "events": ["DIAGNOSTIC_PULSE"]}`
3. Receives DIAGNOSTIC_PULSE events
4. Filters for CRITICAL status
5. Executes action within 1s threshold
6. Logs to WordPress for audit

## Existing Code to Leverage

| File | Reusable Component |
|------|-------------------|
| `perceptual_bridge.py:40-113` | AnomalyDetector CRITICAL/WARNING patterns |
| `visual_bridge.py:207-234` | DIAGNOSTIC_PULSE event routing |
| `publish_to_wp.py:30-52` | WordPress publishing with error handling |
| `perceptual_bridge.py:157-177` | WebSocket connection pattern with reconnect |

## Recommendations

1. **Follow PerceptualBridge pattern** - Same WebSocket client approach with reconnect loop
2. **Use dataclasses** - HealingResult and HealingAction enum from plan
3. **Mock WordPress in tests** - AsyncMock for `_publish_to_wordpress`
4. **Track healing history** - In-memory list for debugging, limit to last 100
5. **Add metrics** - Track reaction times, action counts per type

## Sources

| Source | Key Point |
|--------|-----------|
| `perceptual_bridge.py:49-57` | CRITICAL_PATTERNS regex definitions |
| `visual_bridge.py:207-234` | DIAGNOSTIC_PULSE and QUARANTINE_DISTRICT handling |
| `publish_to_wp.py:30-52` | WordPress publishing implementation |
| `docs/plans/2026-02-20-self-healing-ui-v16.md` | Full implementation plan with tasks |
