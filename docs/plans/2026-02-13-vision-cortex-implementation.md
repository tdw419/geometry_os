# Vision Cortex Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable AI agents to read GUI text via structured WebMCP tool calls using client-side Tesseract.js OCR.

**Architecture:** VisionCortex module encapsulates Tesseract.js WASM OCR with region-based caching. Three WebMCP tools (hypervisor_read_text, hypervisor_find_element, hypervisor_frame) expose OCR capabilities to AI agents through the existing webmcp_bridge.js infrastructure.

**Tech Stack:** JavaScript ES6+, Tesseract.js 5.x (WASM), Web Workers, Canvas API

---

## Task 1: Create VisionCortex Module Skeleton

**Files:**
- Create: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Create module file with class skeleton**

Create `systems/visual_shell/web/VisionCortex.js`:

```javascript
/**
 * VisionCortex - Client-side OCR for AI GUI Operation
 *
 * Uses Tesseract.js (WASM) for text recognition from GPU framebuffer.
 * Implements the Semantic Perception model for WebMCP agents.
 *
 * @version 1.0.0
 * @date 2026-02-13
 */

class VisionCortex {
    // Configuration
    #config = {
        tesseractLang: 'eng',
        cacheTTL: 500,        // ms
        cacheMaxSize: 50,     // max cached regions
        defaultScale: 1.0,
        lazyLoad: true,
        workerPath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/worker.min.js',
        corePath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract-core.wasm.js',
        langPath: 'https://tessdata.projectnaptha.com/4.0.0'
    };

    // State
    #tesseractWorker = null;
    #textCache = new Map();
    #isLoading = false;
    #isReady = false;
    #cacheOrder = [];  // For LRU eviction

    constructor(config = {}) {
        this.#config = { ...this.#config, ...config };
        console.log('[VisionCortex] Initialized with config:', this.#config);
    }

    // Public API (stubs - will implement in later tasks)
    async initialize() {
        throw new Error('Not implemented');
    }

    async recognize(canvas, region, options = {}) {
        throw new Error('Not implemented');
    }

    async findElement(label, type, options = {}) {
        throw new Error('Not implemented');
    }

    async getSemanticFrame(canvas) {
        throw new Error('Not implemented');
    }

    clearCache() {
        this.#textCache.clear();
        this.#cacheOrder = [];
    }

    get isReady() {
        return this.#isReady;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = VisionCortex;
}
```

**Step 2: Verify file exists**

Run: `ls -la systems/visual_shell/web/VisionCortex.js`
Expected: File listed with ~60 lines

**Step 3: Commit skeleton**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): add VisionCortex module skeleton

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Implement Tesseract.js Initialization (Lazy Loading)

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Update initialize() method**

Replace the `initialize()` stub with:

```javascript
    /**
     * Initialize Tesseract.js worker (lazy loaded on first OCR call)
     * @returns {Promise<void>}
     */
    async initialize() {
        if (this.#isReady) {
            console.log('[VisionCortex] Already initialized');
            return;
        }

        if (this.#isLoading) {
            // Wait for existing initialization
            console.log('[VisionCortex] Waiting for existing initialization...');
            while (this.#isLoading) {
                await new Promise(resolve => setTimeout(resolve, 100));
            }
            return;
        }

        this.#isLoading = true;
        console.log('[VisionCortex] Loading Tesseract.js WASM...');

        try {
            // Dynamic import of Tesseract.js
            if (typeof Tesseract === 'undefined') {
                // Load from CDN if not already loaded
                await this.#loadTesseractScript();
            }

            // Create worker
            this.#tesseractWorker = await Tesseract.createWorker(this.#config.tesseractLang, 1, {
                workerPath: this.#config.workerPath,
                corePath: this.#config.corePath,
                langPath: this.#config.langPath,
                logger: m => {
                    if (m.status === 'recognizing text') {
                        console.log(`[VisionCortex] OCR progress: ${(m.progress * 100).toFixed(1)}%`);
                    }
                }
            });

            this.#isReady = true;
            console.log('[VisionCortex] Tesseract.js ready');

        } catch (error) {
            console.error('[VisionCortex] Failed to initialize Tesseract.js:', error);
            throw error;
        } finally {
            this.#isLoading = false;
        }
    }

    /**
     * Load Tesseract.js script from CDN
     * @returns {Promise<void>}
     */
    async #loadTesseractScript() {
        return new Promise((resolve, reject) => {
            const script = document.createElement('script');
            script.src = 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js';
            script.onload = () => {
                console.log('[VisionCortex] Tesseract.js script loaded');
                resolve();
            };
            script.onerror = () => {
                reject(new Error('Failed to load Tesseract.js from CDN'));
            };
            document.head.appendChild(script);
        });
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/VisionCortex.js 2>&1 || echo "Note: Browser-only code, check in browser"`
Expected: Either syntax OK or note about browser-only (acceptable)

**Step 3: Commit initialization**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): implement lazy Tesseract.js initialization

- Load Tesseract.js from CDN on first use
- Create WASM worker with configurable paths
- Prevent duplicate initialization with loading flag

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Implement Region Caching

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Add cache helper methods**

Add these private methods before the `initialize()` method:

```javascript
    /**
     * Generate hash for canvas region (for cache key)
     */
    #hashRegion(canvas, region) {
        const ctx = canvas.getContext('2d');
        if (!ctx) return null;

        const { x, y, width, height } = region;
        const imageData = ctx.getImageData(x, y, width, height);
        const data = imageData.data;

        // Fast hash using corners and dimensions
        // This catches most changes without hashing entire region
        const sampleSize = Math.min(100, data.length);
        const step = Math.floor(data.length / sampleSize);
        let hash = `${width}x${height}:`;

        for (let i = 0; i < data.length; i += step) {
            hash += data[i].toString(16);
        }

        return hash;
    }

    /**
     * Get cached result if available and not expired
     */
    #getCached(hash) {
        const cached = this.#textCache.get(hash);
        if (!cached) return null;

        if (Date.now() - cached.timestamp > this.#config.cacheTTL) {
            this.#textCache.delete(hash);
            this.#cacheOrder = this.#cacheOrder.filter(h => h !== hash);
            return null;
        }

        return cached.result;
    }

    /**
     * Store result in cache with LRU eviction
     */
    #setCache(hash, result) {
        // Evict oldest if at capacity
        while (this.#textCache.size >= this.#config.cacheMaxSize) {
            const oldest = this.#cacheOrder.shift();
            if (oldest) {
                this.#textCache.delete(oldest);
            }
        }

        this.#textCache.set(hash, {
            result,
            timestamp: Date.now()
        });
        this.#cacheOrder.push(hash);
    }
```

**Step 2: Commit caching**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): implement region-based caching

- Hash canvas regions for cache keys
- LRU eviction at max capacity
- TTL-based expiration

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Implement Scale Parameter and Canvas Helpers

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Add canvas manipulation helpers**

Add these private methods after the cache helpers:

```javascript
    /**
     * Scale canvas for better OCR on pixel fonts or high-DPI
     * @param {HTMLCanvasElement} canvas
     * @param {number} scale
     * @returns {HTMLCanvasElement}
     */
    #scaleCanvas(canvas, scale) {
        if (scale === 1.0) return canvas;

        const scaled = document.createElement('canvas');
        scaled.width = Math.floor(canvas.width * scale);
        scaled.height = Math.floor(canvas.height * scale);

        const ctx = scaled.getContext('2d');
        ctx.imageSmoothingEnabled = scale < 1.0; // Smooth for downscale only
        ctx.drawImage(canvas, 0, 0, scaled.width, scaled.height);

        return scaled;
    }

    /**
     * Extract region from canvas
     * @param {HTMLCanvasElement} canvas
     * @param {Object} region
     * @returns {HTMLCanvasElement}
     */
    #extractRegion(canvas, region) {
        if (!region) return canvas;

        const { x, y, width, height } = region;
        const extracted = document.createElement('canvas');
        extracted.width = width;
        extracted.height = height;

        const ctx = extracted.getContext('2d');
        ctx.drawImage(canvas, x, y, width, height, 0, 0, width, height);

        return extracted;
    }

    /**
     * Normalize bounds from scaled coordinates back to original
     */
    #unscaleBounds(bounds, scale) {
        return {
            x: Math.floor(bounds.x / scale),
            y: Math.floor(bounds.y / scale),
            width: Math.floor(bounds.width / scale),
            height: Math.floor(bounds.height / scale)
        };
    }
```

**Step 2: Commit helpers**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): add canvas scaling and region extraction

- Scale parameter for pixel font OCR (2.0) and high-DPI (0.5)
- Extract arbitrary regions from framebuffer
- Unscale bounds back to original coordinates

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Implement recognize() Method

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Replace recognize() stub with implementation**

Replace the `recognize()` stub with:

```javascript
    /**
     * Perform OCR on canvas region
     * @param {HTMLCanvasElement} canvas - Source canvas (framebuffer)
     * @param {Object} region - Optional region {x, y, width, height}
     * @param {Object} options - {scale, lang}
     * @returns {Promise<Object>}
     */
    async recognize(canvas, region = null, options = {}) {
        const scale = options.scale || this.#config.defaultScale;
        const startTime = performance.now();

        try {
            // Validate canvas
            if (!canvas || !(canvas instanceof HTMLCanvasElement)) {
                throw new Error('Invalid canvas: expected HTMLCanvasElement');
            }

            // Default to full canvas
            const targetRegion = region || {
                x: 0,
                y: 0,
                width: canvas.width,
                height: canvas.height
            };

            // Check cache
            const hash = this.#hashRegion(canvas, targetRegion);
            if (hash) {
                const cached = this.#getCached(hash);
                if (cached) {
                    console.log('[VisionCortex] Cache hit for region');
                    return {
                        ...cached,
                        fromCache: true,
                        processing_time_ms: performance.now() - startTime
                    };
                }
            }

            // Ensure Tesseract is ready (lazy load)
            if (!this.#isReady) {
                await this.initialize();
            }

            // Prepare image for OCR
            const regionCanvas = this.#extractRegion(canvas, targetRegion);
            const scaledCanvas = this.#scaleCanvas(regionCanvas, scale);

            // Run OCR
            console.log(`[VisionCortex] Running OCR on region ${targetRegion.width}x${targetRegion.height} at scale ${scale}`);
            const result = await this.#tesseractWorker.recognize(scaledCanvas);

            // Process results
            const output = {
                success: true,
                text: result.data.text,
                confidence: result.data.confidence / 100, // Normalize to 0-1
                regions: result.data.words.map(word => ({
                    text: word.text,
                    bounds: this.#unscaleBounds({
                        x: word.bbox.x0,
                        y: word.bbox.y0,
                        width: word.bbox.x1 - word.bbox.x0,
                        height: word.bbox.y1 - word.bbox.y0
                    }, scale),
                    confidence: word.confidence / 100
                })),
                processing_time_ms: performance.now() - startTime,
                fromCache: false
            };

            // Cache result
            if (hash) {
                this.#setCache(hash, output);
            }

            console.log(`[VisionCortex] OCR complete: ${output.regions.length} words, confidence ${(output.confidence * 100).toFixed(1)}%`);
            return output;

        } catch (error) {
            console.error('[VisionCortex] OCR failed:', error);
            return {
                success: false,
                error: error.message,
                text: '',
                confidence: 0,
                regions: [],
                processing_time_ms: performance.now() - startTime
            };
        }
    }
```

**Step 2: Commit recognize()**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): implement recognize() OCR method

- Full OCR pipeline with Tesseract.js
- Cache results with region hashing
- Scale parameter for pixel fonts
- Detailed error handling

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Implement findElement() Method

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Replace findElement() stub with implementation**

Replace the `findElement()` stub with:

```javascript
    /**
     * Find UI elements by label
     * @param {string} label - Text to search for (fuzzy match)
     * @param {string} type - Element type: button, text, link, window, any
     * @param {HTMLCanvasElement} canvas - Source canvas
     * @param {Object} options - {exact, scale}
     * @returns {Promise<Object>}
     */
    async findElement(label, type = 'any', canvas, options = {}) {
        if (!canvas) {
            return {
                success: false,
                error: 'Canvas required',
                found: false,
                elements: []
            };
        }

        // Get OCR results
        const ocrResult = await this.recognize(canvas, null, { scale: options.scale });

        if (!ocrResult.success) {
            return {
                success: false,
                error: ocrResult.error,
                found: false,
                elements: []
            };
        }

        const searchLabel = label.toLowerCase();
        const exact = options.exact || false;

        // Find matching regions
        const matches = ocrResult.regions.filter(region => {
            const regionText = region.text.toLowerCase().trim();
            if (exact) {
                return regionText === searchLabel;
            }
            // Fuzzy match: contains or is contained by
            return regionText.includes(searchLabel) || searchLabel.includes(regionText);
        });

        // Process by type
        const elements = matches.map(match => {
            const element = {
                label: match.text,
                type: this.#detectElementType(match, type),
                bounds: match.bounds,
                center: {
                    x: match.bounds.x + Math.floor(match.bounds.width / 2),
                    y: match.bounds.y + Math.floor(match.bounds.height / 2)
                },
                confidence: match.confidence
            };

            // Expand bounds for buttons (add padding for click target)
            if (element.type === 'button') {
                element.clickBounds = {
                    x: Math.max(0, element.bounds.x - 4),
                    y: Math.max(0, element.bounds.y - 4),
                    width: element.bounds.width + 8,
                    height: element.bounds.height + 8
                };
            }

            return element;
        }).filter(el => type === 'any' || el.type === type);

        // Generate suggestions if not found
        let suggestion = null;
        if (elements.length === 0) {
            const allLabels = [...new Set(ocrResult.regions.map(r => r.text.trim()))];
            const similar = this.#findSimilarLabels(searchLabel, allLabels);
            suggestion = `No elements matching '${label}' found.` +
                (similar.length > 0 ? ` Similar: ${similar.join(', ')}` : '');
        }

        return {
            success: true,
            found: elements.length > 0,
            elements,
            count: elements.length,
            suggestion
        };
    }

    /**
     * Detect element type from OCR region
     */
    #detectElementType(region, requestedType) {
        const text = region.text.toLowerCase();

        // Button heuristics
        const buttonWords = ['ok', 'cancel', 'submit', 'login', 'logout', 'save', 'delete', 'yes', 'no', 'apply', 'close'];
        if (buttonWords.includes(text)) return 'button';

        // Link heuristics (URLs, starts with http)
        if (text.startsWith('http') || text.includes('://')) return 'link';

        // Default to text
        return 'text';
    }

    /**
     * Find similar labels for suggestions
     */
    #findSimilarLabels(search, labels) {
        return labels
            .filter(label => {
                const l = label.toLowerCase();
                // Levenshtein-like: check for common substrings
                return l.includes(search.substring(0, 3)) ||
                       search.includes(l.substring(0, 3));
            })
            .slice(0, 3);
    }
```

**Step 2: Commit findElement()**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): implement findElement() for semantic search

- Fuzzy and exact label matching
- Element type detection (button, text, link)
- Click bounds expansion for buttons
- Similar label suggestions when not found

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Implement getSemanticFrame() Method

**Files:**
- Modify: `systems/visual_shell/web/VisionCortex.js`

**Step 1: Replace getSemanticFrame() stub with implementation**

Replace the `getSemanticFrame()` stub with:

```javascript
    /**
     * Get structured semantic representation of screen
     * @param {HTMLCanvasElement} canvas - Source canvas
     * @param {Object} options - {scale}
     * @returns {Promise<Object>}
     */
    async getSemanticFrame(canvas, options = {}) {
        if (!canvas) {
            return {
                success: false,
                error: 'Canvas required',
                format: 'semantic'
            };
        }

        const startTime = performance.now();

        // Get OCR results
        const ocrResult = await this.recognize(canvas, null, { scale: options.scale });

        if (!ocrResult.success) {
            return {
                success: false,
                error: ocrResult.error,
                format: 'semantic'
            };
        }

        // Parse into semantic structures
        const semantic = {
            success: true,
            format: 'semantic',
            timestamp: Date.now(),
            screen: {
                width: canvas.width,
                height: canvas.height
            },
            windows: this.#parseWindows(ocrResult.regions),
            buttons: this.#parseButtons(ocrResult.regions),
            text_fields: this.#parseTextFields(ocrResult.regions),
            text_content: ocrResult.text,
            processing_time_ms: performance.now() - startTime
        };

        return semantic;
    }

    /**
     * Parse window-like structures from OCR regions
     */
    #parseWindows(regions) {
        const windows = [];

        // Look for title bar patterns (centered text at top of regions)
        const titleCandidates = regions.filter(r =>
            r.text.length > 3 &&
            r.text.length < 50 &&
            !r.text.includes('\n') &&
            r.confidence > 0.8
        );

        // Group by vertical position (potential title bars)
        const titleGroups = new Map();
        for (const title of titleCandidates) {
            const yBucket = Math.floor(title.bounds.y / 50) * 50;
            if (!titleGroups.has(yBucket)) {
                titleGroups.set(yBucket, []);
            }
            titleGroups.get(yBucket).push(title);
        }

        // Convert to window objects
        for (const [yBucket, titles] of titleGroups) {
            for (const title of titles) {
                windows.push({
                    id: `win_${windows.length}`,
                    title: title.text,
                    bounds: {
                        x: title.bounds.x - 20,
                        y: Math.max(0, title.bounds.y - 20),
                        width: title.bounds.width + 40,
                        height: 400 // Estimate
                    },
                    focused: windows.length === 0 // First window is focused
                });
            }
        }

        return windows;
    }

    /**
     * Parse button-like structures
     */
    #parseButtons(regions) {
        const buttonWords = ['ok', 'cancel', 'submit', 'login', 'logout', 'save', 'delete', 'yes', 'no', 'apply', 'close', 'open', 'edit', 'view', 'help'];

        return regions
            .filter(r => {
                const text = r.text.toLowerCase().trim();
                return buttonWords.includes(text) ||
                       (r.confidence > 0.9 && text.length < 20);
            })
            .map(r => ({
                label: r.text,
                bounds: r.bounds,
                enabled: true // Assume enabled unless we detect otherwise
            }));
    }

    /**
     * Parse text field structures
     */
    #parseTextFields(regions) {
        // Look for input field labels (followed by empty space or cursor)
        const fieldLabels = ['search', 'input', 'name', 'email', 'password', 'address', 'url', 'query'];

        return regions
            .filter(r => {
                const text = r.text.toLowerCase().trim();
                return fieldLabels.some(label => text.includes(label));
            })
            .map(r => ({
                label: r.text,
                bounds: {
                    x: r.bounds.x + r.bounds.width + 5,
                    y: r.bounds.y,
                    width: 200,
                    height: r.bounds.height + 4
                },
                value: '',
                focused: false
            }));
    }
```

**Step 2: Commit getSemanticFrame()**

```bash
git add systems/visual_shell/web/VisionCortex.js
git commit -m "feat(vision): implement getSemanticFrame() for structured UI

- Parse OCR results into windows, buttons, text_fields
- Window detection from title bar patterns
- Button detection from action words
- Text field detection from label patterns

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 8: Wire VisionCortex into WebMCP Bridge

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add VisionCortex import and initialization**

Find the class properties section (around line 100) and add:

```javascript
    /** @type {VisionCortex|null} */
    #visionCortex = null;
```

Find the constructor or `#init()` method and add initialization:

```javascript
        // Initialize VisionCortex (lazy - won't load Tesseract until first use)
        this.#visionCortex = new VisionCortex({
            cacheTTL: 500,
            cacheMaxSize: 50,
            defaultScale: 1.0,
            lazyLoad: true
        });
```

**Step 2: Add hypervisor_read_text tool registration**

Find the tool registration section and add:

```javascript
    async #registerHypervisorReadText() {
        const tool = {
            name: 'hypervisor_read_text',
            description: 'Read text content from the framebuffer using OCR. Returns structured text with bounding boxes.',
            inputSchema: {
                type: 'object',
                properties: {
                    region: {
                        type: 'object',
                        properties: {
                            x: { type: 'number', description: 'Region X offset' },
                            y: { type: 'number', description: 'Region Y offset' },
                            width: { type: 'number', description: 'Region width' },
                            height: { type: 'number', description: 'Region height' }
                        },
                        description: 'Screen region to read. Defaults to full screen.'
                    },
                    scale: {
                        type: 'number',
                        default: 1.0,
                        description: 'Scale factor. Use 2.0 for pixel fonts, 0.5 for high-DPI.'
                    }
                }
            }
        };

        this.#tools.set('hypervisor_read_text', {
            tool,
            handler: async (params) => {
                const canvas = this.#getFramebuffer();
                if (!canvas) {
                    return { success: false, error: 'Framebuffer not available' };
                }

                return await this.#visionCortex.recognize(canvas, params.region, params);
            }
        });

        await this.#registerTool(tool);
    }
```

**Step 3: Add hypervisor_find_element tool registration**

```javascript
    async #registerHypervisorFindElement() {
        const tool = {
            name: 'hypervisor_find_element',
            description: 'Find UI elements by label. Returns element bounds for clicking.',
            inputSchema: {
                type: 'object',
                properties: {
                    label: {
                        type: 'string',
                        description: 'Text label to search for'
                    },
                    type: {
                        type: 'string',
                        enum: ['button', 'text', 'link', 'window', 'any'],
                        default: 'any',
                        description: 'Element type to filter by'
                    },
                    exact: {
                        type: 'boolean',
                        default: false,
                        description: 'Require exact label match'
                    },
                    scale: {
                        type: 'number',
                        default: 1.0,
                        description: 'OCR scale factor'
                    }
                },
                required: ['label']
            }
        };

        this.#tools.set('hypervisor_find_element', {
            tool,
            handler: async (params) => {
                const canvas = this.#getFramebuffer();
                if (!canvas) {
                    return { success: false, error: 'Framebuffer not available' };
                }

                return await this.#visionCortex.findElement(
                    params.label,
                    params.type || 'any',
                    canvas,
                    params
                );
            }
        });

        await this.#registerTool(tool);
    }
```

**Step 4: Add hypervisor_frame semantic format support**

Find the existing `hypervisor_frame` or `get_os_state` tool and update it, or add:

```javascript
    async #registerHypervisorFrame() {
        const tool = {
            name: 'hypervisor_frame',
            description: 'Get current screen state in structured format.',
            inputSchema: {
                type: 'object',
                properties: {
                    format: {
                        type: 'string',
                        enum: ['semantic', 'raw', 'both'],
                        default: 'semantic',
                        description: 'Output format'
                    },
                    scale: {
                        type: 'number',
                        default: 1.0,
                        description: 'OCR scale factor (for semantic format)'
                    }
                }
            }
        };

        this.#tools.set('hypervisor_frame', {
            tool,
            handler: async (params) => {
                const canvas = this.#getFramebuffer();
                if (!canvas) {
                    return { success: false, error: 'Framebuffer not available' };
                }

                const format = params.format || 'semantic';

                if (format === 'raw') {
                    return {
                        success: true,
                        format: 'raw',
                        image: canvas.toDataURL('image/png'),
                        width: canvas.width,
                        height: canvas.height
                    };
                }

                if (format === 'both') {
                    const semantic = await this.#visionCortex.getSemanticFrame(canvas, params);
                    return {
                        ...semantic,
                        image: canvas.toDataURL('image/png')
                    };
                }

                // Default: semantic
                return await this.#visionCortex.getSemanticFrame(canvas, params);
            }
        });

        await this.#registerTool(tool);
    }
```

**Step 5: Add #getFramebuffer() helper method**

```javascript
    /**
     * Get the GPU framebuffer as a canvas
     * @returns {HTMLCanvasElement|null}
     */
    #getFramebuffer() {
        // Try to get from app's GPU renderer
        if (this.#app && this.#app.getFramebuffer) {
            return this.#app.getFramebuffer();
        }

        // Fallback: try to find canvas in DOM
        const canvas = document.querySelector('#gpu-framebuffer') ||
                       document.querySelector('canvas');
        return canvas;
    }
```

**Step 6: Register tools in the initialization flow**

Find where other tools are registered and add calls:

```javascript
        // Vision Cortex tools
        await this.#registerHypervisorReadText();
        await this.#registerHypervisorFindElement();
        await this.#registerHypervisorFrame();
```

**Step 7: Commit WebMCP integration**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): integrate VisionCortex for AI GUI perception

- hypervisor_read_text: OCR text from framebuffer
- hypervisor_find_element: Find UI elements by label
- hypervisor_frame: Semantic and raw screen capture

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 9: Create Test Page

**Files:**
- Create: `systems/visual_shell/web/test_vision_cortex.html`

**Step 1: Create test HTML page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VisionCortex Test Page</title>
    <style>
        body {
            font-family: monospace;
            background: #1a1a2e;
            color: #eee;
            padding: 20px;
        }
        .container { max-width: 1200px; margin: 0 auto; }
        h1 { color: #4CAF50; }
        .section {
            background: #16213e;
            border: 1px solid #0f3460;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        canvas {
            border: 2px solid #0f3460;
            background: #000;
        }
        button {
            background: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 5px;
        }
        button:hover { background: #45a049; }
        button:disabled { background: #666; cursor: not-allowed; }
        .output {
            background: #0f0f23;
            border: 1px solid #0f3460;
            padding: 10px;
            margin-top: 10px;
            white-space: pre-wrap;
            font-size: 12px;
            max-height: 400px;
            overflow-y: auto;
        }
        .status { color: #4CAF50; }
        .error { color: #f44336; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🧠 VisionCortex Test Page</h1>

        <div class="section">
            <h2>1. Test Canvas (Simulated Framebuffer)</h2>
            <canvas id="testCanvas" width="640" height="400"></canvas>
            <br>
            <button onclick="drawTerminal()">Draw Terminal</button>
            <button onclick="drawGUI()">Draw GUI</button>
            <button onclick="drawPixelArt()">Draw Pixel Art</button>
        </div>

        <div class="section">
            <h2>2. Initialize VisionCortex</h2>
            <button id="initBtn" onclick="initVisionCortex()">Initialize Tesseract.js</button>
            <div id="initStatus" class="output"></div>
        </div>

        <div class="section">
            <h2>3. Test hypervisor_read_text</h2>
            <button onclick="testReadText()" id="readBtn" disabled>Read Text</button>
            <label>Scale: <input type="number" id="scaleInput" value="1.0" step="0.5" min="0.5" max="4"></label>
            <div id="readOutput" class="output"></div>
        </div>

        <div class="section">
            <h2>4. Test hypervisor_find_element</h2>
            <input type="text" id="labelInput" placeholder="Enter label (e.g., Login)" value="Login">
            <button onclick="testFindElement()" id="findBtn" disabled>Find Element</button>
            <div id="findOutput" class="output"></div>
        </div>

        <div class="section">
            <h2>5. Test hypervisor_frame (Semantic)</h2>
            <button onclick="testSemanticFrame()" id="frameBtn" disabled>Get Semantic Frame</button>
            <div id="frameOutput" class="output"></div>
        </div>
    </div>

    <script src="VisionCortex.js"></script>
    <script>
        let visionCortex = null;
        const canvas = document.getElementById('testCanvas');
        const ctx = canvas.getContext('2d');

        // Draw simulated terminal
        function drawTerminal() {
            ctx.fillStyle = '#000';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            ctx.font = '14px monospace';
            ctx.fillStyle = '#0f0';

            const lines = [
                'Alpine Linux 5.15.0',
                'root@alpine:~# uname -a',
                'Linux alpine 5.15.0-0-generic #1 SMP x86_64 GNU/Linux',
                'root@alpine:~# df -h',
                'Filesystem      Size  Used Avail Use% Mounted on',
                '/dev/sda1       9.8G  1.2G  8.1G  13% /',
                'root@alpine:~# _'
            ];

            lines.forEach((line, i) => {
                ctx.fillText(line, 10, 30 + i * 20);
            });
        }

        // Draw simulated GUI
        function drawGUI() {
            ctx.fillStyle = '#2d2d2d';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // Window
            ctx.fillStyle = '#3d3d3d';
            ctx.fillRect(50, 50, 540, 300);
            ctx.strokeStyle = '#5d5d5d';
            ctx.strokeRect(50, 50, 540, 300);

            // Title bar
            ctx.fillStyle = '#4d4d4d';
            ctx.fillRect(50, 50, 540, 30);
            ctx.fillStyle = '#fff';
            ctx.font = '14px sans-serif';
            ctx.fillText('Settings', 60, 70);

            // Button
            ctx.fillStyle = '#4CAF50';
            ctx.fillRect(250, 280, 80, 30);
            ctx.fillStyle = '#fff';
            ctx.fillText('OK', 278, 300);

            // Cancel button
            ctx.fillStyle = '#f44336';
            ctx.fillRect(350, 280, 80, 30);
            ctx.fillStyle = '#fff';
            ctx.fillText('Cancel', 365, 300);

            // Label
            ctx.fillStyle = '#ccc';
            ctx.fillText('Username:', 70, 120);

            // Text field
            ctx.fillStyle = '#1a1a1a';
            ctx.fillRect(160, 105, 200, 25);
            ctx.strokeStyle = '#5d5d5d';
            ctx.strokeRect(160, 105, 200, 25);

            // Another label
            ctx.fillStyle = '#ccc';
            ctx.fillText('Password:', 70, 160);
        }

        // Draw pixel art (tests scale parameter)
        function drawPixelArt() {
            ctx.fillStyle = '#000';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // 8x8 pixel font simulation
            ctx.font = '8px monospace';
            ctx.fillStyle = '#0f0';

            const text = 'PIXEL FONT TEST';
            for (let i = 0; i < text.length; i++) {
                ctx.fillText(text[i], 10 + i * 8, 50);
            }

            ctx.font = '10px monospace';
            ctx.fillStyle = '#ff0';
            ctx.fillText('Try scale: 2.0 for better OCR', 10, 80);
        }

        // Initialize VisionCortex
        async function initVisionCortex() {
            const statusEl = document.getElementById('initStatus');
            const initBtn = document.getElementById('initBtn');

            statusEl.innerHTML = '<span class="status">Loading Tesseract.js WASM...</span>';
            initBtn.disabled = true;

            try {
                visionCortex = new VisionCortex({ lazyLoad: false });
                await visionCortex.initialize();

                statusEl.innerHTML = '<span class="status">✅ VisionCortex initialized!</span>';

                // Enable test buttons
                document.getElementById('readBtn').disabled = false;
                document.getElementById('findBtn').disabled = false;
                document.getElementById('frameBtn').disabled = false;

            } catch (error) {
                statusEl.innerHTML = `<span class="error">❌ Error: ${error.message}</span>`;
                initBtn.disabled = false;
            }
        }

        // Test hypervisor_read_text
        async function testReadText() {
            const outputEl = document.getElementById('readOutput');
            const scale = parseFloat(document.getElementById('scaleInput').value) || 1.0;

            outputEl.innerHTML = '<span class="status">Running OCR...</span>';

            const startTime = performance.now();
            const result = await visionCortex.recognize(canvas, null, { scale });
            const duration = performance.now() - startTime;

            if (result.success) {
                outputEl.innerHTML = `<span class="status">✅ OCR Complete (${duration.toFixed(0)}ms)</span>\n\n` +
                    `Confidence: ${(result.confidence * 100).toFixed(1)}%\n` +
                    `Regions: ${result.regions.length}\n\n` +
                    `Text:\n${result.text}\n\n` +
                    `Regions:\n${JSON.stringify(result.regions.slice(0, 5), null, 2)}`;
            } else {
                outputEl.innerHTML = `<span class="error">❌ Error: ${result.error}</span>`;
            }
        }

        // Test hypervisor_find_element
        async function testFindElement() {
            const outputEl = document.getElementById('findOutput');
            const label = document.getElementById('labelInput').value;

            outputEl.innerHTML = '<span class="status">Searching...</span>';

            const result = await visionCortex.findElement(label, 'any', canvas);

            if (result.found) {
                outputEl.innerHTML = `<span class="status">✅ Found ${result.count} element(s)</span>\n\n` +
                    JSON.stringify(result.elements, null, 2);

                // Draw highlights on canvas
                result.elements.forEach(el => {
                    ctx.strokeStyle = '#0f0';
                    ctx.lineWidth = 2;
                    ctx.strokeRect(el.bounds.x, el.bounds.y, el.bounds.width, el.bounds.height);
                });
            } else {
                outputEl.innerHTML = `<span class="error">❌ Not found</span>\n\n${result.suggestion || ''}`;
            }
        }

        // Test hypervisor_frame
        async function testSemanticFrame() {
            const outputEl = document.getElementById('frameOutput');

            outputEl.innerHTML = '<span class="status">Getting semantic frame...</span>';

            const result = await visionCortex.getSemanticFrame(canvas);

            if (result.success) {
                outputEl.innerHTML = `<span class="status">✅ Semantic Frame (${result.processing_time_ms.toFixed(0)}ms)</span>\n\n` +
                    `Windows: ${result.windows.length}\n` +
                    `Buttons: ${result.buttons.length}\n` +
                    `Text Fields: ${result.text_fields.length}\n\n` +
                    JSON.stringify(result, null, 2);
            } else {
                outputEl.innerHTML = `<span class="error">❌ Error: ${result.error}</span>`;
            }
        }

        // Draw initial terminal
        drawTerminal();
    </script>
</body>
</html>
```

**Step 2: Commit test page**

```bash
git add systems/visual_shell/web/test_vision_cortex.html
git commit -m "feat(vision): add VisionCortex test page

Interactive test page for:
- Tesseract.js initialization
- hypervisor_read_text with scale parameter
- hypervisor_find_element with label search
- hypervisor_frame semantic output
- Simulated terminal, GUI, and pixel art canvases

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 10: Integration Verification

**Files:**
- Modify: `systems/visual_shell/web/index.html` (if needed)

**Step 1: Ensure VisionCortex is loaded in main app**

Add to `index.html` script loading section:

```html
    <!-- VisionCortex for AI GUI perception -->
    <script src="VisionCortex.js"></script>
```

**Step 2: Manual verification**

1. Open `test_vision_cortex.html` in browser
2. Click "Draw Terminal"
3. Click "Initialize Tesseract.js" - wait for "initialized"
4. Click "Read Text" - should see terminal text extracted
5. Click "Draw GUI"
6. Click "Find Element" with "Login" or "OK" - should find button
7. Click "Get Semantic Frame" - should see structured output

**Step 3: Final commit**

```bash
git add -A
git commit -m "feat(vision): VisionCortex integration complete

All 3 WebMCP tools working:
- hypervisor_read_text: OCR with scale parameter
- hypervisor_find_element: Semantic element search
- hypervisor_frame: Structured screen state

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files Changed |
|------|-------------|---------------|
| 1 | VisionCortex skeleton | +VisionCortex.js |
| 2 | Tesseract.js initialization | ~VisionCortex.js |
| 3 | Region caching | ~VisionCortex.js |
| 4 | Scale and canvas helpers | ~VisionCortex.js |
| 5 | recognize() method | ~VisionCortex.js |
| 6 | findElement() method | ~VisionCortex.js |
| 7 | getSemanticFrame() method | ~VisionCortex.js |
| 8 | WebMCP bridge integration | ~webmcp_bridge.js |
| 9 | Test page | +test_vision_cortex.html |
| 10 | Integration verification | ~index.html |

**Estimated Total:** ~600 lines of new code across 4 files
