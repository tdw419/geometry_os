/**
 * WidgetInteractionManager - Handles mouse/keyboard interactions for GPU-rendered UI
 *
 * Coordinates between CPU hit-testing and GPU uniform buffer updates for
 * real-time visual feedback (hover, focus, pressed states).
 */
export class WidgetInteractionManager {
  /**
   * @param {Object} options - Configuration options
   * @param {HTMLCanvasElement} options.canvas - The canvas element
   * @param {GPUDevice} options.device - WebGPU device
   * @param {GPUBuffer} options.uniformBuffer - Uniform buffer for shader uniforms
   * @param {Array<Object>} options.widgets - Array of widget definitions with bbox and action
   * @param {Object} options.callbacks - Callback functions
   * @param {Function} [options.callbacks.onHover] - Called when hover state changes
   * @param {Function} [options.callbacks.onClick] - Called when widget is clicked
   * @param {Function} [options.callbacks.onFocus] - Called when focus state changes
   */
  constructor({ canvas, device, uniformBuffer, widgets, callbacks = {} }) {
    // Store references
    this._canvas = canvas;
    this._device = device;
    this._uniformBuffer = uniformBuffer;
    this._widgets = widgets || [];

    // Callbacks
    this._callbacks = callbacks;

    // Interaction state
    this._hoveredWidget = null;
    this._focusedIndex = -1;
    this._mousePressed = false;
    this._mouseX = 0;
    this._mouseY = 0;

    // Filter clickable widgets (those with action field)
    this._clickableWidgets = this._widgets.filter(w => w.action);

    // Event handler references for cleanup
    this._boundHandlers = {
      mousemove: this._onMouseMove.bind(this),
      mousedown: this._onMouseDown.bind(this),
      mouseup: this._onMouseUp.bind(this),
      keydown: this._onKeyDown.bind(this)
    };

    // Bind event listeners (skip if canvas doesn't support addEventListener - mock mode)
    if (this._canvas && typeof this._canvas.addEventListener === 'function') {
      this._canvas.addEventListener('mousemove', this._boundHandlers.mousemove);
      this._canvas.addEventListener('mousedown', this._boundHandlers.mousedown);
      this._canvas.addEventListener('mouseup', this._boundHandlers.mouseup);
      this._canvas.addEventListener('keydown', this._boundHandlers.keydown);
      // Make canvas focusable for keyboard events
      this._canvas.setAttribute('tabindex', '0');
    }
  }

  /**
   * Handle keyboard events for navigation and activation
   * @param {KeyboardEvent} e - Keyboard event
   * @private
   */
  _onKeyDown(e) {
    // Tab key: move focus to next widget
    if (e.key === 'Tab') {
      e.preventDefault();
      if (e.shiftKey) {
        this.focusPrev();
      } else {
        this.focusNext();
      }
      return;
    }

    // Enter key: activate focused widget
    if (e.key === 'Enter') {
      const focusedWidget = this._clickableWidgets[this._focusedIndex];
      if (focusedWidget && this._callbacks.onClick) {
        // Use center of focused widget as click coordinates
        const bbox = focusedWidget.bbox;
        const x = (bbox[0] + bbox[2]) / 2;
        const y = (bbox[1] + bbox[3]) / 2;
        this._callbacks.onClick(focusedWidget, x, y);
      }
      return;
    }
  }

  /**
   * Handle mouse move events
   * @param {MouseEvent} e - Mouse event
   * @private
   */
  _onMouseMove(e) {
    const coords = this._getCanvasCoords(e);
    const widget = this.hitTest(coords.x, coords.y);

    // Update mouse position
    this._mouseX = coords.x;
    this._mouseY = coords.y;

    // Check if hover state changed
    const prevHovered = this._hoveredWidget;
    this._hoveredWidget = widget;

    // Update cursor based on whether we're over a clickable widget
    this._updateCursor(widget);

    // Update uniform buffer with new mouse position
    this._updateUniformBuffer();

    // Call onHover callback if hover state changed
    if (prevHovered !== widget && this._callbacks.onHover) {
      this._callbacks.onHover(widget, coords.x, coords.y);
    }
  }

  /**
   * Handle mouse down events
   * @param {MouseEvent} e - Mouse event
   * @private
   */
  _onMouseDown(e) {
    this._mousePressed = true;

    // Update uniform buffer with pressed state
    this._updateUniformBuffer();

    // Update cursor to indicate pressed state
    if (this._hoveredWidget && this._hoveredWidget.action) {
      this._canvas.style.cursor = 'pointer';
    }
  }

  /**
   * Handle mouse up events
   * @param {MouseEvent} e - Mouse event
   * @private
   */
  _onMouseUp(e) {
    const wasPressed = this._mousePressed;
    this._mousePressed = false;

    // Update uniform buffer with released state
    this._updateUniformBuffer();

    // If mouse was pressed and released over a widget, trigger click
    if (wasPressed && this._hoveredWidget && this._callbacks.onClick) {
      const coords = this._getCanvasCoords(e);
      this._callbacks.onClick(this._hoveredWidget, coords.x, coords.y);
    }

    // Restore cursor
    this._updateCursor(this._hoveredWidget);
  }

  /**
   * Update cursor style based on hovered widget
   * @param {Object|null} widget - Currently hovered widget
   * @private
   */
  _updateCursor(widget) {
    if (widget && widget.action) {
      this._canvas.style.cursor = 'pointer';
    } else {
      this._canvas.style.cursor = 'default';
    }
  }

  /**
   * Remove all event listeners and clean up
   */
  destroy() {
    if (this._boundHandlers.mousemove) {
      this._canvas.removeEventListener('mousemove', this._boundHandlers.mousemove);
    }
    if (this._boundHandlers.mousedown) {
      this._canvas.removeEventListener('mousedown', this._boundHandlers.mousedown);
    }
    if (this._boundHandlers.mouseup) {
      this._canvas.removeEventListener('mouseup', this._boundHandlers.mouseup);
    }
    if (this._boundHandlers.keydown) {
      this._canvas.removeEventListener('keydown', this._boundHandlers.keydown);
    }

    // Clear state
    this._hoveredWidget = null;
    this._mousePressed = false;
    this._boundHandlers = {};
  }

  /**
   * Normalize mouse event coordinates to canvas pixel coordinates
   * @param {MouseEvent} e - Mouse event
   * @returns {{x: number, y: number}} Canvas pixel coordinates
   * @private
   */
  _getCanvasCoords(e) {
    const rect = this._canvas.getBoundingClientRect();
    const scaleX = this._canvas.width / rect.width;
    const scaleY = this._canvas.height / rect.height;

    return {
      x: (e.clientX - rect.left) * scaleX,
      y: (e.clientY - rect.top) * scaleY
    };
  }

  /**
   * Get the currently hovered widget
   * @returns {Object|null} Hovered widget or null
   */
  get hoveredWidget() {
    return this._hoveredWidget;
  }

  /**
   * Get the currently focused widget index
   * @returns {number} Index in clickableWidgets array
   */
  get focusedIndex() {
    return this._focusedIndex;
  }

  /**
   * Get mouse pressed state
   * @returns {boolean} True if mouse button is pressed
   */
  get mousePressed() {
    return this._mousePressed;
  }

  /**
   * Get clickable widgets array
   * @returns {Array<Object>} Widgets with action field
   */
  get clickableWidgets() {
    return this._clickableWidgets;
  }

  /**
   * Update mouse position and pressed state, then write to uniform buffer
   * @param {number} x - Mouse X coordinate in canvas pixels
   * @param {number} y - Mouse Y coordinate in canvas pixels
   * @param {boolean} pressed - Whether mouse button is pressed
   */
  updateMouse(x, y, pressed) {
    this._mousePressed = pressed;
    this._mouseX = x;
    this._mouseY = y;
    this._updateUniformBuffer();
  }

  /**
   * Write uniform data to GPU buffer
   * Layout: [time, mouse_pressed, mouse_x, mouse_y, resolution_x, resolution_y, focused_widget, pad]
   * Total: 8 floats = 32 bytes (16-byte aligned)
   * @private
   */
  _updateUniformBuffer() {
    // Create uniform data array
    const uniformData = new Float32Array(8);

    // Time (could be passed in or use performance.now())
    uniformData[0] = performance.now() / 1000.0;

    // Mouse pressed state (0.0 or 1.0)
    uniformData[1] = this._mousePressed ? 1.0 : 0.0;

    // Mouse coordinates
    uniformData[2] = this._mouseX || 0;
    uniformData[3] = this._mouseY || 0;

    // Canvas resolution
    uniformData[4] = this._canvas?.width || 0;
    uniformData[5] = this._canvas?.height || 0;

    // Focused widget index
    uniformData[6] = this._focusedIndex;

    // Padding for alignment
    uniformData[7] = 0.0;

    // Write to GPU buffer if available
    if (this._uniformBuffer && typeof this._uniformBuffer.write === 'function') {
      // Mock mode: write(offset, data) where data is Float32Array with .buffer property
      // Real WebGPU uses queue.writeBuffer, but mock mode has buffer.write for testing
      this._uniformBuffer.write(0, uniformData);
    } else if (this._uniformBuffer && this._device?.queue?.writeBuffer) {
      // Real WebGPU: use queue.writeBuffer if buffer.write not available
      this._device.queue.writeBuffer(this._uniformBuffer, 0, uniformData.buffer);
    }
    // If neither is available, data is still available in uniformData
    // for testing purposes
  }

  /**
   * Move focus to next clickable widget (Tab navigation)
   * Cycles through clickableWidgets array with wrap-around
   * Calls onFocus callback with newly focused widget
   */
  focusNext() {
    // Edge case: no clickable widgets
    if (!this._clickableWidgets || this._clickableWidgets.length === 0) {
      return;
    }

    // Move to next with wrap-around
    this._focusedIndex = (this._focusedIndex + 1) % this._clickableWidgets.length;

    // Update uniform buffer with new focus index
    this._updateUniformBuffer();

    // Call onFocus callback with newly focused widget
    if (this._callbacks.onFocus) {
      const focusedWidget = this._clickableWidgets[this._focusedIndex];
      this._callbacks.onFocus(focusedWidget, this._focusedIndex);
    }
  }

  /**
   * Move focus to previous clickable widget (Shift+Tab navigation)
   * Cycles through clickableWidgets array with wrap-around
   * Calls onFocus callback with newly focused widget
   */
  focusPrev() {
    // Edge case: no clickable widgets
    if (!this._clickableWidgets || this._clickableWidgets.length === 0) {
      return;
    }

    // Move to previous with wrap-around
    const length = this._clickableWidgets.length;
    this._focusedIndex = (this._focusedIndex - 1 + length) % length;

    // Update uniform buffer with new focus index
    this._updateUniformBuffer();

    // Call onFocus callback with newly focused widget
    if (this._callbacks.onFocus) {
      const focusedWidget = this._clickableWidgets[this._focusedIndex];
      this._callbacks.onFocus(focusedWidget, this._focusedIndex);
    }
  }

  /**
   * Test if a point (x, y) is inside any widget's bounding box
   * @param {number} x - X coordinate in canvas pixels
   * @param {number} y - Y coordinate in canvas pixels
   * @returns {Object|null} First matching widget (topmost) or null if no hit
   */
  hitTest(x, y) {
    // Handle edge cases: null/undefined coords
    if (x == null || y == null) {
      return null;
    }

    // Handle edge case: empty widgets array
    if (!this._clickableWidgets || this._clickableWidgets.length === 0) {
      return null;
    }

    // Iterate widgets in order (render order = z-order, first = topmost)
    for (const widget of this._clickableWidgets) {
      const bbox = widget.bbox;
      if (!bbox || bbox.length < 4) {
        continue; // Skip widgets without valid bbox
      }

      const [x1, y1, x2, y2] = bbox;

      // Check if (x, y) is inside bbox [x1, y1, x2, y2]
      if (x >= x1 && x <= x2 && y >= y1 && y <= y2) {
        return widget;
      }
    }

    return null;
  }
}
