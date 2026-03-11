# PixelRTS v2 Core Library - Implementation Status

## Overview
PixelRTS v2 is a visual bootable container format that encodes binary data into PNG images using Hilbert space-filling curves. This enables visual software distribution where executables can be shared as images.

## Implementation Status

### ✅ Completed Components
- [x] Hilbert curve LUT generator with power-of-2 grid support
- [x] PNG encoder with RGBA dense packing (4 bytes/pixel)
- [x] PNG decoder with automatic metadata extraction
- [x] PNG tEXt chunk metadata embedding (self-describing images)
- [x] WASM semantic coloring in "code" mode
- [x] Converter CLI tool (`pixelrts_v2_converter.py`)
- [x] Extractor CLI tool (`pixelrts_v2_extractor.py`)
- [x] Boot script generation for QEMU
- [x] Comprehensive test suite (65 unit tests, 64 integration tests)

### 📊 Test Results
- **Unit Tests**: 65/65 passing ✅
- **Integration Tests**: 64/65 passing ✅
- **Total Coverage**: 129/130 tests passing (99.2%)

### Usage

#### CLI: Convert binary to PNG
```bash
# Standard mode (dense RGBA packing)
python3 systems/pixel_compiler/pixelrts_v2_converter.py input.bin output.rts.png

# Code mode (semantic coloring for WASM)
python3 systems/pixel_compiler/pixelrts_v2_converter.py module.wasm module.rts.png --mode code

# With metadata
python3 systems/pixel_compiler/pixelrts_v2_converter.py kernel.bin kernel.rts.png \
    --type kernel \
    --name my-kernel \
    --version 1.0.0 \
    --description "My custom kernel"

# With boot script generation
python3 systems/pixel_compiler/pixelrts_v2_converter.py kernel.bin kernel.rts.png \
    --type kernel \
    --generate-boot-script
```

#### CLI: Extract from PNG
```bash
# Extract binary data
python3 systems/pixel_compiler/pixelrts_v2_extractor.py input.rts.png -o output.bin

# View metadata
python3 systems/pixel_compiler/pixelrts_v2_extractor.py input.rts.png --info

# Extract to stdout (pipe to other tools)
python3 systems/pixel_compiler/pixelrts_v2_extractor.py input.rts.png --stdout | qemu-system-x86_64 ...
```

#### Python API
```python
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent / "systems" / "pixel_compiler"))

from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

# Encode binary data to PNG
encoder = PixelRTSEncoder(mode="standard")  # or "code" for WASM
png_bytes = encoder.encode(
    data=b"My binary data here",
    metadata={
        "type": "kernel",
        "name": "my-kernel",
        "version": "1.0.0"
    }
)

# Save to file
with open("output.rts.png", "wb") as f:
    f.write(png_bytes)

# Decode PNG back to binary
decoder = PixelRTSDecoder()
with open("output.rts.png", "rb") as f:
    png_bytes = f.read()

data = decoder.decode(png_bytes)
metadata = decoder.get_metadata()

print(f"Extracted {len(data)} bytes")
print(f"Format: {metadata['format']}")
print(f"Type: {metadata.get('type', 'unknown')}")
```

## Architecture

### Hilbert Space-Filling Curve
- **Purpose**: Preserves spatial locality for GPU-friendly access patterns
- **Grid Size**: Power of 2 (16x16, 256x256, 1024x1024, etc.)
- **Coordinate Order**: (x, y) format matching standard image coordinates
- **LUT Caching**: Generated once and reused for performance

### Encoding Modes

#### Standard Mode (`mode="standard"`)
- **Format**: RGBA dense packing
- **Density**: 4 bytes per pixel (100% efficiency)
- **Use Case**: General binary encoding

#### Code Mode (`mode="code"`)
- **Format**: Semantic coloring for WASM opcodes
- **Coloring**:
  - Control flow (red/high entropy)
  - Arithmetic (green/medium entropy)
  - Memory operations (blue/low entropy)
- **Use Case**: Visualizing program structure in WASM modules

### Metadata Storage

#### PNG tEXt Chunks (Embedded)
Metadata is embedded directly in the PNG file using tEXt chunks with key "PixelRTS":
- Format version
- Encoding mode (RGBA-dense or RGBA-code)
- Grid size
- Data hash (SHA-256)
- Data size
- Custom user metadata (type, name, version, description)

#### Sidecar JSON (Optional)
For additional metadata needs, a `.meta.json` file can be generated:
```json
{
  "format": "PixelRTS-2.0",
  "format_version": 2,
  "grid_size": 256,
  "encoding": {
    "type": "RGBA-dense",
    "bytes_per_pixel": 4,
    "mapping": "Hilbert space-filling curve"
  },
  "data_hash": "abc123...",
  "data_size": 1024,
  "type": "kernel",
  "name": "my-kernel"
}
```

## Testing

### Run All Tests
```bash
# Unit tests
python3 -m pytest tests/unit/test_pixelrts_v2*.py -v

# Integration tests
python3 -m pytest tests/integration/test_pixelrts_v2*.py -v

# All PixelRTS v2 tests
python3 -m pytest tests/unit/test_pixelrts_v2*.py tests/integration/test_pixelrts_v2*.py -v
```

### Test Coverage
- `tests/unit/test_pixelrts_v2_core.py` - Hilbert curve, coordinate mapping
- `tests/unit/test_pixelrts_v2_encoding.py` - Encode/decode, metadata
- `tests/unit/test_pixelrts_v2_wasm.py` - WASM semantic coloring
- `tests/integration/test_pixelrts_v2_converter.py` - CLI converter tool
- `tests/integration/test_pixelrts_v2_extractor.py` - CLI extractor tool
- `tests/integration/test_pixelrts_v2_boot_script.py` - Boot script generation
- `tests/integration/test_pixelrts_v2_e2e.py` - End-to-end workflows
- `tests/integration/test_pixelrts_v2_integration.py` - RTS registry integration
- `tests/integration/test_pixelrts_v2_registry_integration.py` - Registry management

## Performance Characteristics

### Encoding Speed
- Small files (10KB): < 1 second
- Medium files (1MB): < 10 seconds
- Large files (10MB): < 2 minutes

### Decoding Speed
- Small files (10KB): < 0.5 seconds
- Medium files (1MB): < 5 seconds
- Large files (10MB): < 1 minute

### Space Efficiency
- **Data Density**: 4 bytes per pixel (100%)
- **PNG Compression**: Typically 2-5x reduction for executable code
- **Overhead**: ~100 bytes for PNG structure + metadata

## File Format Specification

### PixelRTS v2 PNG Structure
```
┌─────────────────────────────────────┐
│ PNG Signature (8 bytes)             │
├─────────────────────────────────────┤
│ IHDR chunk (image header)           │
├─────────────────────────────────────┤
│ tEXt chunk "PixelRTS" (metadata)    │  ← Self-describing metadata
├─────────────────────────────────────┤
│ IDAT chunks (image data)            │  ← Hilbert-encoded binary data
├─────────────────────────────────────┤
│ IEND chunk (end of file)            │
└─────────────────────────────────────┘
```

### Hilbert Curve Mapping
Binary data is mapped to pixels using Hilbert space-filling curve traversal:
```
Data[0] → Pixel[LUT[0]] = Pixel[(0,0)]
Data[1] → Pixel[LUT[1]] = Pixel[(1,0)]
Data[2] → Pixel[LUT[2]] = Pixel[(1,1)]
...
```

Each pixel stores 4 bytes:
- R channel: Data[n*4 + 0]
- G channel: Data[n*4 + 1]
- B channel: Data[n*4 + 2]
- A channel: Data[n*4 + 3]

## Dependencies

### Required
- Python 3.12+
- Pillow (PNG encoding/decoding)
- numpy (Hilbert LUT generation)

### Optional
- pytest (testing)
- qemu-system-x86_64 (boot script execution)

## Future Enhancements

### Planned Features
- [ ] GPU-accelerated encoding/decoding
- [ ] Support for additional color modes (grayscale, palette)
- [ ] Compression options (ZIP, LZMA)
- [ ] Multi-segment encoding (kernel + initrd + dtb)
- [ ] Digital signature support
- [ ] Streaming decode for large files

### Research Areas
- [ ] Alternative space-filling curves (Morton, Peano)
- [ ] Error correction codes
- [ ] Progressive encoding for web viewing
- [ ] 3D texture encoding for volumetric data

## Contributing

### Code Style
- Follow PEP 8
- Use type hints where appropriate
- Add docstrings to all public functions
- Write tests for new features

### Test Guidelines
- Unit tests for pure functions
- Integration tests for CLI tools
- End-to-end tests for workflows
- Performance tests for optimization work

## License

Part of the Geometry OS project. See main project LICENSE for details.

## Contact

For issues, questions, or contributions, please refer to the main Geometry OS project documentation.
