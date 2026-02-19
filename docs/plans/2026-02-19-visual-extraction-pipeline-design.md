# Visual Extraction Pipeline Design

**Date**: 2026-02-19
**Status**: Implemented (Stage 4 Complete)
**Track**: `conductor/tracks/shotcut-on-the-map/`

## Overview

The Visual Extraction Pipeline enables Geometry OS to "read" any GUI application and reconstruct its structure as an ASCII Scene Graph. This closes the Ouroboros loop, making the "Screen is the Hard Drive" thesis bidirectional:

- **Write**: Visual Bridge injects input into VMs (Stage 3)
- **Read**: Visual Extraction reads structure from screenshots (Stage 4)

## Architecture

```
┌──────────────────────────────────────────────────────────────────────────┐
│                     VISUAL EXTRACTION PIPELINE                           │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  PHASE 1: VISUAL CAPTURE          PHASE 2: STRUCTURE RECOGNITION        │
│  ┌─────────────────────┐          ┌─────────────────────────┐           │
│  │ shotcut_vm_bridge   │          │ gui_structure_analyzer  │           │
│  │ ─────────────────── │          │ ─────────────────────── │           │
│  │ • screenshot()      │─────────▶│ • OCR (tesseract)       │           │
│  │ • click(x,y)        │          │ • Element detection     │           │
│  │ • type(text)        │          │ • Layout inference      │           │
│  └─────────────────────┘          │ • State extraction      │           │
│                                   └───────────┬─────────────┘           │
│                                               │                          │
│                                               ▼                          │
│                                   ┌─────────────────────────┐           │
│                                   │ ASCII Scene Graph       │           │
│                                   │ ─────────────────────── │           │
│                                   │ views/*.ascii           │           │
│                                   │ bindings.json           │           │
│                                   │ state.json              │           │
│                                   └───────────┬─────────────┘           │
│                                               │                          │
│  PHASE 3: PIXEL RECONSTRUCTION                ▼                          │
│  ┌─────────────────────────────┐  ┌─────────────────────────┐           │
│  │ pixel_rts_compiler          │◀─│ scene_to_wgsl           │           │
│  │ ─────────────────────────── │  │ ─────────────────────── │           │
│  │ • ASCII → WGSL shaders      │  │ • Generate WGSL         │           │
│  │ • Hilbert mapping           │  │ • Layout functions      │           │
│  │ • Interactive state         │  │ • Event handlers        │           │
│  └─────────────────────────────┘  └─────────────────────────┘           │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

## Components

### 1. GUI Structure Analyzer

**File**: `conductor/tracks/shotcut-on-the-map/gui_structure_analyzer.py`

The extraction engine that converts screenshots to ASCII scene graphs.

**Capabilities**:
- Tesseract OCR integration for text extraction
- Bounding box parsing from hOCR output
- ASCII projection with coordinate mapping
- Clickable region metadata generation

**Usage**:
```python
from gui_structure_analyzer import analyze_screenshot

# Extract structure from screenshot
result = analyze_screenshot("screenshot.png")

# Result contains:
# - ascii_view: ASCII representation of the screen
# - clickables: Dict of region_id → bounding box
# - text_elements: List of extracted text with positions
```

### 2. ASCII Scene Graph

**File**: `systems/visual_shell/ascii_scene/scene_graph.py`

The Universal Intermediate Representation (UIR) between any GUI and Geometry OS native apps.

**Structure**:
```
.geometry/ascii_scene/
├── views/
│   ├── main.ascii          # Main screen view
│   ├── menu_file.ascii     # File menu dropdown
│   └── dialog_save.ascii   # Save dialog
├── bindings.json           # Navigation graph
├── state.json              # Dynamic runtime state
└── index.json              # Root metadata
```

**ASCII View Format**:
```
┌─────────────────────────────────────────────────────────────┐
│  File  Edit  View  Tools  Help                    [_][□][X] │
├─────────────────────────────────────────────────────────────┤
│   ┌─────────────┐   ┌─────────────┐                        │
│   │ Projects    │   │ app.rts     │                        │
│   └─────────────┘   └─────────────┘                        │
└─────────────────────────────────────────────────────────────┘
# [CLICKABLE: 0,0,60,20 → view:menu_file]
# [CLICKABLE: 70,0,120,20 → view:menu_edit]
# [CLICKABLE: 20,50,120,100 → action:open_project]
```

### 3. PixelRTS Compiler

**File**: `systems/pixel_compiler/` (existing)

Compiles ASCII scene graphs to WGSL shaders for native rendering.

**Pipeline**:
```
ASCII View → Layout Analysis → WGSL Generation → Hilbert Mapping → .rts.png
```

## Workflow

### Extraction Process

1. **Capture Screenshot**
   ```python
   screenshot = bridge.screenshot()
   ```

2. **Analyze Structure**
   ```python
   analysis = analyze_screenshot(screenshot)
   ```

3. **Generate ASCII View**
   ```python
   view = AsciiView(
       id="shotcut_main",
       content=analysis.ascii_view,
       clickables=analysis.clickables
   )
   ```

4. **Update Scene Graph**
   ```python
   graph.views["shotcut_main"] = view
   graph.save_state()
   ```

### AI Navigation

The AI can now navigate using the ASCII scene graph instead of raw screenshots:

```python
# Old way: VLM analyzes every screenshot
screen = screenshot()
action = vlm.decide(screen)  # Expensive!

# New way: Read ASCII scene graph
context = graph.get_ai_context()
action = llm.decide(context)  # Cheap!
```

## Integration Points

### With Visual Bridge

```python
# Full extraction loop
bridge = ShotcutVMBridge()
bridge.boot()

# Extract current screen
screen = bridge.screenshot()
analysis = analyze_screenshot(screen)

# Use extracted structure for navigation
graph = AsciiSceneGraph.load(".geometry/shotcut_scene")
graph.views["main"] = analysis.to_view()

# AI can now navigate efficiently
ai_context = graph.get_ai_context()
```

### With PixelRTS

```python
# Compile extracted UI to native pixels
compiler = PixelRTSCompiler()
compiler.compile_scene_graph(
    graph,
    output="shotcut_native.rts.png"
)
```

## Verification

Stage 4 was verified against actual screenshots from the Shotcut VM:

| Test | Input | Output | Status |
|------|-------|--------|--------|
| Boot console extraction | `screenshots/final_proof.png` | `shotcut_gui.ascii` | ✅ |
| OCR text extraction | Screenshot with xterm | Text + bounding boxes | ✅ |
| Clickable mapping | Console prompt region | `[CLICKABLE: x,y,w,h → action:type]` | ✅ |

## Future Enhancements

1. **Semantic Clustering**: Group OCR elements into logical UI components
2. **Widget Recognition**: Detect buttons, inputs, menus by visual patterns
3. **State Inference**: Derive enabled/disabled state from visual cues
4. **Bidirectional Sync**: Keep ASCII scene graph in sync with VM state
5. **Multi-Resolution**: Handle screenshots at different resolutions

## Artifacts

| File | Description |
|------|-------------|
| `gui_structure_analyzer.py` | The Extraction Engine |
| `shotcut_gui.ascii` | Generated Scene Graph |
| `VISUAL_EXTRACTION_README.md` | Documentation |
| `scene_graph.py` | ASCII Scene Graph system |

## Conclusion

The Visual Extraction Pipeline completes the Ouroboros loop, enabling Geometry OS to:

1. **See** any GUI application through screenshots
2. **Understand** its structure through OCR and analysis
3. **Represent** it as an ASCII scene graph (UIR)
4. **Reconstruct** it as native PixelRTS widgets

This proves the "Screen is the Hard Drive" thesis in both directions: we can read from and write to visual state as if it were structured data.
