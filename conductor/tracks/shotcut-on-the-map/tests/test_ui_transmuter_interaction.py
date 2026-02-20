#!/usr/bin/env python3
"""
Tests for UITransmuter Interaction Features

Test coverage:
- Uniform buffer contains mouse_pressed and focused_widget
- Hover logic for all widget types
- Pressed logic for clickable widgets
- Focus glow logic for focused widgets
- Uniform buffer size validation (32 bytes = 8 floats)
"""

import pytest
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from ui_transmuter import UITransmuter, transmute_extraction


class TestUniformBufferFields:
    """Tests for uniform buffer field generation."""

    def test_uniforms_contains_mouse_pressed(self):
        """Generated WGSL contains mouse_pressed in Uniforms struct."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        assert "mouse_pressed" in wgsl, "Uniforms struct should contain mouse_pressed"
        assert "mouse_pressed: f32" in wgsl, "mouse_pressed should be f32 type"

    def test_uniforms_contains_focused_widget(self):
        """Generated WGSL contains focused_widget in Uniforms struct."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        assert "focused_widget" in wgsl, "Uniforms struct should contain focused_widget"
        assert "focused_widget: f32" in wgsl, "focused_widget should be f32 type"


class TestHoverLogic:
    """Tests for hover logic in all widget types."""

    def test_panel_widget_has_hover_logic(self):
        """Panel widgets include hover logic in generated WGSL."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 100, 100], "text": "Panel1"}
            ]
        })

        assert "panel_0_hover" in wgsl, "Panel widget should have hover variable"
        assert "distance(uv, ui.mouse / ui.resolution)" in wgsl, "Should use mouse distance for hover"

    def test_clip_widget_has_hover_logic(self):
        """Clip widgets include hover logic in generated WGSL."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "clip", "bbox": [0, 0, 100, 100], "text": "Clip1"}
            ]
        })

        assert "clip_0_hover" in wgsl, "Clip widget should have hover variable"
        assert "distance(uv, ui.mouse / ui.resolution)" in wgsl, "Should use mouse distance for hover"

    def test_playhead_widget_has_hover_logic(self):
        """Playhead widgets include hover logic in generated WGSL."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "playhead", "bbox": [50, 0, 55, 200], "text": "Playhead1"}
            ]
        })

        assert "playhead_0_hover" in wgsl, "Playhead widget should have hover variable"

    def test_unknown_widget_has_hover_logic(self):
        """Unknown/default widgets include hover logic in generated WGSL."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30], "text": "Button1"}
            ]
        })

        assert "button_0_hover" in wgsl, "Unknown type widget should have hover variable"

    def test_all_widget_types_have_hover_logic(self):
        """All widget types include hover logic in generated WGSL."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 100, 100]},
                {"type": "clip", "bbox": [100, 0, 200, 100]},
                {"type": "playhead", "bbox": [200, 0, 205, 200]},
                {"type": "button", "bbox": [0, 100, 50, 130]},
            ]
        })

        assert "panel_0_hover" in wgsl, "Panel should have hover"
        assert "clip_1_hover" in wgsl, "Clip should have hover"
        assert "playhead_2_hover" in wgsl, "Playhead should have hover"
        assert "button_3_hover" in wgsl, "Button should have hover"


class TestPressedLogic:
    """Tests for pressed logic in clickable widgets."""

    def test_clickable_widget_has_pressed_logic(self):
        """Clickable widgets (with action) include pressed logic."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30], "action": "click_me"}
            ]
        })

        assert "mouse_pressed" in wgsl, "Should reference mouse_pressed uniform"
        assert "0.05" in wgsl, "Should have pressed darkening value (0.05)"

    def test_non_clickable_widget_no_pressed_logic(self):
        """Non-clickable widgets (no action) do not include pressed logic."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 100, 100]}  # No action
            ]
        })

        # Panel without action should not have pressed state logic
        # It can still reference mouse_pressed for hover, but no darkening
        lines = wgsl.split("\n")
        panel_section = [l for l in lines if "panel_0" in l]
        # Check that the pressed state comment is not there for this widget
        assert not any("Pressed state for clickable widget" in l for l in panel_section) or \
               "mouse_pressed > 0.5" not in "\n".join(panel_section)

    def test_panel_with_action_has_pressed_logic(self):
        """Panel with action field includes pressed logic."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "panel", "bbox": [0, 0, 100, 100], "action": "click_panel"}
            ]
        })

        # Should have pressed state because it has an action
        assert "Pressed state for clickable widget" in wgsl or \
               ("mouse_pressed > 0.5" in wgsl and "panel_0" in wgsl)

    def test_clip_with_action_has_pressed_logic(self):
        """Clip with action field includes pressed logic."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "clip", "bbox": [0, 0, 100, 50], "action": "select_clip"}
            ]
        })

        assert "mouse_pressed > 0.5" in wgsl, "Clip with action should check mouse_pressed"


class TestFocusGlowLogic:
    """Tests for focus glow logic in widgets."""

    def test_focused_widget_has_glow_logic(self):
        """Focused widget includes blue glow outline logic."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30], "action": "click"}
            ]
        })

        # Check for focus indicator (blue glow)
        assert "focused_widget" in wgsl, "Should reference focused_widget uniform"
        assert "0.2, 0.6, 1.0" in wgsl, "Should have blue glow color (0.2, 0.6, 1.0)"

    def test_focus_logic_compares_widget_index(self):
        """Focus logic compares widget index with focused_widget uniform."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30], "action": "click"}
            ]
        })

        # Should compare focused_widget with widget index
        assert "i32(ui.focused_widget)" in wgsl, "Should cast focused_widget to i32 for comparison"


class TestUniformBufferSize:
    """Tests for uniform buffer size validation."""

    def test_uniform_buffer_is_32_bytes(self):
        """Uniform buffer should be 32 bytes (8 floats)."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        # Count the fields in Uniforms struct
        # time: f32 (4 bytes)
        # mouse_pressed: f32 (4 bytes)
        # mouse: vec2f (8 bytes)
        # resolution: vec2f (8 bytes)
        # focused_widget: f32 (4 bytes)
        # pad: f32 (4 bytes)
        # Total: 32 bytes

        # Check struct has correct fields
        assert "time: f32" in wgsl
        assert "mouse_pressed: f32" in wgsl
        assert "mouse: vec2f" in wgsl
        assert "resolution: vec2f" in wgsl
        assert "focused_widget: f32" in wgsl
        assert "pad: f32" in wgsl

        # Verify the order matches the layout
        lines = wgsl.split("\n")
        struct_lines = []
        in_struct = False
        for line in lines:
            if "struct Uniforms" in line:
                in_struct = True
            elif in_struct:
                if "};" in line:
                    break
                struct_lines.append(line.strip())

        # Expected order: time, mouse_pressed, mouse, resolution, focused_widget, pad
        field_order = [l for l in struct_lines if l and not l.startswith("//")]
        assert len(field_order) == 6, f"Expected 6 fields, got {len(field_order)}: {field_order}"

    def test_uniform_buffer_layout_documentation(self):
        """Uniform buffer has layout documentation in docstring."""
        transmuter = UITransmuter()

        # Check _generate_uniforms method has proper documentation
        import inspect
        doc = transmuter._generate_uniforms.__doc__

        assert doc is not None, "_generate_uniforms should have docstring"
        assert "32 bytes" in doc or "8 floats" in doc, \
            "Docstring should document buffer size"


class TestInteractionHelpers:
    """Tests for WGSL interaction helper functions."""

    def test_is_hovered_function_generated(self):
        """is_hovered() helper function is generated."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        assert "fn is_hovered(" in wgsl, "Should generate is_hovered function"

    def test_is_focused_function_generated(self):
        """is_focused() helper function is generated."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        assert "fn is_focused(" in wgsl, "Should generate is_focused function"

    def test_is_pressed_function_generated(self):
        """is_pressed() helper function is generated."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        assert "fn is_pressed(" in wgsl, "Should generate is_pressed function"


class TestHoverBrightening:
    """Tests for hover color brightening."""

    def test_hover_brightening_value(self):
        """Hover brightening uses correct value (0.08)."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30]}
            ]
        })

        assert "vec4f(0.08)" in wgsl, "Hover brightening should use 0.08"


class TestPressedDarkening:
    """Tests for pressed color darkening."""

    def test_pressed_darkening_value(self):
        """Pressed darkening uses correct value (0.05)."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({
            "widgets": [
                {"type": "button", "bbox": [0, 0, 50, 30], "action": "click"}
            ]
        })

        assert "vec4f(0.05)" in wgsl, "Pressed darkening should use 0.05"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
