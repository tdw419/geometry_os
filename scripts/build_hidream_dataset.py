#!/usr/bin/env python3
"""
Transform synthetic_dataset_v13 into HiDream-O1 reasoning chains.

Converts ASM programs into a format where:
- Input: Natural language description
- Reasoning: Spatial planning + ASM logic
- Output: Pixel grid (256x256) representing the framebuffer

This bridges the "Brain" (Qwen3-VL reasoning) and "Hands" (UiT pixel synthesis).
"""

import json
import os
import re
from pathlib import Path
from typing import Dict, List, Tuple
from PIL import Image
import numpy as np

# GeOS opcodes for reference
OPCODES = {
    'NOP': (0, 'No operation'),
    'HALT': (0, 'Stop execution'),
    'LDI': (2, 'Load immediate: LDI reg, value'),
    'MOV': (2, 'Move: MOV dst, src'),
    'ADD': (3, 'Add: ADD dst, src1, src2'),
    'SUB': (3, 'Subtract'),
    'MUL': (3, 'Multiply'),
    'DIV': (3, 'Divide'),
    'AND': (3, 'Bitwise AND'),
    'OR': (3, 'Bitwise OR'),
    'XOR': (3, 'Bitwise XOR'),
    'NOT': (2, 'Bitwise NOT'),
    'SHL': (3, 'Shift left'),
    'SHR': (3, 'Shift right'),
    'PSET': (3, 'Set pixel: PSET x, y, color'),
    'LINE': (5, 'Draw line: LINE x1, y1, x2, y2, color'),
    'RECTF': (5, 'Fill rectangle: RECTF x, y, w, h, color'),
    'CIRC': (4, 'Draw circle: CIRC cx, cy, r, color'),
    'FILL': (1, 'Fill screen: FILL color'),
    'TEXT': (4, 'Draw text: TEXT x, y, str_ptr, color'),
    'BLIT': (5, 'Blit sprite: BLIT dst_x, dst_y, src_ptr, w, h'),
    'JP': (1, 'Jump: JP label'),
    'JZ': (1, 'Jump if zero'),
    'JNZ': (1, 'Jump if not zero'),
    'CMP': (2, 'Compare: CMP reg1, reg2'),
    'CALL': (1, 'Call subroutine'),
    'RET': (0, 'Return from subroutine'),
    'PUSH': (1, 'Push register to stack'),
    'POP': (1, 'Pop from stack to register'),
    'INC': (1, 'Increment register'),
    'DEC': (1, 'Decrement register'),
    'MOD': (3, 'Modulo'),
    'ABS': (2, 'Absolute value'),
    'MIN': (3, 'Minimum'),
    'MAX': (3, 'Maximum'),
    'CLZ': (2, 'Count leading zeros'),
    'SQRT': (2, 'Square root'),
    'RAND': (1, 'Random number'),
    'TIME': (1, 'Get time'),
    'WAIT': (1, 'Wait milliseconds'),
    'IN': (2, 'Input: IN reg, port'),
    'OUT': (2, 'Output: OUT port, reg'),
    'LOAD': (2, 'Load from memory'),
    'STORE': (2, 'Store to memory'),
    'ALLOC': (2, 'Allocate memory'),
    'FREE': (1, 'Free memory'),
    'GETW': (1, 'Get screen width'),
    'GETH': (1, 'Get screen height'),
    'SCROLL': (2, 'Scroll: SCROLL dx, dy'),
}


class ASMParser:
    """Parse GeOS ASM files to extract metadata and instructions."""
    
    def __init__(self, asm_content: str):
        self.content = asm_content
        self.description = ""
        self.plan = ""
        self.instructions = []
        self.labels = {}
        self._parse()
    
    def _parse(self):
        lines = self.content.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            if not line:
                continue
            
            # Parse comments
            if line.startswith(';'):
                comment = line[1:].strip()
                if comment.startswith('DESCRIPTION:'):
                    self.description = comment.replace('DESCRIPTION:', '').strip()
                elif comment.startswith('PLAN:'):
                    self.plan = comment.replace('PLAN:', '').strip()
                continue
            
            # Parse labels
            if ':' in line and not line.startswith(';'):
                label, rest = line.split(':', 1)
                self.labels[label.strip()] = len(self.instructions)
                line = rest.strip()
                if not line:
                    continue
            
            # Parse instructions
            if line:
                self.instructions.append(self._parse_instruction(line))
    
    def _parse_instruction(self, line: str) -> Dict:
        """Parse a single instruction."""
        parts = [p.strip() for p in line.split()]
        if not parts:
            return None
        
        opcode = parts[0].upper()
        args = []
        
        if len(parts) > 1:
            # Join rest and split by comma
            arg_str = ' '.join(parts[1:])
            args = [a.strip() for a in arg_str.split(',')]
        
        return {
            'opcode': opcode,
            'args': args,
            'raw': line
        }
    
    def get_visual_ops(self) -> List[Dict]:
        """Extract visual operations (PSET, LINE, RECTF, etc.)."""
        visual_opcodes = {'PSET', 'LINE', 'RECTF', 'CIRC', 'FILL', 'TEXT', 'BLIT'}
        return [inst for inst in self.instructions if inst and inst['opcode'] in visual_opcodes]
    
    def analyze_spatial_layout(self) -> Dict:
        """Analyze the spatial layout of visual operations."""
        visual_ops = self.get_visual_ops()
        
        bounds = {
            'min_x': float('inf'),
            'max_x': float('-inf'),
            'min_y': float('inf'),
            'max_y': float('-inf'),
            'colors': set(),
            'op_types': set()
        }
        
        for op in visual_ops:
            bounds['op_types'].add(op['opcode'])
            
            # Extract coordinates based on opcode
            if op['opcode'] == 'PSET' and len(op['args']) >= 3:
                try:
                    x = self._resolve_value(op['args'][0])
                    y = self._resolve_value(op['args'][1])
                    color = op['args'][2]
                    bounds['min_x'] = min(bounds['min_x'], x)
                    bounds['max_x'] = max(bounds['max_x'], x)
                    bounds['min_y'] = min(bounds['min_y'], y)
                    bounds['max_y'] = max(bounds['max_y'], y)
                    bounds['colors'].add(color)
                except:
                    pass
            
            elif op['opcode'] == 'LINE' and len(op['args']) >= 5:
                try:
                    x1 = self._resolve_value(op['args'][0])
                    y1 = self._resolve_value(op['args'][1])
                    x2 = self._resolve_value(op['args'][2])
                    y2 = self._resolve_value(op['args'][3])
                    color = op['args'][4]
                    bounds['min_x'] = min(bounds['min_x'], x1, x2)
                    bounds['max_x'] = max(bounds['max_x'], x1, x2)
                    bounds['min_y'] = min(bounds['min_y'], y1, y2)
                    bounds['max_y'] = max(bounds['max_y'], y1, y2)
                    bounds['colors'].add(color)
                except:
                    pass
            
            elif op['opcode'] == 'RECTF' and len(op['args']) >= 5:
                try:
                    x = self._resolve_value(op['args'][0])
                    y = self._resolve_value(op['args'][1])
                    w = self._resolve_value(op['args'][2])
                    h = self._resolve_value(op['args'][3])
                    color = op['args'][4]
                    bounds['min_x'] = min(bounds['min_x'], x)
                    bounds['max_x'] = max(bounds['max_x'], x + w)
                    bounds['min_y'] = min(bounds['min_y'], y)
                    bounds['max_y'] = max(bounds['max_y'], y + h)
                    bounds['colors'].add(color)
                except:
                    pass
            
            elif op['opcode'] == 'FILL' and len(op['args']) >= 1:
                bounds['colors'].add(op['args'][0])
        
        # Handle infinity cases
        if bounds['min_x'] == float('inf'):
            bounds['min_x'] = bounds['max_x'] = bounds['min_y'] = bounds['max_y'] = 0
        
        bounds['colors'] = list(bounds['colors'])
        bounds['op_types'] = list(bounds['op_types'])
        return bounds
    
    def _resolve_value(self, arg: str) -> int:
        """Resolve a register or immediate value to int."""
        arg = arg.strip()
        
        # Hex value
        if arg.startswith('0x') or arg.startswith('0X'):
            return int(arg, 16)
        
        # Binary
        if arg.startswith('0b') or arg.startswith('0B'):
            return int(arg, 2)
        
        # Register reference - extract the value if it's been set
        if arg.startswith('r') or arg.startswith('R'):
            # Try to find the LDI for this register
            reg_name = arg.split(',')[0].strip()
            for inst in self.parser.instructions:
                if inst and inst['opcode'] == 'LDI' and len(inst['args']) >= 2:
                    if inst['args'][0].strip() == reg_name:
                        try:
                            return self._resolve_value(inst['args'][1])
                        except:
                            pass
            return 128  # Fallback placeholder
        
        # Try direct int
        try:
            return int(arg)
        except:
            return 0


class ReasoningChainBuilder:
    """Build reasoning chains from parsed ASM."""
    
    def __init__(self, parser: ASMParser):
        self.parser = parser
    
    def build_reasoning(self) -> str:
        """Generate spatial reasoning from ASM analysis."""
        layout = self.parser.analyze_spatial_layout()
        visual_ops = self.parser.get_visual_ops()
        
        reasoning_parts = []
        
        # Overall goal
        if self.parser.description:
            reasoning_parts.append(f"Goal: {self.parser.description}")
        
        # Spatial analysis
        if layout['op_types']:
            reasoning_parts.append(f"\nVisual operations needed: {', '.join(layout['op_types'])}")
            
            if layout['max_x'] > 0 or layout['max_y'] > 0:
                reasoning_parts.append(
                    f"Bounding box: ({layout['min_x']}, {layout['min_y']}) to "
                    f"({layout['max_x']}, {layout['max_y']})"
                )
        
        # Color palette
        if layout['colors']:
            colors_str = ', '.join(layout['colors'][:5])  # Limit to first 5
            if len(layout['colors']) > 5:
                colors_str += f" and {len(layout['colors']) - 5} more"
            reasoning_parts.append(f"Color palette: {colors_str}")
        
        # Step-by-step execution plan
        if visual_ops:
            reasoning_parts.append("\nExecution sequence:")
            for i, op in enumerate(visual_ops[:10], 1):  # Limit to first 10
                desc = self._describe_operation(op)
                reasoning_parts.append(f"  {i}. {desc}")
            if len(visual_ops) > 10:
                reasoning_parts.append(f"  ... and {len(visual_ops) - 10} more operations")
        
        # Register allocation insight
        registers_used = set()
        for inst in self.parser.instructions:
            if inst:
                for arg in inst['args']:
                    if arg.startswith('r') or arg.startswith('R'):
                        registers_used.add(arg.split(',')[0].strip())
        
        if registers_used:
            reasoning_parts.append(f"\nRegister allocation: {', '.join(sorted(registers_used))}")
        
        return '\n'.join(reasoning_parts)
    
    def _describe_operation(self, op: Dict) -> str:
        """Create human-readable description of an operation."""
        opcode = op['opcode']
        args = op['args']
        
        if opcode == 'PSET' and len(args) >= 3:
            return f"Set pixel at ({args[0]}, {args[1]}) to color {args[2]}"
        elif opcode == 'LINE' and len(args) >= 5:
            return f"Draw line from ({args[0]}, {args[1]}) to ({args[2]}, {args[3]}) in {args[4]}"
        elif opcode == 'RECTF' and len(args) >= 5:
            return f"Fill rectangle at ({args[0]}, {args[1]}) size {args[2]}x{args[3]} in {args[4]}"
        elif opcode == 'CIRC' and len(args) >= 4:
            return f"Draw circle at ({args[0]}, {args[1]}) radius {args[2]} in {args[3]}"
        elif opcode == 'FILL' and len(args) >= 1:
            return f"Fill entire screen with {args[0]}"
        elif opcode == 'TEXT' and len(args) >= 4:
            return f"Render text at ({args[0]}, {args[1]}) from pointer {args[2]}"
        else:
            return f"Execute {opcode} with {len(args)} arguments"


class PixelRenderer:
    """Render ASM programs to pixel grids (simulating GeOS framebuffer)."""
    
    def __init__(self, width: int = 256, height: int = 256):
        self.width = width
        self.height = height
        self.registers = {f'r{i}': 0 for i in range(32)}
    
    def render(self, parser: ASMParser) -> np.ndarray:
        """Render ASM to a 256x256 RGB array."""
        # Initialize black framebuffer
        framebuffer = np.zeros((self.height, self.width, 3), dtype=np.uint8)
        
        # Simple interpreter for visual opcodes
        for inst in parser.instructions:
            if not inst:
                continue
            
            opcode = inst['opcode']
            args = inst['args']
            
            if opcode == 'FILL' and len(args) >= 1:
                color = self._parse_color(args[0])
                framebuffer[:, :] = color
            
            elif opcode == 'PSET' and len(args) >= 3:
                x = self._resolve_value(args[0])
                y = self._resolve_value(args[1])
                color = self._parse_color(args[2])
                if 0 <= x < self.width and 0 <= y < self.height:
                    framebuffer[y, x] = color
            
            elif opcode == 'LINE' and len(args) >= 5:
                x1 = self._resolve_value(args[0])
                y1 = self._resolve_value(args[1])
                x2 = self._resolve_value(args[2])
                y2 = self._resolve_value(args[3])
                color = self._parse_color(args[4])
                self._draw_line(framebuffer, x1, y1, x2, y2, color)
            
            elif opcode == 'RECTF' and len(args) >= 5:
                x = self._resolve_value(args[0])
                y = self._resolve_value(args[1])
                w = self._resolve_value(args[2])
                h = self._resolve_value(args[3])
                color = self._parse_color(args[4])
                self._draw_rect(framebuffer, x, y, w, h, color)
            
            elif opcode == 'LDI' and len(args) >= 2:
                reg = args[0].strip()
                val = self._resolve_value(args[1])
                self.registers[reg] = val
        
        return framebuffer
    
    def _parse_color(self, color_str: str) -> np.ndarray:
        """Parse color string to RGB array."""
        color_str = color_str.strip()
        
        # Hex color
        if color_str.startswith('0x') or color_str.startswith('0X'):
            val = int(color_str, 16)
            r = (val >> 16) & 0xFF
            g = (val >> 8) & 0xFF
            b = val & 0xFF
            return np.array([r, g, b], dtype=np.uint8)
        
        # Named colors (common ones)
        named_colors = {
            'RED': [255, 0, 0],
            'GREEN': [0, 255, 0],
            'BLUE': [0, 0, 255],
            'WHITE': [255, 255, 255],
            'BLACK': [0, 0, 0],
            'YELLOW': [255, 255, 0],
            'CYAN': [0, 255, 255],
            'MAGENTA': [255, 0, 255],
        }
        
        return np.array(named_colors.get(color_str.upper(), [128, 128, 128]), dtype=np.uint8)
    
    def _resolve_value(self, arg: str) -> int:
        """Resolve argument to integer value."""
        arg = arg.strip()
        
        # Register
        if arg in self.registers:
            return self.registers[arg]
        
        # Hex
        if arg.startswith('0x') or arg.startswith('0X'):
            return int(arg, 16)
        
        # Binary
        if arg.startswith('0b') or arg.startswith('0B'):
            return int(arg, 2)
        
        # Int
        try:
            return int(arg)
        except:
            return 0
    
    def _draw_line(self, fb: np.ndarray, x1: int, y1: int, x2: int, y2: int, color: np.ndarray):
        """Bresenham's line algorithm."""
        x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
        
        dx = abs(x2 - x1)
        dy = abs(y2 - y1)
        sx = 1 if x1 < x2 else -1
        sy = 1 if y1 < y2 else -1
        err = dx - dy
        
        while True:
            if 0 <= x1 < self.width and 0 <= y1 < self.height:
                fb[y1, x1] = color
            
            if x1 == x2 and y1 == y2:
                break
            
            e2 = 2 * err
            if e2 > -dy:
                err -= dy
                x1 += sx
            if e2 < dx:
                err += dx
                y1 += sy
    
    def _draw_rect(self, fb: np.ndarray, x: int, y: int, w: int, h: int, color: np.ndarray):
        """Draw filled rectangle."""
        x, y, w, h = int(x), int(y), int(w), int(h)
        x2 = min(x + w, self.width)
        y2 = min(y + h, self.height)
        x = max(x, 0)
        y = max(y, 0)
        
        if x < x2 and y < y2:
            fb[y:y2, x:x2] = color


def process_dataset(input_dir: str, output_dir: str, max_samples: int = None):
    """Process entire synthetic dataset into HiDream format."""
    input_path = Path(input_dir)
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)
    
    # Create subdirectories
    images_dir = output_path / "images"
    images_dir.mkdir(exist_ok=True)
    
    asm_files = sorted(input_path.glob("*.asm"))
    if max_samples:
        asm_files = asm_files[:max_samples]
    
    dataset_entries = []
    renderer = PixelRenderer(256, 256)
    
    print(f"Processing {len(asm_files)} ASM files...")
    
    for i, asm_file in enumerate(asm_files):
        if i % 100 == 0:
            print(f"  Progress: {i}/{len(asm_files)}")
        
        # Parse ASM
        asm_content = asm_file.read_text()
        parser = ASMParser(asm_content)
        
        # Build reasoning chain
        reasoning_builder = ReasoningChainBuilder(parser)
        reasoning = reasoning_builder.build_reasoning()
        
        # Render to pixels
        framebuffer = renderer.render(parser)
        
        # Save image
        img_filename = f"{asm_file.stem}.png"
        img_path = images_dir / img_filename
        Image.fromarray(framebuffer).save(img_path)
        
        # Create dataset entry
        entry = {
            "id": asm_file.stem,
            "instruction": parser.description or f"GeOS program {asm_file.stem}",
            "reasoning": reasoning,
            "asm_code": asm_content,
            "image_path": str(img_path.relative_to(output_path)),
            "spatial_bounds": parser.analyze_spatial_layout(),
            "visual_op_count": len(parser.get_visual_ops())
        }
        dataset_entries.append(entry)
    
    # Save dataset metadata
    dataset_file = output_path / "hidream_dataset.json"
    with open(dataset_file, 'w') as f:
        json.dump({
            "format_version": "1.0",
            "source": str(input_path),
            "total_samples": len(dataset_entries),
            "image_size": [256, 256],
            "entries": dataset_entries
        }, f, indent=2)
    
    print(f"\nDataset built:")
    print(f"  Images: {images_dir}")
    print(f"  Metadata: {dataset_file}")
    print(f"  Total samples: {len(dataset_entries)}")
    
    return dataset_entries


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Build HiDream dataset from GeOS ASM")
    parser.add_argument("--input", default="synthetic_dataset_v13", help="Input ASM directory")
    parser.add_argument("--output", default="hidream_dataset_v1", help="Output directory")
    parser.add_argument("--max-samples", type=int, default=None, help="Limit samples for testing")
    
    args = parser.parse_args()
    
    process_dataset(args.input, args.output, args.max_samples)
