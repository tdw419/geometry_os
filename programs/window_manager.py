"""Window data structure implementation with z-order and visibility management."""

from dataclasses import dataclass, field
from typing import List, Optional
import uuid


@dataclass
class Window:
    """Represents a window in the windowing system."""
    id: str
    x: int
    y: int
    width: int
    height: int
    title: str
    z_order: int
    visible: bool = True
    focused: bool = False


@dataclass
class ScreenBounds:
    """Represents the screen boundaries."""
    width: int = 1920
    height: int = 1080


class WindowManager:
    """Manages a collection of windows with z-order and visibility."""
    
    def __init__(self, screen_bounds: Optional[ScreenBounds] = None):
        """Initialize the window manager.
        
        Args:
            screen_bounds: Optional screen bounds for validation. Defaults to 1920x1080.
        """
        self._windows: dict[str, Window] = {}
        self._z_counter: int = 0
        self._screen_bounds = screen_bounds or ScreenBounds()
    
    def _generate_id(self) -> str:
        """Generate a unique window ID."""
        return str(uuid.uuid4())
    
    def _validate_bounds(self, x: int, y: int, width: int, height: int) -> bool:
        """Validate that window bounds are acceptable.
        
        Args:
            x: X position
            y: Y position
            width: Window width
            height: Window height
            
        Returns:
            True if bounds are valid, False otherwise.
        """
        # Reject negative dimensions
        if width <= 0 or height <= 0:
            return False
        
        # Check if window would be entirely off-screen
        # A window is considered on-screen if at least one pixel is visible
        right_edge = x + width
        bottom_edge = y + height
        
        # Window is entirely off-screen if:
        # - Right edge is at or before left of screen (x + width <= 0)
        # - Bottom edge is at or before top of screen (y + height <= 0)
        # - Left edge is at or after right of screen (x >= screen_width)
        # - Top edge is at or after bottom of screen (y >= screen_height)
        if right_edge <= 0 or bottom_edge <= 0:
            return False
        if x >= self._screen_bounds.width or y >= self._screen_bounds.height:
            return False
        
        return True
    
    def create_window(
        self,
        title: str = "Untitled",
        x: int = 0,
        y: int = 0,
        width: int = 800,
        height: int = 600,
        visible: bool = True
    ) -> Optional[Window]:
        """Create a new window.
        
        Args:
            title: Window title
            x: X position
            y: Y position
            width: Window width
            height: Window height
            visible: Initial visibility state
            
        Returns:
            The created Window object, or None if bounds validation fails.
        """
        if not self._validate_bounds(x, y, width, height):
            return None
        
        window_id = self._generate_id()
        self._z_counter += 1
        
        window = Window(
            id=window_id,
            x=x,
            y=y,
            width=width,
            height=height,
            title=title,
            z_order=self._z_counter,
            visible=visible,
            focused=False
        )
        
        self._windows[window_id] = window
        return window
    
    def destroy_window(self, window_id: str) -> bool:
        """Destroy a window.
        
        Args:
            window_id: The ID of the window to destroy.
            
        Returns:
            True if the window was destroyed, False if not found.
        """
        if window_id in self._windows:
            del self._windows[window_id]
            return True
        return False
    
    def focus_window(self, window_id: str) -> bool:
        """Bring a window to the top of z-order and mark it as focused.
        
        Args:
            window_id: The ID of the window to focus.
            
        Returns:
            True if the window was focused, False if not found.
        """
        if window_id not in self._windows:
            return False
        
        # Unfocus all other windows
        for window in self._windows.values():
            window.focused = False
        
        # Focus this window and bring to top
        window = self._windows[window_id]
        window.focused = True
        self._z_counter += 1
        window.z_order = self._z_counter
        
        return True
    
    def move_window(self, window_id: str, x: int, y: int) -> bool:
        """Move a window to a new position.
        
        Args:
            window_id: The ID of the window to move.
            x: New X position
            y: New Y position
            
        Returns:
            True if the window was moved, False if not found or bounds invalid.
        """
        if window_id not in self._windows:
            return False
        
        window = self._windows[window_id]
        
        if not self._validate_bounds(x, y, window.width, window.height):
            return False
        
        window.x = x
        window.y = y
        return True
    
    def resize_window(self, window_id: str, width: int, height: int) -> bool:
        """Resize a window.
        
        Args:
            window_id: The ID of the window to resize.
            width: New width
            height: New height
            
        Returns:
            True if the window was resized, False if not found or bounds invalid.
        """
        if window_id not in self._windows:
            return False
        
        window = self._windows[window_id]
        
        if not self._validate_bounds(window.x, window.y, width, height):
            return False
        
        window.width = width
        window.height = height
        return True
    
    def show_window(self, window_id: str) -> bool:
        """Show a window.
        
        Args:
            window_id: The ID of the window to show.
            
        Returns:
            True if the window was shown, False if not found.
        """
        if window_id not in self._windows:
            return False
        
        self._windows[window_id].visible = True
        return True
    
    def hide_window(self, window_id: str) -> bool:
        """Hide a window.
        
        Args:
            window_id: The ID of the window to hide.
            
        Returns:
            True if the window was hidden, False if not found.
        """
        if window_id not in self._windows:
            return False
        
        self._windows[window_id].visible = False
        return True
    
    def get_visible_windows(self) -> List[Window]:
        """Get all visible windows sorted by z-order (lowest to highest).
        
        Returns:
            List of visible windows sorted by z_order.
        """
        visible = [w for w in self._windows.values() if w.visible]
        return sorted(visible, key=lambda w: w.z_order)
    
    def get_window(self, window_id: str) -> Optional[Window]:
        """Get a window by ID.
        
        Args:
            window_id: The ID of the window to retrieve.
            
        Returns:
            The Window object, or None if not found.
        """
        return self._windows.get(window_id)
    
    def get_all_windows(self) -> List[Window]:
        """Get all windows sorted by z-order.
        
        Returns:
            List of all windows sorted by z_order.
        """
        return sorted(self._windows.values(), key=lambda w: w.z_order)
    
    def get_focused_window(self) -> Optional[Window]:
        """Get the currently focused window.
        
        Returns:
            The focused Window, or None if no window is focused.
        """
        for window in self._windows.values():
            if window.focused:
                return window
        return None
