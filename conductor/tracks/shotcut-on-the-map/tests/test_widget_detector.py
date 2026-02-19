"""
Tests for WidgetDetector module.

Follows TDD: Tests written BEFORE implementation.
"""
import pytest
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from widget_detector import WidgetDetector, Widget, WidgetType


class TestWidgetDetector:
    """Test suite for WidgetDetector."""

    def test_detect_button_from_keyword(self):
        """Detect button from common button keywords."""
        elements = [
            {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.BUTTON
        assert widgets[0].text == 'OK'

    def test_detect_button_cancel(self):
        """Detect Cancel button."""
        elements = [
            {'text': 'Cancel', 'bbox': [160, 100, 220, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.BUTTON

    def test_detect_menu_from_keyword(self):
        """Detect menu items from keywords."""
        elements = [
            {'text': 'File', 'bbox': [0, 0, 30, 20], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.MENU

    def test_detect_menu_edit(self):
        """Detect Edit menu item."""
        elements = [
            {'text': 'Edit', 'bbox': [35, 0, 65, 20], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.MENU

    def test_detect_label_from_colon(self):
        """Detect labels that end with colon."""
        elements = [
            {'text': 'Filename:', 'bbox': [50, 200, 120, 220], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.LABEL

    def test_detect_label_with_trailing_space(self):
        """Detect labels with colon and trailing space."""
        elements = [
            {'text': 'Path: ', 'bbox': [50, 230, 100, 250], 'conf': 85}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].type == WidgetType.LABEL

    def test_detect_checkbox_from_brackets(self):
        """Detect checkbox from bracket patterns."""
        elements = [
            {'text': '[ ] Enable feature', 'bbox': [50, 300, 180, 320], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 1
        assert widgets[0].type == WidgetType.CHECKBOX

    def test_detect_checkbox_checked(self):
        """Detect checked checkbox."""
        elements = [
            {'text': '[x] Option enabled', 'bbox': [50, 330, 170, 350], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].type == WidgetType.CHECKBOX

    def test_detect_input_from_underscore(self):
        """Detect input fields from underscore patterns."""
        elements = [
            {'text': '_____________', 'bbox': [120, 200, 250, 220], 'conf': 80}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].type == WidgetType.INPUT

    def test_detect_unknown_type(self):
        """Unknown text returns UNKNOWN type."""
        elements = [
            {'text': 'Some random text', 'bbox': [50, 400, 180, 420], 'conf': 90}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].type == WidgetType.UNKNOWN

    def test_widget_has_bbox(self):
        """Widget preserves bounding box."""
        elements = [
            {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].bbox == [100, 100, 150, 130]

    def test_widget_has_confidence(self):
        """Widget preserves confidence."""
        elements = [
            {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].confidence == 95

    def test_widget_has_action(self):
        """Widget has action field."""
        elements = [
            {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        # Action should be None or a string
        assert hasattr(widgets[0], 'action')

    def test_empty_elements_returns_empty_list(self):
        """Empty input returns empty list."""
        detector = WidgetDetector()
        widgets = detector.detect([])

        assert widgets == []

    def test_multiple_elements(self):
        """Handle multiple elements correctly."""
        elements = [
            {'text': 'File', 'bbox': [0, 0, 30, 20], 'conf': 90},
            {'text': 'Edit', 'bbox': [35, 0, 65, 20], 'conf': 90},
            {'text': 'Save', 'bbox': [100, 100, 150, 130], 'conf': 95},
            {'text': 'Name:', 'bbox': [50, 200, 100, 220], 'conf': 85},
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert len(widgets) == 4
        assert widgets[0].type == WidgetType.MENU
        assert widgets[1].type == WidgetType.MENU
        assert widgets[2].type == WidgetType.BUTTON
        assert widgets[3].type == WidgetType.LABEL

    def test_case_insensitive_detection(self):
        """Detection is case insensitive."""
        elements = [
            {'text': 'ok', 'bbox': [100, 100, 150, 130], 'conf': 95},
            {'text': 'CANCEL', 'bbox': [160, 100, 220, 130], 'conf': 95},
            {'text': 'FILE', 'bbox': [0, 0, 30, 20], 'conf': 90},
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        assert widgets[0].type == WidgetType.BUTTON
        assert widgets[1].type == WidgetType.BUTTON
        assert widgets[2].type == WidgetType.MENU

    def test_widget_dataclass_structure(self):
        """Widget has required fields."""
        elements = [
            {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
        ]

        detector = WidgetDetector()
        widgets = detector.detect(elements)

        widget = widgets[0]
        assert hasattr(widget, 'type')
        assert hasattr(widget, 'text')
        assert hasattr(widget, 'bbox')
        assert hasattr(widget, 'confidence')
        assert hasattr(widget, 'action')
