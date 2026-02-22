# ASCII Desktop Control System

Control your Linux desktop via ASCII representations, enabling AI agents to interact with GUI applications through text-based window maps.

## Quick Start

### 1. Install Dependencies

```bash
sudo apt install xdotool x11-utils imagemagick
```

### 2. Test ASCII Capture

```bash
python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py
```

You should see an ASCII map of your focused window with labeled clickable regions (A, B, C...).

### 3. Test Desktop Action

```bash
# Move mouse to coordinates
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py move "[500, 500]"

# Type text
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py type "Hello World"

# Send keyboard shortcut
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py key "Control+L"

# Click at coordinates
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py click "[100, 200]"
```

## Usage with Claude Code

Claude Code has the `ascii-desktop-control` skill available. Just ask:

> "Use the ASCII desktop control skill to open Firefox and search for 'geometry os'"

Or invoke directly:

```
/ascii-desktop-control
```

### Example Claude Code Session

```text
User: Open Firefox and search for "geometry os"

Claude:
1. First, let me scan the desktop:
   python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py

2. I can see the Firefox launcher at label "A" with coordinates [150, 300].
   Let me click it:
   python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py click "[150, 300]"

3. Now I'll wait for Firefox to open, then scan again...

4. I see the search box. Let me click and type:
   python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py click "[500, 100]"
   python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py type "geometry os"

5. Press Enter:
   python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py key "Return"
```

## Usage with Gemini CLI

Gemini has the same skill installed. Activate it with:

```
/ascii-desktop-control
```

The skill provides:
- `scripts/get_ascii_view.py` - Returns text map + JSON bindings
- `scripts/desktop_action.py` - Executes xdotool commands

### Workflow

1. **Scan**: Get the current desktop state
2. **Analyze**: Read the ASCII map and find target elements
3. **Act**: Use coordinates from bindings to interact
4. **Repeat**: Rescan after UI changes

## Directive Daemon

The directive daemon enables autonomous task execution by polling WordPress for directives.

### Running the Daemon

```bash
# Run manually (foreground)
python3 scripts/directive_daemon.py

# Run with LLM mode enabled
USE_LLM=true python3 scripts/directive_daemon.py

# Install as systemd service (background daemon)
./scripts/install_daemon.sh
systemctl --user enable --now geometryos-directive-daemon
```

### Posting Directives

From WordPress admin, create a post in the "Directives" category:

**Example Directive 1:**
- Title: "Open System Monitor"
- Content: "Open the System Monitor application and report CPU usage"

**Example Directive 2:**
- Title: "Web Search"
- Content: 'Open Firefox and search for "geometry os linux"'

The daemon will:
1. Poll WordPress every 5 seconds
2. Pick up unprocessed directives
3. Execute them using ASCII desktop control
4. Post the result as a comment on the directive

### Daemon Logs

```bash
# View live logs
journalctl --user -u geometryos-directive-daemon -f

# Check status
systemctl --user status geometryos-directive-daemon
```

## Architecture

```
+-----------------+     +-----------------+     +------------------+
| WordPress       |---->| Directive       |---->| ASCII Control    |
| (Directives     |     | Daemon          |     | Scripts          |
|  category)      |     | (Python)        |     | (get_ascii_view, |
+-----------------+     +-----------------+     |  desktop_action) |
                              |                +------------------+
                              v                        |
                        +-----------+                  v
                        | LLM       |           +-------------+
                        | (Ollama)  |           | xdotool     |
                        | (optional)|           | xwininfo    |
                        +-----------+           | ImageMagick |
                                                +-------------+
```

### Data Flow

1. WordPress post created in "Directives" category
2. Daemon polls `getDirectives` API every 5s
3. Daemon captures ASCII view + bindings
4. (Optional) LLM plans action sequence
5. Daemon executes via xdotool
6. Daemon posts response as comment

### Capture Modes

| Mode | When Used | Method |
|------|-----------|--------|
| X11 Child Scanning | GTK/Qt apps with visible children | xwininfo -children |
| ImageMagick Screenshot | Browsers, Electron apps (black-box) | import + convert to ASCII |

The system automatically detects black-box windows and switches to screenshot mode.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `WP_URL` | `http://localhost:8080/ai-publisher.php` | WordPress API endpoint |
| `POLL_INTERVAL` | `5` | Seconds between directive polls |
| `USE_LLM` | `false` | Enable LLM-powered execution |
| `LLM_ENDPOINT` | `http://localhost:11434/api/generate` | Ollama API endpoint |
| `LLM_MODEL` | `qwen2.5:7b` | Model to use for planning |

### Setting Environment

```bash
# Temporary (current session)
export USE_LLM=true
export LLM_MODEL="llama3:8b"

# Permanent (add to ~/.bashrc)
echo 'export USE_LLM=true' >> ~/.bashrc
```

### Systemd Service Configuration

Edit the service file to change defaults:

```bash
nano ~/.config/systemd/user/geometryos-directive-daemon.service
```

Then reload:

```bash
systemctl --user daemon-reload
systemctl --user restart geometryos-directive-daemon
```

## Available Actions

| Action | Command | Description |
|--------|---------|-------------|
| Click | `desktop_action.py click "[x, y]"` | Left-click at screen coordinates |
| Type | `desktop_action.py type "text"` | Type text string |
| Key | `desktop_action.py key "Control+C"` | Send keyboard shortcut |
| Move | `desktop_action.py move "[x, y]"` | Move mouse without clicking |

### Key Names

Common key names for the `key` action:
- `Return` - Enter key
- `BackSpace` - Backspace
- `Tab` - Tab
- `Escape` - Escape
- `Control+C`, `Control+V` - Shortcuts
- `Alt+Tab` - Window switch
- `Super` - Windows/Command key

## Security Notes

### Important Security Considerations

1. **Localhost Restriction**: WordPress API is restricted to localhost (127.0.0.1). Remote requests are rejected.

2. **xdotool Power**: xdotool has full desktop control including:
   - Reading all keyboard input
   - Controlling mouse movement
   - Taking screenshots
   - Manipulating any window

3. **No Authentication**: The directive system trusts all localhost requests. Do not expose to network.

4. **No Sandboxing**: Commands run with your user's full permissions.

### Recommendations

- Use only on trusted local networks
- For remote access, use a VPN or SSH tunnel
- Review directives before processing in sensitive environments
- Consider running the daemon as a limited user account

### Network Security

```bash
# Verify WordPress is localhost-only
grep -r "127.0.0.1\|localhost" wordpress_zone/wordpress/ai-publisher.php

# Block external access (if needed)
sudo ufw deny 8080
sudo ufw allow from 127.0.0.1 to any port 8080
```

## Troubleshooting

### "Could not get focused window"

Ensure you have an active X11 display:

```bash
echo $DISPLAY
# Should show :0 or :1

# If empty, set it:
export DISPLAY=:0
```

### "xdotool: command not found"

Install xdotool:

```bash
sudo apt install xdotool x11-utils
```

### Black-box windows show no labels

This is expected for browsers and Electron apps. The system will automatically use screenshot mode, which captures visual content but doesn't provide labeled clickables. Use coordinates directly from your AI's visual analysis.

### Daemon not picking up directives

1. Check WordPress is running:
   ```bash
   curl http://localhost:8080/ai-publisher.php
   ```

2. Check directive category exists and has unprocessed posts

3. Verify daemon is running:
   ```bash
   systemctl --user status geometryos-directive-daemon
   ```

### ImageMagick "not authorized"

Some ImageMagick installations block PNG operations. Edit `/etc/ImageMagick-6/policy.xml`:

```xml
<!-- Change from "none" to "read|write" -->
<policy domain="coder" rights="read|write" pattern="PNG" />
```

## API Reference

### WordPress API Endpoints

All endpoints are at `/ai-publisher.php` via POST with JSON body:

#### getDirectives

Returns unprocessed directive posts.

```json
{
  "action": "getDirectives"
}
```

Response:
```json
{
  "directives": [
    {
      "id": 123,
      "title": "Open Browser",
      "content": "Open Firefox and navigate to github.com"
    }
  ]
}
```

#### markDirectiveProcessed

Marks a directive as processed.

```json
{
  "action": "markDirectiveProcessed",
  "post_id": 123
}
```

#### postDirectiveResponse

Posts execution result as a comment.

```json
{
  "action": "postDirectiveResponse",
  "post_id": 123,
  "response": "Execution completed. Firefox opened successfully.",
  "status": "COMPLETED"
}
```

#### createPost

Creates a new directive post.

```json
{
  "action": "createPost",
  "title": "Test Directive",
  "content": "Description of task",
  "category": "directives",
  "status": "publish"
}
```

## Limitations

- **X11 Only**: Wayland is not currently supported
- **Linux Only**: Windows and macOS are not supported
- **No Multi-Monitor**: Currently captures only primary display
- **ASCII Resolution**: 80x24 grid - higher resolution would be slower
- **No Persistent State**: Each scan is independent; context must be re-analyzed

## Files Reference

| File | Purpose |
|------|---------|
| `.gemini/skills/ascii-desktop-control/SKILL.md` | Gemini skill definition |
| `.gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py` | ASCII capture script |
| `.gemini/skills/ascii-desktop-control/scripts/desktop_action.py` | xdotool wrapper |
| `.claude/skills/ascii-desktop-control/SKILL.md` | Claude Code skill definition |
| `scripts/directive_daemon.py` | WordPress polling daemon |
| `scripts/install_daemon.sh` | Systemd installation script |
| `systemd/geometryos-directive-daemon.service` | Systemd service template |

## Related Documentation

- [Implementation Plan](plans/2026-02-21-ascii-desktop-control.md)
- [ASCII Scene Graph System](../systems/visual_shell/ascii_scene/)
- [Visual Bridge API](../systems/visual_shell/api/visual_bridge.py)
