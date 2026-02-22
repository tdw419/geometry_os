# Visual Extraction Pipeline - Linux Support

The Visual Extraction Pipeline works on **any Linux GUI or console**, enabling Geometry OS to "read" and navigate Linux applications.

## Supported Linux Environments

| Environment | OCR Support | Example |
|-------------|-------------|---------|
| **Console/TTY** | Excellent | Boot messages, shell output |
| **X11 Desktops** | Good | GTK, Qt, Motif applications |
| **Wayland** | Good | GNOME, KDE, Sway |
| **Framebuffers** | Good | Embedded Linux, kiosk mode |
| **Terminal Emulators** | Excellent | xterm, gnome-terminal, alacritty |

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                    LINUX EXTRACTION FLOW                             │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────────┐     ┌──────────────┐     ┌──────────────┐        │
│  │  QEMU/KVM    │────▶│   Screenshot │────▶│  Tesseract   │        │
│  │  VM Console  │     │   Capture    │     │  OCR Engine  │        │
│  └──────────────┘     └──────────────┘     └──────────────┘        │
│         │                                          │                │
│         │                                          ▼                │
│         │                                 ┌──────────────┐         │
│         │                                 │   Semantic   │         │
│         │                                 │  Clustering  │         │
│         │                                 └──────────────┘         │
│         │                                          │                │
│         │                                          ▼                │
│         │                                 ┌──────────────┐         │
│         │                                 │   Widget     │         │
│         │                                 │  Detection   │         │
│         │                                 └──────────────┘         │
│         │                                          │                │
│         ▼                                          ▼                │
│  ┌──────────────┐                        ┌──────────────┐         │
│  │   Click &    │◀───────────────────────│    ASCII     │         │
│  │   Type API   │     Action Mapping     │  Scene Graph │         │
│  └──────────────┘                        └──────────────┘         │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Usage Examples

### 1. Boot Console Extraction

Extract structure from Linux boot messages:

```python
from extraction_pipeline import extract_gui

# Analyze boot console
result = extract_gui("boot_console.png")

# Find boot messages
for element in result.elements:
    if "error" in element.text.lower():
        print(f"Boot error: {element.text}")
```

**Output Example:**
```
Elements: 191
Clusters: 3 (main console, button groups)
Clickable: 15 (detected buttons/actions)
```

### 2. X11/Wayland Desktop

Extract from any GUI application:

```python
from extraction_pipeline import ExtractionPipeline

pipeline = ExtractionPipeline(ascii_width=100, ascii_height=35)
result = pipeline.extract("linux_desktop.png")

# Find clickable menu items
for widget in result.widgets:
    if widget.action:
        print(f"Click '{widget.text}' at {widget.bbox}")
```

### 3. Terminal Emulator

Extract terminal content for AI understanding:

```python
result = extract_gui("terminal.png")

# Reconstruct terminal text
terminal_text = " ".join(e.text for e in sorted(result.elements, key=lambda x: (x.bbox[1], x.bbox[0])))
print(terminal_text)
```

### 4. Live VM Integration

Connect to a running Linux VM:

```python
from shotcut_vm_bridge import ShotcutVMBridge
from extraction_pipeline import ExtractionPipeline

# Connect to VM
vm = ShotcutVMBridge(host="localhost", port=8765)
pipeline = ExtractionPipeline()

# Capture and extract in one flow
screenshot = vm.screenshot()
result = pipeline.extract(screenshot)

# Click on detected button
for widget in result.widgets:
    if "install" in widget.text.lower():
        center = (
            (widget.bbox[0] + widget.bbox[2]) // 2,
            (widget.bbox[1] + widget.bbox[3]) // 2
        )
        vm.click(*center)
        break
```

## Detection Patterns for Linux

The WidgetDetector recognizes Linux-specific patterns:

| Widget Type | Detection Pattern | Example |
|-------------|-------------------|---------|
| **Menu Item** | Keywords: File, Edit, View, Help | `[menu]` |
| **Button** | Keywords: OK, Cancel, Apply, Install | `[button]` |
| **Checkbox** | Patterns: `[ ]`, `[x]`, `[*]` | `[checkbox]` |
| **Terminal Prompt** | Ends with `$` or `#` | `[input]` |
| **Path/URL** | Contains `/` or starts with `~` | `[label]` |

## ASCII Scene Graph Output

For a Linux terminal, the output looks like:

```
┌──────────────────────────────────────────────────────────────────┐
│  user@alpine:~$ ls -la                                           │
│  total 48                                                         │
│  drwxr-xr-x  6 user user 4096 Feb 19 10:30 .                     │
│  drwxr-xr-x  3 root root 4096 Feb 18 20:15 ..                    │
│  -rw-------  1 user user 1234 Feb 19 10:28 .bash_history         │
│  drwxr-xr-x  2 user user 4096 Feb 19 09:00 Documents             │
│  user@alpine:~$ _                                                │
└──────────────────────────────────────────────────────────────────┘

# [CLICKABLE] INPUT: 'prompt' at [10, 120, 200, 135] → type_command
```

## Testing

Run the test suite with Linux screenshots:

```bash
cd conductor/tracks/shotcut-on-the-map
python3 -m pytest tests/ -v -k "gui"
```

## Requirements

- **Tesseract OCR 5.x**: `sudo apt install tesseract-ocr`
- **Pillow**: `pip install Pillow`
- **QEMU (for VM capture)**: `sudo apt install qemu-system-x86`

## The Vision: Linux as Data

The Visual Extraction Pipeline transforms Linux from a "black box" into structured data that AI can understand and manipulate:

1. **Boot Sequence Analysis**: Parse boot logs in real-time
2. **Automated Installation**: Read installer screens and respond
3. **Terminal Automation**: Understand and interact with CLI tools
4. **Desktop Navigation**: Control any GUI application
5. **Cross-Platform Cloning**: Extract Linux app UIs and rebuild in PixelRTS

---

*The "Screen is the Hard Drive" thesis applies universally - Linux is just another GUI to be read.*
