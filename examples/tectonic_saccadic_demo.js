/**
 * Tectonic Saccadic Optimization Demo
 *
 * Demonstrates:
 * 1. Saccadic movement patterns
 * 2. Smooth LOD transitions
 * 3. Predictive tile pre-fetching
 * 4. Motion-based quality scaling
 * 5. Focus-based prioritization
 *
 * Usage: Include this script in your HTML after loading the required modules
 */

class TectonicSaccadicDemo {
    constructor() {
        this.map = null;
        this.saccadicManager = null;
        this.stats = {
            saccades: 0,
            lodTransitions: 0,
            prefetchedTiles: 0,
            avgQuality: 1.0,
            frameTime: 0
        };
        this.lastFrameTime = performance.now();
    }

    /**
     * Initialize the demo
     */
    async initialize() {
        console.log('🚀 Initializing Tectonic Saccadic Demo...');

        // Initialize infinite map
        this.map = new InfiniteMapV2(worldContainer, {
            gridSize: 100,
            enableLOD: true
        });
        await this.map.initialize();

        // Initialize saccadic manager
        this.saccadicManager = new TectonicSaccadicManager({
            viewport: this.map.viewportManager,
            gridSize: 100
        });

        // Set up event listeners
        this._setupEventListeners();

        // Set up demo controls
        this._setupControls();

        // Start demo sequence
        this._runDemoSequence();

        console.log('✅ Tectonic Saccadic Demo initialized');
    }

    /**
     * Set up event listeners for monitoring
     */
    _setupEventListeners() {
        // Track saccades
        this.saccadicManager.on('saccade-start', (data) => {
            this.stats.saccades++;
            console.log(`👁️  Saccade #${this.stats.saccades}:`, data);
            this._updateUI('saccade', data);
        });

        // Track LOD changes
        this.saccadicManager.on('lod-change', (data) => {
            this.stats.lodTransitions++;
            console.log(`🎚️  LOD transition: ${data.from?.name} → ${data.to?.name}`);
            this._updateUI('lod', data);
        });

        // Track prefetch
        this.saccadicManager.on('prefetch', (data) => {
            this.stats.prefetchedTiles += data.tiles.length;
            console.log(`📦 Prefetching ${data.tiles.length} tiles`);
            this._updateUI('prefetch', data);
        });

        // Track settling complete
        this.saccadicManager.on('settling-complete', (data) => {
            console.log(`✨ Settling complete at:`, data.position);
        });
    }

    /**
     * Set up UI controls
     */
    _setupControls() {
        const controls = document.createElement('div');
        controls.id = 'saccadic-controls';
        controls.style.cssText = `
            position: fixed;
            top: 10px;
            right: 10px;
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px;
            border-radius: 8px;
            font-family: monospace;
            font-size: 12px;
            z-index: 1000;
            max-width: 300px;
        `;

        controls.innerHTML = `
            <h3 style="margin: 0 0 10px 0;">👁️  Tectonic Saccadic Demo</h3>
            <div id="stats">
                <div>Saccades: <span id="saccade-count">0</span></div>
                <div>LOD Transitions: <span id="lod-count">0</span></div>
                <div>Prefetched Tiles: <span id="prefetch-count">0</span></div>
                <div>Avg Quality: <span id="quality-value">1.00</span></div>
                <div>Frame Time: <span id="frame-time">0</span>ms</div>
            </div>
            <div style="margin-top: 10px;">
                <button onclick="demo.triggerSaccade(1000, 1000)">Saccade to (1000,1000)</button>
                <button onclick="demo.triggerSaccade(-500, -500)">Saccade to (-500,-500)</button>
                <button onclick="demo.zoomIn()">Zoom In</button>
                <button onclick="demo.zoomOut()">Zoom Out</button>
                <button onclick="demo.reset()">Reset</button>
                <button onclick="demo.autoDemo()">Auto Demo</button>
            </div>
            <div style="margin-top: 10px;">
                <label>
                    <input type="checkbox" id="show-debug" onchange="demo.toggleDebug()">
                    Show Debug Info
                </label>
            </div>
        `;

        document.body.appendChild(controls);
    }

    /**
     * Update UI with event data
     */
    _updateUI(type, data) {
        document.getElementById('saccade-count').textContent = this.stats.saccades;
        document.getElementById('lod-count').textContent = this.stats.lodTransitions;
        document.getElementById('prefetch-count').textContent = this.stats.prefetchedTiles;
        document.getElementById('quality-value').textContent = this.stats.avgQuality.toFixed(2);
        document.getElementById('frame-time').textContent = this.stats.frameTime.toFixed(1);

        if (document.getElementById('show-debug')?.checked) {
            console.log(`[${type.toUpperCase()}]`, data);
        }
    }

    /**
     * Run automated demo sequence
     */
    _runDemoSequence() {
        // Demo 1: Rapid panning (triggers saccades)
        setTimeout(() => {
            console.log('🎬 Demo 1: Rapid panning...');
            this.triggerSaccade(1000, 1000);
        }, 1000);

        // Demo 2: Zoom in (triggers LOD transition)
        setTimeout(() => {
            console.log('🎬 Demo 2: Zoom in...');
            this.map.viewportManager.setZoom(3.0);
        }, 3000);

        // Demo 3: Zoom out (triggers LOD transition)
        setTimeout(() => {
            console.log('🎬 Demo 3: Zoom out...');
            this.map.viewportManager.setZoom(0.3);
        }, 5000);

        // Demo 4: Diagonal movement
        setTimeout(() => {
            console.log('🎬 Demo 4: Diagonal movement...');
            this.triggerSaccade(1500, 1500);
        }, 7000);

        // Print final stats
        setTimeout(() => {
            console.log('📊 Demo Stats:', this.stats);
        }, 9000);
    }

    /**
     * Trigger a saccade to target position
     */
    triggerSaccade(x, y) {
        this.saccadicManager.setTarget(x, y);
    }

    /**
     * Zoom in
     */
    zoomIn() {
        const currentZoom = this.map.viewportManager.getCamera().zoom;
        this.map.viewportManager.setZoom(currentZoom * 1.5);
    }

    /**
     * Zoom out
     */
    zoomOut() {
        const currentZoom = this.map.viewportManager.getCamera().zoom;
        this.map.viewportManager.setZoom(currentZoom / 1.5);
    }

    /**
     * Reset view
     */
    reset() {
        this.map.viewportManager.setZoom(1.0);
        this.map.viewportManager.setPosition(0, 0);
        this.stats = {
            saccades: 0,
            lodTransitions: 0,
            prefetchedTiles: 0,
            avgQuality: 1.0,
            frameTime: 0
        };
        this._updateUI();
    }

    /**
     * Run auto demo with random movements
     */
    autoDemo() {
        const duration = 5000; // 5 seconds
        const interval = 500;  // Move every 500ms
        let elapsed = 0;

        const demoInterval = setInterval(() => {
            const x = (Math.random() - 0.5) * 3000;
            const y = (Math.random() - 0.5) * 3000;
            this.triggerSaccade(x, y);

            elapsed += interval;
            if (elapsed >= duration) {
                clearInterval(demoInterval);
            }
        }, interval);
    }

    /**
     * Toggle debug info
     */
    toggleDebug() {
        const stats = this.saccadicManager.getStats();
        console.log('🔍 Current Stats:', stats);
    }

    /**
     * Update loop (call from main animation loop)
     */
    update(deltaTime) {
        if (this.saccadicManager) {
            this.saccadicManager.update(deltaTime);
        }

        // Update frame time stats
        const now = performance.now();
        this.stats.frameTime = now - this.lastFrameTime;
        this.lastFrameTime = now;

        // Update average quality
        const renderOptions = this.saccadicManager?.getRenderOptions();
        if (renderOptions) {
            this.stats.avgQuality = (this.stats.avgQuality * 0.9) + (renderOptions.quality * 0.1);
        }

        this._updateUI();
    }

    /**
     * Clean up
     */
    destroy() {
        if (this.saccadicManager) {
            this.saccadicManager.destroy();
        }
        const controls = document.getElementById('saccadic-controls');
        if (controls) {
            controls.remove();
        }
    }
}

// Export for global access
if (typeof window !== 'undefined') {
    window.TectonicSaccadicDemo = TectonicSaccadicDemo;
}

// Auto-initialize if running standalone
if (typeof window !== 'undefined' && !window.demo) {
    window.demo = new TectonicSaccadicDemo();

    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            window.demo.initialize();
        });
    } else {
        window.demo.initialize();
    }
}
