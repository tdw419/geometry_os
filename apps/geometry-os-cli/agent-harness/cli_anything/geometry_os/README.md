# Geometry OS CLI (geo)

Agent-native control surface for Geometry OS.

## Installation

1. Install system dependencies (Geometry OS root):
   ```bash
   pip install -r requirements.txt
   ```

2. Install the CLI:
   ```bash
   cd apps/geometry-os-cli/agent-harness
   pip install -e . --break-system-packages
   ```

## Usage

### 1. Crystallization
Convert RISC-V binaries to Spatial Bricks for the Geometric VM:
```bash
geo crystallize geometric <input_riscv> <output.rts.png>
```

### 2. Infinite Map
Launch the compositor with a specific Brick:
```bash
geo map --brick <path_to_brick.rts.png>
```

### 3. Evolution
Start AI-driven optimization on a Brick:
```bash
geo evolve <path_to_brick.rts.png>
```

### 4. REPL Mode
```bash
geo
```

## Architecture
This CLI follows the **CLI-Anything** SOP, providing both human-readable and JSON output (`--json`) for AI agents.
