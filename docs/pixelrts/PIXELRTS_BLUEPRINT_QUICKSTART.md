# PixelRTS v2 Blueprint Layer Quickstart

The Blueprint Layer adds structural metadata to PixelRTS v2 containers, enabling visual understanding and AI-driven analysis of encoded systems.

## Installation

Ensure you have the required dependencies:

```bash
# For ELF binary analysis
pip install pyelftools

# For visualization
pip install Pillow numpy matplotlib
```

## Basic Usage

### 1. Generate with Blueprint

Encode a binary with automatic blueprint generation:

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint generate \
    kernel.bin \
    --output kernel.rts.png \
    --system-name "Linux Kernel 6.1" \
    --system-type "executable"
```

This creates:
- `kernel.rts.png` - The visual container
- `kernel.rts.png.meta.json` - Core metadata
- `kernel.rts.png.blueprint.json` - Blueprint metadata

### 2. View Blueprint Overlay

Generate a visual overlay with component boundaries:

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint view \
    kernel.rts.png \
    --output kernel_overlay.png
```

### 3. Interactive HTML Visualization

Create an interactive HTML view:

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint view \
    kernel.rts.png \
    --html \
    --output kernel_blueprint.html
```

### 4. Analyze Blueprint

Display blueprint information:

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint analyze \
    kernel.rts.png
```

Output:
```
  System: Linux Kernel 6.1
  Type: executable
  Architecture: x86_64
  Entry Point: 0x1000000

  Components (3):
    - .text (executable)
      Code section
      Entropy: high | Visual: red_dominant
    - .data (data)
      Data section
      Entropy: medium | Visual: green_dominant
    - .rodata (config)
      Read-only data
      Entropy: low | Visual: textured_green

  Memory Map (3):
    - .text: rx
    - .data: rw
    - .rodata: r
```

## Programmatic Usage

### Encoding with Blueprint

```python
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

# Read binary
with open('kernel.bin', 'rb') as f:
    data = f.read()

# Generate blueprint
analyzer = BlueprintAnalyzer()
blueprint = analyzer.analyze(
    data,
    system_name="Linux Kernel",
    architecture="x86_64"
)

# Encode with blueprint
encoder = PixelRTSEncoder(mode="standard")
encoder.save(
    data,
    'kernel.rts.png',
    blueprint=blueprint.to_dict()
)
```

### Loading and Visualizing

```python
from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer

viewer = BlueprintViewer()

# Load blueprint from sidecar or PNG
blueprint = viewer.load_blueprint('kernel.rts.png')

# Render overlay
viewer.render_overlay(
    'kernel.rts.png',
    blueprint,
    'kernel_overlay.png',
    show_grid=True
)

# Create HTML visualization
viewer.create_interactive_html(
    'kernel.rts.png',
    blueprint,
    'kernel_blueprint.html'
)
```

### Custom Blueprint Creation

```python
from systems.pixel_compiler.pixelrts_blueprint import (
    PixelRTSBlueprint, Component, ComponentType, HilbertRange
)

# Create custom blueprint
blueprint = PixelRTSBlueprint(
    system_name="Custom OS",
    system_type="Linux Kernel + Initrd",
    architecture="x86_64",
    components=[
        Component(
            id="boot_sector",
            type=ComponentType.EXECUTABLE,
            description="First-stage bootloader",
            hilbert_range=HilbertRange(0, 512, (0, 0), (16, 32)),
            entropy_profile="high",
            visual_hint="red_dominant",
            semantic_tags=["boot", "mbr"]
        )
    ],
    entry_point="0x7c00"
)

# Use with encoder
encoder.save(data, 'custom.rts.png', blueprint=blueprint.to_dict())
```

## Visual Hint Reference

| Hint | Color | Usage |
|------|-------|-------|
| `red_dominant` | Red | High entropy code (compressed, encrypted) |
| `textured_green` | Green | Medium entropy (structured data, text) |
| `blue_dominant` | Blue | Low entropy (sparse, zero-filled) |
| `dark_blue` | Dark Blue | Uninitialized memory |
| `green_dominant` | Green | Writable data sections |
| `gray` | Gray | Unknown/uncategorized |

## Entropy Profile Thresholds

- **Low**: < 2.0 bits/byte (sparse, zero-filled)
- **Medium**: 2.0 - 7.5 bits/byte (structured, text)
- **High**: > 7.5 bits/byte (compressed, encrypted, dense code)

## CLI Command Reference

### `blueprint generate`

Generate a PixelRTS v2 container with blueprint metadata.

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint generate [OPTIONS] INPUT_FILE
```

**Options:**
- `-o, --output PATH`: Output PNG file path (required)
- `-n, --system-name TEXT`: System name for blueprint
- `-t, --system-type TEXT`: System type
- `-a, --architecture TEXT`: Architecture
- `--mode`: Encoding mode (standard or code, default: standard)

### `blueprint view`

View blueprint overlay for PixelRTS container.

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint view [OPTIONS] RTS_FILE
```

**Options:**
- `-o, --output PATH`: Output overlay path (default: <input>_overlay.png)
- `--html`: Generate HTML visualization instead of PNG
- `--show-grid/--no-grid`: Show/hide grid overlay (default: show)

### `blueprint analyze`

Analyze and display blueprint information.

```bash
python3 -m systems.pixel_compiler.pixelrts_cli blueprint analyze RTS_FILE
```

## Integration with VLM Analysis

Blueprints enhance vision-language model analysis:

```python
from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

analyzer = PixelRTSVisionAnalyzer('kernel.rts.png')
blueprint = analyzer.load_blueprint()

# Build context-aware prompt
if blueprint:
    context = f"""
System: {blueprint.system_name}
Components: {len(blueprint.components)}
Architecture: {blueprint.architecture}

Component structure:
"""
    for comp in blueprint.components:
        context += f"- {comp.id}: {comp.description}\n"

    # Use context for VLM analysis
    response = vlm.analyze(image, context)
```

## Troubleshooting

### No blueprint found

If `blueprint view` reports no blueprint:
- Ensure the file was encoded with `blueprint generate`
- Check for `.blueprint.json` sidecar file
- Verify PNG contains `PixelRTS-Blueprint` tEXt chunk

### ELF analysis not working

If blueprint generation doesn't detect ELF structure:
```bash
# Install pyelftools
pip install pyelftools

# Verify ELF detection
python3 -c "
from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer
analyzer = BlueprintAnalyzer()
with open('kernel.bin', 'rb') as f:
    print('Is ELF:', analyzer.is_elf_binary(f.read()))
"
```

### Component boundaries not visible

If overlay doesn't show component boundaries:
- Ensure blueprint has components with valid `hilbert_range` values
- Check that `pixel_start` and `pixel_end` coordinates are within image bounds
- Try with `--show-grid` flag to verify grid overlay is working

## Next Steps

- Read the full [PixelRTS v2 Specification](../PIXELRTS_V2_SPEC.md)
- Explore [PixelRTS Architecture](PIXELRTS_ARCHITECTURE.md)
- Learn about [VLM Diagnostics](VISION_ANALYSIS_GUIDE.md)
