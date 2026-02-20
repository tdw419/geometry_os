#!/usr/bin/env python3
"""
UI Transmuter - Converts extraction JSON to WGSL shaders.

Maps UI primitives to Signed Distance Functions (SDFs):
    panel → sdRoundedBox
    clip → sdBox + texture
    playhead → sdLine

Usage:
    from ui_transmuter import UITransmuter, transmute_extraction

    # Direct usage
    transmuter = UITransmuter(width=1920, height=1080)
    wgsl = transmuter.transmute(extraction_data)

    # Convenience function
    wgsl = transmute_extraction(extraction_data, output_path="output.wgsl")
"""

import json
from pathlib import Path
from typing import Dict, Any, List, Optional, Union


class UITransmuter:
    """
    Converts extraction pipeline JSON to WGSL shader code.

    The transmuter maps UI primitives to SDF functions:
        - panel → sdRoundedBox (container widgets)
        - clip → sdBox + texture (media clips)
        - playhead → sdLine (timeline indicators)
    """

    def __init__(self, width: int = 1920, height: int = 1080, hover_threshold: float = 0.05):
        """
        Initialize the transmuter.

        Args:
            width: Screen width in pixels (default: 1920)
            height: Screen height in pixels (default: 1080)
            hover_threshold: UV distance for mouse hover detection (default: 0.05)
        """
        self.width = float(width)
        self.height = float(height)
        self.hover_threshold = hover_threshold

    def _normalize_bbox(self, bbox: List[float]) -> Dict[str, float]:
        """
        Convert pixel bbox to normalized UV coordinates.

        Args:
            bbox: [x, y, width, height] in pixels

        Returns:
            Dict with cx, cy (center), hw, hh (half dimensions) in UV space
        """
        x, y, w, h = bbox
        return {
            "cx": (x + w / 2) / self.width,
            "cy": (y + h / 2) / self.height,
            "hw": (w / 2) / self.width,
            "hh": (h / 2) / self.height,
        }

    def _generate_sdf_functions(self) -> str:
        """Generate WGSL SDF helper functions."""
        return """
fn sdBox(p: vec2f, b: vec2f) -> f32 {
    let d = abs(p) - b;
    return length(max(d, vec2f(0.0))) + min(max(d.x, d.y), 0.0);
}

fn sdRoundedBox(p: vec2f, b: vec2f, r: vec4f) -> f32 {
    let q = abs(p) - b + r.x;
    return min(max(q.x, q.y), 0.0) + length(max(q, vec2f(0.0))) - r.x;
}

fn sdLine(p: vec2f, a: vec2f, b: vec2f) -> f32 {
    let pa = p - a;
    let ba = b - a;
    let h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    return length(pa - ba * h);
}
"""

    def _generate_interaction_helpers(self) -> str:
        """
        Generate WGSL interaction helper functions.

        These functions check hover, focus, and pressed states for widgets.
        """
        return f"""
fn is_hovered(widget_center: vec2f, threshold: f32) -> bool {{
    return distance(widget_center, ui.mouse / ui.resolution) < threshold;
}}

fn is_focused(widget_index: i32) -> bool {{
    return i32(ui.focused_widget) == widget_index;
}}

fn is_pressed(hover: bool) -> bool {{
    return hover && ui.mouse_pressed > 0.5;
}}
"""

    def _generate_uniforms(self) -> str:
        """
        Generate WGSL uniform struct.

        Layout: 32 bytes total, 16-byte aligned:
            time: f32           (4 bytes, offset 0)
            mouse_pressed: f32  (4 bytes, offset 4)
            mouse: vec2f        (8 bytes, offset 8)
            resolution: vec2f   (8 bytes, offset 16)
            focused_widget: f32 (4 bytes, offset 24)
            pad: f32            (4 bytes, offset 28)
        """
        return """
struct Uniforms {
    time: f32,
    mouse_pressed: f32,
    mouse: vec2f,
    resolution: vec2f,
    focused_widget: f32,
    pad: f32,
};

@group(0) @binding(0) var<uniform> ui: Uniforms;
"""

    def _generate_widget_sdf(self, widget: Dict[str, Any], index: int) -> str:
        """
        Generate SDF code for a single widget.

        Args:
            widget: Widget dict with type, text, bbox
            index: Widget index for naming

        Returns:
            WGSL code string for this widget
        """
        widget_type = widget.get("type", "unknown")
        text = widget.get("text", "")
        bbox = widget.get("bbox", [0, 0, 100, 100])

        norm = self._normalize_bbox(bbox)
        name = f"{widget_type}_{index}"

        lines = [f"    // {widget_type} widget at index {index}"]

        if widget_type == "panel":
            # Panel → sdRoundedBox with hover highlighting
            lines.append(f"    let {name}_center = vec2f({norm['cx']:.6f}, {norm['cy']:.6f});")
            lines.append(f"    let {name}_half = vec2f({norm['hw']:.6f}, {norm['hh']:.6f});")
            lines.append(f"    let {name}_uv = uv - {name}_center;")
            lines.append(f"    let {name}_d = sdRoundedBox({name}_uv, {name}_half, vec4f(0.01));")
            lines.append(f"    let {name}_alpha = 1.0 - smoothstep(0.0, 0.003, {name}_d);")
            lines.append(f"    if ({name}_alpha > 0.0) {{")
            lines.append(f"        let {name}_base = vec4f(0.15, 0.15, 0.18, 1.0);")
            lines.append(f"        let {name}_hover = distance(uv, ui.mouse / ui.resolution) < {self.hover_threshold:.4f};")
            lines.append(f"        let {name}_color = select({name}_base, {name}_base + vec4f(0.08), {name}_hover);")
            lines.append(f"        color = mix(color, {name}_color, {name}_alpha);")
            lines.append(f"    }}")

        elif widget_type == "clip":
            # Clip → sdBox + texture placeholder with smooth edges + hover
            lines.append(f"    let {name}_center = vec2f({norm['cx']:.6f}, {norm['cy']:.6f});")
            lines.append(f"    let {name}_half = vec2f({norm['hw']:.6f}, {norm['hh']:.6f});")
            lines.append(f"    let {name}_uv = uv - {name}_center;")
            lines.append(f"    let {name}_d = sdBox({name}_uv, {name}_half);")
            lines.append(f"    let {name}_alpha = 1.0 - smoothstep(0.0, 0.003, {name}_d);")
            lines.append(f"    if ({name}_alpha > 0.0) {{")
            lines.append(f"        // TODO: Sample texture for clip")
            lines.append(f"        let {name}_base = vec4f(0.3, 0.5, 0.7, 1.0);")
            lines.append(f"        let {name}_hover = distance(uv, ui.mouse / ui.resolution) < {self.hover_threshold:.4f};")
            lines.append(f"        let {name}_color = select({name}_base, {name}_base + vec4f(0.08), {name}_hover);")
            lines.append(f"        color = mix(color, {name}_color, {name}_alpha);")
            lines.append(f"    }}")

        elif widget_type == "playhead":
            # Playhead → sdLine (vertical) with pulse animation + hover
            x_norm = bbox[0] / self.width
            y1_norm = bbox[1] / self.height
            y2_norm = (bbox[1] + bbox[3]) / self.height
            lines.append(f"    let {name}_center = vec2f({x_norm:.6f}, {(y1_norm + y2_norm) / 2:.6f});")
            lines.append(f"    let {name}_a = vec2f({x_norm:.6f}, {y1_norm:.6f});")
            lines.append(f"    let {name}_b = vec2f({x_norm:.6f}, {y2_norm:.6f});")
            lines.append(f"    let {name}_d = sdLine(uv, {name}_a, {name}_b);")
            lines.append(f"    let {name}_pulse = 0.8 + 0.2 * sin(ui.time * 3.0);")
            lines.append(f"    let {name}_alpha = 1.0 - smoothstep(0.0, 0.004, {name}_d);")
            lines.append(f"    if ({name}_alpha > 0.0) {{")
            lines.append(f"        let {name}_base = vec4f(1.0 * {name}_pulse, 0.3, 0.3, 1.0);")
            lines.append(f"        let {name}_hover = distance(uv, ui.mouse / ui.resolution) < {self.hover_threshold:.4f};")
            lines.append(f"        let {name}_color = select({name}_base, {name}_base + vec4f(0.08), {name}_hover);")
            lines.append(f"        color = mix(color, {name}_color, {name}_alpha);")
            lines.append(f"    }}")

        else:
            # Unknown type → sdBox with smooth edges + hover
            lines.append(f"    let {name}_center = vec2f({norm['cx']:.6f}, {norm['cy']:.6f});")
            lines.append(f"    let {name}_half = vec2f({norm['hw']:.6f}, {norm['hh']:.6f});")
            lines.append(f"    let {name}_uv = uv - {name}_center;")
            lines.append(f"    let {name}_d = sdBox({name}_uv, {name}_half);")
            lines.append(f"    let {name}_alpha = 1.0 - smoothstep(0.0, 0.003, {name}_d);")
            lines.append(f"    if ({name}_alpha > 0.0) {{")
            lines.append(f"        let {name}_base = vec4f(0.4, 0.4, 0.4, 1.0);")
            lines.append(f"        let {name}_hover = distance(uv, ui.mouse / ui.resolution) < {self.hover_threshold:.4f};")
            lines.append(f"        let {name}_color = select({name}_base, {name}_base + vec4f(0.08), {name}_hover);")
            lines.append(f"        color = mix(color, {name}_color, {name}_alpha);")
            lines.append(f"    }}")

        return "\n".join(lines)

    def transmute(self, extraction_data: Union[Dict[str, Any], str]) -> str:
        """
        Convert extraction data to WGSL shader.

        Args:
            extraction_data: Dict with 'widgets' and 'metadata',
                           or JSON string of same.

        Returns:
            Complete WGSL shader code as string
        """
        # Handle JSON string input
        if isinstance(extraction_data, str):
            extraction_data = json.loads(extraction_data)

        widgets = extraction_data.get("widgets", [])
        metadata = extraction_data.get("metadata", {})

        # Build WGSL shader
        parts = [
            "// Auto-generated WGSL Shader from UI Transmuter",
            f"// Source: {metadata.get('source_image', 'unknown')}",
            f"// Widgets: {len(widgets)}",
            "",
            self._generate_sdf_functions(),
            self._generate_interaction_helpers(),
            self._generate_uniforms(),
            "",
            "@fragment",
            "fn fragment_main(@builtin(position) frag_coord: vec4f) -> @location(0) vec4f {",
            "    let uv = frag_coord.xy / ui.resolution;",
            "",
            "    var color = vec4f(0.05, 0.05, 0.08, 1.0); // Deep background",
            "",
        ]

        # Generate SDF calls for each widget
        for i, widget in enumerate(widgets):
            parts.append(self._generate_widget_sdf(widget, i))
            parts.append("")

        parts.extend([
            "    return color;",
            "}",
        ])

        return "\n".join(parts)

    def transmute_to_file(
        self,
        extraction_data: Union[Dict[str, Any], str],
        output_path: str
    ) -> str:
        """
        Convert extraction data and write to file.

        Args:
            extraction_data: Dict or JSON string
            output_path: Path to write WGSL file

        Returns:
            The generated WGSL content
        """
        wgsl = self.transmute(extraction_data)

        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        output_file.write_text(wgsl)

        return wgsl


def transmute_extraction(
    extraction_data: Union[Dict[str, Any], str],
    output_path: Optional[str] = None,
    width: int = 1920,
    height: int = 1080
) -> str:
    """
    Convenience function for transmuting extraction data.

    Args:
        extraction_data: Dict or JSON string from extraction_pipeline
        output_path: Optional path to write WGSL file
        width: Screen width (default: 1920)
        height: Screen height (default: 1080)

    Returns:
        Generated WGSL shader code

    Examples:
        wgsl = transmute_extraction(extraction_dict)
        wgsl = transmute_extraction(json_string, output_path="output.wgsl")
    """
    transmuter = UITransmuter(width=width, height=height)

    if output_path:
        return transmuter.transmute_to_file(extraction_data, output_path)

    return transmuter.transmute(extraction_data)


# CLI interface
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="UI Transmuter: JSON → WGSL")
    parser.add_argument("input", help="Input JSON file (from extraction_pipeline)")
    parser.add_argument("--output", "-o", help="Output WGSL file path")
    parser.add_argument("--width", type=int, default=1920, help="Screen width")
    parser.add_argument("--height", type=int, default=1080, help="Screen height")

    args = parser.parse_args()

    input_path = Path(args.input)
    if not input_path.exists():
        print(f"Error: Input file {args.input} not found.")
        import sys
        sys.exit(1)

    extraction_data = json.loads(input_path.read_text())

    if args.output:
        wgsl = transmute_extraction(
            extraction_data,
            output_path=args.output,
            width=args.width,
            height=args.height
        )
        print(f"✅ Generated {args.output} ({len(wgsl)} bytes)")
    else:
        wgsl = transmute_extraction(extraction_data, width=args.width, height=args.height)
        print(wgsl)
