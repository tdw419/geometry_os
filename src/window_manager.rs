/// Window Manager for Geometry OS
///
/// Implements click-to-focus window management with:
/// - Z-order hit testing (front-to-back)
/// - Click on title bar: initiate drag to move
/// - Click on content: bring to front, focus for keyboard
/// - Keyboard input routed to focused window
/// - No phantom clicks or focus glitches

/// Height of the title bar in pixels
pub const TITLE_BAR_HEIGHT: usize = 20;

/// Border thickness around windows
pub const BORDER_THICKNESS: usize = 1;

/// Default title bar color (light blue)
pub const TITLE_BAR_COLOR: u32 = 0x3B5998;

/// Title bar color when window is focused/active
pub const TITLE_BAR_ACTIVE_COLOR: u32 = 0x4A90D9;

/// Window border color
pub const BORDER_COLOR: u32 = 0x888899;

/// Window border color when focused
pub const BORDER_ACTIVE_COLOR: u32 = 0x00FFFF;

/// Content area default background
pub const CONTENT_BG: u32 = 0x0A0A1E;

/// A single managed window
#[derive(Debug, Clone)]
pub struct WmWindow {
    /// Unique window identifier
    pub id: usize,
    /// Window title
    pub title: String,
    /// Top-left X position (including border)
    pub x: usize,
    /// Top-left Y position (including border)
    pub y: usize,
    /// Total width including border and title bar
    pub width: usize,
    /// Total height including border, title bar, and content
    pub height: usize,
    /// Whether this window currently has keyboard focus
    pub focused: bool,
    /// Whether this window is visible
    pub visible: bool,
}

impl WmWindow {
    /// Create a new window with the given id, title, position and size.
    pub fn new(id: usize, title: &str, x: usize, y: usize, width: usize, height: usize) -> Self {
        WmWindow {
            id,
            title: title.to_string(),
            x,
            y,
            width,
            height,
            focused: false,
            visible: true,
        }
    }

    /// Returns the Y coordinate where the title bar starts (top of window).
    pub fn title_bar_top(&self) -> usize {
        self.y
    }

    /// Returns the Y coordinate just past the title bar bottom.
    pub fn title_bar_bottom(&self) -> usize {
        self.y + TITLE_BAR_HEIGHT
    }

    /// Returns the Y coordinate where content starts (below title bar).
    pub fn content_top(&self) -> usize {
        self.y + TITLE_BAR_HEIGHT
    }

    /// Returns the bounding box as (left, top, right, bottom).
    pub fn bounds(&self) -> (usize, usize, usize, usize) {
        (self.x, self.y, self.x + self.width, self.y + self.height)
    }

    /// Check if a point (px, py) is within this window's bounding box.
    pub fn contains_point(&self, px: usize, py: usize) -> bool {
        px >= self.x && px < self.x + self.width && py >= self.y && py < self.y + self.height
    }

    /// Check if a point is on the title bar.
    pub fn is_on_title_bar(&self, px: usize, py: usize) -> bool {
        px >= self.x && px < self.x + self.width && py >= self.y && py < self.y + TITLE_BAR_HEIGHT
    }

    /// Check if a point is on the content area (below title bar).
    pub fn is_on_content(&self, px: usize, py: usize) -> bool {
        px >= self.x
            && px < self.x + self.width
            && py >= self.y + TITLE_BAR_HEIGHT
            && py < self.y + self.height
    }

    /// Convert screen coordinates to window-local content coordinates.
    /// Returns None if the point is outside the content area.
    pub fn screen_to_content(&self, px: usize, py: usize) -> Option<(usize, usize)> {
        if self.is_on_content(px, py) {
            Some((px - self.x, py - self.y - TITLE_BAR_HEIGHT))
        } else {
            None
        }
    }

    /// Move the window to a new position.
    pub fn move_to(&mut self, new_x: usize, new_y: usize) {
        self.x = new_x;
        self.y = new_y;
    }
}

/// State for an active window drag operation.
#[derive(Debug, Clone, Copy)]
pub struct DragState {
    /// The window being dragged
    pub window_id: usize,
    /// Offset from window top-left to mouse at drag start
    pub offset_x: isize,
    pub offset_y: isize,
}

/// Result of a mouse click hit test.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ClickTarget {
    /// Clicked on the title bar of window with given id
    TitleBar(usize),
    /// Clicked on the content area of window with given id
    Content(usize),
    /// Clicked on empty desktop (no window hit)
    Desktop,
}

/// The window manager: owns the window list and z-order.
#[derive(Debug, Clone)]
pub struct WindowManager {
    /// Windows in z-order: index 0 = frontmost (top of stack), last = bottom.
    windows: Vec<WmWindow>,
    /// ID of the currently focused window, if any.
    focused_id: Option<usize>,
    /// Current drag state, if a drag is in progress.
    drag: Option<DragState>,
    /// Next window ID to assign.
    next_id: usize,
}

impl WindowManager {
    /// Create a new, empty window manager.
    pub fn new() -> Self {
        WindowManager {
            windows: Vec::new(),
            focused_id: None,
            drag: None,
            next_id: 1,
        }
    }

    /// Add a window. It appears at the top of the z-order and gets focus.
    /// Returns the assigned window ID.
    pub fn create_window(&mut self, title: &str, x: usize, y: usize, w: usize, h: usize) -> usize {
        let id = self.next_id;
        self.next_id += 1;

        // Unfocus any existing window
        for win in &mut self.windows {
            win.focused = false;
        }

        let mut win = WmWindow::new(id, title, x, y, w, h);
        win.focused = true;
        self.focused_id = Some(id);

        // Insert at front of z-order
        self.windows.insert(0, win);
        id
    }

    /// Remove a window by ID. Returns true if it was found and removed.
    pub fn destroy_window(&mut self, id: usize) -> bool {
        if let Some(pos) = self.windows.iter().position(|w| w.id == id) {
            self.windows.remove(pos);
            if self.focused_id == Some(id) {
                // Focus the new frontmost window, if any
                self.focused_id = self.windows.first().map(|w| w.id);
                if let Some(new_focus) = self.focused_id {
                    if let Some(w) = self.windows.iter_mut().find(|w| w.id == new_focus) {
                        w.focused = true;
                    }
                }
            }
            true
        } else {
            false
        }
    }

    /// Get a reference to a window by ID.
    pub fn get_window(&self, id: usize) -> Option<&WmWindow> {
        self.windows.iter().find(|w| w.id == id)
    }

    /// Get a mutable reference to a window by ID.
    pub fn get_window_mut(&mut self, id: usize) -> Option<&mut WmWindow> {
        self.windows.iter_mut().find(|w| w.id == id)
    }

    /// Get the currently focused window, if any.
    pub fn focused_window(&self) -> Option<&WmWindow> {
        self.focused_id.and_then(|id| self.get_window(id))
    }

    /// Get the currently focused window mutably, if any.
    pub fn focused_window_mut(&mut self) -> Option<&mut WmWindow> {
        if let Some(id) = self.focused_id {
            self.get_window_mut(id)
        } else {
            None
        }
    }

    /// Return the ID of the focused window.
    pub fn focused_id(&self) -> Option<usize> {
        self.focused_id
    }

    /// Return all windows in z-order (front to back).
    pub fn windows(&self) -> &[WmWindow] {
        &self.windows
    }

    /// Perform a z-order hit test: find the frontmost window under (px, py).
    ///
    /// Two-pass strategy:
    ///   1. Check all title bars (front to back) — title bars always win.
    ///   2. Check all content areas (front to back).
    ///
    /// This ensures that a title bar peeking out from behind an overlapping
    /// window is still clickable (standard windowing convention).
    pub fn hit_test(&self, px: usize, py: usize) -> ClickTarget {
        // Pass 1: title bars take priority
        for win in &self.windows {
            if !win.visible {
                continue;
            }
            if win.is_on_title_bar(px, py) {
                return ClickTarget::TitleBar(win.id);
            }
        }
        // Pass 2: content areas
        for win in &self.windows {
            if !win.visible {
                continue;
            }
            if win.is_on_content(px, py) {
                return ClickTarget::Content(win.id);
            }
        }
        ClickTarget::Desktop
    }

    /// Bring a window to the front of the z-order and focus it.
    /// Unfocuses the previously focused window.
    pub fn bring_to_front(&mut self, id: usize) {
        // Unfocus old
        if let Some(old_id) = self.focused_id {
            if let Some(w) = self.windows.iter_mut().find(|w| w.id == old_id) {
                w.focused = false;
            }
        }

        // Find and move to front
        if let Some(pos) = self.windows.iter().position(|w| w.id == id) {
            let mut win = self.windows.remove(pos);
            win.focused = true;
            self.windows.insert(0, win);
            self.focused_id = Some(id);
        }
    }

    /// Handle a mouse button press at (px, py).
    ///
    /// Returns a `ClickEvent` describing what happened, so the caller
    /// can dispatch accordingly.
    pub fn on_mouse_down(&mut self, px: usize, py: usize) -> ClickEvent {
        match self.hit_test(px, py) {
            ClickTarget::TitleBar(id) => {
                // Start drag and bring to front
                self.bring_to_front(id);
                let win = self.get_window(id).unwrap();
                let offset_x = px as isize - win.x as isize;
                let offset_y = py as isize - win.y as isize;
                self.drag = Some(DragState {
                    window_id: id,
                    offset_x,
                    offset_y,
                });
                ClickEvent::DragStarted { window_id: id }
            }
            ClickTarget::Content(id) => {
                // Focus the window but don't start drag
                self.bring_to_front(id);
                let win = self.get_window(id).unwrap();
                let (cx, cy) = win.screen_to_content(px, py).unwrap();
                ClickEvent::ContentClicked {
                    window_id: id,
                    content_x: cx,
                    content_y: cy,
                }
            }
            ClickTarget::Desktop => {
                // Unfocus everything
                if let Some(old_id) = self.focused_id {
                    if let Some(w) = self.windows.iter_mut().find(|w| w.id == old_id) {
                        w.focused = false;
                    }
                }
                self.focused_id = None;
                ClickEvent::DesktopClicked
            }
        }
    }

    /// Handle mouse movement while button is held.
    ///
    /// If a drag is in progress, moves the window accordingly.
    /// Returns the ID of the window being dragged, if any.
    pub fn on_mouse_move(&mut self, px: usize, py: usize) -> Option<usize> {
        if let Some(drag) = self.drag {
            let new_x = (px as isize - drag.offset_x).max(0) as usize;
            let new_y = (py as isize - drag.offset_y).max(0) as usize;
            if let Some(win) = self.windows.iter_mut().find(|w| w.id == drag.window_id) {
                win.move_to(new_x, new_y);
            }
            Some(drag.window_id)
        } else {
            None
        }
    }

    /// Handle mouse button release. Ends any active drag.
    pub fn on_mouse_up(&mut self) -> Option<usize> {
        self.drag.take().map(|d| d.window_id)
    }

    /// Check if a drag is currently in progress.
    pub fn is_dragging(&self) -> bool {
        self.drag.is_some()
    }

    /// Get the window ID being dragged, if any.
    pub fn drag_window_id(&self) -> Option<usize> {
        self.drag.map(|d| d.window_id)
    }
}

/// Event returned by the window manager on mouse interactions.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ClickEvent {
    /// A drag was started on the title bar of the given window.
    DragStarted { window_id: usize },
    /// The content area of a window was clicked at local (content_x, content_y).
    ContentClicked {
        window_id: usize,
        content_x: usize,
        content_y: usize,
    },
    /// The desktop background was clicked (no window).
    DesktopClicked,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_create_window_manager() {
        let wm = WindowManager::new();
        assert!(wm.windows().is_empty());
        assert_eq!(wm.focused_id(), None);
        assert!(!wm.is_dragging());
    }

    #[test]
    fn test_create_and_focus_window() {
        let mut wm = WindowManager::new();
        let id = wm.create_window("Test", 10, 10, 200, 150);
        assert_eq!(id, 1);
        assert_eq!(wm.focused_id(), Some(1));
        let win = wm.focused_window().unwrap();
        assert_eq!(win.title, "Test");
        assert!(win.focused);
    }

    #[test]
    fn test_z_order_hit_test_frontmost() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Back", 10, 10, 200, 150);
        let id2 = wm.create_window("Front", 10, 10, 200, 150);

        // Both at same position; frontmost (id2) should be hit
        let hit = wm.hit_test(50, 50);
        assert_eq!(hit, ClickTarget::Content(id2));
    }

    #[test]
    fn test_click_title_bar_bring_to_front() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Win1", 10, 10, 200, 150);
        let id2 = wm.create_window("Win2", 10, 10, 200, 150);

        // id2 is in front. Move id1 so its title bar is visible but id2 overlaps.
        wm.get_window_mut(id1).unwrap().move_to(10, 100);
        // Now id1 title bar is at y=100..120, content at 120..250
        // id2 is at y=10..160

        // Click title bar of id1 at (50, 105) — only id1 is there
        let evt = wm.on_mouse_down(50, 105);
        assert!(matches!(evt, ClickEvent::DragStarted { window_id } if window_id == id1));

        // id1 should now be focused and in front
        assert_eq!(wm.focused_id(), Some(id1));
        assert_eq!(wm.windows()[0].id, id1);
    }

    #[test]
    fn test_click_content_focuses() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Win1", 10, 10, 200, 150);
        let _id2 = wm.create_window("Win2", 250, 10, 200, 150);

        // Click content of win1 (below title bar)
        let evt = wm.on_mouse_down(50, 50);
        assert!(matches!(evt, ClickEvent::ContentClicked { window_id, .. } if window_id == id1));
        assert_eq!(wm.focused_id(), Some(id1));
    }

    #[test]
    fn test_title_bar_drag_moves_window() {
        let mut wm = WindowManager::new();
        let id = wm.create_window("DragMe", 50, 50, 200, 150);

        // Click on title bar (y=50..70 is title bar)
        let evt = wm.on_mouse_down(100, 55);
        assert!(matches!(evt, ClickEvent::DragStarted { .. }));

        // Move mouse
        let moved = wm.on_mouse_move(150, 75);
        assert_eq!(moved, Some(id));

        let win = wm.get_window(id).unwrap();
        // offset was (100-50, 55-50) = (50, 5)
        // new pos = (150-50, 75-5) = (100, 70)
        assert_eq!(win.x, 100);
        assert_eq!(win.y, 70);

        // Release
        let released = wm.on_mouse_up();
        assert_eq!(released, Some(id));
        assert!(!wm.is_dragging());
    }

    #[test]
    fn test_desktop_click_unfocuses() {
        let mut wm = WindowManager::new();
        let _id = wm.create_window("Win", 10, 10, 200, 150);
        assert!(wm.focused_id().is_some());

        // Click on empty space
        let evt = wm.on_mouse_down(500, 500);
        assert_eq!(evt, ClickEvent::DesktopClicked);
        assert_eq!(wm.focused_id(), None);
    }

    #[test]
    fn test_destroy_window_refocuses() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Win1", 10, 10, 200, 150);
        let id2 = wm.create_window("Win2", 250, 10, 200, 150);

        // id2 is focused (frontmost). Destroy it.
        assert_eq!(wm.focused_id(), Some(id2));
        wm.destroy_window(id2);

        // id1 should now be focused
        assert_eq!(wm.focused_id(), Some(id1));
        let win = wm.get_window(id1).unwrap();
        assert!(win.focused);
    }

    #[test]
    fn test_screen_to_content() {
        let win = WmWindow::new(1, "Test", 100, 100, 200, 150);
        assert_eq!(win.screen_to_content(110, 130), Some((10, 10)));
        // Content starts at y=120 (100 + TITLE_BAR_HEIGHT=20)
        assert_eq!(win.screen_to_content(100, 120), Some((0, 0)));
        assert_eq!(win.screen_to_content(99, 130), None); // outside left
        assert_eq!(win.screen_to_content(110, 119), None); // on title bar
    }

    #[test]
    fn test_window_local_geometry() {
        let win = WmWindow::new(1, "Test", 20, 30, 200, 150);
        assert_eq!(win.title_bar_top(), 30);
        assert_eq!(win.title_bar_bottom(), 50);
        assert_eq!(win.content_top(), 50);
        assert_eq!(win.bounds(), (20, 30, 220, 180));
    }

    #[test]
    fn test_hit_test_regions() {
        let win = WmWindow::new(1, "Test", 20, 30, 200, 150);
        assert!(win.is_on_title_bar(25, 35)); // inside title bar
        assert!(win.is_on_title_bar(219, 49)); // bottom-right of title bar
        assert!(!win.is_on_title_bar(25, 50)); // just below title bar
        assert!(win.is_on_content(25, 50)); // content area
        assert!(win.is_on_content(25, 179)); // bottom of content
        assert!(!win.contains_point(25, 180)); // outside
    }

    #[test]
    fn test_multiple_windows_click_cycles() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("A", 10, 10, 100, 100);
        let id2 = wm.create_window("B", 120, 10, 100, 100);
        let id3 = wm.create_window("C", 230, 10, 100, 100);

        // Focus cycles correctly
        wm.on_mouse_down(50, 50); // click A content
        assert_eq!(wm.focused_id(), Some(id1));

        wm.on_mouse_down(150, 50); // click B content
        assert_eq!(wm.focused_id(), Some(id2));

        wm.on_mouse_down(260, 50); // click C content
        assert_eq!(wm.focused_id(), Some(id3));

        // A is still there, just behind
        assert!(wm.get_window(id1).is_some());
    }

    #[test]
    fn test_no_phantom_focus_on_drag_release() {
        let mut wm = WindowManager::new();
        let id = wm.create_window("Drag", 50, 50, 200, 150);

        // Start drag
        wm.on_mouse_down(100, 55);
        assert_eq!(wm.focused_id(), Some(id));

        // Move
        wm.on_mouse_move(200, 100);

        // Release
        wm.on_mouse_up();
        assert!(!wm.is_dragging());

        // Focus should still be on the dragged window, not lost
        assert_eq!(wm.focused_id(), Some(id));
    }

    #[test]
    fn test_drag_clamps_to_zero() {
        let mut wm = WindowManager::new();
        let id = wm.create_window("Drag", 50, 50, 200, 150);

        // Click near left edge of title bar
        wm.on_mouse_down(55, 55); // offset_x = 5
        // Move mouse to x=0
        wm.on_mouse_move(0, 55);

        let win = wm.get_window(id).unwrap();
        // new_x = max(0 - 5, 0) = 0
        assert_eq!(win.x, 0);
    }

    #[test]
    fn test_invisible_windows_skipped() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Visible", 10, 10, 200, 150);
        let id2 = wm.create_window("Hidden", 10, 10, 200, 150);

        // Make id2 (frontmost) invisible
        wm.get_window_mut(id2).unwrap().visible = false;

        // Hit test should find id1 instead
        let hit = wm.hit_test(50, 50);
        assert_eq!(hit, ClickTarget::Content(id1));
    }
}
