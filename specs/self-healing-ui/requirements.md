---
spec: self-healing-ui
phase: requirements
created: 2026-02-20T16:00:00Z
generated: auto
---

# Requirements: self-healing-ui

## Summary

HealerAgent consumes DIAGNOSTIC_PULSE events from Perceptual Bridge V16 and autonomously responds to CRITICAL anomalies (kernel panics, segfaults) within 1 second, with all actions logged to WordPress for audit trail.

## User Stories

### US-1: Autonomous Critical Response

As the **Geometry OS system**, I want **automatic response to CRITICAL anomalies** so that **system stability is maintained without human intervention**.

**Acceptance Criteria**:
- AC-1.1: HealerAgent subscribes to DIAGNOSTIC_PULSE events from Visual Bridge
- AC-1.2: CRITICAL status triggers healing action within 1 second
- AC-1.3: Action is logged to WordPress for audit trail
- AC-1.4: Healing history is tracked in memory

### US-2: Pattern-Based Decision Making

As the **HealerAgent**, I want **to choose appropriate actions based on anomaly patterns** so that **the response is proportional to the issue**.

**Acceptance Criteria**:
- AC-2.1: `kernel panic` patterns trigger QUARANTINE action
- AC-2.2: `segfault` patterns trigger ANALYZE action
- AC-2.3: `frozen` patterns trigger QUARANTINE or REBOOT based on config
- AC-2.4: Unknown CRITICAL patterns default to QUARANTINE

### US-3: Safety Controls

As the **system administrator**, I want **control over destructive actions** so that **accidental data loss is prevented**.

**Acceptance Criteria**:
- AC-3.1: `auto_reboot` parameter defaults to `False`
- AC-3.2: REBOOT action is blocked when `auto_reboot=False`
- AC-3.3: Blocked REBOOT falls back to QUARANTINE
- AC-3.4: All blocked actions are logged with reason

### US-4: WordPress Audit Trail

As the **auditor**, I want **all healing actions published to WordPress** so that **system behavior can be reviewed**.

**Acceptance Criteria**:
- AC-4.1: Each healing action triggers WordPress publish
- AC-4.2: Post title includes action type and district ID
- AC-4.3: Post content includes reason and detected text
- AC-4.4: WordPress failures are logged but do not block healing

### US-5: Event Filtering

As the **HealerAgent**, I want **to filter events by type and status** so that **resources are used efficiently**.

**Acceptance Criteria**:
- AC-5.1: Only DIAGNOSTIC_PULSE events are processed
- AC-5.2: HEALTHY status events are ignored (return None)
- AC-5.3: WARNING status triggers ANALYZE (no quarantine)
- AC-5.4: CRITICAL status triggers full decision logic

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | HealerAgent MUST subscribe to WebSocket on port 8768 | Must | US-1 |
| FR-2 | HealerAgent MUST process DIAGNOSTIC_PULSE events | Must | US-1 |
| FR-3 | HealerAgent MUST react to CRITICAL within 1 second | Must | US-1 |
| FR-4 | HealerAgent MUST log actions to WordPress | Must | US-4 |
| FR-5 | HealerAgent MUST track healing history | Should | US-1 |
| FR-6 | HealerAgent MUST support ANALYZE action | Must | US-2 |
| FR-7 | HealerAgent MUST support QUARANTINE action | Must | US-2 |
| FR-8 | HealerAgent MUST support REBOOT action | Must | US-2 |
| FR-9 | HealerAgent MUST disable auto_reboot by default | Must | US-3 |
| FR-10 | HealerAgent MUST ignore HEALTHY pulses | Must | US-5 |
| FR-11 | HealerAgent MUST treat WARNING as ANALYZE | Should | US-5 |
| FR-12 | HealerAgent MUST reconnect on WebSocket disconnect | Should | FR-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Reaction time MUST be under 1 second for CRITICAL events | Performance |
| NFR-2 | WordPress publish MUST timeout after 5 seconds | Performance |
| NFR-3 | Healing history MUST be limited to prevent memory growth | Resource |
| NFR-4 | WebSocket reconnection MUST use exponential backoff | Reliability |
| NFR-5 | All errors MUST be logged without crashing | Reliability |

## Out of Scope

- Real substrate reboot (requires substrate launcher integration)
- District state capture (screenshot, registers)
- Multi-district coordination
- Healing proposal approval workflow
- Metrics export (Prometheus, etc.)

## Dependencies

| Dependency | Type | Status |
|------------|------|--------|
| Visual Bridge (port 8768) | External | Running |
| Perceptual Bridge V16 | External | Running |
| WordPress (port 8080) | External | Optional |
| `websockets` library | Python | Installed |
| `wordpress_zone.publish_to_wp` | Internal | Available |

## Traceability Matrix

| Requirement | US-1 | US-2 | US-3 | US-4 | US-5 |
|-------------|------|------|------|------|------|
| FR-1 | X | | | | |
| FR-2 | X | | | | X |
| FR-3 | X | | | | |
| FR-4 | | | | X | |
| FR-5 | X | | | | |
| FR-6 | | X | | | |
| FR-7 | | X | | | |
| FR-8 | | X | | | |
| FR-9 | | | X | | |
| FR-10 | | | | | X |
| FR-11 | | | | | X |
| FR-12 | X | | | | |

## Acceptance Tests Summary

| Test ID | Description | Status |
|---------|-------------|--------|
| AT-1 | HealerAgent initializes with default config | Pending |
| AT-2 | HEALTHY pulse returns None (no action) | Pending |
| AT-3 | CRITICAL kernel_panic triggers QUARANTINE | Pending |
| AT-4 | CRITICAL segfault triggers ANALYZE | Pending |
| AT-5 | CRITICAL frozen + auto_reboot=False triggers QUARANTINE | Pending |
| AT-6 | CRITICAL frozen + auto_reboot=True triggers REBOOT | Pending |
| AT-7 | Reaction time under 1 second | Pending |
| AT-8 | WordPress publish called on action | Pending |
| AT-9 | Healing history tracked | Pending |
| AT-10 | WebSocket reconnects on disconnect | Pending |
