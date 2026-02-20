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

    // Filter clickable widgets (those with action field)
    this._clickableWidgets = this._widgets.filter(w => w.action);

    // Event handler references for cleanup
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
}
