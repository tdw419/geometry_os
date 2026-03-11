---
name: pixelrts-analyze
description: Visual analysis of PixelRTS containers including entropy mapping, pattern detection, and VLM-powered inspection
category: debugging
---

# PixelRTS Analyze

Analyze PixelRTS containers for structure, entropy, patterns, and anomalies using visual and AI-powered inspection.

## When to Use

- Debugging corrupted or malformed PixelRTS images
- Understanding structure of unknown binaries
- Detecting embedded patterns or hidden data
- Verifying encoding correctness after conversion
- AI-assisted visual inspection with VLM integration

## Procedure

### Step 1: Basic Analysis

```bash
# Run visual analyzer
python3 pixelrts_vision_analyzer.py container.rts.png

# Output includes:
# - Entropy heatmap (entropy_map.png)
# - Structure analysis report
# - Detected patterns
```

### Step 2: Entropy Analysis

Entropy mapping reveals data distribution:

| Entropy Level | Meaning |
|---------------|---------|
| High (0.8-1.0) | Compressed or encrypted data |
| Medium (0.4-0.8) | Structured binary (code, tables) |
| Low (0.0-0.4) | Sparse or uniform data |

```bash
# Generate entropy visualization
python3 pixelrts_vision_analyzer.py container.rts.png --entropy-only
```

### Step 3: Pattern Detection

Detect structural patterns in the image:

```bash
# Edge detection and Fourier analysis
python3 -c "
from systems.pixel_compiler.vdisasm import PatternDetector
detector = PatternDetector('container.rts.png')
detector.detect_edges()
detector.fourier_analysis()
detector.report()
"
```

### Step 4: VLM Integration

For AI-assisted visual inspection:

```bash
# Requires VLM endpoint (LM Studio, Ollama, etc.)
python3 pixelrts_vision_analyzer.py container.rts.png --vlm

# The VLM will:
# - Describe visual patterns
# - Identify anomalies
# - Suggest structure interpretation
```

## CLI Reference

### pixelrts_vision_analyzer.py

```
usage: pixelrts_vision_analyzer.py [-h] [--entropy-only] [--vlm] [--output DIR]
                                    input

positional arguments:
  input          Input .rts.png file

options:
  --entropy-only Only generate entropy map
  --vlm          Enable VLM-powered analysis
  --output DIR   Output directory for reports
```

## Troubleshooting

### "High entropy detected - possible corruption"

**Cause**: Data may be corrupted or incorrectly encoded.
**Fix**: Re-convert from source binary.

```bash
# Verify source hash
sha256sum original.bin

# Re-convert
python3 pixelrts_v2_converter.py original.bin fixed.rts.png
```

### "VLM connection failed"

**Cause**: No VLM endpoint available.
**Fix**: Start LM Studio or configure VLM endpoint.

```bash
# Start LM Studio server (default port 1234)
# Or set environment variable
export VLM_ENDPOINT=http://localhost:1234/v1
python3 pixelrts_vision_analyzer.py container.rts.png --vlm
```

### "Pattern detection timeout"

**Cause**: Large file with complex patterns.
**Fix**: Use sampling mode for large files.

```bash
# Sample-based analysis for large files
python3 pixelrts_vision_analyzer.py large.rts.png --sample-size 1024
```

## Examples

### Analyze Unknown Binary

```bash
# Full analysis pipeline
python3 pixelrts_vision_analyzer.py unknown.rts.png --output ./analysis/

# Review outputs
ls ./analysis/
# entropy_map.png
# structure_report.json
# patterns.txt
```

### Verify Conversion Quality

```bash
# Compare entropy before/after conversion
python3 pixelrts_vision_analyzer.py original.rts.png --entropy-only
python3 pixelrts_vision_analyzer.py converted.rts.png --entropy-only

# Entropy distribution should be similar
```

### AI-Assisted Debugging

```bash
# VLM analysis with context
python3 pixelrts_vision_analyzer.py buggy.rts.png --vlm --context "This is a RISC-V kernel that fails to boot"

# VLM will analyze and suggest:
# - Boot structure issues
# - Missing headers
# - Encoding anomalies
```

## Output Files

| File | Description |
|------|-------------|
| `entropy_map.png` | Grayscale heatmap of entropy distribution |
| `structure_report.json` | JSON with detected regions and boundaries |
| `patterns.txt` | Text summary of detected patterns |
| `vlm_analysis.md` | VLM-generated analysis report |

## Related Skills

- `pixelrts-convert` - Convert binaries to analyze
- `pixelrts-debug` - Debug execution issues
- `pixelrts-blueprint` - Generate component metadata
