---
name: ascii-desktop-control
description: Semantic control of Linux GUI via ASCII maps and spatial coordinates. Use this skill when automating desktop interactions through the Infinite Map.
category: operations
---

# ASCII Desktop Control

Semantic control of Linux GUI via ASCII maps and spatial coordinates for automated desktop interactions.

## When to Use

- Automating desktop interactions through the Infinite Map
- Capturing window screenshots as ASCII for AI processing
- Mapping GUI elements to spatial coordinates
- Desktop automation via xdotool

## Prerequisites

- Linux with X11
- `xdotool` installed
- `xwininfo` installed
- ImageMagick (`convert` command)

## Procedure

### Step 1: Get ASCII View of Desktop

```bash
python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py
```

This outputs:
- ASCII representation of the focused window
- JSON bindings file with coordinate mappings

### Step 2: Perform Desktop Action

```bash
# Click at coordinates
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py click <x> <y>

# Type text
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py type "Hello World"

# Press key
python3 .gemini/skills/ascii-desktop-control/scripts/desktop_action.py key Return
```

### Step 3: Verify Action

```bash
# Capture new state
python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py

# Compare before/after to verify
```

## Output Format

### ASCII Map

```
+------------------------------------------------------------------------------+
|                                                                              |
|     ########                 ############                                    |
|     ########                 ############                                    |
|     ########                 ############                                    |
|                                                                              |
|                    Welcome to Geometry OS                                    |
|                                                                              |
+------------------------------------------------------------------------------+
```

### Bindings JSON

```json
{
  "window_id": "0x1234567",
  "geometry": {"w": 800, "h": 600, "x": 100, "y": 100},
  "ascii_grid": {"w": 80, "h": 24},
  "mapping": "hilbert"
}
```

## Troubleshooting

### "xdotool not found"

```bash
sudo apt-get install xdotool
```

### "xwininfo not found"

```bash
sudo apt-get install x11-utils
```

### "Permission denied"

Ensure your user has X11 access:
```bash
xhost +local:
```

### Black Box Window

Some applications (browsers, Electron apps) appear as black boxes:
- Use application-specific automation instead
- Or use accessibility APIs (at-spi)

## Self-Verification

After making changes to this skill:

1. Run: `python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py`
2. Verify output contains `--- ASCII MAP ---` and `--- BINDINGS ---` sections
3. Run: `python3 -m pytest tests/skills/test_skill_scripts.py -v -k ascii`

## Related Skills

- `infinite-map-testing` - Testing map functionality
- `visual-shell-debug` - Debugging visual interface
