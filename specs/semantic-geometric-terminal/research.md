---
spec: semantic-geometric-terminal
phase: research
created: 2026-02-20
generated: auto
---

# Research: semantic-geometric-terminal

## Executive Summary

Integration connects WordPress semantic publishing (AI agent output) to PixelRTS v3 geometric terminal with Phase 30.8 damage tracking. Leverages existing Visual Bridge WebSocket hub, Rust GeometricTerminalBuffer, and DamageTracker for efficient GPU updates.

## Codebase Analysis

### Existing Patterns

| Component | Location | Status |
|-----------|----------|--------|
| GeometricTerminalBuffer | `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs` | Ready - needs notification method |
| DamageTracker | `systems/infinite_map_rs/src/damage_tracker.rs` | Ready - DirtyRect, merge, Hilbert |
| Visual Bridge | `systems/visual_shell/api/visual_bridge.py` | Ready - wordpress_publish handler at line 308 |
| WordPress Publisher | `wordpress_zone/publish_to_wp.py` | Ready - sends via WebSocket |

### Dependencies

- **Rust**: `fast_hilbert` crate for spatial mapping
- **Python**: `websockets`, `dataclasses`, `re` for HTML stripping
- **WebSocket**: Port 8768 for Visual Bridge hub

### Constraints

1. Terminal width fixed at 80 columns
2. Color palette: 16-color ANSI (bright variants 8-15)
3. Notifications must fit single line
4. Damage tracking requires Hilbert-compatible coordinates

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, wiring needed |
| Effort Estimate | S | 7 small tasks, ~2 hours total |
| Risk Level | Low | Non-breaking additions only |

## Recommendations

1. Add `write_notification` method to GeometricTerminalBuffer (TDD approach)
2. Create SemanticNotificationBridge Python class for formatting
3. Wire Visual Bridge to call bridge on wordpress_publish event
4. Use DirtyRect for GPU-efficient partial updates
