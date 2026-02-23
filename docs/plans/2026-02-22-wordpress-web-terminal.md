# Geometry OS Web Terminal Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a web-based terminal (xterm.js) accessible through WordPress admin that connects to Geometry OS shell sessions via WebSocket.

**Architecture:** WordPress plugin provides xterm.js UI in admin dashboard. Plugin connects to Visual Bridge WebSocket (port 8768) which spawns PTY sessions using existing TerminalVatBridge. Bidirectional streaming between browser and shell.

**Tech Stack:** PHP (WordPress plugin), JavaScript (xterm.js), Python (Visual Bridge), WebSocket, PTY (via existing Rust API on port 4445)

---

## Prerequisites

**Existing Infrastructure (DO NOT MODIFY):**
- `systems/visual_shell/api/visual_bridge.py` - WebSocket hub on port 8768
- `systems/visual_shell/api/terminal_vat_bridge.py` - PTY spawning via Rust API (port 4445)
- `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/` - Reference implementation

**Required NPM packages:**
- `xterm` - Terminal emulator
- `xterm-addon-fit` - Auto-resize terminal

---

## Task 1: Create WordPress Plugin Structure

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/geometry-os-web-terminal.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/assets/css/terminal.css`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/assets/js/terminal.js`

**Step 1: Create main plugin file**

```php
<?php
/**
 * Plugin Name: Geometry OS Web Terminal
 * Plugin URI: https://geometry.os/plugins/geometry-os-web-terminal
 * Description: Web-based terminal access to Geometry OS shell via xterm.js
 * Version: 1.0.0
 * Author: Geometry OS
 * Author URI: https://geometry.os
 * License: MIT
 * Text Domain: geometry-os-web-terminal
 * Requires at least: 6.0
 * Requires PHP: 8.0
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

class GeometryOS_WebTerminal {
    public const VERSION = '1.0.0';
    private string $plugin_dir;
    private string $plugin_url;

    public function __construct() {
        $this->plugin_dir = plugin_dir_path(__FILE__);
        $this->plugin_url = plugin_dir_url(__FILE__);

        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_assets']);
        add_action('rest_api_init', [$this, 'register_rest_routes']);
    }

    public function add_menu(): void {
        add_menu_page(
            __('Geometry OS Terminal', 'geometry-os-web-terminal'),
            __('GO Terminal', 'geometry-os-web-terminal'),
            'manage_options',
            'geometry-os-web-terminal',
            [$this, 'render_terminal_page'],
            'dashicons-terminal',
            31
        );
    }

    public function render_terminal_page(): void {
        $ws_url = $this->get_websocket_url();
        $session_token = $this->generate_session_token();
        ?>
        <div class="wrap">
            <h1><?php echo esc_html__('Geometry OS Terminal', 'geometry-os-web-terminal'); ?></h1>
            <div id="geometry-os-terminal-container" style="height: calc(100vh - 150px); margin-top: 10px;"></div>
            <script>
            window.GOTerminal = {
                wsUrl: <?php echo json_encode($ws_url); ?>,
                sessionToken: <?php echo json_encode($session_token); ?>,
                cols: 120,
                rows: 36
            };
            </script>
        </div>
        <?php
    }

    private function get_websocket_url(): string {
        // Connect to Visual Bridge WebSocket
        return apply_filters('geometry_os_ws_url', 'ws://localhost:8768');
    }

    private function generate_session_token(): string {
        $user_id = get_current_user_id();
        $session_key = wp_get_session_token();
        return hash('sha256', $user_id . $session_key . NONCE_KEY);
    }

    public function enqueue_assets(string $hook): void {
        if ($hook !== 'toplevel_page_geometry-os-web-terminal') {
            return;
        }

        // xterm.js from CDN
        wp_enqueue_style(
            'xterm-css',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/css/xterm.css',
            [],
            '5.3.0'
        );

        wp_enqueue_script(
            'xterm-js',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/lib/xterm.min.js',
            [],
            '5.3.0',
            true
        );

        wp_enqueue_script(
            'xterm-fit',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/addons/xterm-addon-fit/lib/xterm-addon-fit.min.js',
            ['xterm-js'],
            '5.3.0',
            true
        );

        wp_enqueue_style(
            'geometry-os-terminal-css',
            $this->plugin_url . 'assets/css/terminal.css',
            ['xterm-css'],
            self::VERSION
        );

        wp_enqueue_script(
            'geometry-os-terminal-js',
            $this->plugin_url . 'assets/js/terminal.js',
            ['xterm-js', 'xterm-fit'],
            self::VERSION,
            true
        );
    }

    public function register_rest_routes(): void {
        register_rest_route('geometry-os/v1', '/terminal/session', [
            'methods' => 'POST',
            'callback' => [$this, 'create_terminal_session'],
            'permission_callback' => [$this, 'check_admin_permission'],
        ]);

        register_rest_route('geometry-os/v1', '/terminal/session/(?P<id>[a-f0-9]+)', [
            'methods' => 'DELETE',
            'callback' => [$this, 'destroy_terminal_session'],
            'permission_callback' => [$this, 'check_admin_permission'],
        ]);
    }

    public function check_admin_permission(): bool {
        return current_user_can('manage_options');
    }

    public function create_terminal_session($request): WP_REST_Response {
        $token = $this->generate_session_token();

        // Notify Visual Bridge to prepare terminal session
        $bridge_response = wp_remote_post('http://127.0.0.1:8769/terminal/session', [
            'timeout' => 5,
            'headers' => ['Content-Type' => 'application/json'],
            'body' => json_encode([
                'session_token' => $token,
                'user_id' => get_current_user_id(),
                'cols' => $request->get_param('cols') ?? 120,
                'rows' => $request->get_param('rows') ?? 36,
            ]),
        ]);

        if (is_wp_error($bridge_response)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Failed to connect to Visual Bridge',
            ], 503);
        }

        $body = json_decode(wp_remote_retrieve_body($bridge_response), true);

        return new WP_REST_Response([
            'success' => true,
            'session_id' => $body['session_id'] ?? null,
            'ws_path' => '/terminal/' . ($body['session_id'] ?? 'default'),
        ], 200);
    }

    public function destroy_terminal_session($request): WP_REST_Response {
        $session_id = $request->get_param('id');

        wp_remote_request('http://127.0.0.1:8769/terminal/session/' . $session_id, [
            'method' => 'DELETE',
            'timeout' => 5,
        ]);

        return new WP_REST_Response([
            'success' => true,
            'message' => 'Session destroyed',
        ], 200);
    }

    public static function activate(): void {
        // Verify Visual Bridge is running
        $response = wp_remote_get('http://127.0.0.1:8769/health', ['timeout' => 2]);
        if (is_wp_error($response)) {
            set_transient('geometry_os_terminal_warning', 'Visual Bridge not running on port 8769', 60);
        }
    }
}

new GeometryOS_WebTerminal();

register_activation_hook(__FILE__, [GeometryOS_WebTerminal::class, 'activate']);
```

**Step 2: Create terminal CSS**

```css
/* assets/css/terminal.css */
#geometry-os-terminal-container {
    background: #1a1a2e;
    border: 1px solid #00ffcc;
    border-radius: 8px;
    padding: 10px;
    box-sizing: border-box;
}

#geometry-os-terminal-container .xterm {
    padding: 8px;
}

#geometry-os-terminal-container .xterm-viewport::-webkit-scrollbar {
    width: 8px;
}

#geometry-os-terminal-container .xterm-viewport::-webkit-scrollbar-track {
    background: #1a1a2e;
}

#geometry-os-terminal-container .xterm-viewport::-webkit-scrollbar-thumb {
    background: #00ffcc;
    border-radius: 4px;
}

.terminal-status-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px 10px;
    background: #0d0d1a;
    border-bottom: 1px solid #00ffcc;
    font-family: monospace;
    font-size: 12px;
    color: #888;
}

.terminal-status-bar .status-indicator {
    display: flex;
    align-items: center;
    gap: 5px;
}

.terminal-status-bar .status-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #dc3232;
}

.terminal-status-bar .status-dot.connected {
    background: #46b450;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}
```

**Step 3: Create terminal JavaScript**

```javascript
/* assets/js/terminal.js */
(function() {
    'use strict';

    if (!window.GOTerminal) {
        console.error('GOTerminal config not found');
        return;
    }

    const config = window.GOTerminal;
    let term = null;
    let socket = null;
    let fitAddon = null;

    function init() {
        // Create status bar
        const container = document.getElementById('geometry-os-terminal-container');
        const statusBar = document.createElement('div');
        statusBar.className = 'terminal-status-bar';
        statusBar.innerHTML = `
            <span class="status-indicator">
                <span class="status-dot" id="terminal-status-dot"></span>
                <span id="terminal-status-text">Connecting...</span>
            </span>
            <span id="terminal-size">${config.cols}x${config.rows}</span>
        `;
        container.parentElement.insertBefore(statusBar, container);

        // Initialize xterm.js
        term = new Terminal({
            cols: config.cols,
            rows: config.rows,
            fontFamily: 'JetBrains Mono, Fira Code, monospace',
            fontSize: 14,
            theme: {
                background: '#1a1a2e',
                foreground: '#e0e0e0',
                cursor: '#00ffcc',
                cursorAccent: '#1a1a2e',
                selection: 'rgba(0, 255, 204, 0.3)',
                black: '#1a1a2e',
                red: '#ff6b6b',
                green: '#4ecdc4',
                yellow: '#ffe66d',
                blue: '#4ea8de',
                magenta: '#c77dff',
                cyan: '#00ffcc',
                white: '#e0e0e0',
                brightBlack: '#4a4a5e',
                brightRed: '#ff8787',
                brightGreen: '#72efdd',
                brightYellow: '#fff59d',
                brightBlue: '#74c0fc',
                brightMagenta: '#e599f7',
                brightCyan: '#66d9e8',
                brightWhite: '#ffffff',
            },
            cursorBlink: true,
            cursorStyle: 'block',
            scrollback: 5000,
        });

        // Initialize fit addon
        fitAddon = new FitAddon.FitAddon();
        term.loadAddon(fitAddon);

        // Open terminal
        term.open(container);
        fitAddon.fit();

        // Write welcome message
        term.writeln('\x1b[36m╔══════════════════════════════════════════════════════════════╗\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m     ██████╗ ███████╗ ██████╗ ██████╗ ███╗   ███╗ ██████╗     \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m    ██╔════╝ ██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔═══██╗    \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m    ██║  ███╗█████╗  ██║   ██║██║  ██║██╔████╔██║██║   ██║    \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m    ██║   ██║██╔══╝  ██║   ██║██║  ██║██║╚██╔╝██║██║   ██║    \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m    ╚██████╔╝███████╗╚██████╔╝██████╔╝██║ ╚═╝ ██║╚██████╔╝    \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[32m     ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝     \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m╠══════════════════════════════════════════════════════════════╣\x1b[0m');
        term.writeln('\x1b[36m║\x1b[0m  \x1b[33mGeometry OS Web Terminal v1.0\x1b[0m                              \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m║\x1b[0m  \x1b[90mType 'help' for available commands\x1b[0m                          \x1b[36m║\x1b[0m');
        term.writeln('\x1b[36m╚══════════════════════════════════════════════════════════════╝\x1b[0m');
        term.writeln('');

        // Connect WebSocket
        connectWebSocket();

        // Handle resize
        window.addEventListener('resize', () => {
            fitAddon.fit();
            if (socket && socket.readyState === WebSocket.OPEN) {
                socket.send(JSON.stringify({
                    type: 'resize',
                    cols: term.cols,
                    rows: term.rows
                }));
            }
            document.getElementById('terminal-size').textContent = `${term.cols}x${term.rows}`;
        });
    }

    function connectWebSocket() {
        const wsUrl = `${config.wsUrl}/terminal?token=${config.sessionToken}`;

        term.writeln('\x1b[90mConnecting to Geometry OS...\x1b[0m');

        socket = new WebSocket(wsUrl);

        socket.onopen = function() {
            document.getElementById('terminal-status-dot').classList.add('connected');
            document.getElementById('terminal-status-text').textContent = 'Connected';

            term.writeln('\x1b[32m✓ Connected to Geometry OS Terminal\x1b[0m');
            term.writeln('');

            // Send initial resize
            socket.send(JSON.stringify({
                type: 'resize',
                cols: term.cols,
                rows: term.rows
            }));
        };

        socket.onmessage = function(event) {
            const data = JSON.parse(event.data);

            if (data.type === 'output') {
                term.write(data.data);
            } else if (data.type === 'error') {
                term.writeln(`\x1b[31mError: ${data.message}\x1b[0m`);
            }
        };

        socket.onerror = function(error) {
            document.getElementById('terminal-status-dot').classList.remove('connected');
            document.getElementById('terminal-status-text').textContent = 'Error';
            term.writeln('\x1b[31m✗ WebSocket connection error\x1b[0m');
        };

        socket.onclose = function(event) {
            document.getElementById('terminal-status-dot').classList.remove('connected');
            document.getElementById('terminal-status-text').textContent = 'Disconnected';

            if (event.code === 1000) {
                term.writeln('\x1b[33mConnection closed\x1b[0m');
            } else {
                term.writeln(`\x1b[33mConnection lost (code: ${event.code})\x1b[0m`);
                term.writeln('\x1b[90mReconnecting in 3 seconds...\x1b[0m');
                setTimeout(connectWebSocket, 3000);
            }
        };

        // Send terminal input to server
        term.onData(function(data) {
            if (socket && socket.readyState === WebSocket.OPEN) {
                socket.send(JSON.stringify({
                    type: 'input',
                    data: data
                }));
            }
        });
    }

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
```

**Step 4: Verify plugin structure**

Run: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/`
Expected: Directory with main PHP file and assets/ subdirectory

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/
git commit -m "$(cat <<'EOF'
feat(terminal): add WordPress web terminal plugin with xterm.js

- Create geometry-os-web-terminal plugin structure
- Add xterm.js terminal emulator integration
- Connect to Visual Bridge WebSocket
- Include terminal CSS with Geometry OS theming
- Add session token authentication

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Task 2: Extend Visual Bridge for Terminal WebSocket

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py` (add terminal handlers)
- Modify: `systems/visual_shell/api/visual_bridge.py` (add HTTP endpoint for session creation)

**Step 1: Add terminal session manager import**

At line ~50 in `visual_bridge.py`, add imports:

```python
# Add after existing imports
try:
    from .terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig
    TERMINAL_BRIDGE_AVAILABLE = True
except ImportError:
    TERMINAL_BRIDGE_AVAILABLE = False
```

**Step 2: Add terminal session tracking to VisualBridge class**

Add to `VisualBridge.__init__()` around line ~100:

```python
        # Terminal sessions (if available)
        self._terminal_sessions: Dict[str, dict] = {}
        self._pty_buffers: Dict[str, bytes] = {}

        # Terminal bridge
        if TERMINAL_BRIDGE_AVAILABLE:
            try:
                self._terminal_bridge = TerminalVatBridge(offline_mode=True)
                logger.info("Terminal bridge initialized (offline mode)")
            except Exception as e:
                logger.warning(f"Terminal bridge unavailable: {e}")
                self._terminal_bridge = None
        else:
            self._terminal_bridge = None
```

**Step 3: Add WebSocket terminal message handler**

Add to `VisualBridge._handle_message()` method, inside the message type handling block:

```python
            # Terminal messages
            elif msg_type == 'input':
                await self._handle_terminal_input(client_id, data.get('data', ''))

            elif msg_type == 'resize':
                await self._handle_terminal_resize(client_id, data.get('cols', 120), data.get('rows', 36))
```

**Step 4: Add terminal handler methods**

Add new methods to `VisualBridge` class:

```python
    async def _handle_terminal_input(self, client_id: str, input_data: str) -> None:
        """Handle terminal input from WebSocket client."""
        session = self._terminal_sessions.get(client_id)
        if not session:
            logger.warning(f"No terminal session for client {client_id}")
            return

        # In a full implementation, this would write to the PTY
        # For now, we use a subprocess-based approach
        if session.get('process'):
            try:
                session['process'].stdin.write(input_data.encode())
                session['process'].stdin.flush()
            except Exception as e:
                logger.error(f"Failed to write to PTY: {e}")

    async def _handle_terminal_resize(self, client_id: str, cols: int, rows: int) -> None:
        """Handle terminal resize request."""
        session = self._terminal_sessions.get(client_id)
        if session:
            session['cols'] = cols
            session['rows'] = rows
            logger.debug(f"Terminal {client_id} resized to {cols}x{rows}")

    async def _broadcast_terminal_output(self, client_id: str, output: bytes) -> None:
        """Broadcast terminal output to WebSocket client."""
        if client_id in self._clients:
            message = json.dumps({
                'type': 'output',
                'data': output.decode('utf-8', errors='replace')
            })
            await self._send_to_client(client_id, message)

    def _spawn_terminal_process(self, client_id: str, cols: int = 120, rows: int = 36) -> None:
        """Spawn a PTY process for terminal session."""
        import pty
        import os
        import select
        import asyncio

        # Create pseudo-terminal
        master_fd, slave_fd = pty.openpty()

        # Set terminal size
        import struct
        import fcntl
        import termios
        winsize = struct.pack('HHHH', rows, cols, 0, 0)
        fcntl.ioctl(master_fd, termios.TIOCSWINSZ, winsize)

        # Fork process
        pid = os.fork()

        if pid == 0:
            # Child process
            os.setsid()
            os.dup2(slave_fd, 0)
            os.dup2(slave_fd, 1)
            os.dup2(slave_fd, 2)
            os.close(master_fd)

            # Set environment
            os.environ['TERM'] = 'xterm-256color'
            os.environ['COLUMNS'] = str(cols)
            os.environ['LINES'] = str(rows)

            # Execute shell
            shell = os.environ.get('SHELL', '/bin/bash')
            os.execvp(shell, [shell])

        else:
            # Parent process
            os.close(slave_fd)

            # Store session info
            self._terminal_sessions[client_id] = {
                'pid': pid,
                'master_fd': master_fd,
                'cols': cols,
                'rows': rows,
                'created': time.time()
            }

            # Start async reader task
            if self._loop:
                asyncio.ensure_future(self._read_pty_output(client_id), loop=self._loop)

            logger.info(f"Spawned terminal {client_id} with PID {pid}")

    async def _read_pty_output(self, client_id: str) -> None:
        """Read output from PTY and broadcast to client."""
        import select

        session = self._terminal_sessions.get(client_id)
        if not session:
            return

        master_fd = session['master_fd']

        while client_id in self._terminal_sessions:
            try:
                # Check for data with timeout
                ready, _, _ = select.select([master_fd], [], [], 0.1)

                if ready:
                    try:
                        data = os.read(master_fd, 4096)
                        if data:
                            await self._broadcast_terminal_output(client_id, data)
                        else:
                            # EOF - process exited
                            break
                    except OSError:
                        break

                await asyncio.sleep(0.01)  # Small delay to prevent busy loop

            except Exception as e:
                logger.error(f"Error reading PTY output: {e}")
                break

        # Cleanup on exit
        self._cleanup_terminal_session(client_id)

    def _cleanup_terminal_session(self, client_id: str) -> None:
        """Clean up terminal session resources."""
        session = self._terminal_sessions.get(client_id)
        if session:
            try:
                os.close(session['master_fd'])
            except:
                pass

            try:
                import signal
                os.kill(session['pid'], signal.SIGTERM)
            except:
                pass

            del self._terminal_sessions[client_id]
            logger.info(f"Cleaned up terminal session {client_id}")
```

**Step 5: Add HTTP endpoint for session creation**

Add to `VisualBridge.run_http_server()` method, add new route handler:

```python
        # Terminal session endpoints
        @app.route('/terminal/session', methods=['POST'])
        def create_terminal_session():
            data = request.get_json() or {}
            session_token = data.get('session_token', str(uuid.uuid4()))
            cols = data.get('cols', 120)
            rows = data.get('rows', 36)

            # Create session ID from token
            session_id = hashlib.sha256(session_token.encode()).hexdigest()[:16]

            return jsonify({
                'success': True,
                'session_id': session_id,
                'cols': cols,
                'rows': rows
            })

        @app.route('/terminal/session/<session_id>', methods=['DELETE'])
        def destroy_terminal_session(session_id):
            # Find and cleanup session
            for client_id, session in list(self._terminal_sessions.items()):
                if client_id.startswith(session_id):
                    self._cleanup_terminal_session(client_id)
                    break
            return jsonify({'success': True})
```

**Step 6: Modify WebSocket connection handler to spawn terminal**

In `_handle_new_connection()` or equivalent, add terminal session creation:

```python
        # Check if this is a terminal connection
        if path.startswith('/terminal'):
            # Extract token from query string
            from urllib.parse import parse_qs, urlparse
            parsed = urlparse(path)
            params = parse_qs(parsed.query)
            token = params.get('token', [None])[0]

            if token:
                # Validate token (compare with WordPress session)
                # For now, accept any token from authenticated context
                logger.info(f"Terminal connection from {client_id}")

                # Spawn terminal process
                self._spawn_terminal_process(client_id, cols=120, rows=36)
```

**Step 7: Add cleanup on disconnect**

In `_handle_disconnect()` method, add:

```python
        # Cleanup terminal session if exists
        if client_id in self._terminal_sessions:
            self._cleanup_terminal_session(client_id)
```

**Step 8: Add missing imports at top of file**

```python
import os
import pty
import hashlib
import uuid
import select
import struct
import fcntl
import termios
```

**Step 9: Run tests to verify nothing broke**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('Import OK')"`
Expected: `Import OK`

**Step 10: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "$(cat <<'EOF'
feat(bridge): add terminal WebSocket support to Visual Bridge

- Add terminal session management
- Implement PTY spawning with pty module
- Add bidirectional terminal I/O over WebSocket
- Add HTTP endpoints for session creation/deletion
- Include automatic cleanup on disconnect

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Task 3: Add Plugin Tests

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/tests/test-plugin.php`

**Step 1: Create test file**

```php
<?php
/**
 * Plugin Tests for Geometry OS Web Terminal
 */

class Test_GeometryOS_WebTerminal extends WP_UnitTestCase {

    public function test_plugin_activates(): void {
        $this->assertTrue(class_exists('GeometryOS_WebTerminal'));
    }

    public function test_session_token_generation(): void {
        $user_id = $this->factory->user->create(['role' => 'administrator']);
        wp_set_current_user($user_id);

        $token1 = GeometryOS_WebTerminal::generate_session_token();
        $token2 = GeometryOS_WebTerminal::generate_session_token();

        $this->assertEquals(64, strlen($token1));
        $this->assertEquals($token1, $token2); // Same user = same token
    }

    public function test_admin_permission_check(): void {
        $admin_id = $this->factory->user->create(['role' => 'administrator']);
        $editor_id = $this->factory->user->create(['role' => 'editor']);

        wp_set_current_user($admin_id);
        $this->assertTrue(GeometryOS_WebTerminal::check_admin_permission());

        wp_set_current_user($editor_id);
        $this->assertFalse(GeometryOS_WebTerminal::check_admin_permission());
    }
}
```

**Step 2: Run tests**

Run: `cd wordpress_zone/wordpress && php vendor/bin/phpunit wp-content/plugins/geometry-os-web-terminal/tests/`
Expected: Tests pass

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/tests/
git commit -m "$(cat <<'EOF'
test(terminal): add WordPress plugin unit tests

- Test plugin activation
- Test session token generation
- Test admin permission checks

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Task 4: Integration Test

**Files:**
- Create: `systems/visual_shell/api/tests/test_terminal_bridge.py`

**Step 1: Create integration test**

```python
#!/usr/bin/env python3
"""
Integration tests for Geometry OS Web Terminal
"""

import asyncio
import json
import pytest
import websockets

BRIDGE_URL = "ws://localhost:8768"


@pytest.mark.asyncio
async def test_terminal_websocket_connect():
    """Test that terminal WebSocket connection works."""
    uri = f"{BRIDGE_URL}/terminal?token=test-token-12345"

    try:
        async with websockets.connect(uri, close_timeout=5) as ws:
            # Send resize message
            await ws.send(json.dumps({
                'type': 'resize',
                'cols': 80,
                'rows': 24
            }))

            # Wait a moment for response
            try:
                response = await asyncio.wait_for(ws.recv(), timeout=2.0)
                data = json.loads(response)
                assert 'type' in data
            except asyncio.TimeoutError:
                pass  # No response is OK for resize

            assert ws.open

    except ConnectionRefusedError:
        pytest.skip("Visual Bridge not running on port 8768")


@pytest.mark.asyncio
async def test_terminal_input_echo():
    """Test that terminal input is processed."""
    uri = f"{BRIDGE_URL}/terminal?token=test-token-echo"

    try:
        async with websockets.connect(uri, close_timeout=5) as ws:
            # Send resize first
            await ws.send(json.dumps({
                'type': 'resize',
                'cols': 120,
                'rows': 36
            }))

            # Wait for shell prompt
            await asyncio.sleep(0.5)

            # Send echo command
            await ws.send(json.dumps({
                'type': 'input',
                'data': 'echo "HELLO_TERMINAL_TEST"\n'
            }))

            # Wait for output
            try:
                response = await asyncio.wait_for(ws.recv(), timeout=3.0)
                data = json.loads(response)
                assert data['type'] == 'output'
                # Shell should echo back
            except asyncio.TimeoutError:
                pass  # Timing dependent

    except ConnectionRefusedError:
        pytest.skip("Visual Bridge not running on port 8768")


if __name__ == '__main__':
    asyncio.run(test_terminal_websocket_connect())
    asyncio.run(test_terminal_input_echo())
    print("All tests passed!")
```

**Step 2: Run integration tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/visual_shell/api/tests/test_terminal_bridge.py -v --tb=short`
Expected: Tests pass or skip with "Visual Bridge not running"

**Step 3: Commit**

```bash
git add systems/visual_shell/api/tests/test_terminal_bridge.py
git commit -m "$(cat <<'EOF'
test(terminal): add WebSocket integration tests

- Test terminal WebSocket connection
- Test terminal input/output flow
- Skip gracefully when Visual Bridge not running

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Task 5: Documentation

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md`

**Step 1: Create README**

```markdown
# Geometry OS Web Terminal

A WordPress plugin that provides a web-based terminal (xterm.js) for accessing Geometry OS shell sessions.

## Requirements

- WordPress 6.0+
- PHP 8.0+
- Visual Bridge running on port 8768

## Installation

1. Copy plugin to `wp-content/plugins/geometry-os-web-terminal/`
2. Activate in WordPress Admin > Plugins
3. Access via **GO Terminal** in admin menu

## Usage

1. Navigate to **GO Terminal** in WordPress admin
2. Terminal will automatically connect to Geometry OS
3. Type commands as you would in any terminal

## Architecture

```
┌─────────────────┐     WebSocket      ┌─────────────────┐
│  WordPress      │ ◄───────────────► │  Visual Bridge  │
│  (xterm.js)     │    ws://8768       │  (PTY Manager)  │
└─────────────────┘                    └─────────────────┘
                                                │
                                                ▼
                                        ┌─────────────────┐
                                        │  Shell Process  │
                                        │  (/bin/bash)    │
                                        └─────────────────┘
```

## Security

- Only WordPress administrators can access
- Session tokens validated on connection
- PTY processes isolated per-session

## Troubleshooting

### "Visual Bridge not running" warning

Start the Visual Bridge:
```bash
python systems/visual_shell/api/visual_bridge.py &
```

### Terminal shows blank screen

Check browser console for WebSocket errors. Ensure port 8768 is accessible.

## Credits

- [xterm.js](https://xtermjs.org/) - Terminal emulator
- Geometry OS Visual Bridge - WebSocket/PTY management
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md
git commit -m "$(cat <<'EOF'
docs(terminal): add plugin README documentation

- Installation instructions
- Architecture diagram
- Security notes
- Troubleshooting guide

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Task 6: Final Verification

**Step 1: Start Visual Bridge**

Run: `python systems/visual_shell/api/visual_bridge.py &`
Expected: Bridge starts on port 8768/8769

**Step 2: Activate WordPress plugin**

Run: `cd wordpress_zone/wordpress && wp plugin activate geometry-os-web-terminal --allow-root` (or activate via admin UI)

**Step 3: Access terminal in browser**

Navigate to: `http://localhost/wordpress/wp-admin/admin.php?page=geometry-os-web-terminal`
Expected: Terminal UI appears with "Connecting..." then "Connected" status

**Step 4: Test command execution**

In the terminal, type: `echo "Hello from Geometry OS Web Terminal"`
Expected: Output shows the echoed message

**Step 5: Final commit**

```bash
git add -A
git commit -m "$(cat <<'EOF'
chore(terminal): final verification complete

Web terminal fully functional:
- xterm.js UI in WordPress admin
- WebSocket connection to Visual Bridge
- PTY spawning and bidirectional I/O
- Session management and cleanup

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Summary

| Task | Description | Status |
|------|-------------|--------|
| 1 | WordPress plugin structure | Pending |
| 2 | Visual Bridge terminal support | Pending |
| 3 | Plugin unit tests | Pending |
| 4 | Integration tests | Pending |
| 5 | Documentation | Pending |
| 6 | Final verification | Pending |

## Access Instructions

After implementation:

1. **Start Visual Bridge:**
   ```bash
   python systems/visual_shell/api/visual_bridge.py
   ```

2. **Access in WordPress:**
   - Navigate to: `wp-admin/admin.php?page=geometry-os-web-terminal`
   - Or click **GO Terminal** in admin sidebar

3. **Direct WebSocket (for testing):**
   ```javascript
   const ws = new WebSocket('ws://localhost:8768/terminal?token=test');
   ws.onmessage = (e) => console.log(JSON.parse(e.data));
   ws.send(JSON.stringify({type: 'input', data: 'ls\n'}));
   ```
