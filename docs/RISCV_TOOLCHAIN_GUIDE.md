# RISC-V Toolchain Guide for Geometry OS

## Prerequisites

Install RISC-V toolchain:
```bash
# Ubuntu/Debian
sudo apt install gcc-riscv64-unknown-elf

# macOS
brew install riscv-gnu-toolchain

# From source
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
make
```

## C Compilation

```bash
# Compile to RISC-V ELF
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -static \
    -T systems/glyph_stratum/tests/riscv/link.ld \
    -o program.elf program.c

# Convert to raw binary
riscv64-unknown-elf-objcopy -O binary program.elf program.bin

# Load into GPU daemon
systems/glyph_stratum/bin/geos-riscv-load.sh program.elf
```

## Rust Compilation

```bash
# Add RISC-V target
rustup target add riscv32i-unknown-none-elf

# Compile (no_std)
cargo build --target riscv32i-unknown-none-elf --release

# Result: target/riscv32i-unknown-none-elf/release/program
```

## Memory Map

| Address Range | Purpose |
|---------------|---------|
| 0x0000-0x0FFF | Glyph VM state |
| 0x1000-0x10FF | MMIO (UART at 0x1000) |
| 0x8000-0xFFFF | Guest RAM (your code) |

## UART Output

Write bytes to address 0x1000 to output characters.
The emulator bridges this to Glyph's UART buffer at 0x0200.

## Loading and Running

1. Start the GPU daemon: `cargo run --release --bin gpu_dev_daemon`
2. Load your binary: `systems/glyph_stratum/bin/geos-riscv-load.sh program.elf`
3. Read output via `/read` endpoint: `curl "http://127.0.0.1:8769/read?addr=0x0200&len=64"`
