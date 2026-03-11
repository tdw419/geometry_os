# Universal Transpiler Guide

## Overview

The Universal Transpiler (`pixelrts_v2_converter.py`) converts executable binaries and source code into PixelRTS v2 cartridges (.rts.png files). This enables seamless integration of software artifacts into the Geometry OS ecosystem.

### Key Features

- **Multi-Source Support**: Converts from Rust, C/C++, WASM binaries, Linux ELF, Windows PE, macOS Mach-O
- **Automatic Detection**: Detects input format and applies appropriate conversion strategy
- **Embedded Metadata**: Stores format-specific metadata (architecture, OS, entry point, etc.)
- **WASM Optimization**: Clang-based WASM compilation for C/C++/Rust sources
- **Validation**: SHA256 checksum verification and data integrity checks

## Supported Input Types

| Input Type | Description | Example Extensions | Notes |
|------------|-------------|-------------------|-------|
| **Rust Source** | Rust source code with main() or entry function | `.rs` | Compiles via rustc to WASM |
| **C Source** | C source code | `.c`, `.h` | Compiles via emscripten/clang to WASM |
| **C++ Source** | C++ source code | `.cpp`, `.cc`, `.cxx`, `.hpp` | Compiles via emscripten/clang++ to WASM |
| **WASM Binary** | Pre-compiled WebAssembly modules | `.wasm`, `.wat` | Directly embedded |
| **Linux ELF** | Linux executable binaries | (no extension) | Extracted as-is |
| **Windows PE** | Windows executables/DLLs | `.exe`, `.dll` | Extracted as-is |
| **macOS Mach-O** | macOS executables/libraries | (no extension), `.dylib` | Extracted as-is |

## Installation

### Prerequisites

```bash
# Install Rust with wasm32 target
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-wasi

# Install emscripten for C/C++ to WASM compilation
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
```

### Python Dependencies

```bash
pip install pillow numpy opencv-python-headless pydantic
```

## CLI Usage

### Basic Conversion

```bash
# Convert Rust source
python3 -m systems.pixel_compiler.pixelrts_v2_converter \
    input.rs output.rts.png

# Convert C source
python3 -m systems.pixel_compiler.pixelrts_v2_converter \
    program.c output.rts.png

# Convert WASM binary
python3 -m systems.pixel_compiler.pixelrts_v2_converter \
    module.wasm output.rts.png

# Convert Linux binary
python3 -m systems.pixel_compiler.pixelrts_v2_converter \
    /usr/bin/ls ls_binary.rts.png
```

### With Metadata

```bash
# Using pixelrts CLI
python3 systems/pixel_compiler/pixelrts_cli.py convert \
    input.rs output.rts.png \
    --name "My Program" \
    --type "utility" \
    --description "A useful program"
```

## Python API

### Basic Usage

```python
from systems.pixel_converter.pixelrts_v2_converter import UniversalTranspiler

# Create transpiler instance
transpiler = UniversalTranspiler()

# Convert file
metadata = {
    "name": "fibonacci",
    "type": "demo",
    "description": "Fibonacci sequence calculator"
}
cartridge_path = transpiler.convert(
    input_path="fibonacci.rs",
    output_path="fibonacci.rts.png",
    metadata=metadata
)
```

### Detect Input Format

```python
from systems.pixel_converter.pixelrts_v2_converter import InputType

# Auto-detect format
input_type = transpiler.detect_input_type("program.rs")
# Returns: InputType.RUST_SOURCE

input_type = transpiler.detect_input_type("/usr/bin/bash")
# Returns: InputType.LINUX_ELF
```

### Get Supported Syscalls

```python
# List all supported syscalls for input type
syscalls = transpiler.get_supported_syscalls(InputType.RUST_SOURCE)
for syscall in syscalls:
    print(f"  - {syscall}")
```

## Syscall Compatibility

### Supported Syscalls (WASM Runtime)

| Syscall | Description | Status |
|---------|-------------|--------|
| `fd_write` | Write to file descriptor | Supported |
| `fd_read` | Read from file descriptor | Supported |
| `fd_close` | Close file descriptor | Supported |
| `fd_seek` | Seek in file | Supported |
| `clock_time_get` | Get system time | Supported |
| `proc_exit` | Exit process | Supported |
| `environ_get` | Get environment variables | Supported |
| `args_get` | Get command-line arguments | Supported |

### Unsupported Syscalls

The following syscalls are **not** currently supported in the WASM runtime:

- Raw network sockets (`socket`, `bind`, `listen`, `accept`, `connect`)
- Direct hardware access (inb, outb port I/O)
- Process forking (`fork`, `execve`, `clone`)
- Signal handling (`sigaction`, `kill`)
- Memory-mapped I/O (`mmap`, `munmap` for device mapping)

### Checking Syscall Support

```python
from systems.pixel_converter.pixelrts_v2_converter import UniversalTranspiler

transpiler = UniversalTranspiler()

# Check if specific syscall is supported
if transpiler.is_syscall_supported("fd_write"):
    print("fd_write is supported")

# Get supported syscalls for Rust
rust_syscalls = transpiler.get_supported_syscalls(InputType.RUST_SOURCE)
print(f"Rust supports {len(rust_syscalls)} syscalls")

# Check Linux ELF (limited syscall info)
linux_syscalls = transpiler.get_supported_syscalls(InputType.LINUX_ELF)
print(f"Linux ELF supports {len(linux_syscalls)} syscalls")
```

## Output Format

### Cartridge Structure

```
output.rts.png
├── PNG image data (RGBA, Hilbert-mapped)
├── PNG tEXt chunks (metadata)
│   ├── format: "pixelrts-v2"
│   ├── version: "2.0"
│   ├── mode: "code" | "standard"
│   ├── grid_size: "256"
│   ├── bytes_per_pixel: "4"
│   ├── timestamp: "2026-02-10T12:00:00Z"
│   ├── data_size: "12345"
│   └── checksum: "sha256:abc123..."
└── Optional sidecar: output.rts.meta.json
```

### Metadata Schema

```json
{
  "format": "pixelrts-v2",
  "version": "2.0",
  "mode": "code",
  "grid_size": 256,
  "bytes_per_pixel": 4,
  "timestamp": "2026-02-10T12:00:00Z",
  "data": {
    "original_path": "input.rs",
    "original_size": 12345,
    "checksum": "sha256:abc123...",
    "compression": "none"
  },
  "executable": {
    "format": "wasm",
    "architecture": "wasm32",
    "entry_point": "main",
    "compiler": "rustc",
    "compiler_version": "1.75.0"
  },
  "custom": {
    "name": "My Program",
    "type": "utility",
    "description": "A useful program"
  }
}
```

## Runtime Execution

### Loading and Executing

```python
from systems.pixel_compiler.wasm_runtime import WASMRuntime

# Load cartridge
runtime = WASMRuntime.from_png("output.rts.png")

# Call function
result = runtime.call("main", 42)
print(f"Result: {result}")

# Get metadata
metadata = runtime.metadata
print(f"Program: {metadata.get('name', 'Unknown')}")
```

### Direct WASM Execution

```python
from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

# Create bridge
bridge = WASMGPUBridge()

# Load cartridge data
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
decoder = PixelRTSDecoder()
wasm_data = decoder.load("output.rts.png", verify_hash=True)

# Execute
result = bridge.execute(
    wasm_data,
    entry_point=0,
    arguments=[42, 10]
)
print(f"Execution result: {result}")
```

## Troubleshooting

### Common Issues

**Issue**: `rustc: command not found`
- **Solution**: Install Rust via rustup: `curl https://sh.rustup.rs -sSf | sh`

**Issue**: `wasm32-wasi target not found`
- **Solution**: Add WASM target: `rustup target add wasm32-wasi`

**Issue**: `emcc: command not found`
- **Solution**: Install and activate emscripten SDK

**Issue**: `Unsupported input format`
- **Solution**: Ensure input file has recognized extension or is valid binary

**Issue**: `Checksum verification failed`
- **Solution**: The cartridge may be corrupted; re-run conversion

### Debug Mode

```python
import logging
logging.basicConfig(level=logging.DEBUG)

transpiler = UniversalTranspiler()
# Now you'll see detailed debug output
```

## Future Enhancements

- [ ] GPU shader (WGSL/GLSL) source compilation
- [ ] Intermediate Representation (IR) generation
- [ ] Multi-input linking (combine multiple modules)
- [ ] Dependency resolution and bundling
- [ ] Incremental compilation caching
- [ ] Remote compilation service
- [ ] WebAssembly GC and SIMD support
- [ ] Direct GPU binary compilation (PTX/SPIR-V)

## See Also

- [PixelRTS v2 Specification](/docs/pixelrts/PIXELRTS_V2_SPEC.md)
- [WASM Runtime Guide](/docs/guides/WASM_RUNTIME_GUIDE.md)
- [WASM GPU Bridge](/docs/architecture/wasm-gpu-bridge.md)
