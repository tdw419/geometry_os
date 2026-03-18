#!/usr/bin/env python3
"""
GeosASCII Compiler
Compiles ASCII templates into GPU-native .rts.png cartridges.

The cartridge format (4-segment vertical PNG):
  - Segment 1 (top): Glyph Grid (80x24 RGBA) - the ASCII characters as pixels
  - Segment 2: SIT (Spatial Instruction Table, 256x1 RGBA) - action at each coord
  - Segment 3: State Buffer (1024x1 RGBA) - mutable state
  - Segment 4 (bottom): Bootstrap (16x16 RGBA) - metadata header
"""

import sys
import json
import re
import argparse
from pathlib import Path
from typing import Dict, List, Tuple, Optional

try:
    from PIL import Image
    import numpy as np
except ImportError:
    print("Error: PIL and numpy required. Install with: pip install pillow numpy")
    sys.exit(1)

WIDTH = 80
HEIGHT = 24
GLYPH_WIDTH = 8
GLSIT_ENTRIES = 256

# Glyph VM opcodes (aligned with synthetic_vram.rs)
OPCODES = {
    "NOP": 0,
    "LD": 3,
    "ST": 4,
    "ADD": 5,
    "SUB": 6,
    "MUL": 7,
    "DIV": 8,
    "JMP": 209,
    "JZ": 10,
    "JAL": 11,
    "CALL": 11,
    "RET": 12,
    "HALT": 13,
    "LDI": 204,
    "MOV": 206,
    "AND": 220,
    "OR": 221,
    "XOR": 222,
    "NOT": 223,
    "SHL": 224,
    "SHR": 225,
    "SAR": 226,
    # Legacy aliases for compatibility
    "JUMP": 209,
    "EXIT": 13,
}

ACTION_PATTERN = re.compile(r"\[([A-Z0-9])\]\s*(\w+)")
LABEL_PATTERN = re.compile(r"^:(\w+)\s*$")

# Memory layout constants (must match ascii_cartridge.rs)
PROGRAM_BASE = 0x8000  # Program code starts here
STATE_BASE = 0xF000  # State buffer base
GLYPH_BASE = 0x0000  # Glyph grid base


def scan_labels(ascii_content: str) -> Dict[str, int]:
    """
    Pass 1: Scan for labels in ASCII content.

    Labels are denoted by ':' prefix (e.g., :main, :handler).
    Each label gets assigned an address starting at PROGRAM_BASE.
    """
    labels = {}
    addr = PROGRAM_BASE

    lines = ascii_content.split("\n")
    for line in lines:
        line = line.strip()

        # Skip empty lines and comments
        if not line or line.startswith("#"):
            continue

        # Check for label definition
        match = LABEL_PATTERN.match(line)
        if match:
            label_name = match.group(1)
            labels[label_name] = addr
            continue

        # Count instructions (rough estimate: 1 instruction per significant line)
        # This is simplified - real implementation would tokenize properly
        if not line.startswith("[") and not line.startswith("|"):
            addr += 1  # Advance address for each instruction

    return labels


def resolve_target(target: str, labels: Dict[str, int]) -> int:
    """
    Resolve a target string to a numeric address.

    - If target is a number, return as-is
    - If target is a label, look up in label table
    - If target is unknown, return 0 (will halt/error)
    """
    # Try parsing as number first
    try:
        return int(target, 0)  # Allow hex (0x...) or decimal
    except ValueError:
        pass

    # Look up label
    return labels.get(target, 0)


def create_glyph_grid(ascii_content: str) -> np.ndarray:
    """Convert ASCII text to RGBA glyph grid (80x24)."""
    grid = np.zeros((HEIGHT, WIDTH, 4), dtype=np.uint8)
    lines = ascii_content.split("\n")

    for y, line in enumerate(lines):
        if y >= HEIGHT:
            break
        for x, char in enumerate(line[:WIDTH]):
            if x >= WIDTH:
                break
            code = ord(char) if char else 0
            grid[y, x] = [code, code, code, 255]

    return grid


def detect_patterns(ascii_content: str) -> List[Tuple[int, int, str, str]]:
    """Detect [A] Button patterns, return (x, y, label, action) tuples."""
    patterns = []
    lines = ascii_content.split("\n")

    for y, line in enumerate(lines):
        matches = ACTION_PATTERN.findall(line)
        for label, action in matches:
            x = line.index(f"[{label}]")
            patterns.append((x, y, label, action))

    return patterns


def create_sit(
    patterns: List[Tuple[int, int, str, str]],
    mapping: Dict,
    labels: Optional[Dict[str, int]] = None,
) -> np.ndarray:
    """Create Spatial Instruction Table (256x1 RGBA).

    Each entry contains:
    - Byte 0: Opcode (209=JMP, 11=CALL, 13=HALT, etc.)
    - Byte 1: Target address low byte
    - Byte 2: Target address high byte
    - Byte 3: Reserved (255)
    """
    if labels is None:
        labels = {}

    sit = np.zeros((GLSIT_ENTRIES, 1, 4), dtype=np.uint8)

    for x, y, label, action in patterns:
        idx = y * WIDTH + x

        if idx >= GLSIT_ENTRIES:
            continue

        action_def = mapping.get(action, {})
        opcode = action_def.get("opcode", "JUMP")
        target = action_def.get("target", action)

        opcode_val = OPCODES.get(opcode.upper(), OPCODES["NOP"])

        # Resolve target to numeric address (compile-time binding)
        target_addr = resolve_target(target, labels)

        # Pack address into p1/p2 bytes (little-endian)
        sit[idx, 0] = [opcode_val, target_addr & 0xFF, (target_addr >> 8) & 0xFF, 255]

    return sit


def create_state_buffer() -> np.ndarray:
    """Create empty State Buffer (1024x1 RGBA)."""
    return np.zeros((1024, 1, 4), dtype=np.uint8)


def create_bootstrap(name: str, version: str, pattern_count: int) -> np.ndarray:
    """Create Bootstrap header (16x16 RGBA)."""
    bootstrap = np.zeros((16, 16, 4), dtype=np.uint8)

    name_bytes = name.encode("utf-8")[:16]
    bootstrap[0, : len(name_bytes), 0] = list(name_bytes)
    bootstrap[0, :, 3] = 255

    version_parts = version.split(".")
    bootstrap[1, 0, 0] = int(version_parts[0]) if len(version_parts) > 0 else 1
    bootstrap[1, 1, 0] = int(version_parts[1]) if len(version_parts) > 1 else 0
    bootstrap[1, 2, 0] = int(version_parts[2]) if len(version_parts) > 2 else 0
    bootstrap[1, :, 3] = 255

    bootstrap[2, 0, 0] = pattern_count & 0xFF
    bootstrap[2, 1, 0] = (pattern_count >> 8) & 0xFF
    bootstrap[2, :, 3] = 255

    bootstrap[3, :, 0] = [ord(c) for c in "GEOSASCII"][:16] + [0] * max(0, 16 - len("GEOSASCII"))
    bootstrap[3, :, 3] = 255

    return bootstrap


def compile_cartridge(ascii_path: Path, mapping: Dict, output: Path) -> bool:
    """Compile ASCII file to .rts.png cartridge."""
    ascii_content = ascii_path.read_text()

    # Pass 1: Scan for labels
    labels = scan_labels(ascii_content)
    if labels:
        print(f"  Resolved {len(labels)} labels: {list(labels.keys())}")
        for name, addr in labels.items():
            print(f"    :{name} -> 0x{addr:04X}")

    glyph_grid = create_glyph_grid(ascii_content)
    patterns = detect_patterns(ascii_content)
    sit = create_sit(patterns, mapping, labels)
    state_buffer = create_state_buffer()

    name = ascii_path.stem
    bootstrap = create_bootstrap(name, "1.0.0", len(patterns))

    sit_padded = np.zeros((GLSIT_ENTRIES, WIDTH, 4), dtype=np.uint8)
    for i in range(min(GLSIT_ENTRIES, WIDTH)):
        sit_padded[i, 0] = sit[i, 0]

    state_padded = np.zeros((1024, WIDTH, 4), dtype=np.uint8)
    for i in range(min(1024, WIDTH)):
        state_padded[i, 0] = state_buffer[i, 0]

    bootstrap_padded = np.zeros((16, WIDTH, 4), dtype=np.uint8)
    bootstrap_padded[:, :16, :] = bootstrap

    cartridge = np.vstack([glyph_grid, sit_padded, state_padded, bootstrap_padded])

    img = Image.fromarray(cartridge, mode="RGBA")
    img.save(output, "PNG")

    return True


def main():
    parser = argparse.ArgumentParser(
        description="GeosASCII Compiler - Compile ASCII to GPU cartridge"
    )
    parser.add_argument("input", type=Path, help="Input .ascii file")
    parser.add_argument("-m", "--mapping", type=Path, help="JSON mapping file")
    parser.add_argument("-o", "--output", type=Path, help="Output .rts.png file")
    parser.add_argument(
        "--generate-mapping", action="store_true", help="Generate default mapping.json"
    )

    args = parser.parse_args()

    if args.generate_mapping:
        default_mapping = {
            "run": {"opcode": "JUMP", "target": "main"},
            "stop": {"opcode": "EXIT", "target": ""},
            "quit": {"opcode": "EXIT", "target": ""},
            "start": {"opcode": "JUMP", "target": "start"},
            "back": {"opcode": "JUMP", "target": "menu"},
            "next": {"opcode": "JUMP", "target": "next_page"},
            "prev": {"opcode": "JUMP", "target": "prev_page"},
        }
        mapping_path = args.input.with_suffix(".mapping.json")
        mapping_path.write_text(json.dumps(default_mapping, indent=2))
        print(f"Generated mapping: {mapping_path}")
        return 0

    if not args.input.exists():
        print(f"Error: Input file not found: {args.input}")
        return 1

    mapping = {}
    if args.mapping:
        if args.mapping.exists():
            mapping = json.loads(args.mapping.read_text())
        else:
            print(f"Warning: Mapping file not found: {args.mapping}")
    else:
        mapping_path = args.input.with_suffix(".mapping.json")
        if mapping_path.exists():
            mapping = json.loads(mapping_path.read_text())

    output = args.output or args.input.with_suffix(".rts.png")

    if compile_cartridge(args.input, mapping, output):
        print(f"Compiled: {args.input} -> {output}")
        patterns = detect_patterns(args.input.read_text())
        print(f"Detected {len(patterns)} patterns")
        return 0

    return 1


if __name__ == "__main__":
    sys.exit(main())
