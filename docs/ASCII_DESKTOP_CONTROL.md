# ASCII Desktop Control System

A unified AI-to-desktop control system that allows Claude Code and Gemini to control your Linux desktop via ASCII representations, with WordPress-based directive polling for remote task dispatch.

## How It Works

### The Core Idea

Instead of using screenshots and computer vision (which is slow and expensive), this system represents your desktop as **ASCII art** that AI can read instantly. Think of it as giving AI a "text-mode view" of your graphical desktop.

```
Real Desktop          →        ASCII Representation
┌──────────────┐              +------------------+
│ [Firefox]    │              | A | B | C |      |
│ ┌──────────┐ │     →        |   |---|         |
│ │ Search   │ │              | D | E |         |
│ └──────────┘ │              +------------------+
└──────────────┘
```

The ASCII map includes **labeled regions** (A, B, C...) with a **bindings JSON** that maps each label to exact screen coordinates. AI can then "click" on region A by looking up its coordinates.

### Two Capture Methods

#### 1. X11 Child Window Scanning (Fast)
For traditional X11 applications (terminal, file manager, etc.), we use `xwininfo` to find all child windows and map them to the ASCII grid:

```python
# Get focused window
xdotool getactivewindow → 0x1234567

# Find child windows
xwininfo -children -id 0x1234567 → list of buttons, text fields, etc.

# Map to ASCII grid
child at (100, 200) → grid position G5 → label "A"
```

#### 2. ImageMagick Screenshot Fallback (Universal)
For "black-box" windows (browsers, Electron apps) that don't expose child windows:

```python
# Capture screenshot
import -window 0x1234567 /tmp/window.png

# Convert to ASCII art
convert window.png -resize 80x24 -colorspace Gray txt:-

# Result: ".:-=+*#%@" characters representing brightness levels
```

### The Workflow

```
┌─────────────────────────────────────────────────────────────────────┐
│                         ASCII CAPTURE                                │
│                                                                      │
│  1. Get focused window (xdotool)                                    │
│  2. Try X11 child scanning                                          │
│  3. If < 2 children → use ImageMagick screenshot                   │
│  4. Output: ASCII map + bindings JSON                              │
└─────────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         AI DECISION                                  │
│                                                                      │
│  Option A: Heuristic Parsing (fast, no LLM)                         │
│    - "click Firefox" → action=click, target=firefox                 │
│    - "type hello" → action=type, text="hello"                       │
│                                                                      │
│  Option B: LLM Planning (intelligent, requires Ollama/LM Studio)   │
│    - Send ASCII map + directive to LLM                              │
│    - LLM returns action sequence: [click, type, key, ...]           │
└─────────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         ACTION EXECUTION                             │
│                                                                      │
│  xdotool mousemove 100 200 click 1    # Click at coordinates        │
│  xdotool type "Hello World"            # Type text                  │
│  xdotool key Control+L                 # Send hotkey                │
└─────────────────────────────────────────────────────────────────────┘
```

---

## File Structure

```
.gemini/skills/ascii-desktop-control/
├── SKILL.md                    # Skill definition for Gemini CLI
└── scripts/
    ├── get_ascii_view.py       # ASCII capture (X11 + ImageMagick)
    └── desktop_action.py       # xdotool wrapper (click, type, key)

.claude/skills/ascii-desktop-control/
└── SKILL.md                    # Skill definition for Claude Code

scripts/
└── directive_daemon.py         # WordPress polling daemon

tests/
├── test_ascii_view.py          # ASCII capture tests
├── test_directive_daemon.py    # Daemon tests
└── test_ascii_wp_integration.py # WordPress integration tests

systemd/
└── geometryos-directive-daemon.service  # Systemd service
```

---

## Components Explained

### 1. get_ascii_view.py

**Purpose:** Capture the desktop as ASCII art.

**Key Functions:**

```python
def get_focused_window():
    """Get the currently focused window ID and geometry."""
    # Uses xdotool getactivewindow + xwininfo

def detect_black_box_window(window_id):
    """Detect if window has no accessible children (browser/Electron)."""
    # Returns True if < 2 child windows found

def capture_screenshot_ascii(window, grid_w=80, grid_h=24):
    """Capture window screenshot and convert to ASCII."""
    # Uses ImageMagick: import → convert → parse gray values

def generate_ascii_view():
    """Main function - generates ASCII map + bindings."""
    # Returns: (ascii_string, bindings_dict)
```

**Output Format:**

```
--- ASCII MAP ---
WINDOW: 0x1234567 | SIZE: 1920x1080 | MODE: x11
+--------------------------------------------------------------------------------+
| A | B | C |                                                                    |
|---|---|---|                                                                    |
| D | E | F |                                                                    |
+--------------------------------------------------------------------------------+

--- BINDINGS ---
{
  "A": {"x": 100, "y": 50, "w": 80, "h": 30},
  "B": {"x": 200, "y": 50, "w": 80, "h": 30},
  "C": {"x": 300, "y": 50, "w": 80, "h": 30}
}
```

### 2. desktop_action.py

**Purpose:** Execute desktop actions via xdotool.

**Actions:**

| Action | Command | Example |
|--------|---------|---------|
| Click | `click "[x, y]"` | `click "[100, 200]"` |
| Type | `type "text"` | `type "Hello World"` |
| Key | `key "Combo"` | `key "Control+L"` |
| Move | `move "[x, y]"` | `move "[500, 500]"` |

### 3. directive_daemon.py

**Purpose:** Poll WordPress for directives and execute them autonomously.

**Architecture:**

```
WordPress Directives
        │
        ▼
┌───────────────────┐
│  poll_directives  │ ← GET /ai-publisher.php?action=getDirectives
└───────────────────┘
        │
        ▼
┌───────────────────┐
│ parse_directive   │ ← Heuristic or LLM-based intent extraction
└───────────────────┘
        │
        ▼
┌───────────────────┐
│ get_desktop_state │ ← Run get_ascii_view.py
└───────────────────┘
        │
        ▼
┌───────────────────┐
│  execute_directive│ ← Run actions via desktop_action.py
└───────────────────┘
        │
        ▼
┌───────────────────┐
│ post_response     │ ← POST response as WordPress comment
└───────────────────┘
```

**Environment Variables:**

```bash
DISPLAY=:0                      # X11 display
WP_URL=http://localhost:8080/ai-publisher.php
POLL_INTERVAL=5                 # Seconds between polls
USE_LLM=true                    # Enable LLM planning
LLM_ENDPOINT=http://localhost:11434/api/generate
LLM_MODEL=qwen2.5:7b
```

---

## WordPress Integration

### Required Setup

1. **WordPress running** at `localhost:8080`
2. **ai-publisher.php** installed (already present at `wordpress_zone/wordpress/ai-publisher.php`)
3. **Directives category** created

### API Endpoints

| Action | Method | Description |
|--------|--------|-------------|
| `getDirectives` | POST | Get unprocessed directive posts |
| `markDirectiveProcessed` | POST | Mark directive as done |
| `postDirectiveResponse` | POST | Add comment with result |
| `createPost` | POST | Create new directive |

### Posting a Directive

**Via WordPress Admin:**
1. Go to Posts → Add New
2. Set category to "Directives"
3. Write your task
4. Publish

**Via API:**
```bash
curl -X POST http://localhost:8080/ai-publisher.php \
  -H "Content-Type: application/json" \
  -d '{
    "action": "createPost",
    "title": "Open Browser",
    "content": "Open Firefox and navigate to github.com",
    "category": "directives",
    "status": "publish"
  }'
```

---

## Usage Examples

### Manual Desktop Control

```bash
# See your desktop as ASCII
DISPLAY=:0 python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py

# Move mouse to center of screen
DISPLAY=:0 python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py move "[960, 540]"

# Click at specific coordinates
DISPLAY=:0 python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py click "[100, 200]"

# Type text
DISPLAY=:0 python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py type "Hello World"

# Send keyboard shortcut
DISPLAY=:0 python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py key "Control+L"
```

### Running the Daemon

```bash
# Simple mode (heuristic parsing only)
DISPLAY=:0 python3 scripts/directive_daemon.py

# LLM-powered mode
DISPLAY=:0 USE_LLM=true \
  LLM_ENDPOINT=http://localhost:11434/api/generate \
  LLM_MODEL=qwen2.5:7b \
  python3 scripts/directive_daemon.py

# As a background service
./scripts/install_daemon.sh
systemctl --user enable --now geometryos-directive-daemon

# View logs
journalctl --user -u geometryos-directive-daemon -f
```

### With Claude Code

Just ask naturally:
> "Use the ASCII desktop control to open Firefox and search for 'geometry os'"

Claude will:
1. Run `get_ascii_view.py` to see the desktop
2. Find Firefox in the bindings
3. Click to launch
4. Wait, rescan, find the search box
5. Click and type your query

### With Gemini CLI

```
/ascii-desktop-control

Then describe what you want to do:
"Scan the desktop and tell me what applications are open"
```

---

## Security Considerations

### Risks

| Risk | Mitigation |
|------|------------|
| xdotool has full desktop control | WordPress API is localhost-only |
| AI could click wrong things | Human reviews directives before processing |
| Sensitive data in screenshots | ASCII representation loses detail |

### Best Practices

1. **Run daemon only when needed** - Don't leave it running unattended
2. **Review directives** - Check WordPress before AI executes
3. **Use VM for testing** - Test in isolated environment first
4. **Restrict WordPress access** - Keep `ai-publisher.php` localhost-only

### Access Control

The `ai-publisher.php` enforces localhost access:

```php
if ($_SERVER['REMOTE_ADDR'] !== '127.0.0.1' && $_SERVER['REMOTE_ADDR'] !== '::1') {
    header('HTTP/1.1 403 Forbidden');
    die(json_encode(array('success' => false, 'error' => 'Local access only.')));
}
```

---

## Troubleshooting

### "Could not get focused window"

**Cause:** No active X11 window or running in headless environment.

**Fix:**
```bash
export DISPLAY=:0
xdotool getactivewindow  # Test if xdotool works
```

### "Screenshot capture failed"

**Cause:** ImageMagick not installed or no display.

**Fix:**
```bash
sudo apt install imagemagick
export DISPLAY=:0
```

### "Connection refused" (WordPress)

**Cause:** WordPress not running.

**Fix:**
```bash
cd wordpress_zone
./start_evolution_bridge.sh
```

### "LLM call failed"

**Cause:** Ollama or LM Studio not running.

**Fix:**
```bash
# Ollama
ollama serve

# LM Studio - start the local server in the app
```

---

## Architecture Diagram

```
                    ┌──────────────────────────────────────┐
                    │           USER / AI CLIENT           │
                    │    (Claude Code, Gemini CLI, Web)    │
                    └─────────────────┬────────────────────┘
                                      │
                    ┌─────────────────▼────────────────────┐
                    │            ASCII CAPTURE             │
                    │  ┌─────────────┐ ┌────────────────┐ │
                    │  │ X11 Scanning│ │ ImageMagick    │ │
                    │  │ (Fast)      │ │ Fallback       │ │
                    │  └─────────────┘ └────────────────┘ │
                    └─────────────────┬────────────────────┘
                                      │ ASCII + Bindings
                    ┌─────────────────▼────────────────────┐
                    │           AI DECISION                │
                    │  ┌─────────────┐ ┌────────────────┐ │
                    │  │ Heuristic   │ │ LLM Planning   │ │
                    │  │ Parsing     │ │ (Ollama/LM)    │ │
                    │  └─────────────┘ └────────────────┘ │
                    └─────────────────┬────────────────────┘
                                      │ Actions
                    ┌─────────────────▼────────────────────┐
                    │          ACTION EXECUTOR             │
                    │            (xdotool)                 │
                    │  click │ type │ key │ move           │
                    └──────────────────────────────────────┘

                    ┌──────────────────────────────────────┐
                    │         DIRECTIVE DAEMON             │
                    │  ┌─────────────────────────────────┐ │
                    │  │ Poll WordPress (5s interval)    │ │
                    │  │ ↓                               │ │
                    │  │ Parse Directive Intent          │ │
                    │  │ ↓                               │ │
                    │  │ Execute via ASCII Control       │ │
                    │  │ ↓                               │ │
                    │  │ Post Response to WordPress      │ │
                    │  └─────────────────────────────────┘ │
                    └──────────────────────────────────────┘
```

---

## Files Reference

| File | Purpose |
|------|---------|
| `.gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py` | ASCII capture engine |
| `.gemini/skills/ascii-desktop-control/scripts/desktop_action.py` | xdotool wrapper |
| `.gemini/skills/ascii-desktop-control/SKILL.md` | Gemini skill definition |
| `.claude/skills/ascii-desktop-control/SKILL.md` | Claude skill definition |
| `scripts/directive_daemon.py` | WordPress polling daemon |
| `scripts/install_daemon.sh` | Systemd service installer |
| `systemd/geometryos-directive-daemon.service` | Systemd unit file |
| `tests/test_ascii_view.py` | ASCII capture tests |
| `tests/test_directive_daemon.py` | Daemon unit tests |
| `tests/test_ascii_wp_integration.py` | WordPress integration tests |

---

## Version History

| Version | Changes |
|---------|---------|
| 1.0 | Initial implementation with X11 scanning |
| 1.1 | Added ImageMagick screenshot fallback |
| 1.2 | Added LLM-powered directive parsing |
| 1.3 | Added systemd service support |
