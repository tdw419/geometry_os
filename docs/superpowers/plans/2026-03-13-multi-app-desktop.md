# Multi-App Desktop Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enable multiple glyph apps to run simultaneously with drag, focus, close, and app launching via command palette.

**Architecture:** WindowManager class handles window state and interactions. GlyphWindowRenderer remains visual-only. CommandPalette provides app launching. Minimal changes to existing GlyphVMBridge protocol.

**Tech Stack:** PixiJS 7, WebSocket, vanilla JavaScript, Python 3

---

## File Structure

| File | Responsibility |
|------|---------------|
| `systems/visual_shell/web/WindowManager.js` | Window state, drag/drop, focus, z-order |
| `systems/visual_shell/web/CommandPalette.js` | App launcher UI with keyboard filter |
| `systems/visual_shell/web/GlyphWindowRenderer.js` | Visual rendering (modified) |
| `systems/visual_shell/api/glyph_vm_bridge.py` | Backend (add load_app_by_name) |

---

## Chunk 1: WindowManager.js

### Task 1: Create WindowManager Class

**Files:**
- Create: `systems/visual_shell/web/WindowManager.js`

- [ ] **Step 1: Write WindowManager.js with event emitter pattern**

```javascript
/**
 * WindowManager.js
 *
 * Manages window state: positions, z-order, focus, and drag operations.
 * Emits events for renderer to consume.
 */

export class WindowManager {
    constructor() {
        this.windows = new Map();  // appId -> { x, y, z, width, height, focused }
        this.dragState = null;     // { appId, offsetX, offsetY } | null
        this.topZ = 0;
        this._cascadeOffset = 0;   // For new window positioning
        this._listeners = new Map(); // event -> [callback, ...]
    }

    // === Event System ===

    on(event, callback) {
        if (!this._listeners.has(event)) {
            this._listeners.set(event, []);
        }
        this._listeners.get(event).push(callback);
    }

    off(event, callback) {
        const callbacks = this._listeners.get(event);
        if (callbacks) {
            const idx = callbacks.indexOf(callback);
            if (idx >= 0) callbacks.splice(idx, 1);
        }
    }

    emit(event, data) {
        const callbacks = this._listeners.get(event);
        if (callbacks) {
            callbacks.forEach(cb => cb(data));
        }
    }

    // === Window Management ===

    addWindow(appId, width, height) {
        // Cascade position: each new window offset by 30px
        const x = 100 + this._cascadeOffset;
        const y = 100 + this._cascadeOffset;
        this._cascadeOffset = (this._cascadeOffset + 30) % 150;

        this.topZ += 1;

        const windowState = {
            x,
            y,
            z: this.topZ,
            width,
            height,
            focused: this.windows.size === 0, // First window focused
        };

        this.windows.set(appId, windowState);

        // If this is the first window, focus it
        if (windowState.focused) {
            this.emit('window_focused', { appId });
        }

        this.emit('window_added', { appId, ...windowState });
        return windowState;
    }

    removeWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return false;

        this.windows.delete(appId);
        this.emit('window_removed', { appId });

        // If removed window was focused, focus another
        if (win.focused && this.windows.size > 0) {
            const nextAppId = this.windows.keys().next().value;
            this.focusWindow(nextAppId);
        }

        return true;
    }

    focusWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Unfocus current focused window
        for (const [id, w] of this.windows) {
            if (w.focused && id !== appId) {
                w.focused = false;
            }
        }

        // Focus new window and bring to front
        win.focused = true;
        this.topZ += 1;
        win.z = this.topZ;

        this.emit('window_focused', { appId });
    }

    getWindow(appId) {
        return this.windows.get(appId);
    }

    getFocusedApp() {
        for (const [appId, win] of this.windows) {
            if (win.focused) return appId;
        }
        return null;
    }

    // === Drag Operations ===

    startDrag(appId, mouseX, mouseY) {
        const win = this.windows.get(appId);
        if (!win) return;

        this.dragState = {
            appId,
            offsetX: mouseX - win.x,
            offsetY: mouseY - win.y,
        };

        // Focus on drag start
        this.focusWindow(appId);
    }

    updateDrag(mouseX, mouseY) {
        if (!this.dragState) return;

        const win = this.windows.get(this.dragState.appId);
        if (!win) return;

        let newX = mouseX - this.dragState.offsetX;
        let newY = mouseY - this.dragState.offsetY;

        // Clamp to stay partially visible (at least 50px on screen)
        const screenW = globalThis.innerWidth || 800;
        const screenH = globalThis.innerHeight || 600;
        newX = Math.max(-win.width * 10 + 50, Math.min(newX, screenW - 50));
        newY = Math.max(0, Math.min(newY, screenH - 50));

        win.x = newX;
        win.y = newY;

        this.emit('window_moved', {
            appId: this.dragState.appId,
            x: newX,
            y: newY,
        });
    }

    endDrag() {
        this.dragState = null;
    }

    isDragging() {
        return this.dragState !== null;
    }

    getDragAppId() {
        return this.dragState?.appId ?? null;
    }
}
```

- [ ] **Step 2: Verify WindowManager works**

```bash
node -e "
import('./systems/visual_shell/web/WindowManager.js')
  .then(m => { const wm = new m.WindowManager(); console.log('OK:', wm.addWindow(1, 32, 16)); })
  .catch(e => console.error('FAIL:', e));
"
```
Expected: `OK: { x: 100, y: 100, z: 1, width: 32, height: 16, focused: true }`

- [ ] **Step 3: Commit WindowManager.js**

```bash
git add systems/visual_shell/web/WindowManager.js
git commit -m "feat(visual_shell): add WindowManager for multi-app desktop

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 2: GlyphWindowRenderer Modifications

### Task 2: Add Close Button and WindowManager Integration

**Files:**
- Modify: `systems/visual_shell/web/GlyphWindowRenderer.js`

**CRITICAL:** Do steps in order! Step 1 defines `this.windowManager` which Step 2 uses.

- [ ] **Step 1: Modify constructor to accept WindowManager parameter**

Replace the constructor (lines 13-34) with:

```javascript
constructor(client, container, options = {}, windowManager = null) {
    this.client = client;
    this.container = container;
    this.windowManager = windowManager;  // NEW: Optional WindowManager

    this.options = {
        borderWidth: 2,
        focusedBorderColor: 0x00FF00,
        unfocusedBorderColor: 0x444444,
        backgroundColor: 0x0a0a0f,
        titleBarHeight: 24,
        glyphWidth: 10,
        glyphHeight: 16,
        fontFamily: 'Courier New, monospace',
        fontSize: 12,
        textColor: 0x00ff88,
        ...options
    };

    this.windows = new Map();
    this.focusedAppId = null;

    this._setupEventHandlers();
    this._setupWindowManagerListeners();  // NEW
}

// NEW: Listen to WindowManager events
_setupWindowManagerListeners() {
    if (!this.windowManager) return;

    this.windowManager.on('window_moved', ({ appId, x, y }) => {
        const win = this.windows.get(appId);
        if (win) {
            win.container.x = x;
            win.container.y = y;
        }
    });

    this.windowManager.on('window_focused', ({ appId }) => {
        this._updateAllBorders();
    });

    this.windowManager.on('window_removed', ({ appId }) => {
        // Use existing _destroyWindow method (line 183)
        this._destroyWindow(appId);
    });
}
```

- [ ] **Step 2: Replace _createWindow method with close button support**

Replace the `_createWindow` method (lines 63-170) with:

```javascript
_createWindow(app) {
    const { appId, x, y, width, height, flags, name } = app;
    const { titleBarHeight, backgroundColor, glyphWidth, glyphHeight } = this.options;

    // Get position from WindowManager if available
    let windowX = x;
    let windowY = y;
    if (this.windowManager) {
        const wmState = this.windowManager.addWindow(appId, width, height);
        windowX = wmState.x;
        windowY = wmState.y;
    }

    // Create container
    const windowContainer = new PIXI.Container();
    windowContainer.x = windowX;
    windowContainer.y = windowY;

    // Background
    const bg = new PIXI.Graphics();
    bg.beginFill(backgroundColor);
    bg.drawRect(0, 0, width * glyphWidth, height * glyphHeight + titleBarHeight);
    bg.endFill();
    windowContainer.addChild(bg);

    // Title bar
    const titleBar = new PIXI.Graphics();
    titleBar.beginFill(0x16213e);
    titleBar.drawRect(0, 0, width * glyphWidth, titleBarHeight);
    titleBar.endFill();
    titleBar.eventMode = 'static';
    windowContainer.addChild(titleBar);

    // Title text
    const displayName = name || `App ${appId}`;
    const titleText = new PIXI.Text(displayName, {
        fontFamily: this.options.fontFamily,
        fontSize: 12,
        fill: 0xFFFFFF,
    });
    titleText.x = 8;
    titleText.y = (titleBarHeight - titleText.height) / 2;
    windowContainer.addChild(titleText);

    // Close button [X]
    const closeBtn = new PIXI.Text('[X]', {
        fontFamily: this.options.fontFamily,
        fontSize: 12,
        fill: 0xff4444,
    });
    closeBtn.x = width * glyphWidth - closeBtn.width - 8;
    closeBtn.y = (titleBarHeight - closeBtn.height) / 2;
    closeBtn.eventMode = 'static';
    closeBtn.cursor = 'pointer';
    closeBtn.on('pointerover', () => { closeBtn.style.fill = 0xff0000; });
    closeBtn.on('pointerout', () => { closeBtn.style.fill = 0xff4444; });
    closeBtn.on('pointerdown', (e) => { e.stopPropagation(); this._closeWindow(appId); });
    windowContainer.addChild(closeBtn);

    // Capability indicators
    const wantsKeyboard = flags & 0x01;
    const wantsMouse = flags & 0x02;
    const caps = [];
    if (wantsKeyboard) caps.push('K');
    if (wantsMouse) caps.push('M');
    if (caps.length > 0) {
        const capsText = new PIXI.Text(caps.join(' '), {
            fontFamily: this.options.fontFamily,
            fontSize: 10,
            fill: 0x88ff88,
        });
        capsText.x = width * glyphWidth - capsText.width - 40;
        capsText.y = (titleBarHeight - capsText.height) / 2;
        windowContainer.addChild(capsText);
    }

    // Glyph display area
    const glyphArea = new PIXI.Container();
    glyphArea.y = titleBarHeight;
    const glyphText = new PIXI.Text('', {
        fontFamily: this.options.fontFamily,
        fontSize: this.options.fontSize,
        fill: this.options.textColor,
        leading: 2,
    });
    glyphArea.addChild(glyphText);
    windowContainer.addChild(glyphArea);

    // Border
    const border = new PIXI.Graphics();
    const isFocused = this.windowManager?.getWindow(appId)?.focused ?? (this.focusedAppId === appId);
    this._drawBorder(border, width * glyphWidth, height * glyphHeight + titleBarHeight, isFocused);
    windowContainer.addChild(border);

    // Add to container
    this.container.addChild(windowContainer);

    // Interactive - title bar drag
    titleBar.on('pointerdown', (e) => {
        if (this.windowManager) {
            this.windowManager.startDrag(appId, e.global.x, e.global.y);
        } else {
            this._focusWindow(appId);
        }
    });

    // Interactive - window click
    windowContainer.eventMode = 'static';
    windowContainer.on('pointerdown', (e) => {
        if (this.windowManager) {
            this.windowManager.focusWindow(appId);
        } else {
            this._focusWindow(appId);
        }
        if (wantsMouse) {
            const localX = Math.floor((e.global.x - windowX) / glyphWidth);
            const localY = Math.floor((e.global.y - windowY - titleBarHeight) / glyphHeight);
            if (localY >= 0 && localY < height && localX >= 0 && localX < width) {
                this.client.sendMouseButton(0, localX, localY);
            }
        }
    });

    // Store reference
    this.windows.set(appId, {
        container: windowContainer,
        border,
        glyphText,
        closeBtn,
        app,
        glyphGrid: [],
    });

    this._initializeGlyphGrid(appId, width, height);
}
```

- [ ] **Step 3: Add helper methods after _drawBorder**

Add these methods after `_drawBorder` (around line 264):

```javascript
// NEW: Close window handler
_closeWindow(appId) {
    if (this.windowManager) {
        this.windowManager.removeWindow(appId);
    }
    this.client.unloadApp(appId);
}

// NEW: Update all window borders based on focus
_updateAllBorders() {
    for (const [appId, win] of this.windows) {
        const isFocused = this.windowManager?.getWindow(appId)?.focused ?? (this.focusedAppId === appId);
        this._updateBorder(appId, isFocused);
    }
}
```

- [ ] **Step 4: Update handleKeyboard to use WindowManager**

Replace `handleKeyboard` (lines 269-284) with:

```javascript
handleKeyboard(event) {
    // Let command palette handle backtick
    if (event.keyCode === 192) {  // Backtick
        return;
    }

    // Use WindowManager focus if available
    const focusedId = this.windowManager?.getFocusedApp() ?? this.focusedAppId;
    if (focusedId === null) return;

    const win = this.windows.get(focusedId);
    if (!win) return;

    if (!(win.app.flags & 0x01)) return;

    this.client.sendKeyboardEvent(event.keyCode, 0, 0);
}
```

- [ ] **Step 5: Commit GlyphWindowRenderer changes**

    this._setupEventHandlers();
    this._setupWindowManagerListeners();  // NEW
}

// NEW: Listen to WindowManager events
_setupWindowManagerListeners() {
    if (!this.windowManager) return;

    this.windowManager.on('window_moved', ({ appId, x, y }) => {
        const win = this.windows.get(appId);
        if (win) {
            win.container.x = x;
            win.container.y = y;
        }
    });

    this.windowManager.on('window_focused', ({ appId }) => {
        this._updateAllBorders();
    });

    this.windowManager.on('window_removed', ({ appId }) => {
        // Use existing _destroyWindow method (defined at line 183)
        this._destroyWindow(appId);
    });
}
```

- [ ] **Step 3: Add helper methods after _drawBorder**

Add these methods after `_drawBorder` (around line 264):

```javascript
// NEW: Close window handler
_closeWindow(appId) {
    if (this.windowManager) {
        this.windowManager.removeWindow(appId);
    }
    // Use existing client method
    this.client.unloadApp(appId);
}

// NEW: Update all window borders based on focus
_updateAllBorders() {
    for (const [appId, win] of this.windows) {
        const isFocused = this.windowManager?.getWindow(appId)?.focused ?? (this.focusedAppId === appId);
        this._updateBorder(appId, isFocused);
    }
}
```

- [ ] **Step 3: Update handleKeyboard to use WindowManager**

```javascript
handleKeyboard(event) {
    // Let command palette handle backtick
    if (event.keyCode === 192) {  // Backtick
        return;
    }

    const focusedId = this.windowManager?.getFocusedApp() ?? this.focusedAppId;
    if (focusedId === null) return;

    const win = this.windows.get(focusedId);
    if (!win) return;

    if (!(win.app.flags & 0x01)) return;

    this.client.sendKeyboardEvent(event.keyCode, 0, 0);
}
```

- [ ] **Step 4: Commit GlyphWindowRenderer changes**

```bash
git add systems/visual_shell/web/GlyphWindowRenderer.js
git commit -m "feat(visual_shell): add close button and WindowManager integration

- Add [X] close button to window title bar
- Accept WindowManager parameter in constructor
- Listen to WindowManager events for position/focus updates
- Route keyboard through WindowManager focus

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 3: CommandPalette.js

### Task 3: Create Command Palette

**Files:**
- Create: `systems/visual_shell/web/CommandPalette.js`

- [ ] **Step 1: Write CommandPalette.js**

```javascript
/**
 * CommandPalette.js
 *
 * App launcher triggered by backtick (`) key.
 * Filters available apps and sends load request to bridge.
 */

export class CommandPalette {
    constructor(client, options = {}) {
        this.client = client;
        this.options = {
            triggerKey: 192,  // Backtick
            fontFamily: 'Courier New, monospace',
            fontSize: 14,
            ...options
        };

        this.visible = false;
        this.filter = '';
        this.apps = [];
        this.selectedIndex = 0;
        this.container = null;
        this.inputText = null;
        this.listContainer = null;

        this._createUI();
        this._setupKeyHandler();
    }

    _createUI() {
        // Main container (hidden by default)
        this.container = new PIXI.Container();
        this.container.visible = false;

        const width = 400;
        const height = 300;

        // Background overlay (semi-transparent)
        const overlay = new PIXI.Graphics();
        overlay.beginFill(0x000000, 0.7);
        overlay.drawRect(0, 0, globalThis.innerWidth || 800, globalThis.innerHeight || 600);
        overlay.endFill();
        overlay.eventMode = 'static';
        overlay.on('pointerdown', () => this.hide());
        this.container.addChild(overlay);

        // Palette box
        const boxX = ((globalThis.innerWidth || 800) - width) / 2;
        const boxY = 100;

        const box = new PIXI.Graphics();
        box.beginFill(0x1a1a2e);
        box.lineStyle(2, 0x00ff88);
        box.drawRoundedRect(boxX, boxY, width, height, 8);
        box.endFill();
        this.container.addChild(box);

        // Input field background
        const inputBg = new PIXI.Graphics();
        inputBg.beginFill(0x0f0f1a);
        inputBg.drawRoundedRect(boxX + 10, boxY + 10, width - 20, 40, 4);
        inputBg.endFill();
        this.container.addChild(inputBg);

        // Input text (shows filter)
        this.inputText = new PIXI.Text('>', {
            fontFamily: this.options.fontFamily,
            fontSize: this.options.fontSize,
            fill: 0x00ff88,
        });
        this.inputText.x = boxX + 20;
        this.inputText.y = boxY + 20;
        this.container.addChild(this.inputText);

        // List container
        this.listContainer = new PIXI.Container();
        this.listContainer.x = boxX + 10;
        this.listContainer.y = boxY + 60;
        this.container.addChild(this.listContainer);

        // Instructions
        const instructions = new PIXI.Text('Type to filter, Enter to launch, Esc to close', {
            fontFamily: this.options.fontFamily,
            fontSize: 10,
            fill: 0x666666,
        });
        instructions.x = boxX + 10;
        instructions.y = boxY + height - 25;
        this.container.addChild(instructions);
    }

    _setupKeyHandler() {
        globalThis.addEventListener('keydown', (e) => {
            // Toggle on backtick
            if (e.keyCode === this.options.triggerKey) {
                e.preventDefault();
                this.toggle();
                return;
            }

            if (!this.visible) return;

            // Escape closes
            if (e.keyCode === 27) {
                this.hide();
                return;
            }

            // Enter launches selected
            if (e.keyCode === 13) {
                this._launchSelected();
                return;
            }

            // Up/Down navigation
            if (e.keyCode === 38) {  // Up
                e.preventDefault();
                this._selectPrevious();
                return;
            }
            if (e.keyCode === 40) {  // Down
                e.preventDefault();
                this._selectNext();
                return;
            }

            // Typing updates filter
            if (e.key.length === 1 && !e.ctrlKey && !e.metaKey) {
                this.filter += e.key.toLowerCase();
                this._updateList();
            } else if (e.keyCode === 8) {  // Backspace
                this.filter = this.filter.slice(0, -1);
                this._updateList();
            }
        });
    }

    setApps(apps) {
        this.apps = apps;
        this._updateList();
    }

    toggle() {
        if (this.visible) {
            this.hide();
        } else {
            this.show();
        }
    }

    show() {
        this.visible = true;
        this.filter = '';
        this.selectedIndex = 0;
        this.container.visible = true;
        this._updateList();

        // Request app list from server
        this.client.send({ type: 'list_apps', data: {} });
    }

    hide() {
        this.visible = false;
        this.container.visible = false;
    }

    _getFilteredApps() {
        if (!this.filter) return this.apps;

        return this.apps.filter(app => {
            const name = app.toLowerCase();
            // Simple substring match
            return name.includes(this.filter);
        });
    }

    _updateList() {
        // Clear existing list items
        while (this.listContainer.children.length > 0) {
            this.listContainer.removeChildAt(0);
        }

        // Update input text
        this.inputText.text = `> ${this.filter}_`;

        // Get filtered apps
        const filtered = this._getFilteredApps();

        // Clamp selection
        if (this.selectedIndex >= filtered.length) {
            this.selectedIndex = Math.max(0, filtered.length - 1);
        }

        // Draw list items
        filtered.slice(0, 8).forEach((app, i) => {
            const isSelected = i === this.selectedIndex;

            const itemBg = new PIXI.Graphics();
            itemBg.beginFill(isSelected ? 0x00ff88 : 0x1a1a2e);
            itemBg.drawRoundedRect(0, i * 28, 380, 26, 4);
            itemBg.endFill();
            itemBg.eventMode = 'static';
            itemBg.on('pointerdown', () => {
                this.selectedIndex = i;
                this._launchSelected();
            });
            this.listContainer.addChild(itemBg);

            const itemText = new PIXI.Text(app, {
                fontFamily: this.options.fontFamily,
                fontSize: this.options.fontSize,
                fill: isSelected ? 0x000000 : 0xffffff,
            });
            itemText.x = 10;
            itemText.y = i * 28 + 5;
            this.listContainer.addChild(itemText);
        });
    }

    _selectNext() {
        const filtered = this._getFilteredApps();
        if (this.selectedIndex < filtered.length - 1) {
            this.selectedIndex++;
            this._updateList();
        }
    }

    _selectPrevious() {
        if (this.selectedIndex > 0) {
            this.selectedIndex--;
            this._updateList();
        }
    }

    _launchSelected() {
        const filtered = this._getFilteredApps();
        if (filtered.length === 0) return;

        const appName = filtered[this.selectedIndex];
        this.client.send({
            type: 'load_app_by_name',
            data: { name: appName }
        });
        this.hide();
    }

    addToContainer(container) {
        container.addChild(this.container);
    }
}
```

- [ ] **Step 2: Commit CommandPalette.js**

```bash
git add systems/visual_shell/web/CommandPalette.js
git commit -m "feat(visual_shell): add CommandPalette for app launching

- Toggle with backtick (`) key
- Type to filter available apps
- Enter launches selected app
- Arrow keys navigate list

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 4: GlyphVMBridge Backend

### Task 4: Add load_app_by_name Handler

**Files:**
- Modify: `systems/visual_shell/api/glyph_vm_bridge.py`

- [ ] **Step 1: Add import for AppLoader**

Add near the top of the file (after the GPU VM imports):

```python
# Import AppLoader for app discovery
try:
    from systems.spatial_coordinator.apps import AppLoader
    HAS_APP_LOADER = True
except ImportError as e:
    logger.warning(f"AppLoader not available: {e}")
    AppLoader = None
    HAS_APP_LOADER = False
```

- [ ] **Step 2: Add app loader initialization in __init__**

Add to the `__init__` method:

```python
def __init__(self, host: str = "localhost", port: int = 8770):
    # ... existing code ...

    # App loader for loading apps by name
    self._app_loader: Optional[AppLoader] = None
```

- [ ] **Step 3: Add message handlers in _handle_message**

Add these cases to the `if/elif` chain in `_handle_message`:

```python
elif msg_type == "load_app_by_name":
    await self._handle_load_app_by_name(data.get("data", {}))
elif msg_type == "list_apps":
    await self._handle_list_apps()
```

- [ ] **Step 4: Implement the new handlers**

Add these methods to the `GlyphVMBridge` class:

```python
async def _handle_load_app_by_name(self, data: dict):
    """Load an app by name using AppLoader for discovery, but load into bridge's VM."""
    if self.vm is None:
        return

    app_name = data.get("name")
    if not app_name:
        logger.error("load_app_by_name requires 'name' field")
        return

    # Use AppLoader only for app discovery (not for VM execution)
    if self._app_loader is None and HAS_APP_LOADER:
        self._app_loader = AppLoader()
        # Note: We DON'T use AppLoader's VM - we use self.vm directly

    if self._app_loader is None:
        logger.error("AppLoader not available")
        return

    # Check if app exists in discovered apps
    if app_name not in self._app_loader._app_info:
        logger.error(f"Unknown app: {app_name}")
        await self.broadcast({
            "type": "error",
            "data": {"message": f"Unknown app: {app_name}"}
        })
        return

    # Get the app binary from AppLoader's discovery
    app_info = self._app_loader._app_info[app_name]
    app_binary = app_info.get('binary')

    if app_binary is None:
        logger.error(f"App '{app_name}' has no binary")
        return

    # Load into OUR VM (not AppLoader's VM)
    app_id = self.vm.load_app(app_binary)
    if app_id is None:
        logger.error(f"Failed to load app: {app_name}")
        return

    # Get app info from our VM
    app = self.vm._apps[app_id]
    ctx = app['context']

    # Initialize glyph buffer
    glyph_count = ctx.width * ctx.height
    self._glyph_buffers[app_id] = [32] * glyph_count

    # Broadcast app loaded with name
    await self.broadcast({
        "type": "app_loaded",
        "data": {
            "app_id": app_id,
            "name": app_name,
            "x": ctx.origin_x,
            "y": ctx.origin_y,
            "width": ctx.width,
            "height": ctx.height,
            "flags": app['flags'],
        }
    })

    # Send initial glyph state
    await self._broadcast_glyph_update(app_id)

    logger.info(f"App '{app_name}' loaded as app_id={app_id}")

async def _handle_list_apps(self):
    """Send list of available apps."""
    # Initialize AppLoader for discovery only if needed
    if self._app_loader is None and HAS_APP_LOADER:
        self._app_loader = AppLoader()
        # Note: AppLoader discovers apps in __init__, no VM needed

    apps = []
    if self._app_loader:
        apps = list(self._app_loader._app_info.keys())

    await self.broadcast({
        "type": "app_list",
        "data": {"apps": apps}
    })
    logger.debug(f"Sent app list: {apps}")

async def _broadcast_glyph_update(self, app_id: int):
    """Broadcast glyph buffer for a specific app."""
    if app_id not in self._glyph_buffers:
        return

    app = self.vm._apps[app_id]
    if app is None:
        return

    ctx = app['context']
    glyphs = self._glyph_buffers[app_id]

    # Convert to 2D array
    glyph_grid = []
    for y in range(ctx.height):
        row = glyphs[y * ctx.width:(y + 1) * ctx.width]
        glyph_grid.append(row)

    await self.broadcast({
        "type": "app_render",
        "data": {
            "app_id": app_id,
            "glyphs": glyph_grid,
        }
    })
```

- [ ] **Step 5: Commit GlyphVMBridge changes**

```bash
git add systems/visual_shell/api/glyph_vm_bridge.py
git commit -m "feat(visual_shell): add load_app_by_name and list_apps handlers

- load_app_by_name: Load app using AppLoader by name
- list_apps: Return available app names
- Broadcast app_list and initial glyph state

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 5: Integration

### Task 5: Wire Everything Together

**Files:**
- Modify: `systems/visual_shell/web/GlyphWindowRenderer.js` (createGlyphDesktop function)

- [ ] **Step 1: Update createGlyphDesktop to use WindowManager and CommandPalette**

**NOTE:** This step uses `SpatialCoordinatorClient` which already exists at `systems/visual_shell/web/SpatialCoordinatorClient.js`. Ensure that file is available.

Replace the `createGlyphDesktop` function at the end of `GlyphWindowRenderer.js`:

```javascript
import { SpatialCoordinatorClient } from './SpatialCoordinatorClient.js';  // ADD at top of file

// ... existing code ...

export async function createGlyphDesktop(containerId, bridgeUrl = 'ws://localhost:8770') {
    // Import PixiJS
    const PIXI = await import('https://cdn.skypack.dev/pixi.js@7');

    // Import components (created in previous tasks)
    const { WindowManager } = await import('./WindowManager.js');
    const { CommandPalette } = await import('./CommandPalette.js');

    // Create PixiJS application
    const app = new PIXI.Application({
        width: window.innerWidth,
        height: window.innerHeight,
        backgroundColor: 0x0f0f1a,
        antialias: true,
    });

    const container = document.getElementById(containerId);
    if (container) {
        container.appendChild(app.view);
    }

    // Create client
    const client = new SpatialCoordinatorClient(bridgeUrl);

    // Create WindowManager
    const windowManager = new WindowManager();

    // Create renderer with WindowManager
    const renderer = new GlyphWindowRenderer(client, app.stage, {}, windowManager);

    // Create CommandPalette
    const commandPalette = new CommandPalette(client);
    commandPalette.addToContainer(app.stage);

    // Handle app list from server
    client.on('app_list', (data) => {
        commandPalette.setApps(data.apps);
    });

    // Handle window dragging
    app.stage.eventMode = 'static';
    app.stage.hitArea = app.screen;

    app.stage.on('pointermove', (e) => {
        if (windowManager.isDragging()) {
            windowManager.updateDrag(e.global.x, e.global.y);
        }
    });

    app.stage.on('pointerup', () => {
        windowManager.endDrag();
    });

    app.stage.on('pointerupoutside', () => {
        windowManager.endDrag();
    });

    // Connect
    client.connect();

    // Handle keyboard (skip if command palette is visible)
    window.addEventListener('keydown', (e) => {
        if (commandPalette.visible && e.keyCode !== 27 && e.keyCode !== 192) {
            return; // Let command palette handle it
        }
        renderer.handleKeyboard(e);
    });

    // Handle resize
    window.addEventListener('resize', () => {
        app.renderer.resize(window.innerWidth, window.innerHeight);
    });

    return { app, client, renderer, windowManager, commandPalette };
}
```

- [ ] **Step 2: Commit integration changes**

```bash
git add systems/visual_shell/web/GlyphWindowRenderer.js
git commit -m "feat(visual_shell): integrate WindowManager and CommandPalette

- Create WindowManager for window state management
- Add CommandPalette for app launching
- Wire up drag handling and keyboard routing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Success Criteria

- [ ] Can load multiple apps simultaneously via command palette
- [ ] Windows appear at cascaded positions (100+30n, 100+30n)
- [ ] Windows can be dragged by title bar
- [ ] Clicking a window focuses it (border turns green)
- [ ] Close button [X] unloads app and removes window
- [ ] Command palette (backtick) lists and launches apps
- [ ] Keyboard input routes to focused window

---

*Created: 2026-03-13*
