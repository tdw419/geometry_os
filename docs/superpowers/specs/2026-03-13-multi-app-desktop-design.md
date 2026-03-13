# Multi-App Desktop Design

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enable multiple glyph apps to run simultaneously with drag, focus, close, and app launching via command palette.

**Architecture:** WindowManager class handles window state and interactions. GlyphWindowRenderer remains visual-only. CommandPalette provides app launching. Minimal changes to existing GlyphVMBridge protocol.

**Tech Stack:** PixiJS (existing), WebSocket (existing), vanilla JavaScript

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                      Frontend (PixiJS)                       │
├──────────────────┬──────────────────┬───────────────────────┤
│  WindowManager   │ GlyphWindowRenderer │  CommandPalette    │
│  - window state  │  - visual rendering │  - app launcher    │
│  - drag/drop     │  - glyph grids      │  - keyboard filter │
│  - focus/z-order │  - borders/titles   │  - overlay UI      │
└────────┬─────────┴─────────┬────────┴───────────┬───────────┘
         │                   │                    │
         ▼                   ▼                    ▼
┌─────────────────────────────────────────────────────────────┐
│              GlyphVMBridge (WebSocket :8770)                 │
│  - load_app, tick, interrupt messages                        │
│  - broadcasts app_loaded, app_render                         │
└─────────────────────────────────────────────────────────────┘
```

---

## Components

### 1. WindowManager.js (~150 lines)

Tracks and manages all window state.

**State:**
```javascript
{
  windows: Map<appId, { x, y, z, focused }>,
  dragState: { appId, offsetX, offsetY } | null,
  topZ: number
}
```

**Methods:**
- `addWindow(appId, width, height)` - Create window at default position
- `removeWindow(appId)` - Close and cleanup
- `focusWindow(appId)` - Set focus, update z-order
- `startDrag(appId, mouseX, mouseY)` - Begin drag
- `updateDrag(mouseX, mouseY)` - Move window during drag
- `endDrag()` - Finish drag
- `getFocusedApp()` - Returns focused appId or null

**Events emitted:**
- `window_added` - New window created
- `window_removed` - Window closed
- `window_moved` - Position changed
- `window_focused` - Focus changed

### 2. GlyphWindowRenderer.js (modified, ~200 lines)

Now receives state from WindowManager instead of managing its own.

**Changes:**
- Add close button `[X]` to title bar (right side)
- Accept WindowManager instance in constructor
- Listen to WindowManager events for updates
- Remove internal window state tracking

**Close button behavior:**
- Red `X` on hover shows darker red
- Click sends `unload_app` message to bridge

### 3. CommandPalette.js (~100 lines)

App launcher triggered by backtick (`) key.

**State:**
```javascript
{
  visible: boolean,
  filter: string,
  apps: string[],      // Available app names
  selectedIndex: number
}
```

**Behavior:**
- Backtick (`) toggles visibility
- Type to filter app list
- Up/Down arrows navigate list
- Enter launches selected app
- Escape closes palette

**Message to bridge:**
```json
{ "type": "load_app_by_name", "data": { "name": "terminal" } }
```

### 4. GlyphVMBridge (Python, minor changes)

Add one new message type:

**Incoming:**
```json
{ "type": "load_app_by_name", "data": { "name": "terminal" } }
```

**Outgoing:**
```json
{ "type": "app_list", "data": { "apps": ["counter", "terminal", "file_browser"] } }
```

**Implementation:**
- Add `_handle_load_app_by_name()` method
- Use AppLoader to get binary by name
- Reuse existing `load_app` logic

---

## Data Flow

### App Launch Sequence

```
User presses ` → CommandPalette.visible = true
User types "ter" → Filtered list: ["terminal"]
User presses Enter → Client sends { type: "load_app_by_name", name: "terminal" }
Bridge loads app → Broadcasts { type: "app_loaded", data: {...} }
WindowManager.onAppLoaded() → Creates window at (100, 100) + offset
Renderer.onWindowAdded() → Draws new window
```

### Window Drag Sequence

```
User mousedown on title bar → WindowManager.startDrag(appId, x, y)
User moves mouse → WindowManager.updateDrag(x, y) → emits window_moved
Renderer.onWindowMoved() → Updates window position
User mouseup → WindowManager.endDrag()
```

### Keyboard Routing

```
User presses key → WindowManager.getFocusedApp() → returns focused appId
Client sends { type: "interrupt", app_id: focusedId, payload: keycode }
Bridge delivers to correct app
```

### Window Close Sequence

```
User clicks [X] → Renderer emits close_clicked
WindowManager.removeWindow(appId) → emits window_removed
Client sends { type: "unload_app", app_id: appId }
Bridge unloads app → Broadcasts { type: "app_unloaded" }
Renderer removes window graphics
```

---

## Error Handling

| Scenario | Handling |
|----------|----------|
| App fails to load | Show error in command palette, no window created |
| Window dragged off-screen | Clamp position: `x = Math.max(0, Math.min(x, screenW - 50))` |
| Bridge disconnects | Show "Reconnecting..." overlay, retry every 2s |
| Unknown message type | Log warning, ignore gracefully |

---

## Testing Strategy

### Unit Tests (Python)

```python
# test_window_manager.py
def test_add_window_creates_at_default_position()
def test_focus_updates_z_order()
def test_drag_moves_window()
def test_bring_to_front_increments_z()

# test_command_palette.py
def test_filter_fuzzy_matches()
def test_enter_launches_selected()
def test_escape_closes()
```

### Integration Tests

1. **Multi-app load:** Load 3 apps, verify 3 windows appear at different positions
2. **Drag:** Drag window, verify position persists across ticks
3. **Focus:** Click window, verify border color changes and keyboard routes correctly
4. **Close:** Click [X], verify window disappears and app unloads
5. **Command palette:** Press `, type "term", Enter, verify terminal launches

---

## Files to Create/Modify

| File | Action |
|------|--------|
| `systems/visual_shell/web/WindowManager.js` | Create |
| `systems/visual_shell/web/CommandPalette.js` | Create |
| `systems/visual_shell/web/GlyphWindowRenderer.js` | Modify |
| `systems/visual_shell/api/glyph_vm_bridge.py` | Modify |
| `systems/visual_shell/web/tests/test_window_manager.py` | Create |

---

## Success Criteria

- [ ] Can load multiple apps simultaneously
- [ ] Windows can be dragged by title bar
- [ ] Clicking a window focuses it (keyboard routes correctly)
- [ ] Close button unloads app and removes window
- [ ] Command palette (backtick) lists and launches apps
- [ ] All tests pass

---

*Created: 2026-03-13*
