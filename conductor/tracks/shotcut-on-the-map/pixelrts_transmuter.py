"""
PixelRTS v3 Transmuter - Converts Geometric Instructions to Interactive WGSL

Generates WebGPU shaders that visualize PixelRTS v3 programs with:
- Per-pixel opcode visualization (color-coded by instruction type)
- Hover highlighting for instruction inspection
- PC (program counter) indicator
- Real-time register display via uniforms

Usage:
    from pixelrts_transmuter import PixelRTSTransmuter
    transmuter = PixelRTSTransmuter()
    wgsl = transmuter.transmute(instructions, grid_size=16)
"""

from typing import List, Tuple, Optional
from dataclasses import dataclass

# Opcode definitions
OPCODES = {
    "NOP":  0x00,
    "MOV":  0x01,
    "ADD":  0x33,
    "SUB":  0x34,
    "MUL":  0x35,
    "DIV":  0x36,
    "JMP":  0x06,
    "HALT": 0x07,
    "LDI":  0x08,
}

OPCODE_NAMES = {
    0x00: "NOP", 0x01: "MOV", 0x33: "ADD", 0x34: "SUB",
    0x35: "MUL", 0x36: "DIV", 0x06: "JMP", 0x07: "HALT", 0x08: "LDI"
}

# Opcode colors for visualization
OPCODE_COLORS = {
    0x00: (0.1, 0.1, 0.1),   # NOP - dark gray
    0x01: (0.3, 0.3, 0.8),   # MOV - blue
    0x33: (0.2, 0.8, 0.2),   # ADD - green
    0x34: (0.8, 0.6, 0.2),   # SUB - orange
    0x35: (0.8, 0.2, 0.8),   # MUL - magenta
    0x36: (0.8, 0.4, 0.4),   # DIV - red
    0x06: (0.6, 0.6, 0.2),   # JMP - yellow
    0x07: (0.8, 0.1, 0.1),   # HALT - bright red
    0x08: (0.2, 0.8, 0.8),   # LDI - cyan
}


@dataclass
class Instruction:
    """Represents a single PixelRTS v3 instruction."""
    opcode: int
    rs1: int
    rs2: int
    rd: int

    @property
    def opcode_name(self) -> str:
        return OPCODE_NAMES.get(self.opcode, "???")

    @property
    def color(self) -> Tuple[float, float, float]:
        return OPCODE_COLORS.get(self.opcode, (0.5, 0.5, 0.5))

    def to_wgsl_rgba(self) -> str:
        """Convert to WGSL vec4f."""
        r, g, b = self.color
        return f"vec4f({r:.2f}, {g:.2f}, {b:.2f}, 1.0)"


class HilbertCurve:
    """Hilbert curve utilities for spatial mapping."""

    @staticmethod
    def d2xy(d: int, n: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        x, y = 0, 0
        s = 1
        while s < n:
            rx = 1 & (d >> 1)
            ry = 1 & (d ^ rx)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return x, y

    @staticmethod
    def xy2d(x: int, y: int, n: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) else 0
            ry = 1 if (y & s) else 0
            d += s * s * ((3 * rx) ^ ry)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            s //= 2
        return d


class PixelRTSTransmuter:
    """
    Transmutes PixelRTS v3 instructions into interactive WGSL shaders.

    The generated shader visualizes the program as a grid of colored pixels,
    with hover highlighting and PC indicator support.
    """

    def __init__(self, hover_threshold: float = 0.02):
        self.hover_threshold = hover_threshold

    def transmute(self, instructions: List[List[int]], grid_size: int = 16) -> str:
        """
        Generate WGSL shader from instruction list.

        Args:
            instructions: List of [R, G, B, A] instruction tuples
            grid_size: Size of the program grid (power of 2)

        Returns:
            Complete WGSL shader code
        """
        lines = []

        # Header
        lines.append("// PixelRTS v3 Interactive Shader")
        lines.append(f"// Grid: {grid_size}x{grid_size}, Instructions: {len(instructions)}")
        lines.append("")

        # Uniforms
        lines.extend(self._generate_uniforms())

        # Hilbert helpers
        lines.extend(self._generate_hilbert_helpers(grid_size))

        # Instruction colors array
        lines.extend(self._generate_instruction_colors(instructions, grid_size))

        # SDF helpers
        lines.extend(self._generate_sdf_helpers())

        # Main shader
        lines.extend(self._generate_main_shader(instructions, grid_size))

        return "\n".join(lines)

    def _generate_uniforms(self) -> List[str]:
        """Generate uniform buffer declaration."""
        return [
            "struct Uniforms {",
            "    time: f32,",
            "    mouse_pressed: f32,",
            "    mouse: vec2f,",
            "    resolution: vec2f,",
            "    pc: f32,         // Program counter",
            "    hovered_d: f32,  // Hovered Hilbert index",
            "};",
            "",
            "@group(0) @binding(0) var<uniform> ui: Uniforms;",
            "",
        ]

    def _generate_hilbert_helpers(self, n: int) -> List[str]:
        """Generate Hilbert curve WGSL functions."""
        return [
            f"const GRID_SIZE: u32 = {n}u;",
            "",
            "// Hilbert curve: d -> (x, y)",
            "fn hilbert_d2xy(d: u32) -> vec2u {",
            "    var x: u32 = 0u;",
            "    var y: u32 = 0u;",
            "    var s: u32 = 1u;",
            "    var idx = d;",
            "    while s < GRID_SIZE {",
            "        let rx = 1u & (idx >> 1u);",
            "        let ry = 1u & (idx ^ rx);",
            "        if ry == 0u {",
            "            if rx == 1u {",
            "                x = s - 1u - x;",
            "                y = s - 1u - y;",
            "            }",
            "            let tmp = x;",
            "            x = y;",
            "            y = tmp;",
            "        }",
            "        x += s * rx;",
            "        y += s * ry;",
            "        idx /= 4u;",
            "        s *= 2u;",
            "    }",
            "    return vec2u(x, y);",
            "}",
            "",
            "// Hilbert curve: (x, y) -> d",
            "fn hilbert_xy2d(px: u32, py: u32) -> u32 {",
            "    var d: u32 = 0u;",
            "    var s = GRID_SIZE / 2u;",
            "    var x = px;",
            "    var y = py;",
            "    while s > 0u {",
            "        let rx = select(0u, 1u, (x & s) != 0u);",
            "        let ry = select(0u, 1u, (y & s) != 0u);",
            "        d += s * s * ((3u * rx) ^ ry);",
            "        if ry == 0u {",
            "            if rx == 1u {",
            "                x = s - 1u - x;",
            "                y = s - 1u - y;",
            "            }",
            "            let tmp = x;",
            "            x = y;",
            "            y = tmp;",
            "        }",
            "        s /= 2u;",
            "    }",
            "    return d;",
            "}",
            "",
        ]

    def _generate_instruction_colors(self, instructions: List[List[int]], grid_size: int) -> List[str]:
        """Generate instruction color array."""
        lines = [
            "// Instruction colors (indexed by Hilbert d)",
            f"const NUM_INSTRUCTIONS: u32 = {len(instructions)}u;",
            "var<private> instruction_colors: array<vec4f, NUM_INSTRUCTIONS> = array<vec4f, NUM_INSTRUCTIONS>(",
        ]

        for i, (r, g, b, a) in enumerate(instructions[:len(instructions)]):
            opcode = r
            color = OPCODE_COLORS.get(opcode, (0.5, 0.5, 0.5))
            lines.append(f"    vec4f({color[0]:.2f}, {color[1]:.2f}, {color[2]:.2f}, 1.0),  // d={i}: {OPCODE_NAMES.get(opcode, '???')}")

        if not instructions:
            lines.append("    vec4f(0.1, 0.1, 0.1, 1.0)")

        lines.append(");")
        lines.append("")
        return lines

    def _generate_sdf_helpers(self) -> List[str]:
        """Generate SDF helper functions."""
        return [
            "fn sdBox(p: vec2f, b: vec2f) -> f32 {",
            "    let d = abs(p) - b;",
            "    return length(max(d, vec2f(0.0))) + min(max(d.x, d.y), 0.0);",
            "}",
            "",
        ]

    def _generate_main_shader(self, instructions: List[List[int]], grid_size: int) -> List[str]:
        """Generate main fragment shader."""
        cell_size = 1.0 / grid_size
        half_cell = cell_size / 2.0

        return [
            "@fragment",
            "fn main(@builtin(position) pos: vec4f) -> @location(0) vec4f {",
            "    let uv = pos.xy / ui.resolution;",
            "    var color = vec4f(0.05, 0.05, 0.08, 1.0);  // Background",
            "",
            "    // Calculate grid position",
            "    let grid_pos = vec2u(uv * f32(GRID_SIZE));",
            "    if (grid_pos.x >= GRID_SIZE || grid_pos.y >= GRID_SIZE) {",
            "        return color;",
            "    }",
            "",
            "    // Get Hilbert index for this pixel",
            "    let d = hilbert_xy2d(grid_pos.x, grid_pos.y);",
            "",
            "    // Get instruction color",
            "    var pixel_color = vec4f(0.1, 0.1, 0.1, 1.0);",
            "    if d < NUM_INSTRUCTIONS {",
            "        pixel_color = instruction_colors[d];",
            "    }",
            "",
            "    // Calculate pixel center for SDF",
            "    let cell_size = 1.0 / f32(GRID_SIZE);",
            "    let cell_center = (vec2f(grid_pos) + 0.5) * cell_size;",
            "    let half_cell = cell_size * 0.45;",
            "",
            "    // SDF for pixel cell",
            "    let pixel_uv = uv - cell_center;",
            "    let pixel_d = sdBox(pixel_uv, vec2f(half_cell));",
            "    let pixel_alpha = 1.0 - smoothstep(0.0, 0.002, pixel_d);",
            "",
            "    if (pixel_alpha > 0.0) {",
            "        var final_color = pixel_color;",
            "",
            "        // Hover highlighting",
            "        let mouse_uv = ui.mouse / ui.resolution;",
            "        let dist_to_mouse = distance(uv, mouse_uv);",
            "        let is_hovered = dist_to_mouse < 0.03 && d == u32(ui.hovered_d);",
            "",
            "        if is_hovered {",
            "            final_color += vec4f(0.3, 0.3, 0.3, 0.0);  // Brighten",
            "        }",
            "",
            "        // PC indicator (green border)",
            "        let is_pc = d == u32(ui.pc);",
            "        if is_pc && pixel_d > half_cell * 0.7 {",
            "            final_color = vec4f(0.2, 1.0, 0.2, 1.0);  // Green border",
            "        }",
            "",
            "        color = mix(color, final_color, pixel_alpha);",
            "    }",
            "",
            "    // Grid lines",
            "    let grid_line = fract(uv * f32(GRID_SIZE));",
            "    let line_width = 0.02;",
            "    if grid_line.x < line_width || grid_line.y < line_width {",
            "        color = mix(color, vec4f(0.15, 0.15, 0.2, 1.0), 0.5);",
            "    }",
            "",
            "    return color;",
            "}",
        ]


def demo():
    """Demo: Generate shader for a simple program."""
    instructions = [
        [0x08, 10, 0, 1],   # LDI r1, 10
        [0x08, 20, 0, 2],   # LDI r2, 20
        [0x33, 1, 2, 3],    # ADD r3, r1, r2
        [0x07, 0, 0, 0],    # HALT
    ]

    transmuter = PixelRTSTransmuter()
    wgsl = transmuter.transmute(instructions, grid_size=4)

    print(wgsl)


if __name__ == "__main__":
    demo()
