# WebAssembly Test Programs for PixelRTS

This directory contains test WebAssembly (WASM) programs for the PixelRTS WASM execution bridge.

## Files

### Source Files (.wat - WebAssembly Text Format)

- **fibonacci.wat** - Fibonacci calculator
  - `fibonacci(n)` - Calculate nth Fibonacci number
  - `test_fib10()` - Returns fibonacci(10) = 55
  - `test_fib20()` - Returns fibonacci(20) = 6765
  - `write_result(value, offset)` - Write result to memory
  - `read_memory(offset)` - Read from memory

- **counter.wat** - Simple counter and loop test
  - `count_sum(n)` - Count from 0 to n-1, return sum
  - `count_to_memory(n)` - Store counter values in memory
  - `test_sum10()` - Returns sum of 0-9 = 45

- **memory_test.wat** - Memory operations test
  - `write_pattern(offset, count)` - Write pattern to memory
  - `verify_pattern(offset, count)` - Verify pattern, return error count
  - `fill_memory(value, count)` - Fill memory with value
  - `checksum(offset, count)` - Compute checksum of region
  - `test_offsets()` - Test memory access at various offsets

### Compiled Files (.wasm - WebAssembly Binary)

- **fibonacci.wasm** - Compiled fibonacci program
- **counter.wasm** - Compiled counter program
- **memory_test.wasm** - Compiled memory test program

### Embedded Files (.rts.png)

These are PNG images with WASM binaries embedded using RGB encoding:

- **fibonacci.rts.png** - Fibonacci program embedded
- **counter.rts.png** - Counter program embedded
- **memory_test.rts.png** - Memory test program embedded

Each .rts.png file has a corresponding metadata file (.rts.meta.json) with information about the embedded WASM.

## Usage

### Using embed_wasm.py

```bash
# Compile .wat to .wasm (uses pre-compiled binaries)
python3 embed_wasm.py compile fibonacci.wat

# Embed .wasm in .rts.png
python3 embed_wasm.py embed fibonacci.wasm fibonacci.rts.png

# Extract .wasm from .rts.png
python3 embed_wasm.py extract fibonacci.rts.png output.wasm

# Build (compile + embed) in one step
python3 embed_wasm.py build fibonacci.wat fibonacci.rts.png

# Create all test files
python3 embed_wasm.py create-test
```

### Using the WASM Runtime (when implemented)

```python
from systems.pixel_compiler import WASMRuntime

# Load from .rts.png
runtime = WASMRuntime.from_png("fibonacci.rts.png")

# Call function
result = runtime.call("fibonacci", 10)
print(f"fibonacci(10) = {result}")  # Expected: 55

# Test counter
runtime = WASMRuntime.from_png("counter.rts.png")
result = runtime.call("test_sum10")
print(f"sum(0..9) = {result}")  # Expected: 45
```

### Using CLI (when implemented)

```bash
# Execute WASM from .rts.png
python3 -m systems.pixel_compiler.wasmrun fibonacci.rts.png

# With entry point
python3 -m systems.pixel_compiler.wasmrun fibonacci.rts.png --entry fibonacci --arg 10

# With trace
python3 -m systems.pixel_compiler.wasmrun fibonacci.rts.png --trace output.json

# Memory dump
python3 -m systems.pixel_compiler.wasmrun memory_test.rts.png --dump-memory memory.bin
```

## WASM Format Details

The embedded WASM files use linear RGB encoding:

1. Each pixel stores 3 bytes (RGB channels)
2. Data is written row by row (linear encoding)
3. Alpha channel is set to 255 for all pixels
4. Metadata is stored in a sidecar .json file

## Expected Results

| Program | Function | Input | Expected Output |
|---------|----------|-------|-----------------|
| fibonacci | fibonacci(10) | 10 | 55 |
| fibonacci | fibonacci(20) | 20 | 6765 |
| counter | test_sum10() | - | 45 |
| memory_test | get_memory_size() | - | 1 (page) |
| memory_test | test_offsets() | - | 0x1E5B06C1 (checksum) |

## Notes

- The .wat files are full-featured WASM text format examples
- The .wasm files are minimal pre-compiled binaries for testing
- For production use, install the 'wat' package for proper .wat compilation:
  ```bash
  pip install wat
  ```
- The embed_wasm.py tool creates 256x256 PNG images for these test programs
