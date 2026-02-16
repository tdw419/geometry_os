"""
Geometry OS: On-Map Terminal

A functional terminal rendered on the PixiJS map that:
1. Displays a terminal window with text
2. Accepts commands (via Python or browser)
3. Executes shell commands on the backend
4. Displays output in real-time

Usage:
    python3 map_terminal.py                    # Host backend (default)
    python3 map_terminal.py --backend qemu     # QEMU via linux_bridge.py
    python3 map_terminal.py --backend wgpu     # WGPU hypervisor

Then in browser console:
    terminal.input("ls -la")
    terminal.input("pwd")
"""

import argparse
import asyncio
import json
import requests
import websockets
from websockets.server import serve
import subprocess
import time

from vm_linux_bridge import VMLinuxBridge, HostBridge, QEMUBridge, WGPUBridge


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


class InputServer:
    """WebSocket server that receives keystrokes from browser."""

    def __init__(self, manager: TerminalManager, port=8765):
        self.manager = manager
        self.port = port
        self.clients = set()

    async def handle_client(self, websocket):
        """Handle incoming keystroke messages."""
        self.clients.add(websocket)
        try:
            async for message in websocket:
                data = json.loads(message)
                await self.process_keystroke(data)
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.clients.discard(websocket)

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

        elif event_type == 'focus':
            # Legacy single-terminal focus (for backwards compat)
            focused = data.get('focused', False)
            terminal = self.manager.get_active()
            if terminal:
                await terminal.set_focus(focused)

    async def start(self):
        """Start the WebSocket server."""
        self.server = await serve(self.handle_client, "localhost", self.port)
        print(f"Input server listening on ws://localhost:{self.port}")


class MapTerminal:
    def __init__(self, ws, bridge: VMLinuxBridge, term_id: int, x=400, y=200, width=400, height=300, working_dir: str = "~"):
        self.ws = ws
        self.bridge = bridge
        self.term_id = term_id
        self.working_dir = working_dir
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.lines = []  # Terminal output lines
        self.max_lines = 12  # Max visible lines
        self.input_buffer = ""
        self.prompt = "$ "
        self.line_height = 22
        self.msg_id = int(time.time() * 1000)
        self.focused = False

        # Command history
        self.command_history: list = []  # List of previous commands
        self.history_index: int = -1     # Current position in history (-1 = not browsing)
        self.history_max: int = 100      # Maximum commands to store

    async def send_js(self, js_code):
        """Send JavaScript to browser and wait for response."""
        self.msg_id += 1
        payload = {
            "id": self.msg_id,
            "method": "Runtime.evaluate",
            "params": {"expression": js_code}
        }
        await self.ws.send(json.dumps(payload))
        try:
            response = await asyncio.wait_for(self.ws.recv(), timeout=3.0)
            return json.loads(response)
        except asyncio.TimeoutError:
            return None

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
                        if (this.activeId !== null) {
                            const old = this.terminals.get(this.activeId);
                            if (old) old.focused = false;
                        }
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

            // Connect to input server (once)
            if (!window._terminalInputSocket) {
                try {
                    window._terminalInputSocket = new WebSocket('ws://localhost:8765');
                    window._terminalInputSocket.onopen = () => console.log('Terminal input socket connected');
                    window._terminalInputSocket.onerror = (e) => console.error('Terminal input socket error:', e);
                } catch (e) {
                    console.error('Failed to connect input socket:', e);
                }
            }
        """
        await self.send_js(setup_js)

        # Register this terminal
        register_js = f"""
            window.terminalRegistry.register(
                {self.term_id},
                {self.x}, {self.y},
                {self.width}, {self.height},
                '{self.working_dir}'
            );

            // Set as active if first terminal
            if (window.terminalRegistry.activeId === null) {{
                window.terminalRegistry.setActive({self.term_id});
            }}
        """
        await self.send_js(register_js)

        # Setup global handlers (only once)
        await self._setup_click_handler()
        await self._setup_keyboard_handler()

        print(f"Terminal #{self.term_id} display initialized at ({self.x}, {self.y})")

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
        """Setup keyboard handler with Ctrl+Shift+T shortcut."""
        setup_js = """
            if (!window._terminalKeyboardHandlerInstalled) {
                window._terminalKeyboardHandlerInstalled = true;

                document.addEventListener('keydown', (e) => {
                    // Ctrl+Shift+T = new terminal
                    if (e.ctrlKey && e.shiftKey && (e.key === 'T' || e.key === 't')) {
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

                console.log('Terminal keyboard handler installed (Ctrl+Shift+T for new terminal)');
            }
        """
        await self.send_js(setup_js)

    async def render(self):
        """Render all terminal lines to the map."""
        # Build the lines to display
        display_lines = self.lines[-self.max_lines:]  # Last N lines
        cursor = "█" if self.focused else "_"
        display_lines.append(self.prompt + self.input_buffer + cursor)  # Input line with cursor

        # Border color based on focus state
        border_color = 0x00FF00 if self.focused else 0x444444
        title_indicator = "●" if self.focused else ""
        title_text = f"{self.working_dir} {title_indicator}".strip()

        # Create JS to update all text elements
        js_code = "window.geometryOSApp.clearGraphics();\n"

        # Draw border (4 thin rectangles around the terminal)
        js_code += f"""
            // Top border
            window.geometryOSApp.drawRect({self.x - 2}, {self.y - 2}, {self.width + 4}, 2, {border_color}, 1.0);
            // Bottom border
            window.geometryOSApp.drawRect({self.x - 2}, {self.y + self.height}, {self.width + 4}, 2, {border_color}, 1.0);
            // Left border
            window.geometryOSApp.drawRect({self.x - 2}, {self.y - 2}, 2, {self.height + 4}, {border_color}, 1.0);
            // Right border
            window.geometryOSApp.drawRect({self.x + self.width}, {self.y - 2}, 2, {self.height + 4}, {border_color}, 1.0);

            // Redraw terminal window
            window.geometryOSApp.drawRect({self.x}, {self.y}, {self.width}, {self.height}, 0x0D0D0D, 0.95);
            window.geometryOSApp.drawRect({self.x}, {self.y}, {self.width}, 25, 0x1A1A2E, 1.0);
        """

        # Add title text with focus indicator
        js_code += f"""
            window.geometryOSApp.placeText('term_title', '{title_text}',
                {self.x + 10}, {self.y + 12},
                {{fontFamily: 'Courier New', fontSize: 12, fill: 0x00FF00}}
            );
        """

        # Add each line
        for i, line in enumerate(display_lines):
            y_pos = self.y + 40 + (i * self.line_height)
            # Escape quotes in line
            safe_line = line.replace('\\', '\\\\').replace('`', '\\`').replace('$', '\\$')
            js_code += f"""
                window.geometryOSApp.placeText('term_line_{i}', `{safe_line}`,
                    {self.x + 10}, {y_pos},
                    {{fontFamily: 'Courier New', fontSize: 14, fill: 0x00FF00}}
                );
            """

        await self.send_js(js_code)

    async def execute(self, command):
        """Execute a shell command and display output."""
        # Add command to history
        self.lines.append(f"$ {command}")
        await self.render()

        print(f"Executing: {command}")

        try:
            # Run the command via the bridge
            result = await self.bridge.execute(command, timeout=10)

            # Get output
            output = result.stdout
            if result.stderr:
                output += result.stderr

            # Split into lines and add
            if output.strip():
                for line in output.strip().split('\n')[:50]:  # Limit output
                    self.lines.append(line)
            else:
                self.lines.append("(no output)")

            if result.exit_code != 0:
                self.lines.append(f"[Exit code: {result.exit_code}]")

        except Exception as e:
            self.lines.append(f"[Error: {e}]")

        # Update working directory if cd command
        if command.strip().startswith('cd '):
            pwd_result = await self.bridge.execute('pwd', timeout=5)
            if pwd_result.exit_code == 0:
                self.working_dir = pwd_result.stdout.strip()

        # Clear input buffer and re-render
        self.input_buffer = ""
        await self.render()

    async def input(self, command):
        """Accept input command and execute it."""
        self.input_buffer = command
        await self.render()
        await asyncio.sleep(0.1)
        await self.execute(command)

    async def set_focus(self, focused):
        """Set terminal focus state."""
        self.focused = focused
        await self.render()

    async def handle_key(self, key):
        """Handle a keystroke from the browser."""
        if not self.focused:
            return

        if key == 'Enter':
            # Store command in history (if non-empty and different from last)
            if self.input_buffer.strip():
                # Don't duplicate consecutive commands
                if not self.command_history or self.command_history[-1] != self.input_buffer.strip():
                    self.command_history.append(self.input_buffer.strip())
                    # Trim history if too long
                    if len(self.command_history) > self.history_max:
                        self.command_history = self.command_history[-self.history_max:]
                await self.execute(self.input_buffer)
            else:
                self.input_buffer = ""
                await self.render()
            # Reset history index
            self.history_index = -1
        elif key == 'Backspace':
            self.input_buffer = self.input_buffer[:-1]
            await self.render()
        elif key == 'Escape':
            # Clear input
            self.input_buffer = ""
            await self.render()

        elif key == 'ArrowUp':
            # Navigate backward through history
            if self.command_history:
                if self.history_index == -1:
                    # First press - go to most recent
                    self.history_index = len(self.command_history) - 1
                elif self.history_index > 0:
                    self.history_index -= 1

                if self.history_index >= 0:
                    self.input_buffer = self.command_history[self.history_index]
                    await self.render()

        elif key == 'ArrowDown':
            # Navigate forward through history
            if self.history_index != -1:
                if self.history_index < len(self.command_history) - 1:
                    self.history_index += 1
                    self.input_buffer = self.command_history[self.history_index]
                else:
                    # At the end - clear to new line
                    self.history_index = -1
                    self.input_buffer = ""
                await self.render()

        elif key == 'Tab':
            # Autocomplete based on history and common commands
            suggestions = self._get_autocomplete_suggestions(self.input_buffer)
            if suggestions:
                # If multiple matches, show them (or cycle through)
                if len(suggestions) == 1:
                    self.input_buffer = suggestions[0]
                    await self.render()
                # For multiple matches, could show list - for now just take first
                elif len(suggestions) > 1:
                    # Find common prefix
                    common = self._find_common_prefix(suggestions)
                    if common and len(common) > len(self.input_buffer):
                        self.input_buffer = common
                        await self.render()

        elif len(key) == 1:
            # Regular character
            self.input_buffer += key
            await self.render()

    def _get_autocomplete_suggestions(self, partial: str) -> list:
        """Get autocomplete suggestions for partial input."""
        if not partial:
            return []

        suggestions = []
        partial_lower = partial.lower()

        # Check command history first
        for cmd in reversed(self.command_history):
            if cmd.lower().startswith(partial_lower) and cmd not in suggestions:
                suggestions.append(cmd)

        # Add common shell commands
        common_commands = [
            'ls', 'ls -la', 'ls -laF', 'cd', 'cd ..', 'pwd',
            'cat', 'echo', 'mkdir', 'rm', 'cp', 'mv',
            'grep', 'find', 'chmod', 'chown',
            'git status', 'git add', 'git commit', 'git push', 'git pull',
            'python3', 'pip install', 'npm install', 'npm run',
        ]

        for cmd in common_commands:
            if cmd.lower().startswith(partial_lower) and cmd not in suggestions:
                suggestions.append(cmd)

        return suggestions[:10]  # Limit to 10 suggestions

    def _find_common_prefix(self, strings: list) -> str:
        """Find the common prefix among a list of strings."""
        if not strings:
            return ""

        prefix = strings[0]
        for s in strings[1:]:
            while not s.startswith(prefix):
                prefix = prefix[:-1]
                if not prefix:
                    return ""

        return prefix

    def get_state(self) -> dict:
        """Get terminal state as a dictionary (for API responses)."""
        return {
            "id": self.term_id,
            "working_dir": self.working_dir,
            "focused": self.focused,
            "x": self.x,
            "y": self.y,
            "width": self.width,
            "height": self.height,
            "history_count": len(self.command_history),
            "lines_count": len(self.lines),
        }


def parse_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description='Geometry OS On-Map Terminal')
    parser.add_argument(
        '--backend',
        choices=['host', 'qemu', 'wgpu'],
        default='host',
        help='Execution backend: host (default), qemu, or wgpu'
    )
    parser.add_argument(
        '--kernel',
        default='alpine',
        help='Kernel to use for QEMU backend (default: alpine)'
    )
    return parser.parse_args()


async def create_bridge(backend: str, cdp_ws=None, kernel: str = 'alpine') -> VMLinuxBridge:
    """Create the appropriate bridge based on backend selection."""
    if backend == 'host':
        print(f"Using HostBridge (subprocess execution)")
        return HostBridge()

    elif backend == 'qemu':
        print(f"Using QEMUBridge (kernel={kernel})")
        bridge = QEMUBridge(kernel=kernel)
        print("Starting QEMU VM...")
        if await bridge.start():
            print("QEMU VM started successfully")
            return bridge
        else:
            print("WARNING: Failed to start QEMU, falling back to HostBridge")
            return HostBridge()

    elif backend == 'wgpu':
        print("Using WGPUBridge (GPU hypervisor)")
        if cdp_ws is None:
            print("WARNING: No CDP connection for WGPU, falling back to HostBridge")
            return HostBridge()
        bridge = WGPUBridge(cdp_ws)
        print("Initializing WGPU hypervisor...")
        if await bridge.start():
            print("WGPU hypervisor initialized")
            return bridge
        else:
            print("WARNING: Failed to initialize WGPU, falling back to HostBridge")
            return HostBridge()

    else:
        print(f"Unknown backend '{backend}', using HostBridge")
        return HostBridge()


async def main():
    """Main entry point."""
    args = parse_args()

    print("=== Geometry OS: On-Map Terminal ===")
    print(f"Backend: {args.backend}")
    print()

    # Connect to browser
    try:
        resp = requests.get("http://localhost:9222/json")
        pages = resp.json()
        page = next((p for p in pages if "index.html" in p.get("url", "")), None)

        if not page:
            print("ERROR: Could not find 'index.html'. Is the Geometry OS app running?")
            return

        ws_url = page['webSocketDebuggerUrl']
        print(f"Connecting to: {page.get('url')}")

    except requests.exceptions.ConnectionError:
        print("ERROR: Cannot connect to Chrome. Is it running with --remote-debugging-port=9222?")
        return

    async with websockets.connect(ws_url) as ws:
        # Create the appropriate bridge
        bridge = await create_bridge(args.backend, cdp_ws=ws, kernel=args.kernel)

        # Create terminal manager
        global manager
        manager = TerminalManager(ws, bridge)

        # Register with Agent Control Surface (for Pyodide)
        try:
            from agent_control_surface import register_control_surface
            gemini = register_control_surface(manager)
            # Expose globally for JavaScript access
            # Note: In browser, this becomes accessible via window.pyodide.globals
        except ImportError as e:
            print(f"⚠ Agent Control Surface not available: {e}")

        # Create input server (uses manager instead of single terminal)
        input_server = InputServer(manager, port=8765)

        # Create first terminal
        terminal = manager.create_terminal(x=100, y=100)
        await terminal.init_display()

        print()
        print("Multi-Terminal ready!")
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

    print("\nTerminal session ended.")


if __name__ == "__main__":
    # Global manager reference for console access
    manager = None
    asyncio.run(main())
