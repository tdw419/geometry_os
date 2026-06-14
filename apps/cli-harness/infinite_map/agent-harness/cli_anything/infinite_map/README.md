# g-map: Geometry OS Infinite Map CLI

CLI for managing the Geometry OS Infinite Map system - Virtual Address Translation (VAT) and tile management for GPU-native memory operations.

## Installation

```bash
# From source
cd apps/cli-harness/infinite_map/agent-harness
pip install -e .

# Or publish to PyPI
python -m build && twine upload dist/*
```

## Usage

```bash
# Show infinite map status
g-map status
g-map --json status  # JSON output for AI agents

# List active tiles
g-map tiles

# Allocate new tile memory
g-map allocate

# Free tile memory
g-map free tile_001

# Show VAT (Virtual Address Translation) table
g-map vat

# Map virtual address to physical
g-map map 0x0000000000001000

# Unmap virtual address
g-map unmap 0x0000000000001000

# Show memory statistics
g-map stats
```

## Commands

- `g-map status` - Show infinite map status
- `g-map tiles` - List active tiles
- `g-map allocate` - Allocate new tile memory
- `g-map free <tile_id>` - Free tile memory
- `g-map vat` - Show VAT table
- `g-map map <address>` - Map virtual address to physical
- `g-map unmap <address>` - Unmap virtual address
- `g-map stats` - Show memory statistics

All commands support `--json` flag for AI agent compatibility.

## Development

```bash
# Run tests
python -m pytest cli_anything/infinite_map/tests/
```