# Morphological Font Layer Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement this plan task-by-task.

**Goal:** Build a post-symbolic font system that synthesizes glyphs on-demand using Hilbert curve patterns and semantic context.

**Architecture:** Character + semantic context → SemanticClassifier → HilbertGlyphSynthesizer → SDF texture → GPUTexture cache. All client-side via WebGPU.

**Tech Stack:** JavaScript (ES6+), WebGPU, WGSL shaders, Hilbert curves

---

## Task 1: PatternLibrary.js

**Files:**
- Create: `systems/visual_shell/web/morphological/PatternLibrary.js`

**Step 1: Create the pattern library with base Hilbert patterns and semantic parameters**

```javascript
/**
 * Geometry OS: Morphological Pattern Library
 *
 * Defines base Hilbert patterns and semantic transformation parameters.
 * Each category maps to a distinct geometric signature.
 */

const PatternLibrary = {
    /**
     * Semantic categories and their geometric properties.
     */
    categories: {
        control: {
            name: 'control',
            description: 'Branching patterns for control flow keywords',
            keywords: ['if', 'else', 'for', 'while', 'switch', 'case', 'default', 'try', 'catch', 'finally'],
            pattern: 'branch',
            params: {
                branchAngle: 45,
                branchDepth: 0.3,
                branchPosition: 0.5,
                symmetry: 'bilateral'
            }
        },
        function: {
            name: 'function',
            description: 'Enclosed loop patterns for function/class definitions',
            keywords: ['def', 'function', 'class', 'lambda', 'fn', 'func', 'method', 'constructor'],
            pattern: 'enclose',
            params: {
                enclosureDepth: 2,
                cornerRadius: 0.2,
                innerPadding: 0.15,
                symmetry: 'radial'
            }
        },
        return: {
            name: 'return',
            description: 'Outward arrow patterns for return/exit keywords',
            keywords: ['return', 'yield', 'break', 'continue', 'exit', 'raise', 'throw'],
            pattern: 'direct',
            params: {
                direction: 'outward',
                arrowSize: 0.4,
                shaftWidth: 0.15,
                arrowStyle: 'double'
            }
        },
        data: {
            name: 'data',
            description: 'Stable rectangular patterns for data declarations',
            keywords: ['const', 'let', 'var', 'int', 'string', 'bool', 'float', 'number', 'array', 'object'],
            pattern: 'stabilize',
            params: {
                aspectRatio: 1.0,
                cornerRadius: 0.1,
                stability: 1.0,
                fill: 'solid'
            }
        },
        operator: {
            name: 'operator',
            description: 'Symmetric cross patterns for operators',
            keywords: ['+', '-', '*', '/', '=', '==', '!=', '<', '>', '<=', '>=', '&&', '||'],
            pattern: 'cross',
            params: {
                armLength: 0.4,
                armWidth: 0.15,
                centerSize: 0.2,
                symmetry: 'quad'
            }
        },
        literal: {
            name: 'literal',
            description: 'Dense spiral patterns for literals',
            keywords: [],  // Detected by regex, not keyword
            pattern: 'spiral',
            params: {
                turns: 3,
                spacing: 0.1,
                direction: 'clockwise',
                density: 'high'
            }
        },
        default: {
            name: 'default',
            description: 'Standard Hilbert pattern for general characters',
            keywords: [],
            pattern: 'standard',
            params: {
                order: 4,
                rotation: 0,
                scale: 1.0
            }
        }
    },

    /**
     * Character-specific modifiers for uniqueness within categories.
     * Maps char → { startOffset, rotation, scale, length }
     */
    characterModifiers: {
        // Control flow
        'if': { startOffset: 0, rotation: 0, scale: 1.0, length: 1.0, branchPosition: 0.5 },
        'else': { startOffset: 64, rotation: 90, scale: 0.95, length: 1.0, branchPosition: 0.3 },
        'for': { startOffset: 32, rotation: 90, scale: 1.0, length: 1.0, branchPosition: 0.25 },
        'while': { startOffset: 128, rotation: 180, scale: 1.0, length: 1.0, branchPosition: 0.6 },

        // Functions
        'def': { startOffset: 0, rotation: 0, scale: 1.0, enclosureDepth: 2 },
        'function': { startOffset: 64, rotation: 0, scale: 1.1, enclosureDepth: 3 },
        'class': { startOffset: 128, rotation: 90, scale: 1.2, enclosureDepth: 3 },

        // Returns
        'return': { startOffset: 0, rotation: 0, scale: 1.0, arrowSize: 0.4 },
        'yield': { startOffset: 64, rotation: 45, scale: 0.9, arrowSize: 0.3 },
        'break': { startOffset: 128, rotation: 0, scale: 1.0, arrowSize: 0.5 },

        // Data
        'const': { startOffset: 0, rotation: 0, scale: 1.0, aspectRatio: 1.0 },
        'let': { startOffset: 64, rotation: 0, scale: 0.95, aspectRatio: 0.8 },
        'var': { startOffset: 128, rotation: 0, scale: 0.95, aspectRatio: 1.2 }
    },

    /**
     * Hilbert curve order-4 lookup table (16x16 = 256 points).
     * Generated using standard Hilbert algorithm.
     */
    generateHilbertLUT(order = 4) {
        const size = Math.pow(2, order);
        const lut = new Array(size * size);

        for (let i = 0; i < size * size; i++) {
            const [x, y] = this._hilbertD2XY(size, i);
            lut[i] = { x, y, d: i };
        }

        return lut;
    },

    /**
     * Convert Hilbert distance to (x, y) coordinates.
     */
    _hilbertD2XY(n, d) {
        let x = 0, y = 0;
        let s = 1;
        let rx, ry, t = d;

        while (s < n) {
            rx = 1 & (t / 2);
            ry = 1 & (t ^ rx);

            this._hilbertRot(s, x, y, rx, ry);

            x += s * rx;
            y += s * ry;
            t = Math.floor(t / 4);
            s *= 2;
        }

        return [x, y];
    },

    /**
     * Rotate Hilbert quadrant.
     */
    _hilbertRot(n, x, y, rx, ry) {
        if (ry === 0) {
            if (rx === 1) {
                x = n - 1 - x;
                y = n - 1 - y;
            }
            [x, y] = [y, x];
        }
    },

    /**
     * Get pattern for a category.
     */
    getPattern(categoryName) {
        return this.categories[categoryName] || this.categories.default;
    },

    /**
     * Get character modifier or default.
     */
    getModifier(char) {
        return this.characterModifiers[char] || {
            startOffset: char.charCodeAt(0) % 256,
            rotation: 0,
            scale: 1.0,
            length: 1.0
        };
    }
};

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = PatternLibrary;
}
```

**Step 2: Verify the file was created**

Run: Open `systems/visual_shell/web/morphological/PatternLibrary.js` in browser console
Expected: PatternLibrary object with categories defined

**Step 3: Commit**

```bash
git add systems/visual_shell/web/morphological/PatternLibrary.js
git commit -m "feat(morphological): add PatternLibrary with semantic categories"
```

---

## Task 2: SemanticClassifier.js

**Files:**
- Create: `systems/visual_shell/web/morphological/SemanticClassifier.js`

**Step 1: Create the semantic classifier**

```javascript
/**
 * Geometry OS: Semantic Classifier
 *
 * Classifies tokens/characters into semantic categories
 * for morphological glyph synthesis.
 */

class SemanticClassifier {
    constructor() {
        this.patternLibrary = null;  // Injected or imported
        this.literalPatterns = {
            number: /^-?\d+\.?\d*$/,
            string: /^['"`].*['"`]$/,
            boolean: /^(true|false)$/
        };
    }

    /**
     * Set the pattern library reference.
     */
    setPatternLibrary(library) {
        this.patternLibrary = library;
    }

    /**
     * Classify a token/character into a semantic category.
     *
     * @param {string} token - The token to classify
     * @param {Object} context - Additional context (previous/next tokens, etc.)
     * @returns {Object} Classification result with category and params
     */
    classify(token, context = {}) {
        if (!this.patternLibrary) {
            console.warn('[SemanticClassifier] PatternLibrary not set, using default');
            return this._defaultResult(token);
        }

        // Check each category for keyword match
        for (const [categoryName, category] of Object.entries(this.patternLibrary.categories)) {
            if (category.keywords && category.keywords.includes(token)) {
                return {
                    category: categoryName,
                    pattern: category.pattern,
                    params: { ...category.params },
                    modifier: this.patternLibrary.getModifier(token)
                };
            }
        }

        // Check for literal patterns
        const literalType = this._classifyLiteral(token);
        if (literalType) {
            const category = this.patternLibrary.categories.literal;
            return {
                category: 'literal',
                pattern: category.pattern,
                params: { ...category.params, literalType },
                modifier: this.patternLibrary.getModifier(token)
            };
        }

        // Check context for hints
        if (context.nextToken && this._isOperatorContext(token, context)) {
            return this._classifyOperator(token);
        }

        // Default category
        return this._defaultResult(token);
    }

    /**
     * Check if token is a literal (number, string, boolean).
     */
    _classifyLiteral(token) {
        for (const [type, pattern] of Object.entries(this.literalPatterns)) {
            if (pattern.test(token)) {
                return type;
            }
        }
        return null;
    }

    /**
     * Check if token should be classified as operator.
     */
    _isOperatorContext(token, context) {
        const operators = this.patternLibrary.categories.operator.keywords;
        return operators.includes(token);
    }

    /**
     * Classify an operator.
     */
    _classifyOperator(token) {
        const category = this.patternLibrary.categories.operator;
        return {
            category: 'operator',
            pattern: category.pattern,
            params: { ...category.params },
            modifier: this.patternLibrary.getModifier(token)
        };
    }

    /**
     * Default classification result.
     */
    _defaultResult(token) {
        const category = this.patternLibrary?.categories?.default || {
            name: 'default',
            pattern: 'standard',
            params: { order: 4, rotation: 0, scale: 1.0 }
        };

        return {
            category: 'default',
            pattern: category.pattern,
            params: { ...category.params },
            modifier: this.patternLibrary?.getModifier(token) || {
                startOffset: token.charCodeAt(0) % 256,
                rotation: 0,
                scale: 1.0,
                length: 1.0
            }
        };
    }

    /**
     * Batch classify multiple tokens.
     *
     * @param {string[]} tokens - Array of tokens
     * @returns {Object[]} Array of classification results
     */
    classifyBatch(tokens) {
        return tokens.map((token, index) => {
            const context = {
                prevToken: tokens[index - 1],
                nextToken: tokens[index + 1]
            };
            return this.classify(token, context);
        });
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SemanticClassifier;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/morphological/SemanticClassifier.js
git commit -m "feat(morphological): add SemanticClassifier for token categorization"
```

---

## Task 3: HilbertGlyphSynthesizer.js

**Files:**
- Create: `systems/visual_shell/web/morphological/HilbertGlyphSynthesizer.js`

**Step 1: Create the glyph synthesizer**

```javascript
/**
 * Geometry OS: Hilbert Glyph Synthesizer
 *
 * Synthesizes 16x16 SDF textures from semantic parameters
 * using Hilbert curve transformations.
 */

class HilbertGlyphSynthesizer {
    constructor() {
        this.size = 16;  // 16x16 grid
        this.hilbertLUT = null;
        this.distanceField = null;
    }

    /**
     * Initialize the Hilbert lookup table.
     */
    init() {
        if (typeof PatternLibrary !== 'undefined') {
            this.hilbertLUT = PatternLibrary.generateHilbertLUT(4);
        } else {
            this.hilbertLUT = this._generateHilbertLUT(4);
        }
    }

    /**
     * Synthesize a 16x16 SDF texture.
     *
     * @param {string} char - Character to synthesize
     * @param {string} category - Semantic category
     * @param {Object} params - Pattern parameters
     * @param {Object} modifier - Character-specific modifier
     * @returns {Float32Array} 256-element distance field
     */
    synthesize(char, category, params, modifier = {}) {
        if (!this.hilbertLUT) this.init();

        // Start with base Hilbert pattern
        let sequence = this._generateBaseSequence(modifier);

        // Apply category-specific transformation
        switch (category) {
            case 'control':
                sequence = this._applyBranch(sequence, params);
                break;
            case 'function':
                sequence = this._applyEnclose(sequence, params);
                break;
            case 'return':
                sequence = this._applyDirect(sequence, params);
                break;
            case 'data':
                sequence = this._applyStabilize(sequence, params);
                break;
            case 'operator':
                sequence = this._applyCross(sequence, params);
                break;
            case 'literal':
                sequence = this._applySpiral(sequence, params);
                break;
            default:
                // Standard Hilbert, no modification
                break;
        }

        // Convert sequence to distance field
        return this._sequenceToDistanceField(sequence);
    }

    /**
     * Generate base Hilbert sequence with modifier applied.
     */
    _generateBaseSequence(modifier) {
        const offset = modifier.startOffset || 0;
        const rotation = modifier.rotation || 0;
        const scale = modifier.scale || 1.0;
        const length = modifier.length || 1.0;

        const sequence = [];
        const totalPoints = Math.floor(256 * length);

        for (let i = 0; i < totalPoints; i++) {
            const lutIndex = (i + offset) % 256;
            const point = this.hilbertLUT[lutIndex];

            // Apply rotation
            const rotated = this._rotatePoint(point, rotation);

            // Apply scale
            const scaled = {
                x: 8 + (rotated.x - 8) * scale,
                y: 8 + (rotated.y - 8) * scale
            };

            sequence.push(scaled);
        }

        return sequence;
    }

    /**
     * Rotate a point around the center (8, 8).
     */
    _rotatePoint(point, degrees) {
        const rad = degrees * Math.PI / 180;
        const cx = 8, cy = 8;
        const dx = point.x - cx;
        const dy = point.y - cy;

        return {
            x: cx + dx * Math.cos(rad) - dy * Math.sin(rad),
            y: cy + dx * Math.sin(rad) + dy * Math.cos(rad)
        };
    }

    /**
     * Apply branching pattern for control flow.
     */
    _applyBranch(sequence, params) {
        const branchPos = params.branchPosition || 0.5;
        const branchAngle = params.branchAngle || 45;

        const result = [];
        const splitIndex = Math.floor(sequence.length * branchPos);

        // First part: original path
        for (let i = 0; i < splitIndex; i++) {
            result.push(sequence[i]);
        }

        // Branch point
        const branchPoint = sequence[splitIndex];

        // Left branch
        const leftBranch = this._createBranch(branchPoint, branchAngle, sequence.length - splitIndex, -1);

        // Right branch
        const rightBranch = this._createBranch(branchPoint, branchAngle, sequence.length - splitIndex, 1);

        // Interleave branches
        for (let i = 0; i < leftBranch.length; i++) {
            result.push(leftBranch[i]);
            if (rightBranch[i]) result.push(rightBranch[i]);
        }

        return result;
    }

    /**
     * Create a branch from a point.
     */
    _createBranch(start, angle, length, direction) {
        const branch = [];
        const rad = (angle * direction * Math.PI) / 180;
        const step = 0.5;

        for (let i = 0; i < length; i++) {
            branch.push({
                x: start.x + Math.cos(rad) * i * step,
                y: start.y + Math.sin(rad) * i * step
            });
        }

        return branch;
    }

    /**
     * Apply enclosure pattern for functions.
     */
    _applyEnclose(sequence, params) {
        const depth = params.enclosureDepth || 2;
        const padding = params.innerPadding || 0.15;

        // Create nested rectangular paths
        const result = [];

        for (let d = 0; d < depth; d++) {
            const inset = padding * d * 16;
            const rect = this._createRectPath(inset, 16 - inset * 2);
            result.push(...rect);
        }

        return result.length > 0 ? result : sequence;
    }

    /**
     * Create a rectangular path.
     */
    _createRectPath(inset, size) {
        const path = [];
        const steps = Math.floor(64 / 4);

        // Top edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + (size * i / steps), y: inset });
        }
        // Right edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + size, y: inset + (size * i / steps) });
        }
        // Bottom edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset + size - (size * i / steps), y: inset + size });
        }
        // Left edge
        for (let i = 0; i < steps; i++) {
            path.push({ x: inset, y: inset + size - (size * i / steps) });
        }

        return path;
    }

    /**
     * Apply arrow/direction pattern for returns.
     */
    _applyDirect(sequence, params) {
        const arrowSize = params.arrowSize || 0.4;
        const shaftWidth = params.shaftWidth || 0.15;

        const result = [];
        const centerX = 8;
        const centerY = 8;
        const arrowLength = arrowSize * 16;
        const shaftLen = (1 - arrowSize) * 16;

        // Shaft (vertical line through center)
        for (let i = 0; i < shaftLen; i++) {
            result.push({ x: centerX, y: 16 - i * 0.5 });
        }

        // Arrow head
        const headStart = 16 - shaftLen;
        for (let i = 0; i < arrowLength; i++) {
            // Left side of arrow
            result.push({
                x: centerX - i * 0.5,
                y: headStart - i * 0.5
            });
            // Right side of arrow
            result.push({
                x: centerX + i * 0.5,
                y: headStart - i * 0.5
            });
        }

        return result;
    }

    /**
     * Apply stabilization for data declarations.
     */
    _applyStabilize(sequence, params) {
        const aspectRatio = params.aspectRatio || 1.0;
        const cornerRadius = params.cornerRadius || 0.1;

        // Create stable rectangular shape
        const width = 12 * aspectRatio;
        const height = 12;
        const x = 8 - width / 2;
        const y = 8 - height / 2;

        return this._createRectPath(x, width > height ? height : width);
    }

    /**
     * Apply cross pattern for operators.
     */
    _applyCross(sequence, params) {
        const armLength = params.armLength || 0.4;
        const armWidth = params.armWidth || 0.15;

        const result = [];
        const len = armLength * 16;

        // Horizontal arm
        for (let i = -len; i <= len; i++) {
            result.push({ x: 8 + i, y: 8 });
        }

        // Vertical arm
        for (let i = -len; i <= len; i++) {
            result.push({ x: 8, y: 8 + i });
        }

        return result;
    }

    /**
     * Apply spiral pattern for literals.
     */
    _applySpiral(sequence, params) {
        const turns = params.turns || 3;
        const spacing = params.spacing || 0.1;

        const result = [];
        const totalAngle = turns * 2 * Math.PI;
        const steps = 256;

        for (let i = 0; i < steps; i++) {
            const t = i / steps;
            const angle = t * totalAngle;
            const radius = t * 6 + 1;

            result.push({
                x: 8 + Math.cos(angle) * radius,
                y: 8 + Math.sin(angle) * radius
            });
        }

        return result;
    }

    /**
     * Convert sequence to distance field.
     */
    _sequenceToDistanceField(sequence) {
        const df = new Float32Array(256);

        for (let y = 0; y < 16; y++) {
            for (let x = 0; x < 16; x++) {
                const idx = y * 16 + x;
                df[idx] = this._computeDistance(x, y, sequence);
            }
        }

        // Normalize to [0, 1] range
        const maxDist = Math.max(...df);
        if (maxDist > 0) {
            for (let i = 0; i < 256; i++) {
                df[i] = 1.0 - (df[i] / maxDist);
            }
        }

        return df;
    }

    /**
     * Compute distance from point to nearest curve point.
     */
    _computeDistance(px, py, sequence) {
        let minDist = Infinity;

        for (const point of sequence) {
            const dx = px - point.x;
            const dy = py - point.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < minDist) {
                minDist = dist;
            }
        }

        return minDist;
    }

    /**
     * Generate Hilbert LUT internally if PatternLibrary not available.
     */
    _generateHilbertLUT(order) {
        const size = Math.pow(2, order);
        const lut = [];

        for (let d = 0; d < size * size; d++) {
            lut.push(this._hilbertD2XY(size, d));
        }

        return lut;
    }

    _hilbertD2XY(n, d) {
        let x = 0, y = 0, s = 1, rx, ry, t = d;

        while (s < n) {
            rx = 1 & (t / 2);
            ry = 1 & (t ^ rx);
            [x, y] = this._rot(s, x, y, rx, ry);
            x += s * rx;
            y += s * ry;
            t = Math.floor(t / 4);
            s *= 2;
        }

        return { x, y, d };
    }

    _rot(n, x, y, rx, ry) {
        if (ry === 0) {
            if (rx === 1) {
                x = n - 1 - x;
                y = n - 1 - y;
            }
            return [y, x];
        }
        return [x, y];
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = HilbertGlyphSynthesizer;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/morphological/HilbertGlyphSynthesizer.js
git commit -m "feat(morphological): add HilbertGlyphSynthesizer for pattern generation"
```

---

## Task 4: sdf_generator.wgsl

**Files:**
- Create: `systems/visual_shell/web/shaders/sdf_generator.wgsl`

**Step 1: Create the SDF generator compute shader**

```wgsl
// Geometry OS: SDF Generator Compute Shader
// Converts Hilbert sequences to signed distance fields
//
// Input: hilbertSequence - array of vec2<f32> curve points
// Output: texture_storage_2d for distance field

struct SequenceParams {
    numPoints: u32,
    width: f32,
    height: f32,
    padding: f32,
}

@group(0) @binding(0) var<uniform> params: SequenceParams;
@group(0) @binding(1) var<storage, read> hilbertSequence: array<vec2<f32>>;
@group(0) @binding(2) var output: texture_storage_2d<r32float, write>;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;

    // Bounds check
    if (x >= u32(params.width) || y >= u32(params.height)) {
        return;
    }

    let px = f32(x);
    let py = f32(y);

    // Compute minimum distance to curve
    var minDist = 1e10;

    for (var i = 0u; i < params.numPoints; i++) {
        let point = hilbertSequence[i];
        let dx = px - point.x;
        let dy = py - point.y;
        let dist = sqrt(dx * dx + dy * dy);
        minDist = min(minDist, dist);
    }

    // Normalize distance field
    // Values closer to curve = higher (1.0)
    // Values far from curve = lower (0.0)
    let maxDist = sqrt(params.width * params.width + params.height * params.height) * 0.5;
    let normalizedDist = 1.0 - clamp(minDist / maxDist, 0.0, 1.0);

    // Write to output texture
    textureStore(output, vec2<i32>(i32(x), i32(y)), vec4<f32>(normalizedDist, 0.0, 0.0, 1.0));
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/shaders/sdf_generator.wgsl
git commit -m "feat(shaders): add sdf_generator compute shader for WebGPU"
```

---

## Task 5: MorphologicalFont.js

**Files:**
- Create: `systems/visual_shell/web/morphological/MorphologicalFont.js`

**Step 1: Create the main API class**

```javascript
/**
 * Geometry OS: Morphological Font
 *
 * Main API for client-side glyph synthesis using Hilbert patterns.
 * Provides cached texture generation for terminal rendering.
 */

class MorphologicalFont {
    constructor(options = {}) {
        this.device = options.device || null;
        this.size = options.size || 16;

        // Texture cache: "char:category" → GPUTexture
        this.cache = new Map();
        this.cacheHits = 0;
        this.cacheMisses = 0;

        // Initialize components
        this.classifier = options.classifier || null;
        this.synthesizer = options.synthesizer || null;

        // Fallback canvas for non-WebGPU rendering
        this.fallbackCanvas = null;
        this.fallbackCtx = null;

        console.log('[MorphologicalFont] Initialized');
    }

    /**
     * Initialize with WebGPU device.
     */
    async init(device) {
        this.device = device;

        // Initialize classifier
        if (typeof SemanticClassifier !== 'undefined') {
            this.classifier = new SemanticClassifier();
            if (typeof PatternLibrary !== 'undefined') {
                this.classifier.setPatternLibrary(PatternLibrary);
            }
        }

        // Initialize synthesizer
        if (typeof HilbertGlyphSynthesizer !== 'undefined') {
            this.synthesizer = new HilbertGlyphSynthesizer();
            this.synthesizer.init();
        }

        // Create fallback canvas
        this._initFallbackCanvas();

        console.log('[MorphologicalFont] Ready');
    }

    /**
     * Initialize fallback canvas for non-WebGPU environments.
     */
    _initFallbackCanvas() {
        this.fallbackCanvas = document.createElement('canvas');
        this.fallbackCanvas.width = this.size;
        this.fallbackCanvas.height = this.size;
        this.fallbackCtx = this.fallbackCanvas.getContext('2d');
    }

    /**
     * Get or create glyph texture.
     *
     * @param {string} char - Character to render
     * @param {Object} context - Semantic context { category, bold, error, etc. }
     * @returns {Promise<PIXI.Texture|ImageData>} Glyph texture
     */
    async getGlyphTexture(char, context = {}) {
        // Build cache key
        const category = context.category || 'default';
        const key = `${char}:${category}`;

        // Check cache
        if (this.cache.has(key)) {
            this.cacheHits++;
            return this.cache.get(key);
        }

        this.cacheMisses++;

        // Synthesize glyph
        const texture = await this._synthesizeGlyph(char, context);

        // Cache and return
        this.cache.set(key, texture);
        return texture;
    }

    /**
     * Synthesize a glyph texture.
     */
    async _synthesizeGlyph(char, context) {
        // Classify if not provided
        let classification;
        if (context.category && this.classifier) {
            classification = this.classifier.classify(char, context);
        } else if (this.classifier) {
            classification = this.classifier.classify(char);
        } else {
            classification = {
                category: context.category || 'default',
                params: {},
                modifier: {}
            };
        }

        // Synthesize distance field
        let sdfData;
        if (this.synthesizer) {
            sdfData = this.synthesizer.synthesize(
                char,
                classification.category,
                classification.params,
                classification.modifier
            );
        } else {
            sdfData = this._fallbackSDF(char);
        }

        // Convert to texture
        if (this.device) {
            return this._createGPUTexture(sdfData);
        } else {
            return this._createCanvasTexture(sdfData);
        }
    }

    /**
     * Create WebGPU texture from SDF data.
     */
    async _createGPUTexture(sdfData) {
        // For now, use canvas texture as WebGPU texture creation is complex
        // TODO: Implement proper WebGPU texture when pipeline is ready
        return this._createCanvasTexture(sdfData);
    }

    /**
     * Create canvas-based texture from SDF data.
     */
    _createCanvasTexture(sdfData) {
        const canvas = document.createElement('canvas');
        canvas.width = this.size;
        canvas.height = this.size;
        const ctx = canvas.getContext('2d');

        const imageData = ctx.createImageData(this.size, this.size);

        for (let i = 0; i < sdfData.length; i++) {
            const value = Math.floor(sdfData[i] * 255);
            imageData.data[i * 4] = 255;     // R
            imageData.data[i * 4 + 1] = 255; // G
            imageData.data[i * 4 + 2] = 255; // B
            imageData.data[i * 4 + 3] = value; // A (distance)
        }

        ctx.putImageData(imageData, 0, 0);

        // Return canvas for PIXI.Texture.from() usage
        return canvas;
    }

    /**
     * Fallback SDF for when synthesizer is not available.
     */
    _fallbackSDF(char) {
        const sdf = new Float32Array(256);

        // Simple circular gradient as fallback
        for (let y = 0; y < 16; y++) {
            for (let x = 0; x < 16; x++) {
                const dx = x - 7.5;
                const dy = y - 7.5;
                const dist = Math.sqrt(dx * dx + dy * dy);
                sdf[y * 16 + x] = Math.max(0, 1 - dist / 8);
            }
        }

        return sdf;
    }

    /**
     * Batch synthesis for a line of tokens.
     *
     * @param {Object[]} tokens - Array of { char, category } objects
     * @returns {Promise<Array>} Array of textures
     */
    async synthesizeLine(tokens) {
        return Promise.all(tokens.map(t =>
            this.getGlyphTexture(t.char, { category: t.category })
        ));
    }

    /**
     * Get cache statistics.
     */
    getStats() {
        const total = this.cacheHits + this.cacheMisses;
        return {
            cacheSize: this.cache.size,
            cacheHits: this.cacheHits,
            cacheMisses: this.cacheMisses,
            hitRate: total > 0 ? (this.cacheHits / total * 100).toFixed(1) + '%' : 'N/A'
        };
    }

    /**
     * Clear the texture cache.
     */
    clearCache() {
        this.cache.clear();
        this.cacheHits = 0;
        this.cacheMisses = 0;
        console.log('[MorphologicalFont] Cache cleared');
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MorphologicalFont;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/morphological/MorphologicalFont.js
git commit -m "feat(morphological): add MorphologicalFont main API class"
```

---

## Task 6: test_morphological_font.html

**Files:**
- Create: `systems/visual_shell/web/test_morphological_font.html`

**Step 1: Create the demo page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Morphological Font Layer - Geometry OS</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background: #0a0a0a;
            color: #00ff88;
            font-family: 'Courier New', monospace;
            padding: 20px;
        }
        h1 { margin-bottom: 20px; }
        .subtitle { color: #666; margin-bottom: 30px; }

        .section {
            background: #1a1a1a;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 14px;
            color: #888;
            text-transform: uppercase;
            margin-bottom: 15px;
            border-bottom: 1px solid #333;
            padding-bottom: 10px;
        }

        .glyph-grid {
            display: grid;
            grid-template-columns: repeat(8, 80px);
            gap: 10px;
        }

        .glyph-cell {
            background: #252535;
            border-radius: 4px;
            padding: 10px;
            text-align: center;
        }

        .glyph-canvas {
            width: 64px;
            height: 64px;
            background: #0a0a0a;
            border-radius: 4px;
            margin-bottom: 5px;
        }

        .glyph-label {
            font-size: 10px;
            color: #666;
        }

        .stats {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .stat {
            text-align: center;
        }

        .stat-value {
            font-size: 24px;
            color: #00ff88;
        }

        .stat-label {
            font-size: 12px;
            color: #666;
        }

        .controls {
            margin-top: 20px;
        }

        button {
            background: #252535;
            color: #00ff88;
            border: 1px solid #00ff88;
            padding: 10px 20px;
            cursor: pointer;
            font-family: inherit;
            border-radius: 4px;
            margin-right: 10px;
        }

        button:hover {
            background: #00ff88;
            color: #0a0a0a;
        }

        .category-legend {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 15px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .legend-color {
            width: 16px;
            height: 16px;
            border-radius: 2px;
        }

        .legend-label {
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>
    <h1>◈ Morphological Font Layer</h1>
    <p class="subtitle">Post-Symbolic Glyph Synthesis with Hilbert Patterns</p>

    <div class="section">
        <div class="section-title">Semantic Categories</div>
        <div class="category-legend">
            <div class="legend-item">
                <div class="legend-color" style="background: #44FFFF"></div>
                <span class="legend-label">Control (branching)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #FF44FF"></div>
                <span class="legend-label">Function (enclosed)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #FFFF44"></div>
                <span class="legend-label">Return (arrow)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #44FF44"></div>
                <span class="legend-label">Data (stable)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #FF8844"></div>
                <span class="legend-label">Operator (cross)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #8888FF"></div>
                <span class="legend-label">Literal (spiral)</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #FFFFFF"></div>
                <span class="legend-label">Default (hilbert)</span>
            </div>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Glyph Gallery</div>
        <div id="glyph-grid" class="glyph-grid"></div>
    </div>

    <div class="section">
        <div class="section-title">Cache Statistics</div>
        <div class="stats">
            <div class="stat">
                <div class="stat-value" id="cache-size">0</div>
                <div class="stat-label">Cached Glyphs</div>
            </div>
            <div class="stat">
                <div class="stat-value" id="cache-hits">0</div>
                <div class="stat-label">Cache Hits</div>
            </div>
            <div class="stat">
                <div class="stat-value" id="hit-rate">0%</div>
                <div class="stat-label">Hit Rate</div>
            </div>
        </div>
        <div class="controls">
            <button onclick="clearCache()">Clear Cache</button>
            <button onclick="regenerateAll()">Regenerate All</button>
        </div>
    </div>

    <script src="morphological/PatternLibrary.js"></script>
    <script src="morphological/SemanticClassifier.js"></script>
    <script src="morphological/HilbertGlyphSynthesizer.js"></script>
    <script src="morphological/MorphologicalFont.js"></script>
    <script>
        let morphFont;

        // Category colors for rendering
        const CATEGORY_COLORS = {
            control: '#44FFFF',
            function: '#FF44FF',
            return: '#FFFF44',
            data: '#44FF44',
            operator: '#FF8844',
            literal: '#8888FF',
            default: '#FFFFFF'
        };

        // Test tokens to render
        const TEST_TOKENS = [
            { char: 'if', category: 'control' },
            { char: 'else', category: 'control' },
            { char: 'for', category: 'control' },
            { char: 'while', category: 'control' },
            { char: 'def', category: 'function' },
            { char: 'class', category: 'function' },
            { char: 'return', category: 'return' },
            { char: 'yield', category: 'return' },
            { char: 'const', category: 'data' },
            { char: 'let', category: 'data' },
            { char: '+', category: 'operator' },
            { char: '=', category: 'operator' },
            { char: '42', category: 'literal' },
            { char: 'A', category: 'default' },
            { char: 'B', category: 'default' },
            { char: 'C', category: 'default' }
        ];

        async function init() {
            // Initialize morphological font
            morphFont = new MorphologicalFont({ size: 16 });
            await morphFont.init();

            console.log('[Demo] MorphologicalFont initialized');

            // Render glyph gallery
            await renderGallery();
            updateStats();
        }

        async function renderGallery() {
            const grid = document.getElementById('glyph-grid');
            grid.innerHTML = '';

            for (const token of TEST_TOKENS) {
                const cell = document.createElement('div');
                cell.className = 'glyph-cell';

                const canvas = document.createElement('canvas');
                canvas.className = 'glyph-canvas';
                canvas.width = 64;
                canvas.height = 64;

                const label = document.createElement('div');
                label.className = 'glyph-label';
                label.textContent = `"${token.char}" (${token.category})`;

                cell.appendChild(canvas);
                cell.appendChild(label);
                grid.appendChild(cell);

                // Get glyph texture
                const glyphCanvas = await morphFont.getGlyphTexture(token.char, { category: token.category });

                // Render scaled up (16x16 → 64x64)
                const ctx = canvas.getContext('2d');
                ctx.imageSmoothingEnabled = false;
                ctx.drawImage(glyphCanvas, 0, 0, 64, 64);

                // Tint by category
                ctx.globalCompositeOperation = 'source-atop';
                ctx.fillStyle = CATEGORY_COLORS[token.category] || CATEGORY_COLORS.default;
                ctx.fillRect(0, 0, 64, 64);
                ctx.globalCompositeOperation = 'source-over';
            }
        }

        function updateStats() {
            const stats = morphFont.getStats();
            document.getElementById('cache-size').textContent = stats.cacheSize;
            document.getElementById('cache-hits').textContent = stats.cacheHits;
            document.getElementById('hit-rate').textContent = stats.hitRate;
        }

        function clearCache() {
            morphFont.clearCache();
            updateStats();
        }

        async function regenerateAll() {
            await renderGallery();
            updateStats();
        }

        // Initialize on load
        init();
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_morphological_font.html
git commit -m "feat(morphological): add test page for morphological font"
```

---

## Task 7: Integration with GeometricTerminal

**Files:**
- Modify: `systems/visual_shell/web/GeometricTerminal.js`

**Step 1: Add MorphologicalFont integration**

Add after line 134 (after `this.textureCache`):

```javascript
        // Morphological font system
        this.morphFont = options.morphFont || null;
        this.useMorphFont = options.useMorphFont !== undefined ? options.useMorphFont : true;
```

**Step 2: Add initialization in constructor**

Add after `_initShader()` call:

```javascript
        // Initialize morphological font if enabled
        if (this.useMorphFont && typeof MorphologicalFont !== 'undefined') {
            this.morphFont = new MorphologicalFont({ size: this.cellSize });
            this.morphFont.init().then(() => {
                console.log('[GeometricTerminal] MorphologicalFont ready');
            });
        }
```

**Step 3: Add method to use morphological font**

Add new method after `_handleShellMessage`:

```javascript
    /**
     * Render a cell using morphological font.
     */
    async _renderMorphologicalCell(char, x, y, semanticState = {}) {
        if (!this.morphFont) return;

        const context = {
            category: semanticState.category || 'default',
            bold: semanticState.bold || false,
            error: semanticState.error || false
        };

        const glyphCanvas = await this.morphFont.getGlyphTexture(char, context);

        // Update cell
        const cell = this.grid[y][x];
        cell.char = char;

        if (cell.sprite) {
            // Convert canvas to PIXI texture
            const texture = PIXI.Texture.from(glyphCanvas);
            cell.sprite.texture = texture;
            cell.texture = texture;
            cell.dirty = false;

            // Apply semantic transforms
            this._applySemanticTransforms(cell, semanticState);
        }
    }
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/GeometricTerminal.js
git commit -m "feat(terminal): integrate MorphologicalFont with GeometricTerminal"
```

---

## Verification

After all tasks complete:

1. Open `test_morphological_font.html` in browser
2. Verify 16 glyphs render with distinct patterns
3. Verify cache hit rate increases on "Regenerate All"
4. Check console for initialization messages

**Expected Results:**
- Control keywords show branching patterns
- Function keywords show enclosed patterns
- Return keywords show arrow patterns
- Data keywords show stable rectangular patterns
- Operators show cross patterns
- Literals show spiral patterns
- Default characters show standard Hilbert patterns
