---
name: pixelrts-blueprint
description: Generate and visualize blueprint metadata for PixelRTS containers showing component boundaries and structure
category: debugging
---

# PixelRTS Blueprint

Generate and visualize component blueprints for PixelRTS containers to understand internal structure.

## When to Use

- Understanding structure of complex binaries
- Debugging component boundaries
- Visualizing ELF section layout
- Analyzing memory regions in converted containers
- Creating documentation for PixelRTS images

## Procedure

### Step 1: Generate Blueprint

```bash
# Generate blueprint during conversion
python3 pixelrts_v2_converter.py binary.elf output.rts.png --blueprint

# Creates: output.rts.meta.json with component metadata
```

### Step 2: Analyze Existing Container

```bash
# Analyze ELF and generate blueprint
python3 systems/pixel_compiler/pixelrts_blueprint_analyzer.py binary.elf

# Output: binary.blueprint.json
```

### Step 3: Visualize Blueprint

```bash
# Visual overlay on image
python3 systems/pixel_compiler/pixelrts_blueprint_viewer.py container.rts.png

# Creates: container.blueprint.html (interactive visualization)
```

### Step 4: Query Components

```bash
# List components
cat container.rts.meta.json | jq '.components[]'

# Find specific component
jq '.components[] | select(.name == ".text")' container.rts.meta.json
```

## Blueprint Format

```json
{
  "name": "binary.elf",
  "sha256": "abc123...",
  "components": [
    {
      "name": ".text",
      "type": "code",
      "offset": 0,
      "size": 4096,
      "hilbert_start": [0, 0],
      "hilbert_end": [64, 64]
    },
    {
      "name": ".data",
      "type": "data",
      "offset": 4096,
      "size": 2048,
      "hilbert_start": [64, 64],
      "hilbert_end": [96, 96]
    },
    {
      "name": ".rodata",
      "type": "readonly",
      "offset": 6144,
      "size": 1024,
      "hilbert_start": [96, 96],
      "hilbert_end": [112, 112]
    }
  ]
}
```

## CLI Reference

### pixelrts_blueprint_analyzer.py

```
usage: pixelrts_blueprint_analyzer.py [-h] [--output FILE] input

positional arguments:
  input          Input ELF binary

options:
  --output FILE  Output JSON file (default: input.blueprint.json)
```

### pixelrts_blueprint_viewer.py

```
usage: pixelrts_blueprint_viewer.py [-h] [--overlay] [--html] input

positional arguments:
  input          Input .rts.png file

options:
  --overlay      Generate PNG overlay with component boundaries
  --html         Generate interactive HTML visualization
```

## Visualization Types

### PNG Overlay

Component boundaries drawn over the image:

- **Red**: Code sections (.text, .init)
- **Green**: Data sections (.data, .bss)
- **Blue**: Read-only data (.rodata)
- **Yellow**: Metadata (.symtab, .strtab)

### HTML Interactive

Interactive visualization with:
- Zoomable map view
- Click-to-inspect components
- Size statistics
- Address range display

## Troubleshooting

### "Not an ELF file - blueprint not supported"

**Cause**: Blueprint requires ELF format for section analysis.
**Fix**: Only ELF binaries support blueprint generation.

```bash
# Check file format
file binary.bin
# binary.bin: ELF 64-bit LSB executable...  <- Good
# binary.bin: data                          <- Not supported
```

### "No sections found"

**Cause**: Stripped binary with no section headers.
**Fix**: Use program headers instead, or recompile with debug info.

```bash
# Check for sections
readelf -S binary.elf

# Use program headers if no sections
readelf -l binary.elf
```

### "Hilbert coordinates out of range"

**Cause**: Component extends beyond image bounds.
**Fix**: Image may be truncated, re-convert from source.

```bash
# Verify image dimensions
identify container.rts.png

# Re-convert
python3 pixelrts_v2_converter.py source.elf fixed.rts.png --blueprint
```

## Examples

### Analyze Kernel Structure

```bash
# Generate blueprint for kernel
python3 systems/pixel_compiler/pixelrts_blueprint_analyzer.py vmlinux

# View largest components
jq '.components | sort_by(.size) | reverse | .[:5]' vmlinux.blueprint.json

# Output:
# [
#   {"name": ".text", "size": 2097152, ...},
#   {"name": ".rodata", "size": 1048576, ...},
#   ...
# ]
```

### Create Visual Documentation

```bash
# Generate HTML visualization
python3 systems/pixel_compiler/pixelrts_blueprint_viewer.py kernel.rts.png --html

# Open in browser
firefox kernel.blueprint.html
```

### Compare Two Versions

```bash
# Generate blueprints for both
python3 systems/pixel_compiler/pixelrts_blueprint_analyzer.py v1.elf
python3 systems/pixel_compiler/pixelrts_blueprint_analyzer.py v2.elf

# Compare component sizes
diff <(jq '.components[].size' v1.blueprint.json) \
     <(jq '.components[].size' v2.blueprint.json)
```

### Debug Memory Layout

```bash
# Find component at specific address
jq --arg addr 0x1000 '.components[] | select(.offset <= ($addr | tonumber) and .offset + .size > ($addr | tonumber))' container.rts.meta.json
```

## Component Types

| Type | Color | Description |
|------|-------|-------------|
| `code` | Red | Executable instructions |
| `data` | Green | Mutable data |
| `readonly` | Blue | Constant data |
| `metadata` | Yellow | Symbol tables, debug info |
| `bss` | Gray | Uninitialized data |

## Related Skills

- `pixelrts-convert` - Generate blueprints during conversion
- `pixelrts-analyze` - Visual analysis companion
- `pixelrts-debug` - Debug using component info
