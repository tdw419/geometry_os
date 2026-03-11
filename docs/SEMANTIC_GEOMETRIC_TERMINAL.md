# Semantic-Geometric Terminal Integration

## Overview

The Semantic-Geometric Terminal connects WordPress semantic publishing to the PixelRTS v3 geometric terminal with Phase 30.8 damage tracking for efficient visual feedback.

## Data Flow

```
WordPress Publish (AI Agent)
         │
         ▼
   publish_to_wp.py
         │
         ▼ WebSocket (port 8768)
         │
   Visual Bridge
         │
         ├─► Browser HUD (WORDPRESS_PUBLISH)
         │
         └─► Geometric Terminal (terminal_notification)
                  │
                  ▼
            DamageTracker
                  │
                  ▼
               GPU RAM Texture
```

## Components

### 1. SemanticNotificationBridge (Python)

**File:** `systems/visual_shell/api/semantic_notification_bridge.py`

Transforms WordPress publications into terminal-ready notifications with automatic color coding.

```python
from systems.visual_shell.api.semantic_notification_bridge import (
    SemanticNotificationBridge,
    NotificationEvent,
)

bridge = SemanticNotificationBridge()
event = NotificationEvent(
    title="Evolution Complete",
    content="PAS score reached 0.99",
    url="http://localhost:8080/?p=123"
)

# Get formatted text for terminal
formatted = bridge.format_for_terminal(event)
# Output: "[14:32:05] Evolution Complete - PAS score reached 0.99"

# Get WebSocket opcode for terminal
opcode = bridge.to_terminal_opcode(event)
# Output: {"type": "terminal_notification", "text": "...", "color": 10, "flags": 1}
```

### 2. GeometricTerminalBuffer.write_notification (Rust)

**File:** `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs`

Writes timestamped notifications to the geometric terminal buffer with damage tracking.

```rust
let mut buf = GeometricTerminalBuffer::new(80, 24);

// Write notification with auto-timestamp
buf.write_notification("Evolution Complete", 10); // Bright green

// Write notification with explicit timestamp (for testing)
buf.write_notification_with_time("Test", "14:32:05", 11); // Bright yellow
```

### 3. Visual Bridge Integration

**File:** `systems/visual_shell/api/visual_bridge.py`

The `wordpress_publish` handler now broadcasts to both browser and terminal:

```python
# 14b. WordPress Semantic Publishing (Memory District)
elif msg_type == 'wordpress_publish':
    # ... create NotificationEvent ...
    terminal_op = self.semantic_bridge.to_terminal_opcode(event)
    await self._broadcast(terminal_op)
```

## Color Codes

| Event Type | Color Index | ANSI Color |
|------------|-------------|------------|
| Evolution/Success | 10 | Bright Green |
| Error/Failure | 9 | Bright Red |
| Warning | 11 | Bright Yellow |
| Info/Status | 14 | Bright Cyan |
| Default | 12 | Bright Blue |

Color assignment is automatic based on title keywords:
- **Error:** "error", "failed", "crash", "critical"
- **Success:** "breakthrough", "success", "complete", "evolution"
- **Warning:** "warning", "caution", "alert"
- **Info:** "info", "status", "update", "metric"

## Usage

### From Python (AI Agent)

```python
from wordpress_zone.publish_to_wp import publish_to_wordpress

publish_to_wordpress(
    title="Evolution Complete: Generation 500",
    content="PAS score reached 0.99. Neural kernel stability verified.",
    post_type="post"
)
```

The terminal will automatically show:
```
[14:32:05] Evolution Complete: Generation 500 - PAS score reached 0.99...
```

### Testing

```bash
# Unit tests (Python)
python3 tests/test_semantic_notification_bridge.py

# Unit tests (Rust)
cd systems/infinite_map_rs
cargo test --features hypervisor --lib geometric_bridge

# E2E test (requires running bridge)
python3 systems/visual_shell/api/visual_bridge.py &
python3 tests/test_semantic_terminal_e2e.py
```

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     WORDPRESS DISTRICT                           │
│  (Agent publishes evolution breakthrough)                        │
└────────────────────────┬────────────────────────────────────────┘
                         │ POST to ai-publisher.php
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                   SEMANTIC PULSE BRIDGE                          │
│  publish_to_wp.py → visual_bridge.py                            │
│  Triggers: type: "wordpress_publish" → terminal visual pulse    │
└────────────────────────┬────────────────────────────────────────┘
                         │ WebSocket broadcast
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│              GEOMETRIC TERMINAL (PixelRTS v3)                    │
│  • Receives pulse event                                          │
│  • Executes write_notification with color coding                │
│  • Hilbert-mapped cells → RAM texture                           │
│  • DamageTracker marks only changed cells                        │
└────────────────────────┬────────────────────────────────────────┘
                         │ GPU render
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                 INFINITE MAP DISPLAY                             │
│  Terminal tile shows: "[HH:MM:SS] Event Title - Content"       │
│  District pulses on map                                          │
└─────────────────────────────────────────────────────────────────┘
```

## Files Modified

| File | Changes |
|------|---------|
| `systems/visual_shell/api/semantic_notification_bridge.py` | New - Semantic bridge |
| `systems/visual_shell/api/visual_bridge.py` | Added semantic_bridge integration |
| `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs` | Added write_notification |
| `tests/test_semantic_notification_bridge.py` | New - Python tests |
| `tests/test_semantic_terminal_e2e.py` | New - E2E tests |

## Test Summary

| Test Suite | Count | Status |
|------------|-------|--------|
| Python Unit | 6 | ✅ Passing |
| Rust Unit | 6 | ✅ Passing |
| E2E | 2 | ✅ Passing |

---

**"The Screen is the Hard Drive. The Website is the Memory. The Terminal is the Conscience."**
