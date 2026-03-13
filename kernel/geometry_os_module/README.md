# Geometry OS Kernel Module

Linux kernel module for direct GPU glyph execution.

## Build

```bash
# Install kernel headers
sudo apt install linux-headers-$(uname -r)

# Build
cd kernel/geometry_os_module
make
```

## Usage

```bash
# Load module
sudo insmod geometry_os.ko

# Verify
ls -la /dev/geometry_os

# Use from Python
python3 tests/test_geometry_os_module.py

# Unload
sudo rmmod geometry_os
```

## Ioctl Interface

| Command | Description |
|---------|-------------|
| `GEOS_IOCTL_LOAD_SPIRV` | Load SPIR-V binary |
| `GEOS_IOCTL_EXECUTE` | Execute loaded program |
| `GEOS_IOCTL_GET_OUTPUT` | Get output buffer fd |
| `GEOS_IOCTL_SET_UNIFORMS` | Set uniform values |

## Requirements

- Linux 5.0+
- Intel GPU (Iris Xe, HD Graphics)
- Root access for module loading

## Status

Phase 3 - Basic ioctl interface working. GPU ring buffer submission pending.
