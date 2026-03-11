---
name: pixelrts-convert
description: Convert any binary file (ELF, WASM, GGUF, SafeTensors) to PixelRTS format with Hilbert curve spatial encoding
category: operations
---

# PixelRTS Convert

Convert binaries to spatial PixelRTS format for GPU-native execution on the Infinite Map.

## When to Use

- Converting compiled binaries to `.rts` or `.rts.png` format
- Preparing Linux kernels, WASM modules, or ML models for spatial execution
- Encoding data with Hilbert curve mapping for cache-efficient GPU access
- Creating bootable PixelRTS containers

## Procedure

### Step 1: Identify Input Format

The universal converter auto-detects these formats:
- **ELF** - Linux executables, kernels, RISC-V binaries
- **WASM** - WebAssembly modules (spatial agents)
- **GGUF** - Quantized ML models (LLM weights)
- **SafeTensors** - PyTorch/TensorFlow model weights
- **Raw binary** - Any generic binary data

### Step 2: Choose Encoding Mode

| Mode | Bytes/Pixel | Use Case |
|------|-------------|----------|
| Standard | 4 | General purpose, RGBA encoding |
| HDPF | 16 | High-density, ML models |

### Step 3: Run Conversion

```bash
# Standard conversion (auto-detect format)
python3 pixelrts_v2_converter.py input.bin output.rts.png

# High-density format for large files
python3 systems/pixel_compiler/pixelrts_converter_hdpf.py input.gguf output.rts.png

# Universal converter with format detection
python3 systems/pixel_compiler/universal_rts_converter.py input.wasm output.rts
```

### Step 4: Verify Output

```bash
# Check SHA256 hash
sha256sum output.rts.png

# Verify blueprint metadata
python3 systems/pixel_compiler/pixelrts_blueprint_viewer.py output.rts.png
```

## CLI Reference

### pixelrts_v2_converter.py

```
usage: pixelrts_v2_converter.py [-h] [--hdpf] [--blueprint] input output

positional arguments:
  input       Input binary file
  output      Output .rts or .rts.png file

options:
  --hdpf      Use high-density pixel format (16 bytes/pixel)
  --blueprint Generate blueprint metadata JSON
```

### universal_rts_converter.py

```
usage: universal_rts_converter.py [-h] [--format {auto,elf,wasm,gguf,safetensors}]
                                   input output

Auto-detects input format and converts to PixelRTS.
```

## Troubleshooting

### "Hilbert curve overflow"

**Cause**: Input file too large for standard encoding.
**Fix**: Use `--hdpf` flag for high-density format.

```bash
python3 pixelrts_v2_converter.py large.gguf output.rts.png --hdpf
```

### "Invalid magic bytes"

**Cause**: Unknown input format.
**Fix**: Specify format manually or verify file integrity.

```bash
file input.bin  # Check actual format
python3 systems/pixel_compiler/universal_rts_converter.py input.bin output.rts --format elf
```

### "Blueprint generation failed"

**Cause**: Non-ELF input for blueprint analyzer.
**Fix**: Blueprint requires ELF format. For other formats, skip blueprint.

```bash
# Check if ELF
readelf -h input.bin

# Convert without blueprint
python3 pixelrts_v2_converter.py input.bin output.rts.png
```

## Examples

### Convert Linux Kernel

```bash
# RISC-V kernel to PixelRTS
python3 pixelrts_v2_converter.py vmlinux kernel.rts.png

# Generate boot script
python3 pixelrts_v2_extractor.py kernel.rts.png --boot-script
./kernel.rts.boot.sh
```

### Convert WASM Agent

```bash
# Spatial WASM agent
python3 systems/pixel_compiler/universal_rts_converter.py agent.wasm agent.rts.png

# Verify ABI exports
wasm-objdump -x agent.wasm | grep -E "(think|init)"
```

### Convert ML Model

```bash
# GGUF model with HDPF encoding
python3 systems/pixel_compiler/pixelrts_converter_hdpf.py model.gguf model.rts.png

# Verify size ratio
ls -lh model.gguf model.rts.png
```

## Related Skills

- `pixelrts-boot` - Boot converted containers
- `pixelrts-analyze` - Analyze converted images
- `pixelrts-blueprint` - Generate component metadata
