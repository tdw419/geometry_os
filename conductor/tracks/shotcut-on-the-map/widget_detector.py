"""
WidgetDetector Module

Detects UI widget types from OCR-extracted elements based on
text patterns and visual characteristics.
"""
from dataclasses import dataclass
from enum import Enum
from typing import List, Optional


class WidgetType(Enum):
    """Enumeration of supported widget types."""
    BUTTON = "button"
    INPUT = "input"
    MENU = "menu"
    LABEL = "label"
    CHECKBOX = "checkbox"
    UNKNOWN = "unknown"


@dataclass
class Widget:
    """Represents a detected UI widget."""
    type: WidgetType
    text: str
    bbox: List[int]  # [x1, y1, x2, y2]
    confidence: float
    action: Optional[str] = None


# Keyword lists for pattern-based detection
BUTTON_KEYWORDS = [
    'ok', 'cancel', 'save', 'open', 'apply', 'yes', 'no',
    'close', 'submit', 'clear', 'reset', 'delete', 'edit',
    'done', 'next', 'back', 'continue', 'confirm', 'accept',
    'reject', 'browse', 'choose', 'select', 'create', 'remove'
]

MENU_KEYWORDS = [
    'file', 'edit', 'view', 'help', 'tools', 'window', 'settings',
    'options', 'format', 'insert', 'image', 'audio', 'video',
    'filter', 'select', 'clip', 'timeline', 'export', 'import'
]


class WidgetDetector:
    """
    Detects UI widgets from OCR elements using pattern matching.

    Detection rules (in priority order):
    1. Checkbox: text starts with [ ] or [x]
    2. Input: text is mostly underscores or empty-looking
    3. Label: text ends with colon
    4. Menu: text matches menu keywords (checked before button)
    5. Button: text matches button keywords
    6. Unknown: no pattern matched
    """

    def __init__(self):
        """Initialize the detector with keyword sets."""
        self.button_keywords = set(kw.lower() for kw in BUTTON_KEYWORDS)
        self.menu_keywords = set(kw.lower() for kw in MENU_KEYWORDS)

    def detect(self, elements: List[dict]) -> List[Widget]:
        """
        Detect widgets from OCR elements.

        Args:
            elements: List of OCR elements with 'text', 'bbox', 'conf' keys

        Returns:
            List of detected Widget objects
        """
        widgets = []

        for element in elements:
            text = element.get('text', '')
            bbox = element.get('bbox', [0, 0, 0, 0])
            conf = element.get('conf', 0)

            widget_type = self._classify(text)
            action = self._infer_action(widget_type, text)

            widget = Widget(
                type=widget_type,
                text=text,
                bbox=bbox,
                confidence=conf,
                action=action
            )
            widgets.append(widget)

        return widgets

    def _classify(self, text: str) -> WidgetType:
        """
        Classify text into a widget type.

        Args:
            text: The text content of the element

        Returns:
            WidgetType enum value
        """
        if not text:
            return WidgetType.UNKNOWN

        text_stripped = text.strip()
        text_lower = text_stripped.lower()

        # Check for checkbox pattern: [ ] or [x] or [X]
        if text_stripped.startswith('[ ]') or text_stripped.startswith('[x]') or \
           text_stripped.startswith('[X]'):
            return WidgetType.CHECKBOX

        # Check for input field pattern: mostly underscores
        if self._is_input_field(text_stripped):
            return WidgetType.INPUT

        # Check for label pattern: ends with colon
        if text_stripped.endswith(':') or text_stripped.rstrip().endswith(':'):
            return WidgetType.LABEL

        # Check for menu keywords BEFORE button (some overlap like 'edit')
        first_word = text_lower.split()[0] if text_lower.split() else text_lower
        if text_lower in self.menu_keywords or first_word in self.menu_keywords:
            return WidgetType.MENU

        # Check for button keywords (exact match or first word)
        if text_lower in self.button_keywords or first_word in self.button_keywords:
            return WidgetType.BUTTON

        return WidgetType.UNKNOWN

    def _is_input_field(self, text: str) -> bool:
        """
        Check if text represents an input field.

        Input fields often appear as underscores or dots in OCR.
        """
        if not text:
            return False

        # Count underscore characters
        underscore_count = text.count('_')
        total_chars = len(text.strip())

        if total_chars == 0:
            return False

        # If mostly underscores (>60%), it's likely an input field
        underscore_ratio = underscore_count / total_chars
        return underscore_ratio > 0.6

    def _infer_action(self, widget_type: WidgetType, text: str) -> Optional[str]:
        """
        Infer the action associated with a widget.

        Args:
            widget_type: The type of widget
            text: The text content

        Returns:
            Action string or None
        """
        if widget_type == WidgetType.BUTTON:
            text_lower = text.strip().lower()
            # Map button text to actions
            action_map = {
                'ok': 'confirm',
                'cancel': 'cancel',
                'save': 'save',
                'open': 'open',
                'apply': 'apply',
                'yes': 'confirm',
                'no': 'reject',
                'close': 'close',
                'submit': 'submit',
                'clear': 'clear',
                'reset': 'reset',
                'delete': 'delete',
                'edit': 'edit',
            }
            return action_map.get(text_lower)

        if widget_type == WidgetType.MENU:
            return f'menu_{text.strip().lower()}'

        if widget_type == WidgetType.CHECKBOX:
            if '[x]' in text.lower():
                return 'uncheck'
            return 'check'

        if widget_type == WidgetType.INPUT:
            return 'type'

        return None
