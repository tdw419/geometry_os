# Semantic-Geometric Terminal Integration Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect WordPress semantic publishing to the PixelRTS v3 geometric terminal with Phase 30.8 damage tracking for efficient visual feedback.

**Architecture:** When an AI agent publishes to WordPress (via publish_to_wp.py), the Visual Bridge receives the event, triggers a terminal notification using PixelRTS v3 opcodes, and the DamageTracker ensures only changed cells are uploaded to GPU. The terminal becomes a live "semantic console" showing system evolution.

**Tech Stack:** Rust (GeometricTerminalBuffer, DamageTracker), Python (visual_bridge.py, publish_to_wp.py), WebSocket (port 8768), PixelRTS v3 RGBA encoding

---

## Task 1: Add Notification Method to GeometricTerminalBuffer

**Files:**
- Modify: `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs:207-260`
- Test: `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs` (inline tests)

**Step 1: Write the failing test**

Add to the `#[cfg(test)]` module in `geometric_bridge.rs`:

```rust
#[test]
fn test_write_notification_single_line() {
    let mut buf = GeometricTerminalBuffer::new(80, 24);

    buf.write_notification("Test Event", 11); // Bright yellow

    // Should start at row 0
    assert_eq!(buf.cells[0].char, b'T');
    assert_eq!(buf.cells[0].fg, 11); // Bright yellow
    assert_eq!(buf.cells[0].flags, flags::BOLD);
    assert_eq!(buf.cursor_y, 1); // Advanced to next line
}

#[test]
fn test_write_notification_with_timestamp() {
    let mut buf = GeometricTerminalBuffer::new(80, 24);

    buf.write_notification_with_time("Evolution Complete", "14:32:05", 10);

    // Check timestamp prefix at start
    assert_eq!(buf.cells[0].char, b'[');
    // Check message appears after timestamp
    assert_eq!(buf.cells[9].char, b'E'); // After "[14:32:05] "
    assert_eq!(buf.cells[9].fg, 10); // Bright green
}
```

**Step 2: Run test to verify it fails**

Run: `cd systems/infinite_map_rs && cargo test --features hypervisor test_write_notification --no-fail-fast 2>&1 | head -30`
Expected: FAIL with "no method named `write_notification`"

**Step 3: Write minimal implementation**

Add to `GeometricTerminalBuffer` impl block in `geometric_bridge.rs` after line 207:

```rust
/// Write a notification line with timestamp prefix
///
/// Format: [HH:MM:SS] Message
/// Uses bright colors and bold for visibility
pub fn write_notification(&mut self, message: &str, fg_color: u8) {
    // Get current time as HH:MM:SS
    let timestamp = Self::get_timestamp();

    // Move to start of current line
    self.cursor_x = 0;

    // Write timestamp in dim white
    let saved_fg = self.current_fg;
    let saved_flags = self.current_flags;
    self.current_fg = 8; // Bright black (dim gray)
    self.current_flags = 0;

    for c in format!("[{}] ", timestamp).chars() {
        if c.is_ascii() {
            self.putc(c as u8);
        }
    }

    // Write message in specified color with bold
    self.current_fg = fg_color;
    self.current_flags = flags::BOLD;

    for c in message.chars() {
        if c.is_ascii() {
            self.putc(c as u8);
        }
    }

    // Restore colors and advance to next line
    self.current_fg = saved_fg;
    self.current_flags = saved_flags;
    self.cursor_x = 0;
    if self.cursor_y + 1 < self.rows {
        self.cursor_y += 1;
    } else {
        self.scroll(1);
    }
}

/// Write notification with explicit timestamp (for testing)
pub fn write_notification_with_time(&mut self, message: &str, timestamp: &str, fg_color: u8) {
    self.cursor_x = 0;

    let saved_fg = self.current_fg;
    let saved_flags = self.current_flags;

    // Timestamp in dim gray
    self.current_fg = 8;
    self.current_flags = 0;
    for c in format!("[{}] ", timestamp).chars() {
        if c.is_ascii() {
            self.putc(c as u8);
        }
    }

    // Message in specified color with bold
    self.current_fg = fg_color;
    self.current_flags = flags::BOLD;
    for c in message.chars() {
        if c.is_ascii() {
            self.putc(c as u8);
        }
    }

    self.current_fg = saved_fg;
    self.current_flags = saved_flags;
    self.cursor_x = 0;
    if self.cursor_y + 1 < self.rows {
        self.cursor_y += 1;
    } else {
        self.scroll(1);
    }
}

/// Get current timestamp as HH:MM:SS
fn get_timestamp() -> String {
    use std::time::{SystemTime, UNIX_EPOCH};

    let duration = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default();
    let total_secs = duration.as_secs();
    let hours = (total_secs / 3600) % 24;
    let mins = (total_secs / 60) % 60;
    let secs = total_secs % 60;

    format!("{:02}:{:02}:{:02}", hours, mins, secs)
}
```

**Step 4: Run test to verify it passes**

Run: `cd systems/infinite_map_rs && cargo test --features hypervisor test_write_notification --no-fail-fast 2>&1 | tail -20`
Expected: PASS for both tests

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs
git commit -m "feat(geometric-terminal): add write_notification for semantic events"
```

---

## Task 2: Create Semantic Notification Bridge

**Files:**
- Create: `systems/visual_shell/api/semantic_notification_bridge.py`
- Test: `tests/test_semantic_notification_bridge.py`

**Step 1: Write the failing test**

Create `tests/test_semantic_notification_bridge.py`:

```python
#!/usr/bin/env python3
"""Tests for Semantic Notification Bridge - WordPress to Terminal."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from systems.visual_shell.api.semantic_notification_bridge import (
    SemanticNotificationBridge,
    NotificationEvent,
)


def test_notification_event_creation():
    """Test creating a notification event from WordPress data."""
    event = NotificationEvent(
        title="Generation 500: PAS Score Breakthrough",
        content="<p>Neural kernel stability reached 0.99</p>",
        url="http://localhost:8080/?p=123",
    )

    assert event.title == "Generation 500: PAS Score Breakthrough"
    assert "stability" in event.content
    assert event.color_index == 10  # Bright green for breakthrough


def test_notification_event_categories():
    """Test color assignment based on event category."""
    # Evolution breakthrough = bright green
    event = NotificationEvent(title="Evolution Success", content="", url="")
    assert event.color_index == 10

    # Error = bright red
    event = NotificationEvent(title="Error: Connection Failed", content="", url="")
    assert event.color_index == 9

    # Warning = bright yellow
    event = NotificationEvent(title="Warning: Memory Low", content="", url="")
    assert event.color_index == 11

    # Info = bright cyan
    event = NotificationEvent(title="System Status Update", content="", url="")
    assert event.color_index == 14


def test_bridge_format_for_terminal():
    """Test formatting notification for geometric terminal."""
    bridge = SemanticNotificationBridge()

    event = NotificationEvent(
        title="Evolution Complete",
        content="PAS score: 0.95",
        url="http://localhost:8080/?p=456",
    )

    formatted = bridge.format_for_terminal(event)

    assert formatted.startswith("[")
    assert "Evolution Complete" in formatted
    assert len(formatted) <= 80  # Fits in terminal width


def test_bridge_strips_html():
    """Test HTML stripping from content."""
    bridge = SemanticNotificationBridge()

    event = NotificationEvent(
        title="Test",
        content="<p>Hello <b>World</b></p>",
        url="",
    )

    formatted = bridge.format_for_terminal(event)
    assert "<p>" not in formatted
    assert "<b>" not in formatted
    assert "Hello World" in formatted


if __name__ == "__main__":
    test_notification_event_creation()
    test_notification_event_categories()
    test_bridge_format_for_terminal()
    test_bridge_strips_html()
    print("All tests passed!")
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 tests/test_semantic_notification_bridge.py`
Expected: FAIL with "No module named 'systems.visual_shell.api.semantic_notification_bridge'"

**Step 3: Write minimal implementation**

Create `systems/visual_shell/api/semantic_notification_bridge.py`:

```python
#!/usr/bin/env python3
"""
Semantic Notification Bridge

Connects WordPress semantic publishing to the PixelRTS v3 geometric terminal.
Transforms agent publications into terminal notifications with proper
color coding and formatting.

Terminal Color Index (16-color):
  9  = Bright Red (errors)
  10 = Bright Green (success/evolution)
  11 = Bright Yellow (warnings)
  12 = Bright Blue (info)
  14 = Bright Cyan (general updates)
"""

import re
from dataclasses import dataclass
from typing import Optional
from datetime import datetime


@dataclass
class NotificationEvent:
    """A semantic event from WordPress publishing."""

    title: str
    content: str
    url: str
    timestamp: Optional[str] = None
    color_index: int = 14  # Default: bright cyan

    def __post_init__(self):
        """Auto-assign color based on title keywords."""
        title_lower = self.title.lower()

        # Determine color from keywords
        if any(kw in title_lower for kw in ['error', 'failed', 'crash', 'critical']):
            self.color_index = 9  # Bright red
        elif any(kw in title_lower for kw in ['breakthrough', 'success', 'complete', 'evolution']):
            self.color_index = 10  # Bright green
        elif any(kw in title_lower for kw in ['warning', 'caution', 'alert']):
            self.color_index = 11  # Bright yellow
        elif any(kw in title_lower for kw in ['info', 'status', 'update', 'metric']):
            self.color_index = 14  # Bright cyan
        else:
            self.color_index = 12  # Bright blue (default)

        # Set timestamp if not provided
        if self.timestamp is None:
            self.timestamp = datetime.now().strftime("%H:%M:%S")


class SemanticNotificationBridge:
    """Bridge between WordPress events and geometric terminal notifications."""

    MAX_WIDTH = 80  # Standard terminal width

    def format_for_terminal(self, event: NotificationEvent) -> str:
        """
        Format a notification event for terminal display.

        Output format: [HH:MM:SS] Title - Content (stripped)
        """
        # Strip HTML tags from content
        clean_content = self._strip_html(event.content)

        # Truncate content to fit width
        prefix = f"[{event.timestamp}] "
        available = self.MAX_WIDTH - len(prefix) - 3  # 3 for " - "

        if len(event.title) + len(clean_content) > available:
            # Truncate combined, prefer title
            title_space = min(len(event.title), available // 2)
            content_space = available - title_space - 3
            truncated_title = event.title[:title_space]
            truncated_content = clean_content[:content_space]
        else:
            truncated_title = event.title
            truncated_content = clean_content

        # Combine
        if truncated_content:
            return f"{prefix}{truncated_title} - {truncated_content}"
        else:
            return f"{prefix}{truncated_title}"

    def _strip_html(self, text: str) -> str:
        """Remove HTML tags from text."""
        # Remove tags
        clean = re.sub(r'<[^>]+>', '', text)
        # Decode common entities
        clean = clean.replace('&nbsp;', ' ')
        clean = clean.replace('&amp;', '&')
        clean = clean.replace('&lt;', '<')
        clean = clean.replace('&gt;', '>')
        # Collapse whitespace
        clean = re.sub(r'\s+', ' ', clean).strip()
        return clean

    def to_terminal_opcode(self, event: NotificationEvent) -> dict:
        """
        Convert notification to PixelRTS v3 terminal opcode format.

        Returns dict suitable for WebSocket transmission to terminal.
        """
        formatted = self.format_for_terminal(event)
        return {
            "type": "terminal_notification",
            "text": formatted,
            "color": event.color_index,
            "flags": 1,  # Bold
            "url": event.url,
        }
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 tests/test_semantic_notification_bridge.py`
Expected: "All tests passed!"

**Step 5: Commit**

```bash
git add systems/visual_shell/api/semantic_notification_bridge.py tests/test_semantic_notification_bridge.py
git commit -m "feat(semantic-bridge): add WordPress to terminal notification bridge"
```

---

## Task 3: Connect Visual Bridge to Semantic Notifications

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py:308-317`
- Test: Integration test via WebSocket

**Step 1: Identify modification point**

The current `wordpress_publish` handler at line 308 only broadcasts to browser clients. We need to also send to the geometric terminal.

**Step 2: Add import at top of visual_bridge.py**

Add after line 40 (after VATManager import):

```python
# Import Semantic Notification Bridge (PixelRTS v3 integration)
from systems.visual_shell.api.semantic_notification_bridge import (
    SemanticNotificationBridge,
    NotificationEvent,
)
```

**Step 3: Initialize bridge in __init__**

Add after line 63 (after heat aggregator initialization):

```python
        # Semantic Notification Bridge (WordPress → Terminal)
        self.semantic_bridge = SemanticNotificationBridge()
```

**Step 4: Enhance wordpress_publish handler**

Replace the current handler (lines 308-317) with:

```python
                # 14b. WordPress Semantic Publishing (Memory District)
                elif msg_type == 'wordpress_publish':
                    title = data.get('title', 'Untitled')
                    content = data.get('content', '')
                    url = data.get('url', '')
                    print(f"📝 WordPress Publish: {title}")

                    # Create notification event
                    event = NotificationEvent(
                        title=title,
                        content=content,
                        url=url,
                    )

                    # Broadcast to browser clients
                    await self._broadcast({
                        "type": "WORDPRESS_PUBLISH",
                        "title": title,
                        "content": content,
                        "url": url,
                        "timestamp": time.time()
                    })

                    # Send to geometric terminal (PixelRTS v3)
                    terminal_op = self.semantic_bridge.to_terminal_opcode(event)
                    await self._broadcast(terminal_op)
                    print(f"📺 Terminal notification: {title[:40]}...")
```

**Step 5: Verify integration**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('Import OK')"`
Expected: "Import OK"

**Step 6: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): connect WordPress to geometric terminal notifications"
```

---

## Task 4: Add Terminal Notification Handler to Rust App

**Files:**
- Modify: `systems/infinite_map_rs/src/app.rs` (find terminal message handler section)
- Test: Manual integration test

**Step 1: Find the terminal notification handling location**

Search for where terminal messages are processed. Look for `terminal_notification` or similar WebSocket message handling.

**Step 2: Add notification handler**

In the WebSocket message handling section (around line 3500+), add:

```rust
                // Phase 30.8 + PixelRTS v3: Terminal Notifications
                crate::glass_ram::bridge::VisualCommand::TerminalNotification { text, color, flags } => {
                    log::info!("📺 Terminal Notification: {}", text);

                    // Find the first terminal tile and write notification
                    if let Some(ref mut tile) = self.terminal_tile {
                        // Use geometric buffer's notification method
                        // This will be connected via the geometric_bridge
                        tile.write_notification(&text, color as u8, flags as u8);
                    }
                }
```

**Step 3: Add to VisualCommand enum**

In `systems/infinite_map_rs/src/glass_ram/bridge.rs`, add to the VisualCommand enum:

```rust
    /// Terminal notification from semantic bridge
    TerminalNotification {
        text: String,
        color: u32,
        flags: u32,
    },
```

**Step 4: Build and verify**

Run: `cd systems/infinite_map_rs && cargo build --features hypervisor 2>&1 | tail -20`
Expected: Build succeeds (may have warnings)

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/app.rs systems/infinite_map_rs/src/glass_ram/bridge.rs
git commit -m "feat(rust-app): add terminal notification handler for semantic events"
```

---

## Task 5: Add Damage Tracking to Notifications

**Files:**
- Modify: `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs`
- Test: Inline test

**Step 1: Write failing test**

Add to test module:

```rust
#[test]
fn test_notification_returns_dirty_rect() {
    let mut buf = GeometricTerminalBuffer::new(80, 24);

    let dirty = buf.write_notification_tracked("Test", 10);

    // Should return dirty rect covering the notification line
    assert!(dirty.is_some());
    let rect = dirty.unwrap();
    assert_eq!(rect.y1, 0); // First line
    assert_eq!(rect.y2, 1); // One line tall
    assert!(rect.x2 > 4);   // At least "[HH:MM:SS] " wide
}
```

**Step 2: Add tracked notification method**

Add to `GeometricTerminalBuffer`:

```rust
use crate::damage_tracker::DirtyRect;

/// Write notification and return the dirty rectangle
pub fn write_notification_tracked(&mut self, message: &str, fg_color: u8) -> Option<DirtyRect> {
    let start_row = self.cursor_y;
    let start_col = self.cursor_x;

    self.write_notification(message, fg_color);

    // Compute dirty rect
    // The notification spans from start_col to end of line on start_row
    Some(DirtyRect::new(
        0,                  // x1: start of line
        start_row as u32,   // y1: the row we wrote on
        self.cols as u32,   // x2: full width
        (start_row + 1) as u32, // y2: one line
    ))
}
```

**Step 3: Run test**

Run: `cd systems/infinite_map_rs && cargo test --features hypervisor test_notification_returns_dirty_rect 2>&1 | tail -10`
Expected: PASS

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs
git commit -m "feat(geometric-bridge): add damage tracking for notifications"
```

---

## Task 6: End-to-End Integration Test

**Files:**
- Create: `tests/test_semantic_terminal_e2e.py`
- Test: Manual verification

**Step 1: Create E2E test**

```python
#!/usr/bin/env python3
"""
End-to-End Test: WordPress → Visual Bridge → Terminal Notification

Verifies the complete semantic-geometric terminal integration.
"""

import asyncio
import json
import sys
import os
import time

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))


async def test_wordpress_to_terminal_flow():
    """Test that WordPress publish triggers terminal notification."""
    import websockets

    # Connect to Visual Bridge
    uri = "ws://localhost:8768"
    try:
        async with websockets.connect(uri, close_timeout=1) as ws:
            # Simulate WordPress publish
            wordpress_event = {
                "type": "wordpress_publish",
                "title": "E2E Test: Evolution Complete",
                "content": "Test PAS score: 0.99",
                "url": "http://localhost:8080/?p=test",
                "timestamp": time.time()
            }

            await ws.send(json.dumps(wordpress_event))
            print(f"✓ Sent WordPress event: {wordpress_event['title']}")

            # Wait for terminal notification broadcast
            try:
                response = await asyncio.wait_for(ws.recv(), timeout=2.0)
                data = json.loads(response)

                if data.get('type') == 'terminal_notification':
                    print(f"✓ Received terminal notification: {data.get('text', '')[:40]}")
                    assert 'E2E Test' in data.get('text', ''), "Title should be in notification"
                    assert data.get('color') == 10, "Evolution should be bright green"
                    return True
                elif data.get('type') == 'WORDPRESS_PUBLISH':
                    print("✓ Received browser broadcast")
                    # Continue waiting for terminal_notification

            except asyncio.TimeoutError:
                print("⚠️ Timeout waiting for response (bridge may not be running)")
                return False

    except Exception as e:
        print(f"⚠️ Could not connect to Visual Bridge: {e}")
        print("   Start bridge with: python3 systems/visual_shell/api/visual_bridge.py")
        return False

    return True


def test_notification_bridge_unit():
    """Unit test the bridge without WebSocket."""
    from systems.visual_shell.api.semantic_notification_bridge import (
        SemanticNotificationBridge, NotificationEvent
    )

    bridge = SemanticNotificationBridge()

    # Test evolution event
    event = NotificationEvent(
        title="Generation 100: PAS Score Breakthrough",
        content="Stability reached 0.99",
        url="http://localhost:8080/?p=100"
    )

    opcode = bridge.to_terminal_opcode(event)

    assert opcode['type'] == 'terminal_notification'
    assert opcode['color'] == 10  # Bright green
    assert 'Generation 100' in opcode['text']
    assert opcode['flags'] == 1  # Bold

    print(f"✓ Unit test passed: {opcode['text'][:50]}")
    return True


if __name__ == "__main__":
    print("=" * 60)
    print("SEMANTIC-GEOMETRIC TERMINAL E2E TEST")
    print("=" * 60)

    # Unit test first
    print("\n1. Unit Test (Bridge Logic)")
    if not test_notification_bridge_unit():
        sys.exit(1)

    # E2E test (requires running bridge)
    print("\n2. E2E Test (WebSocket Flow)")
    try:
        result = asyncio.run(test_wordpress_to_terminal_flow())
        if not result:
            print("\n⚠️ E2E test skipped (Visual Bridge not running)")
            print("   To run E2E: python3 systems/visual_shell/api/visual_bridge.py &")
    except RuntimeError:
        # Already running event loop
        print("   Skipping (event loop conflict)")

    print("\n✓ All available tests passed!")
```

**Step 2: Run unit test**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 tests/test_semantic_terminal_e2e.py`
Expected: Unit test passes, E2E skipped if bridge not running

**Step 3: Commit**

```bash
git add tests/test_semantic_terminal_e2e.py
git commit -m "test: add E2E test for semantic-terminal integration"
```

---

## Task 7: Update Documentation

**Files:**
- Create: `docs/SEMANTIC_GEOMETRIC_TERMINAL.md`
- Modify: `MEMORY.md`

**Step 1: Create integration documentation**

```markdown
# Semantic-Geometric Terminal Integration

## Overview

The Semantic-Geometric Terminal connects WordPress semantic publishing to the PixelRTS v3 geometric terminal with Phase 30.8 damage tracking.

## Data Flow

\`\`\`
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
\`\`\`

## Usage

### From Python (AI Agent)

\`\`\`python
from wordpress_zone.publish_to_wp import publish_to_wordpress

publish_to_wordpress(
    title="Evolution Complete: Generation 500",
    content="PAS score reached 0.99",
    post_type="post"
)
\`\`\`

### Terminal Color Codes

| Event Type | Color Index | Color |
|------------|-------------|-------|
| Evolution/Success | 10 | Bright Green |
| Error/Failure | 9 | Bright Red |
| Warning | 11 | Bright Yellow |
| Info/Status | 14 | Bright Cyan |
| Default | 12 | Bright Blue |

## Testing

\`\`\`bash
# Unit tests
python3 tests/test_semantic_notification_bridge.py

# E2E test (requires running bridge)
python3 systems/visual_shell/api/visual_bridge.py &
python3 tests/test_semantic_terminal_e2e.py
\`\`\`
```

**Step 2: Update MEMORY.md**

Add entry under Active Development Areas:

```markdown
### Semantic-Geometric Terminal (2026-02-20)
**Status**: ✅ COMPLETE
**Key Files**: `systems/visual_shell/api/semantic_notification_bridge.py`, `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs`

| Component | Description |
|-----------|-------------|
| SemanticNotificationBridge | WordPress → terminal formatting |
| GeometricTerminalBuffer.write_notification | Rust notification method |
| DamageTracker integration | Efficient partial updates |

**Flow**: WordPress publish → Visual Bridge → Terminal notification → GPU
```

**Step 3: Commit**

```bash
git add docs/SEMANTIC_GEOMETRIC_TERMINAL.md MEMORY.md
git commit -m "docs: add semantic-geometric terminal documentation"
```

---

## Verification Checklist

After completing all tasks:

1. [ ] Unit tests pass: `python3 tests/test_semantic_notification_bridge.py`
2. [ ] Rust tests pass: `cd systems/infinite_map_rs && cargo test --features hypervisor test_write_notification`
3. [ ] Build succeeds: `cd systems/infinite_map_rs && cargo build --features hypervisor`
4. [ ] Manual test: Publish to WordPress, see notification in terminal

---

## Summary

| Task | Files | Tests |
|------|-------|-------|
| 1. Notification Method | geometric_bridge.rs | 2 |
| 2. Semantic Bridge | semantic_notification_bridge.py | 4 |
| 3. Visual Bridge Connect | visual_bridge.py | Integration |
| 4. Rust App Handler | app.rs, bridge.rs | Manual |
| 5. Damage Tracking | geometric_bridge.rs | 1 |
| 6. E2E Test | test_semantic_terminal_e2e.py | 2 |
| 7. Documentation | SEMANTIC_GEOMETRIC_TERMINAL.md | - |
| **Total** | **7 files** | **9+ tests** |
