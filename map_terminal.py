"""
Geometry OS: On-Map Terminal

A functional terminal rendered on the PixiJS map that:
1. Displays a terminal window with text
2. Accepts commands (via Python or browser)
3. Executes shell commands on the backend
4. Displays output in real-time

Usage:
    python3 map_terminal.py

Then in browser console:
    terminal.input("ls -la")
    terminal.input("pwd")
"""

import asyncio
import json
import requests
import websockets
from websockets.server import serve
import subprocess
import time


class InputServer:
    """WebSocket server that receives keystrokes from browser."""

    def __init__(self, terminal, port=8765):
        self.terminal = terminal
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
        """Process a keystroke from the browser."""
        event_type = data.get('type')

        if event_type == 'key':
            key = data.get('key', '')
            await self.terminal.handle_key(key)
        elif event_type == 'focus':
            focused = data.get('focused', False)
            await self.terminal.set_focus(focused)

    async def start(self):
        """Start the WebSocket server."""
        self.server = await serve(self.handle_client, "localhost", self.port)
        print(f"Input server listening on ws://localhost:{self.port}")


class MapTerminal:
    def __init__(self, ws, x=400, y=200, width=400, height=300):
        self.ws = ws
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
        # Create terminal window with keyboard capture
        setup_js = f"""
            // Store terminal state globally
            window.mapTerminal = {{
                x: {self.x},
                y: {self.y},
                width: {self.width},
                height: {self.height},
                lines: [],
                cursorVisible: true,
                focused: false,
                inputSocket: null
            }};

            // Connect to input server
            try {{
                window.mapTerminal.inputSocket = new WebSocket('ws://localhost:8765');
                window.mapTerminal.inputSocket.onopen = () => {{
                    console.log('Terminal input socket connected');
                }};
                window.mapTerminal.inputSocket.onclose = () => {{
                    console.log('Terminal input socket disconnected');
                }};
                window.mapTerminal.inputSocket.onerror = (e) => {{
                    console.error('Terminal input socket error:', e);
                }};
            }} catch (e) {{
                console.error('Failed to connect input socket:', e);
            }}

            // Click detection for focus
            window.geometryOSApp.app.view.addEventListener('click', (e) => {{
                const rect = window.geometryOSApp.app.view.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                const term = window.mapTerminal;

                // Check if click is inside terminal
                const insideTerminal = (
                    x >= term.x && x <= term.x + term.width &&
                    y >= term.y && y <= term.y + term.height
                );

                if (insideTerminal && !term.focused) {{
                    term.focused = true;
                    if (term.inputSocket && term.inputSocket.readyState === WebSocket.OPEN) {{
                        term.inputSocket.send(JSON.stringify({{type: 'focus', focused: true}}));
                    }}
                }} else if (!insideTerminal && term.focused) {{
                    term.focused = false;
                    if (term.inputSocket && term.inputSocket.readyState === WebSocket.OPEN) {{
                        term.inputSocket.send(JSON.stringify({{type: 'focus', focused: false}}));
                    }}
                }}
            }});

            // Keyboard capture
            document.addEventListener('keydown', (e) => {{
                const term = window.mapTerminal;
                if (!term.focused) return;

                // Prevent default for most keys
                if (e.key !== 'F11' && e.key !== 'F12') {{
                    e.preventDefault();
                }}

                // Send to Python
                if (term.inputSocket && term.inputSocket.readyState === WebSocket.OPEN) {{
                    term.inputSocket.send(JSON.stringify({{
                        type: 'key',
                        key: e.key,
                        code: e.code,
                        ctrlKey: e.ctrlKey,
                        shiftKey: e.shiftKey,
                        altKey: e.altKey
                    }}));
                }}
            }});

            // Clear and draw terminal background
            window.geometryOSApp.clearGraphics();

            // Terminal window background
            window.geometryOSApp.drawRect(
                window.mapTerminal.x,
                window.mapTerminal.y,
                window.mapTerminal.width,
                window.mapTerminal.height,
                0x0D0D0D,  // Near black
                0.95
            );

            // Terminal title bar
            window.geometryOSApp.drawRect(
                window.mapTerminal.x,
                window.mapTerminal.y,
                window.mapTerminal.width,
                25,
                0x1A1A2E,
                1.0
            );

            // Title text
            window.geometryOSApp.placeText('term_title', 'Terminal (click to focus)',
                window.mapTerminal.x + 10, window.mapTerminal.y + 12,
                {{fontFamily: 'Courier New', fontSize: 12, fill: 0x00FF00}}
            );

            // Initial prompt line
            window.geometryOSApp.placeText('term_line_0', '$ _',
                window.mapTerminal.x + 10, window.mapTerminal.y + 40,
                {{fontFamily: 'Courier New', fontSize: 14, fill: 0x00FF00}}
            );

            'Terminal initialized';
        """
        await self.send_js(setup_js)
        print("Terminal display initialized on map")
        print("Click on the terminal to focus, then type!")

    async def render(self):
        """Render all terminal lines to the map."""
        # Build the lines to display
        display_lines = self.lines[-self.max_lines:]  # Last N lines
        cursor = "█" if self.focused else "_"
        display_lines.append(self.prompt + self.input_buffer + cursor)  # Input line with cursor

        # Border color based on focus state
        border_color = 0x00FF00 if self.focused else 0x444444
        title_indicator = "●" if self.focused else ""
        title_text = f"Terminal {title_indicator}".strip()

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
            # Run the command
            result = subprocess.run(
                command,
                shell=True,
                capture_output=True,
                text=True,
                timeout=10
            )

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

            if result.returncode != 0:
                self.lines.append(f"[Exit code: {result.returncode}]")

        except subprocess.TimeoutExpired:
            self.lines.append("[Command timed out]")
        except Exception as e:
            self.lines.append(f"[Error: {e}]")

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
            # Execute the command
            if self.input_buffer.strip():
                await self.execute(self.input_buffer)
            else:
                self.input_buffer = ""
                await self.render()
        elif key == 'Backspace':
            self.input_buffer = self.input_buffer[:-1]
            await self.render()
        elif key == 'Escape':
            # Clear input
            self.input_buffer = ""
            await self.render()
        elif len(key) == 1:
            # Regular character
            self.input_buffer += key
            await self.render()


async def main():
    """Main entry point."""
    print("=== Geometry OS: On-Map Terminal ===")
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
        # Create terminal
        global terminal
        terminal = MapTerminal(ws, x=400, y=150, width=450, height=350)

        # Create input server
        input_server = InputServer(terminal, port=8765)

        await terminal.init_display()

        print()
        print("Terminal ready!")
        print()
        print("  • Click on the terminal to focus it")
        print("  • Type commands directly")
        print("  • Press Enter to execute")
        print("  • Press Escape to clear input")
        print("  • Click outside to unfocus")
        print()

        # Run welcome command
        await terminal.input("echo 'Welcome to Geometry OS Terminal!'")
        await asyncio.sleep(0.5)

        # Start input server (this runs forever)
        await input_server.start()
        await input_server.server.serve_forever()

    # Make terminal accessible after connection closes
    print("\nTerminal session ended.")


if __name__ == "__main__":
    # Global terminal reference for console access
    terminal = None
    asyncio.run(main())
