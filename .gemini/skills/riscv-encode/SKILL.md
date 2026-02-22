---
name: riscv-encode
description: Encode RISC-V ELF binaries to PixelRTS format with Hilbert curve spatial mapping for GPU execution
category: development
---

# RISC-V Encode

Convert RISC-V ELF binaries to spatial PixelRTS format for execution on the Pixel CPU.

## When to Use

- Preparing RISC-V kernels for GPU execution
- Encoding test programs for the Pixel CPU
- Converting standalone RISC-V binaries
- Debugging RISC-V to Pixel mapping issues

## Procedure

### Step 1: Build RISC-V Binary

```bash
# Using riscv64-unknown-elf-gcc
riscv64-unknown-elf-gcc -march=rv64imac -mabi=lp64 \
    -nostdlib -static \
    -o program.elf program.c

# Or using the test build script
cd systems/riscv_gpu
./build_tests.sh
```

### Step 2: Encode to PixelRTS

```bash
python3 src/riscv_encoder_standalone.py program.elf output.rts.png
```

### Step 3: Verify Output

```bash
# Check generated metadata
cat output.rts.meta.json

# Visualize the encoding
python3 -c "
from PIL import Image
img = Image.open('output.rts.png')
print(f'Size: {img.size}')
print(f'Mode: {img.mode}')
"
```

### Step 4: Run on Pixel CPU

```bash
# Via QEMU bridge
cd systems/infinite_map_rs
cargo run --release --bin run_riscv -- ../riscv_gpu/output.rts.png
```

## CLI Reference

### riscv_encoder_standalone.py

```
usage: riscv_encoder_standalone.py [-h] [--test] [--verbose]
                                    input output

positional:
  input           Input ELF binary
  output          Output .rts.png file

options:
  --test          Run self-tests
  --verbose       Show encoding details
  --entry ADDR    Entry point address (default: from ELF)
```

## Encoding Process

```
ELF Binary
    │
    ▼
┌─────────────────┐
│  Parse ELF      │  Extract .text, .data, .rodata
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Decode RISC-V  │  Instructions to operations
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Hilbert Map    │  Linear → 2D spatial coordinates
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  RGBA Encode    │  4 bytes per pixel
└────────┬────────┘
         │
         ▼
    output.rts.png
```

## Troubleshooting

### "Not a valid ELF file"

**Cause**: Input is not an ELF binary.
**Fix**: Verify file format.

```bash
file program.elf
# Should show: ELF 64-bit LSB executable, UCB RISC-V

# If not ELF, compile correctly:
riscv64-unknown-elf-gcc -o program.elf program.c
```

### "Unsupported architecture"

**Cause**: Binary is not RISC-V.
**Fix**: Cross-compile for RISC-V target.

```bash
# Install RISC-V toolchain
sudo apt install gcc-riscv64-unknown-elf

# Compile with correct target
riscv64-unknown-elf-gcc -march=rv64imac program.c -o program.elf
```

### "Entry point not found"

**Cause**: ELF has no entry point or custom start.
**Fix**: Specify entry point manually.

```bash
# Find entry point
riscv64-unknown-elf-objdump -f program.elf

# Encode with explicit entry
python3 src/riscv_encoder_standalone.py program.elf output.rts.png --entry 0x80000000
```

### "Instruction decode failed"

**Cause**: Unsupported RISC-V instruction.
**Fix**: Check supported instruction set.

```bash
# List instructions
riscv64-unknown-elf-objdump -d program.elf | grep "^[0-9a-f]*:" | head -20

# Supported: RV64I, RV64M, RV64A, RV64C
# Unsupported: RV64V (vector), custom extensions
```

### "Image size exceeds limit"

**Cause**: Binary too large for encoding.
**Fix**: Strip debug symbols or optimize.

```bash
# Strip debug info
riscv64-unknown-elf-strip program.elf

# Optimize size
riscv64-unknown-elf-gcc -Os program.c -o program.elf
```

## Examples

### Encode Test Program

```bash
# Create simple program
cat > hello.c << 'EOF'
void _start() {
    // Write "Hello" via UART
    volatile char *uart = (char *)0x10000000;
    const char *msg = "Hello\n";
    while (*msg) {
        *uart = *msg++;
    }
    // Halt
    while (1) {}
}
EOF

# Compile
riscv64-unknown-elf-gcc -march=rv64imac -nostdlib -static \
    -o hello.elf hello.c

# Encode
python3 src/riscv_encoder_standalone.py hello.elf hello.rts.png

# Run
cargo run --release --bin run_riscv -- hello.rts.png
```

### Batch Encode Tests

```bash
cd systems/riscv_gpu

# Build all tests
./build_tests.sh

# Encode all
for elf in tests/*.elf; do
    name=$(basename $elf .elf)
    python3 src/riscv_encoder_standalone.py $elf tests/${name}.rts.png
done

# Run all tests
./tests/run_all_tests.sh
```

## Supported Instructions

| Category | Instructions |
|----------|-------------|
| Integer | ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU |
| Multiply | MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU |
| Atomic | LR, SC, AMO* |
| Compressed | C.ADD, C.MV, C.LI, C.LUI, etc. |
| System | ECALL, EBREAK, CSRRW, CSRRS, CSRRC |

## Output Metadata

```json
{
  "entry_point": "0x80000000",
  "code_size": 4096,
  "data_size": 1024,
  "image_dimensions": [64, 64],
  "hilbert_order": 12,
  "sha256": "abc123..."
}
```

## Related Skills

- `pixelrts-convert` - General binary conversion
- `pixelrts-boot` - Boot encoded binaries
- `pixelrts-analyze` - Analyze encoding quality
