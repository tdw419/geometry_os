"""
Palette Forge State Serialization Module

Provides save/load functionality for Palette Forge state with round-trip integrity.
"""

import json
import struct
from dataclasses import dataclass, field, asdict
from typing import List, Tuple, Optional
from enum import IntEnum


# Version for forward compatibility
FORMAT_VERSION = 1


class ToolType(IntEnum):
    """Available tools in Palette Forge"""
    BRUSH = 0
    ERASER = 1
    FILL = 2
    PICKER = 3


@dataclass
class ToolSettings:
    """Settings for the active tool"""
    tool_type: ToolType
    brush_size: int = 1
    color_index: int = 0
    opacity: int = 255  # 0-255

    def to_dict(self) -> dict:
        return {
            "tool_type": int(self.tool_type),
            "brush_size": self.brush_size,
            "color_index": self.color_index,
            "opacity": self.opacity
        }

    @classmethod
    def from_dict(cls, data: dict) -> "ToolSettings":
        return cls(
            tool_type=ToolType(data["tool_type"]),
            brush_size=data["brush_size"],
            color_index=data["color_index"],
            opacity=data["opacity"]
        )


@dataclass
class PaletteState:
    """
    Complete state of Palette Forge application.
    
    Attributes:
        palette: List of RGB tuples representing available colors
        canvas: 2D grid of color indices (row-major order)
        tool_settings: Current tool configuration
        undo_history: Stack of previous canvas states for undo functionality
    """
    palette: List[Tuple[int, int, int]] = field(default_factory=list)
    canvas: List[List[int]] = field(default_factory=list)
    tool_settings: ToolSettings = field(default_factory=ToolSettings)
    undo_history: List[List[List[int]]] = field(default_factory=list)
    
    def __post_init__(self):
        """Validate and normalize state"""
        # Ensure palette colors are valid RGB (0-255)
        self.palette = [
            (max(0, min(255, r)), max(0, min(255, g)), max(0, min(255, b)))
            for r, g, b in self.palette
        ]
        
        # Ensure canvas indices are valid
        if self.palette:
            max_index = len(self.palette) - 1
            self.canvas = [
                [max(0, min(max_index, idx)) for idx in row]
                for row in self.canvas
            ]
    
    def copy(self) -> "PaletteState":
        """Create a deep copy of this state"""
        return PaletteState(
            palette=[tuple(c) for c in self.palette],
            canvas=[row[:] for row in self.canvas],
            tool_settings=ToolSettings(
                tool_type=self.tool_settings.tool_type,
                brush_size=self.tool_settings.brush_size,
                color_index=self.tool_settings.color_index,
                opacity=self.tool_settings.opacity
            ),
            undo_history=[row[:] for row in self.undo_history]
        )
    
    def to_dict(self) -> dict:
        """Convert state to dictionary for serialization"""
        return {
            "version": FORMAT_VERSION,
            "palette": self.palette,
            "canvas": self.canvas,
            "tool_settings": self.tool_settings.to_dict(),
            "undo_history": self.undo_history
        }
    
    @classmethod
    def from_dict(cls, data: dict) -> "PaletteState":
        """Create state from dictionary"""
        version = data.get("version", 1)
        if version > FORMAT_VERSION:
            raise ValueError(f"Unsupported format version: {version}")
        
        return cls(
            palette=data.get("palette", []),
            canvas=data.get("canvas", []),
            tool_settings=ToolSettings.from_dict(data.get("tool_settings", {})),
            undo_history=data.get("undo_history", [])
        )


def save_state(state: PaletteState) -> bytes:
    """
    Serialize PaletteState to bytes.
    
    Args:
        state: The PaletteState object to serialize
        
    Returns:
        Bytes representation of the state in JSON format
        
    Raises:
        TypeError: If state is not a PaletteState instance
    """
    if not isinstance(state, PaletteState):
        raise TypeError(f"Expected PaletteState, got {type(state).__name__}")
    
    state_dict = state.to_dict()
    return json.dumps(state_dict).encode("utf-8")


def load_state(data: bytes) -> PaletteState:
    """
    Deserialize bytes to PaletteState.
    
    Args:
        data: Bytes containing serialized state
        
    Returns:
        Deserialized PaletteState object
        
    Raises:
        ValueError: If data is corrupted or invalid
        TypeError: If data is not bytes
    """
    if not isinstance(data, bytes):
        raise TypeError(f"Expected bytes, got {type(data).__name__}")
    
    try:
        # Decode bytes to string
        json_str = data.decode("utf-8")
        
        # Parse JSON
        state_dict = json.loads(json_str)
        
        # Validate required fields
        required_fields = ["version", "palette", "canvas", "tool_settings", "undo_history"]
        for field_name in required_fields:
            if field_name not in state_dict:
                raise ValueError(f"Missing required field: {field_name}")
        
        # Validate version
        version = state_dict["version"]
        if not isinstance(version, int) or version < 1:
            raise ValueError(f"Invalid version: {version}")
        
        if version > FORMAT_VERSION:
            raise ValueError(f"Unsupported format version: {version}")
        
        # Validate palette format
        if not isinstance(state_dict["palette"], list):
            raise ValueError("Palette must be a list")
        
        for i, color in enumerate(state_dict["palette"]):
            if not isinstance(color, list) or len(color) != 3:
                raise ValueError(f"Invalid color format at index {i}")
            for j, val in enumerate(color):
                if not isinstance(val, int) or not (0 <= val <= 255):
                    raise ValueError(f"Invalid color value at palette[{i}][{j}]: {val}")
        
        # Validate canvas format
        if not isinstance(state_dict["canvas"], list):
            raise ValueError("Canvas must be a list")
        
        for i, row in enumerate(state_dict["canvas"]):
            if not isinstance(row, list):
                raise ValueError(f"Invalid canvas row at index {i}")
            for j, idx in enumerate(row):
                if not isinstance(idx, int) or idx < 0:
                    raise ValueError(f"Invalid canvas index at [{i}][{j}]: {idx}")
        
        # Validate tool_settings
        if not isinstance(state_dict["tool_settings"], dict):
            raise ValueError("Tool settings must be a dictionary")
        
        # Validate undo_history
        if not isinstance(state_dict["undo_history"], list):
            raise ValueError("Undo history must be a list")
        
        return PaletteState.from_dict(state_dict)
        
    except json.JSONDecodeError as e:
        raise ValueError(f"Invalid JSON format: {e}")
    except UnicodeDecodeError as e:
        raise ValueError(f"Invalid UTF-8 encoding: {e}")


def create_empty_state(width: int = 0, height: int = 0) -> PaletteState:
    """
    Create an empty PaletteState with optional canvas dimensions.
    
    Args:
        width: Canvas width in pixels
        height: Canvas height in pixels
        
    Returns:
        New PaletteState with empty/default values
    """
    canvas = [[0 for _ in range(width)] for _ in range(height)]
    
    return PaletteState(
        palette=[(255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 255), (0, 0, 0)],
        canvas=canvas,
        tool_settings=ToolSettings(tool_type=ToolType.BRUSH, brush_size=1),
        undo_history=[]
    )


def create_full_state(width: int = 10, height: int = 10) -> PaletteState:
    """
    Create a PaletteState with a full canvas (all colors used).
    
    Args:
        width: Canvas width in pixels
        height: Canvas height in pixels
        
    Returns:
        PaletteState with filled canvas
    """
    palette = [(i * 50 % 256, i * 100 % 256, i * 150 % 256) for i in range(16)]
    canvas = [[(i + j) % len(palette) for j in range(width)] for i in range(height)]
    
    return PaletteState(
        palette=palette,
        canvas=canvas,
        tool_settings=ToolSettings(tool_type=ToolType.FILL, brush_size=5, color_index=7),
        undo_history=[[[0] * width for _ in range(height)]]
    )
