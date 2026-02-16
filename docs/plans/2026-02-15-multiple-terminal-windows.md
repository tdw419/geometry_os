# Multiple Terminal Windows Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable multiple independent terminal windows on the Geometry OS map with proper focus management.

**Architecture:** Refactor map_terminal.py to introduce a TerminalManager that coordinates multiple MapTerminal instances. A single InputServer WebSocket routes keystrokes to the active terminal. Browser-side terminalRegistry mirrors state and handles hit-testing.

**Tech Stack:** Python asyncio, WebSocket, Chrome DevTools Protocol, PixiJS

---

## Task 1: Add TerminalManager Class

**Files:**
- Modify: `map_terminal.py` (add after imports, before InputServer)

**Step 1: Add TerminalManager class**

Add after line 29 (after the vm_linux_bridge import):

```python
class TerminalManager:
    """Manages multiple terminal instances."""

    def __init__(self, ws, bridge: VMLinuxBridge):
        self.ws = ws
        self.bridge = bridge
        self.terminals: dict = {}  # id -> MapTerminal
        self.active_terminal_id: int = 0
        self.next_id: int = 1

    def create_terminal(self, x: int = 100, y: int = 100,
                        width: int = 450, height: int = 350) -> 'MapTerminal':
        """Create a new terminal instance."""
        term_id = self.next_id
        self.next_id += 1

        terminal = MapTerminal(
            ws=self.ws,
            bridge=self.bridge,
            term_id=term_id,
            x=x, y=y,
            width=width, height=height
        )
        self.terminals[term_id] = terminal

        # First terminal is auto-focused
        if len(self.terminals) == 1:
            self.active_terminal_id = term_id
            terminal.focused = True

        return terminal

    def get_terminal(self, term_id: int) -> 'MapTerminal':
        """Get terminal by ID."""
        return self.terminals.get(term_id)

    def get_active(self) -> 'MapTerminal':
        """Get the currently active terminal."""
        return self.terminals.get(self.active_terminal_id)

    def focus_terminal(self, term_id: int):
        """Set focus to a specific terminal."""
        # Unfocus current
        current = self.get_active()
        if current:
            current.focused = False

        # Focus new
        terminal = self.terminals.get(term_id)
        if terminal:
            self.active_terminal_id = term_id
            terminal.focused = True

    def destroy_terminal(self, term_id: int):
        """Remove a terminal."""
        if term_id in self.terminals:
            del self.terminals[term_id]

            # If we destroyed the active terminal, focus another
            if self.active_terminal_id == term_id and self.terminals:
                self.active_terminal_id = list(self.terminals.keys())[0]
                self.terminals[self.active_terminal_id].focused = True

    def get_next_position(self) -> tuple:
        """Calculate position for next terminal (offset from existing)."""
        count = len(self.terminals)
        offset = count * 50
        return (100 + offset, 100 + offset)
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add TerminalManager class for multi-window support"
```

---

## Task 2: Enhance MapTerminal with ID and Working Directory

**Files:**
- Modify: `map_terminal.py` (MapTerminal class)

**Step 1: Update MapTerminal.__init__**

Change the MapTerminal __init__ from:

```python
def __init__(self, ws, bridge: VMLinuxBridge, x=400, y=200, width=400, height=300):
```

To:

```python
def __init__(self, ws, bridge: VMLinuxBridge, term_id: int, x=400, y=200, width=400, height=300, working_dir: str = "~"):
        self.ws = ws
        self.bridge = bridge
        self.term_id = term_id
        self.working_dir = working_dir
        self.x = x
        self.y = y
        self.width = width
        self.height = height
```

**Step 2: Add working_dir update on cd command**

In the `execute` method, after command execution, add:

```python
        # Update working directory if cd command
        if command.strip().startswith('cd '):
            result = await self.bridge.execute('pwd')
            if result.exit_code == 0:
                self.working_dir = result.stdout.strip()
```

**Step 3: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add term_id and working_dir to MapTerminal"
```

---

## Task 3: Refactor InputServer to Use TerminalManager

**Files:**
- Modify: `map_terminal.py` (InputServer class)

**Step 1: Update InputServer to accept TerminalManager**

Change InputServer.__init__ from:

```python
def __init__(self, terminal, port=8765):
    self.terminal = terminal
```

To:

```python
def __init__(self, manager: TerminalManager, port=8765):
    self.manager = manager
```

**Step 2: Update process_keystroke to handle new message types**

Replace the entire `process_keystroke` method with:

```python
    async def process_keystroke(self, data):
        """Process a keystroke or command from the browser."""
        event_type = data.get('type')

        if event_type == 'key':
            key = data.get('key', '')
            # Route to active terminal
            terminal = self.manager.get_active()
            if terminal:
                await terminal.handle_key(key)

        elif event_type == 'focus_change':
            # Browser reports which terminal was clicked
            to_id = data.get('toId', 0)
            from_id = data.get('fromId', 0)

            # Unfocus old terminal
            old_term = self.manager.get_terminal(from_id)
            if old_term:
                old_term.focused = False
                await old_term.render()

            # Focus new terminal
            self.manager.focus_terminal(to_id)
            new_term = self.manager.get_active()
            if new_term:
                await new_term.render()

        elif event_type == 'new_terminal':
            # Create new terminal
            x, y = self.manager.get_next_position()
            terminal = self.manager.create_terminal(x=x, y=y)
            await terminal.init_display()
            print(f"Created terminal #{terminal.term_id}")

        elif event_type == 'close_terminal':
            term_id = data.get('id', 0)
            self.manager.destroy_terminal(term_id)
            print(f"Closed terminal #{term_id}")
```

**Step 3: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): refactor InputServer to route via TerminalManager"
```

---

## Task 4: Update init_display for terminalRegistry

**Files:**
- Modify: `map_terminal.py` (MapTerminal.init_display)

**Step 1: Replace init_display with multi-terminal version**

Replace the entire `init_display` method with:

```python
    async def init_display(self):
        """Initialize the terminal display on the map."""
        # Initialize terminalRegistry if needed
        setup_js = """
            if (!window.terminalRegistry) {
                window.terminalRegistry = {
                    terminals: new Map(),
                    activeId: null,

                    register(id, x, y, width, height, workingDir) {
                        this.terminals.set(id, { x, y, width, height, workingDir, focused: false });
                    },

                    update(id, props) {
                        const term = this.terminals.get(id);
                        if (term) Object.assign(term, props);
                    },

                    unregister(id) {
                        this.terminals.delete(id);
                    },

                    setActive(id) {
                        // Unfocus old
                        if (this.activeId !== null) {
                            const old = this.terminals.get(this.activeId);
                            if (old) old.focused = false;
                        }
                        // Focus new
                        this.activeId = id;
                        const term = this.terminals.get(id);
                        if (term) term.focused = true;
                    },

                    hitTest(x, y) {
                        for (const [id, term] of this.terminals) {
                            if (x >= term.x && x <= term.x + term.width &&
                                y >= term.y && y <= term.y + term.height) {
                                return id;
                            }
                        }
                        return null;
                    }
                };
                console.log('Terminal registry initialized');
            }

            // Register this terminal
            window.terminalRegistry.register(
                """ + str(self.term_id) + """,
                """ + str(self.x) + """,
                """ + str(self.y) + """,
                """ + str(self.width) + """,
                """ + str(self.height) + """,
                '""" + str(self.working_dir) + """'
            );

            // Set as active if first terminal
            if (window.terminalRegistry.activeId === null) {
                window.terminalRegistry.setActive(""" + str(self.term_id) + """);
            }
        """
        await self.send_js(setup_js)

        // Setup global click handler (only once)
        await self._setup_click_handler()

        // Setup keyboard handler (only once)
        await self._setup_keyboard_handler()

        print(f"Terminal #{self.term_id} display initialized")

    async def _setup_click_handler(self):
        """Setup click handler (idempotent)."""
        setup_js = """
            if (!window._terminalClickHandlerInstalled) {
                window._terminalClickHandlerInstalled = true;

                window.geometryOSApp.app.view.addEventListener('click', (e) => {
                    const rect = window.geometryOSApp.app.view.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;

                    const hitId = window.terminalRegistry.hitTest(x, y);
                    const activeId = window.terminalRegistry.activeId;

                    if (hitId !== null && hitId !== activeId) {
                        // Focus change
                        if (window._terminalInputSocket && window._terminalInputSocket.readyState === WebSocket.OPEN) {
                            window._terminalInputSocket.send(JSON.stringify({
                                type: 'focus_change',
                                fromId: activeId,
                                toId: hitId
                            }));
                        }
                    }
                });

                console.log('Terminal click handler installed');
            }
        """
        await self.send_js(setup_js)

    async def _setup_keyboard_handler(self):
        """Setup keyboard handler with new terminal shortcut."""
        setup_js = """
            if (!window._terminalKeyboardHandlerInstalled) {
                window._terminalKeyboardHandlerInstalled = true;

                document.addEventListener('keydown', (e) => {
                    // Ctrl+Shift+T = new terminal
                    if (e.ctrlKey && e.shiftKey && e.key === 'T') {
                        e.preventDefault();
                        if (window._terminalInputSocket && window._terminalInputSocket.readyState === WebSocket.OPEN) {
                            window._terminalInputSocket.send(JSON.stringify({ type: 'new_terminal' }));
                        }
                        return;
                    }

                    // Regular keystroke - route to active terminal
                    const activeId = window.terminalRegistry.activeId;
                    if (activeId === null) return;

                    const term = window.terminalRegistry.terminals.get(activeId);
                    if (!term || !term.focused) return;

                    if (e.key !== 'F11' && e.key !== 'F12') {
                        e.preventDefault();
                    }

                    if (window._terminalInputSocket && window._terminalInputSocket.readyState === WebSocket.OPEN) {
                        window._terminalInputSocket.send(JSON.stringify({
                            type: 'key',
                            key: e.key,
                            code: e.code,
                            ctrlKey: e.ctrlKey,
                            shiftKey: e.shiftKey,
                            altKey: e.altKey
                        }));
                    }
                });

                console.log('Terminal keyboard handler installed');
            }
        """
        await self.send_js(setup_js)
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add terminalRegistry and Ctrl+Shift+T shortcut"
```

---

## Task 5: Update render() for Working Directory Title

**Files:**
- Modify: `map_terminal.py` (MapTerminal.render)

**Step 1: Update title in render method**

Change the title_text line from:

```python
title_text = f"Terminal {title_indicator}".strip()
```

To:

```python
title_text = f"{self.working_dir} {title_indicator}".strip()
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): show working directory in terminal title"
```

---

## Task 6: Update main() for TerminalManager

**Files:**
- Modify: `map_terminal.py` (main function)

**Step 1: Update main to use TerminalManager**

Replace the main function's terminal creation with:

```python
    async with websockets.connect(ws_url) as ws:
        # Create the appropriate bridge
        bridge = await create_bridge(args.backend, cdp_ws=ws, kernel=args.kernel)

        # Create terminal manager
        global manager
        manager = TerminalManager(ws, bridge)

        # Create input server (now uses manager instead of single terminal)
        input_server = InputServer(manager, port=8765)

        # Create first terminal
        terminal = manager.create_terminal(x=100, y=100)
        await terminal.init_display()

        print()
        print("Terminal ready!")
        print()
        print("  • Click on a terminal to focus it")
        print("  • Press Ctrl+Shift+T for new terminal")
        print("  • Type commands directly")
        print("  • Press Enter to execute")
        print("  • Press Escape to clear input")
        print()

        # Show backend info
        info = bridge.get_info()
        print(f"Backend: {info.get('vm_type', 'unknown')} ({info.get('backend', 'unknown')})")
        print()

        # Run welcome command
        await terminal.input("echo 'Welcome to Geometry OS Terminal!'")
        await asyncio.sleep(0.5)

        # Start input server (this runs forever)
        await input_server.start()
        await input_server.server.serve_forever()
```

**Step 2: Update global variable at bottom**

Change:
```python
terminal = None
```

To:
```python
manager = None
```

**Step 3: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): integrate TerminalManager into main loop"
```

---

## Task 7: Manual Verification

**Files:**
- None (manual testing)

**Step 1: Start Chrome with debugging**

```bash
google-chrome --remote-debugging-port=9222 http://localhost:8001/index.html
```

**Step 2: Start the terminal**

```bash
python3 map_terminal.py
```

**Step 3: Verify the following**

1. Terminal appears with working directory in title (e.g., "~ ●")
2. Press Ctrl+Shift+T - second terminal appears at offset position
3. Click on first terminal - focus changes, border turns green
4. Click on second terminal - focus changes there
5. Type in focused terminal - only that one receives input
6. Run `cd /tmp` in one terminal - title updates to "/tmp"
7. Create 3+ terminals - each appears at different offset

**Step 4: Document verification**

```bash
echo "Phase 50.3: Multiple Terminal Windows - VERIFIED" >> VERIFICATION.md
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Add TerminalManager class | `map_terminal.py` |
| 2 | Enhance MapTerminal with id/working_dir | `map_terminal.py` |
| 3 | Refactor InputServer for TerminalManager | `map_terminal.py` |
| 4 | Add terminalRegistry and Ctrl+Shift+T | `map_terminal.py` |
| 5 | Update render for working dir title | `map_terminal.py` |
| 6 | Update main for TerminalManager | `map_terminal.py` |
| 7 | Manual verification | Manual |
