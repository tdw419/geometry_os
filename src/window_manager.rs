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

/// Maximum number of entries in a WindowTable.
pub const WINDOW_TABLE_MAX: usize = 16;

/// A single entry in the VM-aware Window Table.
///
/// Maps a VM process (by pid) to a rectangular screen region with z-ordering.
/// This is the data structure the compositor reads to blit each VM's screen
/// to the correct position on the display.
///
/// The WindowTable is the bridge between the process scheduler (which owns VMs)
/// and the compositor (which paints pixels). Each VM process that should be
/// visible on screen gets a WindowEntry.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct WindowEntry {
    /// Process ID of the VM that owns this window.
    pub vm_id: u32,
    /// Left edge X coordinate in pixels.
    pub x: u32,
    /// Top edge Y coordinate in pixels.
    pub y: u32,
    /// Width in pixels.
    pub w: u32,
    /// Height in pixels.
    pub h: u32,
    /// Z-order: lower = drawn first (background), higher = drawn on top.
    /// Entries with equal z_order are drawn in insertion order.
    pub z_order: u32,
    /// Whether this window is visible (true) or hidden (false).
    pub visible: bool,
}

impl WindowEntry {
    /// Create a new visible window entry.
    pub fn new(vm_id: u32, x: u32, y: u32, w: u32, h: u32, z_order: u32) -> Self {
        WindowEntry {
            vm_id,
            x,
            y,
            w,
            h,
            z_order,
            visible: true,
        }
    }

    /// Check if a point (px, py) is inside this window's bounds.
    pub fn contains_point(&self, px: u32, py: u32) -> bool {
        px >= self.x && px < self.x + self.w && py >= self.y && py < self.y + self.h
    }

    /// Right edge X coordinate.
    pub fn right(&self) -> u32 {
        self.x + self.w
    }

    /// Bottom edge Y coordinate.
    pub fn bottom(&self) -> u32 {
        self.y + self.h
    }
}

/// A fixed-capacity table mapping VM processes to screen regions.
///
/// The compositor reads this table to know where to blit each VM's
/// pixel buffer. Entries can be added, removed, and re-ordered by z_order.
///
/// Design: fixed-size array (WINDOW_TABLE_MAX entries) to keep it simple
/// and deterministic -- no heap allocation pressure during compositing.
#[derive(Debug, Clone)]
pub struct WindowTable {
    entries: Vec<WindowEntry>,
    /// PID of the VM that currently has keyboard focus (receives key events).
    focus: Option<u32>,
}

impl WindowTable {
    /// Create an empty window table.
    pub fn new() -> Self {
        WindowTable {
            entries: Vec::with_capacity(WINDOW_TABLE_MAX),
            focus: None,
        }
    }

    /// Add a window entry. Returns the index, or None if the table is full.
    /// The first window added automatically gets focus.
    pub fn add(&mut self, entry: WindowEntry) -> Option<usize> {
        if self.entries.len() >= WINDOW_TABLE_MAX {
            return None;
        }
        // Reject duplicate vm_id
        if self.entries.iter().any(|e| e.vm_id == entry.vm_id) {
            return None;
        }
        let idx = self.entries.len();
        // Auto-focus the first window
        if self.focus.is_none() {
            self.focus = Some(entry.vm_id);
        }
        self.entries.push(entry);
        Some(idx)
    }

    /// Remove an entry by vm_id. Returns true if found and removed.
    /// If the removed window had focus, transfers focus to the next visible window.
    pub fn remove(&mut self, vm_id: u32) -> bool {
        if let Some(pos) = self.entries.iter().position(|e| e.vm_id == vm_id) {
            self.entries.remove(pos);
            // If we removed the focused window, transfer focus
            if self.focus == Some(vm_id) {
                let new_focus = self
                    .entries
                    .iter()
                    .filter(|e| e.visible)
                    .max_by_key(|e| e.z_order)
                    .map(|e| e.vm_id);
                self.focus = new_focus;
            }
            true
        } else {
            false
        }
    }

    /// Look up an entry by vm_id.
    pub fn get(&self, vm_id: u32) -> Option<&WindowEntry> {
        self.entries.iter().find(|e| e.vm_id == vm_id)
    }

    /// Look up an entry by vm_id, mutably.
    pub fn get_mut(&mut self, vm_id: u32) -> Option<&mut WindowEntry> {
        self.entries.iter_mut().find(|e| e.vm_id == vm_id)
    }

    /// Return all entries sorted by z_order (ascending: background first).
    /// Entries with equal z_order retain their insertion order (stable sort).
    pub fn sorted_by_z(&self) -> Vec<&WindowEntry> {
        let mut refs: Vec<&WindowEntry> = self.entries.iter().collect();
        refs.sort_by_key(|e| e.z_order);
        refs
    }

    /// Return only visible entries, sorted by z_order (ascending).
    pub fn visible_sorted(&self) -> Vec<&WindowEntry> {
        let mut refs: Vec<&WindowEntry> = self.entries.iter().filter(|e| e.visible).collect();
        refs.sort_by_key(|e| e.z_order);
        refs
    }

    /// Find the topmost visible window at screen point (px, py).
    /// Iterates sorted by z_order descending (highest first).
    pub fn hit_test(&self, px: u32, py: u32) -> Option<&WindowEntry> {
        let mut visible: Vec<&WindowEntry> = self.entries.iter().filter(|e| e.visible).collect();
        visible.sort_by_key(|e| e.z_order);
        // Check highest z_order first
        for entry in visible.into_iter().rev() {
            if entry.contains_point(px, py) {
                return Some(entry);
            }
        }
        None
    }

    /// Number of entries in the table.
    pub fn len(&self) -> usize {
        self.entries.len()
    }

    /// Whether the table is empty.
    pub fn is_empty(&self) -> bool {
        self.entries.is_empty()
    }

    /// Set visibility of a window by vm_id. Returns true if found.
    pub fn set_visible(&mut self, vm_id: u32, visible: bool) -> bool {
        if let Some(entry) = self.get_mut(vm_id) {
            entry.visible = visible;
            true
        } else {
            false
        }
    }

    /// Move a window to a new position. Returns true if found.
    pub fn move_window(&mut self, vm_id: u32, new_x: u32, new_y: u32) -> bool {
        if let Some(entry) = self.get_mut(vm_id) {
            entry.x = new_x;
            entry.y = new_y;
            true
        } else {
            false
        }
    }

    /// Update a window's z_order. Returns true if found.
    pub fn set_z_order(&mut self, vm_id: u32, z_order: u32) -> bool {
        if let Some(entry) = self.get_mut(vm_id) {
            entry.z_order = z_order;
            true
        } else {
            false
        }
    }

    /// Bring a window to front by giving it the highest z_order + 1.
    /// Also sets keyboard focus to this window.
    /// Returns the new z_order, or None if not found.
    pub fn bring_to_front(&mut self, vm_id: u32) -> Option<u32> {
        let max_z = self.entries.iter().map(|e| e.z_order).max().unwrap_or(0);
        if let Some(entry) = self.get_mut(vm_id) {
            entry.z_order = max_z + 1;
        } else {
            return None;
        }
        self.focus = Some(vm_id);
        Some(self.get(vm_id).unwrap().z_order)
    }

    /// Get the VM that currently has keyboard focus.
    pub fn focused_vm_id(&self) -> Option<u32> {
        self.focus
    }

    /// Set focus to a specific VM. Returns true if found.
    pub fn set_focus(&mut self, vm_id: u32) -> bool {
        if self.entries.iter().any(|e| e.vm_id == vm_id && e.visible) {
            self.focus = Some(vm_id);
            true
        } else {
            false
        }
    }

    /// Handle a click: hit-test at (px, py), bring the hit window to front
    /// and focus it. Returns the routed mouse event, or None if desktop hit.
    pub fn click_focus(&mut self, px: u32, py: u32) -> Option<RoutedMouse> {
        let entry = self.hit_test(px, py)?;
        let vm_id = entry.vm_id;
        // Bring to front + focus
        let _ = self.bring_to_front(vm_id);
        // Now route the mouse coordinates
        route_mouse(self, px, py)
    }

    /// Return all entries as a slice.
    pub fn entries(&self) -> &[WindowEntry] {
        &self.entries
    }
}

/// Size of VM screen buffers (width and height in pixels).
pub const VM_SCREEN_SIZE: usize = 256;

/// Result of routing a mouse event to a window.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct RoutedMouse {
    /// The VM process that should receive this event.
    pub target_vm_id: u32,
    /// Mouse X in the target VM's 256x256 screen coordinate space.
    pub vm_mouse_x: u32,
    /// Mouse Y in the target VM's 256x256 screen coordinate space.
    pub vm_mouse_y: u32,
}

/// Route a mouse event (global screen coordinates) to the topmost window.
///
/// Returns None if no visible window contains the point.
/// Maps global (px, py) to the VM's 256x256 coordinate space based on
/// the window's position and size in the WindowTable.
pub fn route_mouse(table: &WindowTable, px: u32, py: u32) -> Option<RoutedMouse> {
    let entry = table.hit_test(px, py)?;
    // Convert global coords to window-local coords
    let local_x = px.saturating_sub(entry.x);
    let local_y = py.saturating_sub(entry.y);
    // Scale from window size to VM 256x256 screen space
    let vm_x = (local_x as u64 * VM_SCREEN_SIZE as u64 / entry.w as u64) as u32;
    let vm_y = (local_y as u64 * VM_SCREEN_SIZE as u64 / entry.h as u64) as u32;
    // Clamp to screen bounds
    let vm_x = vm_x.min((VM_SCREEN_SIZE - 1) as u32);
    let vm_y = vm_y.min((VM_SCREEN_SIZE - 1) as u32);
    Some(RoutedMouse {
        target_vm_id: entry.vm_id,
        vm_mouse_x: vm_x,
        vm_mouse_y: vm_y,
    })
}

/// Composite all visible windows onto an output buffer using painter's algorithm.
///
/// For each visible entry in `table` (sorted by z_order ascending), blits the
/// corresponding VM's screen buffer onto `output`. The output buffer is
/// `out_width x out_height` pixels. Each VM screen is 256x256.
///
/// The `screens` map provides the screen buffer for each VM (keyed by pid).
/// Pixels with value 0 are treated as transparent (not drawn), allowing
/// overlapping windows to layer correctly.
///
/// Returns the number of windows composited.
pub fn composite(
    table: &WindowTable,
    screens: &std::collections::HashMap<u32, &[u32]>,
    output: &mut [u32],
    out_width: usize,
    out_height: usize,
) -> usize {
    // Clear output to black
    output.fill(0);

    let mut count = 0;
    for entry in table.visible_sorted() {
        if let Some(screen) = screens.get(&entry.vm_id) {
            blit_window(screen, entry, output, out_width, out_height);
            count += 1;
        }
    }
    count
}

/// Blit a single VM's screen buffer onto the output at the window's position.
///
/// Reads from the VM's 256x256 screen buffer, writing non-zero pixels to the
/// output at (entry.x, entry.y) through (entry.x + entry.w, entry.y + entry.h).
fn blit_window(
    screen: &[u32],
    entry: &WindowEntry,
    output: &mut [u32],
    out_width: usize,
    out_height: usize,
) {
    let ew = entry.w as usize;
    let eh = entry.h as usize;
    let ex = entry.x as usize;
    let ey = entry.y as usize;

    for row in 0..eh {
        let out_y = ey + row;
        if out_y >= out_height {
            break;
        }
        for col in 0..ew {
            let out_x = ex + col;
            if out_x >= out_width {
                break;
            }
            // Scale from window coords to VM screen coords
            let src_x = (col * VM_SCREEN_SIZE) / ew;
            let src_y = (row * VM_SCREEN_SIZE) / eh;
            let pixel = screen[src_y * VM_SCREEN_SIZE + src_x];
            if pixel != 0 {
                output[out_y * out_width + out_x] = pixel;
            }
        }
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
        let _id1 = wm.create_window("Back", 10, 10, 200, 150);
        let id2 = wm.create_window("Front", 10, 10, 200, 150);

        // Both at same position; frontmost (id2) should be hit
        let hit = wm.hit_test(50, 50);
        assert_eq!(hit, ClickTarget::Content(id2));
    }

    #[test]
    fn test_click_title_bar_bring_to_front() {
        let mut wm = WindowManager::new();
        let id1 = wm.create_window("Win1", 10, 10, 200, 150);
        let _id2 = wm.create_window("Win2", 10, 10, 200, 150);

        // _id2 is in front. Move id1 so its title bar is visible but _id2 overlaps.
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

    // ---- WindowEntry tests ----

    #[test]
    fn window_entry_new_visible() {
        let e = WindowEntry::new(1, 10, 20, 100, 80, 0);
        assert_eq!(e.vm_id, 1);
        assert_eq!(e.x, 10);
        assert_eq!(e.y, 20);
        assert_eq!(e.w, 100);
        assert_eq!(e.h, 80);
        assert_eq!(e.z_order, 0);
        assert!(e.visible);
    }

    #[test]
    fn window_entry_contains_point() {
        let e = WindowEntry::new(1, 10, 20, 100, 80, 0);
        assert!(e.contains_point(10, 20)); // top-left
        assert!(e.contains_point(109, 99)); // bottom-right (exclusive)
        assert!(!e.contains_point(9, 20)); // left of window
        assert!(!e.contains_point(10, 19)); // above window
        assert!(!e.contains_point(110, 20)); // right edge exclusive
        assert!(!e.contains_point(10, 100)); // bottom edge exclusive
    }

    #[test]
    fn window_entry_edges() {
        let e = WindowEntry::new(1, 5, 10, 30, 40, 0);
        assert_eq!(e.right(), 35);
        assert_eq!(e.bottom(), 50);
    }

    // ---- WindowTable tests ----

    #[test]
    fn window_table_new_empty() {
        let t = WindowTable::new();
        assert!(t.is_empty());
        assert_eq!(t.len(), 0);
    }

    #[test]
    fn window_table_add_entry() {
        let mut t = WindowTable::new();
        let idx = t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert_eq!(idx, Some(0));
        assert_eq!(t.len(), 1);
        assert!(!t.is_empty());
    }

    #[test]
    fn window_table_add_returns_index() {
        let mut t = WindowTable::new();
        assert_eq!(t.add(WindowEntry::new(1, 0, 0, 32, 32, 0)), Some(0));
        assert_eq!(t.add(WindowEntry::new(2, 32, 0, 32, 32, 1)), Some(1));
        assert_eq!(t.add(WindowEntry::new(3, 0, 32, 32, 32, 2)), Some(2));
    }

    #[test]
    fn window_table_reject_duplicate_vm_id() {
        let mut t = WindowTable::new();
        assert!(t.add(WindowEntry::new(1, 0, 0, 32, 32, 0)).is_some());
        assert_eq!(t.add(WindowEntry::new(1, 64, 64, 32, 32, 1)), None);
        assert_eq!(t.len(), 1);
    }

    #[test]
    fn window_table_max_capacity() {
        let mut t = WindowTable::new();
        for i in 0..WINDOW_TABLE_MAX {
            assert!(t.add(WindowEntry::new(i as u32 + 1, 0, 0, 32, 32, i as u32)).is_some());
        }
        // 17th entry should fail
        assert_eq!(
            t.add(WindowEntry::new(99, 0, 0, 32, 32, 0)),
            None
        );
        assert_eq!(t.len(), WINDOW_TABLE_MAX);
    }

    #[test]
    fn window_table_get() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 10, 20, 30, 40, 0));
        let e = t.get(1).unwrap();
        assert_eq!(e.x, 10);
        assert_eq!(e.y, 20);
        assert_eq!(e.w, 30);
        assert_eq!(e.h, 40);
        assert!(t.get(999).is_none());
    }

    #[test]
    fn window_table_get_mut() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 10, 20, 30, 40, 0));
        t.get_mut(1).unwrap().x = 100;
        assert_eq!(t.get(1).unwrap().x, 100);
    }

    #[test]
    fn window_table_remove() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 32, 0, 32, 32, 1));
        assert_eq!(t.len(), 2);

        assert!(t.remove(1));
        assert_eq!(t.len(), 1);
        assert!(t.get(1).is_none());
        assert!(t.get(2).is_some());

        // Remove non-existent
        assert!(!t.remove(999));
    }

    #[test]
    fn window_table_sorted_by_z() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 2)); // background
        t.add(WindowEntry::new(2, 0, 0, 32, 32, 0)); // foreground
        t.add(WindowEntry::new(3, 0, 0, 32, 32, 1)); // middle

        let sorted: Vec<u32> = t.sorted_by_z().iter().map(|e| e.vm_id).collect();
        assert_eq!(sorted, vec![2, 3, 1]); // z_order 0, 1, 2
    }

    #[test]
    fn window_table_visible_sorted_skips_hidden() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        let mut hidden = WindowEntry::new(2, 0, 0, 32, 32, 1);
        hidden.visible = false;
        t.add(hidden);
        t.add(WindowEntry::new(3, 0, 0, 32, 32, 2));

        let vis: Vec<u32> = t.visible_sorted().iter().map(|e| e.vm_id).collect();
        assert_eq!(vis, vec![1, 3]);
    }

    #[test]
    fn window_table_hit_test_topmost() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 100, 100, 0)); // background
        t.add(WindowEntry::new(2, 0, 0, 100, 100, 1)); // foreground

        // Point at (50,50) is in both windows; topmost (z=1) wins
        let hit = t.hit_test(50, 50).unwrap();
        assert_eq!(hit.vm_id, 2);
    }

    #[test]
    fn window_table_hit_test_nothing() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert!(t.hit_test(100, 100).is_none());
    }

    #[test]
    fn window_table_hit_test_skips_hidden() {
        let mut t = WindowTable::new();
        let mut hidden = WindowEntry::new(1, 0, 0, 100, 100, 1);
        hidden.visible = false;
        t.add(hidden);
        t.add(WindowEntry::new(2, 0, 0, 100, 100, 0)); // visible background

        let hit = t.hit_test(50, 50).unwrap();
        assert_eq!(hit.vm_id, 2);
    }

    #[test]
    fn window_table_set_visible() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert!(t.get(1).unwrap().visible);

        assert!(t.set_visible(1, false));
        assert!(!t.get(1).unwrap().visible);

        assert!(!t.set_visible(999, false)); // non-existent
    }

    #[test]
    fn window_table_move_window() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 10, 20, 32, 32, 0));
        assert!(t.move_window(1, 100, 200));
        assert_eq!(t.get(1).unwrap().x, 100);
        assert_eq!(t.get(1).unwrap().y, 200);

        assert!(!t.move_window(999, 0, 0));
    }

    #[test]
    fn window_table_set_z_order() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert!(t.set_z_order(1, 5));
        assert_eq!(t.get(1).unwrap().z_order, 5);

        assert!(!t.set_z_order(999, 5));
    }

    #[test]
    fn window_table_bring_to_front() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 0, 0, 32, 32, 1));

        // Bring vm_id=1 to front; it should get z_order=2 (max+1)
        let new_z = t.bring_to_front(1);
        assert_eq!(new_z, Some(2));
        assert_eq!(t.get(1).unwrap().z_order, 2);

        assert!(t.bring_to_front(999).is_none());
    }

    #[test]
    fn window_table_entries() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 32, 0, 32, 32, 1));
        assert_eq!(t.entries().len(), 2);
        assert_eq!(t.entries()[0].vm_id, 1);
        assert_eq!(t.entries()[1].vm_id, 2);
    }

    #[test]
    fn window_table_three_windows_compositor_order() {
        // Simulate a real layout: editor left, shell right, assembler top-right
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 128, 128, 0)); // editor (background)
        t.add(WindowEntry::new(2, 128, 0, 128, 64, 1)); // shell (middle)
        t.add(WindowEntry::new(3, 128, 64, 128, 64, 2)); // assembler (topmost)

        let vis: Vec<u32> = t.visible_sorted().iter().map(|e| e.vm_id).collect();
        assert_eq!(vis, vec![1, 2, 3]);

        // Click at (64, 64) -- only editor
        assert_eq!(t.hit_test(64, 64).unwrap().vm_id, 1);

        // Click at (192, 32) -- shell overlaps nothing, wins
        assert_eq!(t.hit_test(192, 32).unwrap().vm_id, 2);

        // Click at (192, 96) -- assembler area
        assert_eq!(t.hit_test(192, 96).unwrap().vm_id, 3);
    }

    // ---- Compositor tests ----

    use std::collections::HashMap;

    /// Helper: create a 256x256 screen with a single colored pixel at (sx, sy).
    fn make_screen_with_pixel(sx: usize, sy: usize, color: u32) -> Vec<u32> {
        let mut screen = vec![0u32; VM_SCREEN_SIZE * VM_SCREEN_SIZE];
        screen[sy * VM_SCREEN_SIZE + sx] = color;
        screen
    }

    /// Helper: create a 256x256 screen filled with a solid color.
    fn make_solid_screen(color: u32) -> Vec<u32> {
        vec![color; VM_SCREEN_SIZE * VM_SCREEN_SIZE]
    }

    #[test]
    fn composite_single_window_blits_pixel() {
        let mut table = WindowTable::new();
        table.add(WindowEntry::new(1, 0, 0, 64, 64, 0));

        let screen = make_screen_with_pixel(0, 0, 0xFF0000); // red pixel at (0,0)
        let mut screens = HashMap::new();
        screens.insert(1u32, screen.as_slice());

        let mut output = vec![0u32; 256 * 256];
        let count = composite(&table, &screens, &mut output, 256, 256);

        assert_eq!(count, 1);
        // The 64x64 window maps VM (0,0) to output (0,0)
        assert_eq!(output[0], 0xFF0000);
    }

    #[test]
    fn composite_clears_output_first() {
        let table = WindowTable::new(); // empty table

        let mut output = vec![0xFFFFFFu32; 64 * 64]; // all white
        let count = composite(&table, &HashMap::new(), &mut output, 64, 64);

        assert_eq!(count, 0);
        assert!(output.iter().all(|&p| p == 0)); // all black
    }

    #[test]
    fn composite_two_windows_z_order() {
        let mut table = WindowTable::new();
        // Window 1: full 64x64 background, z=0
        table.add(WindowEntry::new(1, 0, 0, 64, 64, 0));
        // Window 2: top-left 32x32, z=1 (on top)
        table.add(WindowEntry::new(2, 0, 0, 32, 32, 1));

        let bg_screen = make_solid_screen(0x0000FF); // blue
        let fg_screen = make_solid_screen(0xFF0000); // red

        let mut screens = HashMap::new();
        screens.insert(1u32, bg_screen.as_slice());
        screens.insert(2u32, fg_screen.as_slice());

        let mut output = vec![0u32; 64 * 64];
        let count = composite(&table, &screens, &mut output, 64, 64);

        assert_eq!(count, 2);
        // Top-left 32x32 should be red (foreground)
        assert_eq!(output[0], 0xFF0000);
        assert_eq!(output[31 * 64 + 31], 0xFF0000);
        // Bottom-right should be blue (background only)
        assert_eq!(output[63 * 64 + 63], 0x0000FF);
    }

    #[test]
    fn composite_skips_hidden_window() {
        let mut table = WindowTable::new();
        let mut hidden = WindowEntry::new(1, 0, 0, 64, 64, 0);
        hidden.visible = false;
        table.add(hidden);

        let screen = make_solid_screen(0xFFFFFF);
        let mut screens = HashMap::new();
        screens.insert(1u32, screen.as_slice());

        let mut output = vec![0u32; 64 * 64];
        let count = composite(&table, &screens, &mut output, 64, 64);

        assert_eq!(count, 0);
        assert!(output.iter().all(|&p| p == 0));
    }

    #[test]
    fn composite_skips_missing_screen() {
        let mut table = WindowTable::new();
        table.add(WindowEntry::new(1, 0, 0, 64, 64, 0));
        // No screen for vm_id=1 in the map

        let mut output = vec![0u32; 64 * 64];
        let count = composite(&table, &HashMap::new(), &mut output, 64, 64);

        assert_eq!(count, 0);
    }

    #[test]
    fn composite_position_offset() {
        let mut table = WindowTable::new();
        // Window at position (32, 16), size 4x4
        table.add(WindowEntry::new(1, 32, 16, 4, 4, 0));

        // Put a red pixel at VM (0,0)
        let screen = make_screen_with_pixel(0, 0, 0xFF0000);
        let mut screens = HashMap::new();
        screens.insert(1u32, screen.as_slice());

        let mut output = vec![0u32; 64 * 64];
        composite(&table, &screens, &mut output, 64, 64);

        // Should appear at output (32, 16)
        assert_eq!(output[16 * 64 + 32], 0xFF0000);
        // Should NOT appear at (0,0)
        assert_eq!(output[0], 0);
    }

    #[test]
    fn composite_transparency() {
        let mut table = WindowTable::new();
        // Two overlapping windows
        table.add(WindowEntry::new(1, 0, 0, 8, 8, 0)); // background
        table.add(WindowEntry::new(2, 0, 0, 8, 8, 1)); // foreground, transparent

        let bg = make_solid_screen(0x0000FF); // blue everywhere
        let fg = vec![0u32; VM_SCREEN_SIZE * VM_SCREEN_SIZE]; // all black (transparent)

        let mut screens = HashMap::new();
        screens.insert(1u32, bg.as_slice());
        screens.insert(2u32, fg.as_slice());

        let mut output = vec![0u32; 8 * 8];
        composite(&table, &screens, &mut output, 8, 8);

        // Since foreground is all 0 (transparent), background shows through
        assert!(output.iter().all(|&p| p == 0x0000FF));
    }

    // ---- route_mouse tests ----

    #[test]
    fn route_mouse_hits_window() {
        let mut table = WindowTable::new();
        // 64x64 window at (0,0)
        table.add(WindowEntry::new(1, 0, 0, 64, 64, 0));

        let routed = route_mouse(&table, 32, 32).unwrap();
        assert_eq!(routed.target_vm_id, 1);
        // 32/64 * 256 = 128
        assert_eq!(routed.vm_mouse_x, 128);
        assert_eq!(routed.vm_mouse_y, 128);
    }

    #[test]
    fn route_mouse_miss() {
        let mut table = WindowTable::new();
        table.add(WindowEntry::new(1, 0, 0, 64, 64, 0));

        assert!(route_mouse(&table, 100, 100).is_none());
    }

    #[test]
    fn route_mouse_offset_window() {
        let mut table = WindowTable::new();
        // 32x32 window at (100, 50)
        table.add(WindowEntry::new(2, 100, 50, 32, 32, 0));

        // Click at global (116, 66) -> local (16, 16) -> VM (128, 128)
        let routed = route_mouse(&table, 116, 66).unwrap();
        assert_eq!(routed.target_vm_id, 2);
        assert_eq!(routed.vm_mouse_x, 128);
        assert_eq!(routed.vm_mouse_y, 128);
    }

    #[test]
    fn route_mouse_overlapping_picks_topmost() {
        let mut table = WindowTable::new();
        table.add(WindowEntry::new(1, 0, 0, 100, 100, 0)); // background
        table.add(WindowEntry::new(2, 0, 0, 100, 100, 1)); // foreground

        let routed = route_mouse(&table, 50, 50).unwrap();
        assert_eq!(routed.target_vm_id, 2); // topmost
    }

    #[test]
    fn route_mouse_hidden_window_skipped() {
        let mut table = WindowTable::new();
        let mut hidden = WindowEntry::new(1, 0, 0, 100, 100, 1);
        hidden.visible = false;
        table.add(hidden);
        table.add(WindowEntry::new(2, 0, 0, 100, 100, 0));

        let routed = route_mouse(&table, 50, 50).unwrap();
        assert_eq!(routed.target_vm_id, 2);
    }

    #[test]
    fn route_mouse_edge_pixel() {
        let mut table = WindowTable::new();
        // 256x256 window at (0,0) -- 1:1 mapping
        table.add(WindowEntry::new(1, 0, 0, 256, 256, 0));

        let routed = route_mouse(&table, 255, 255).unwrap();
        assert_eq!(routed.vm_mouse_x, 255);
        assert_eq!(routed.vm_mouse_y, 255);
    }

    #[test]
    fn route_mouse_top_left_corner() {
        let mut table = WindowTable::new();
        table.add(WindowEntry::new(1, 10, 20, 64, 64, 0));

        // Click at exact top-left of window
        let routed = route_mouse(&table, 10, 20).unwrap();
        assert_eq!(routed.target_vm_id, 1);
        assert_eq!(routed.vm_mouse_x, 0);
        assert_eq!(routed.vm_mouse_y, 0);
    }

    // ---- Focus tracking tests ----

    #[test]
    fn focus_auto_set_on_first_window() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert_eq!(t.focused_vm_id(), Some(1));
    }

    #[test]
    fn focus_not_changed_by_second_window() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 32, 0, 32, 32, 1));
        assert_eq!(t.focused_vm_id(), Some(1)); // first still focused
    }

    #[test]
    fn focus_transfers_on_remove() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0)); // focused
        t.add(WindowEntry::new(2, 32, 0, 32, 32, 1)); // higher z
        t.remove(1); // remove focused -> transfer to highest z visible
        assert_eq!(t.focused_vm_id(), Some(2));
    }

    #[test]
    fn focus_clears_when_last_removed() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.remove(1);
        assert_eq!(t.focused_vm_id(), None);
    }

    #[test]
    fn set_focus_to_visible_window() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 32, 0, 32, 32, 1));
        assert!(t.set_focus(2));
        assert_eq!(t.focused_vm_id(), Some(2));
    }

    #[test]
    fn set_focus_rejects_hidden_window() {
        let mut t = WindowTable::new();
        let mut hidden = WindowEntry::new(2, 32, 0, 32, 32, 1);
        hidden.visible = false;
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(hidden);
        assert!(!t.set_focus(2));
        assert_eq!(t.focused_vm_id(), Some(1)); // unchanged
    }

    #[test]
    fn set_focus_rejects_nonexistent() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert!(!t.set_focus(999));
    }

    #[test]
    fn bring_to_front_sets_focus() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        t.add(WindowEntry::new(2, 0, 0, 32, 32, 1));
        // Initially focused on first
        assert_eq!(t.focused_vm_id(), Some(1));
        // Bring window 2 to front
        t.bring_to_front(2);
        assert_eq!(t.focused_vm_id(), Some(2));
    }

    #[test]
    fn click_focus_combines_hit_and_focus() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 64, 64, 0));
        t.add(WindowEntry::new(2, 64, 0, 64, 64, 1));

        // Focus starts on 1
        assert_eq!(t.focused_vm_id(), Some(1));

        // Click in window 2's area
        let routed = t.click_focus(100, 32).unwrap();
        assert_eq!(routed.target_vm_id, 2);
        assert_eq!(t.focused_vm_id(), Some(2));

        // Click in window 1's area
        let routed = t.click_focus(32, 32).unwrap();
        assert_eq!(routed.target_vm_id, 1);
        assert_eq!(t.focused_vm_id(), Some(1));
    }

    #[test]
    fn click_focus_desktop_returns_none() {
        let mut t = WindowTable::new();
        t.add(WindowEntry::new(1, 0, 0, 32, 32, 0));
        assert!(t.click_focus(100, 100).is_none());
    }
}