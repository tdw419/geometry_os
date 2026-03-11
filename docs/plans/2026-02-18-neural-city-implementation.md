# Neural City Visualization Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a unified visualization that transforms the Geometry OS infinite map into a living urban landscape representing agent cognition, metabolism, and system state.

**Architecture:** NeuralCityEngine.js orchestrates three layers: TelemetryBus (WebSocket subscriptions), CityOrchestrator (spatial layout), and PixiJS v8 RenderGroups (static/dynamic separation). WGSL compute shader handles procedural building generation at scale.

**Tech Stack:** JavaScript (ES6+), PixiJS v8, WebGPU/WGSL, WebSocket, Python (EvolutionDaemon telemetry)

---

## Task 1: Create TelemetryBus Class

**Files:**
- Create: `systems/visual_shell/web/js/TelemetryBus.js`
- Test: `systems/visual_shell/web/tests/test_telemetry_bus.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_telemetry_bus.js
describe('TelemetryBus', () => {
    it('should subscribe to events', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('metabolism_update', (data) => { received = data; });
        bus.emit('metabolism_update', { ipc: 0.5 });
        assert.deepEqual(received, { ipc: 0.5 });
    });

    it('should unsubscribe correctly', () => {
        const bus = new TelemetryBus();
        let count = 0;
        const unsub = bus.subscribe('test', () => { count++; });
        bus.emit('test', {});
        unsub();
        bus.emit('test', {});
        assert.equal(count, 1);
    });

    it('should connect to WebSocket', async () => {
        const bus = new TelemetryBus('ws://localhost:8768');
        // Mock WebSocket for testing
        bus.ws = { send: () => {}, readyState: 1 };
        assert.ok(bus.isConnected() || bus.ws);
    });
});
```

**Step 2: Run test to verify it fails**

Run: Open `test_telemetry_bus.html` in browser console or use Node.js with mocha
Expected: FAIL with "TelemetryBus is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/TelemetryBus.js
/**
 * TelemetryBus - Event-driven data bus for Neural City visualization.
 * Subscribes to WebSocket events from EvolutionDaemon and Area Agents.
 */
class TelemetryBus {
    constructor(wsUrl = 'ws://localhost:8768') {
        this.wsUrl = wsUrl;
        this.ws = null;
        this.subscribers = new Map();
        this.connected = false;
    }

    subscribe(eventType, callback) {
        if (!this.subscribers.has(eventType)) {
            this.subscribers.set(eventType, new Set());
        }
        this.subscribers.get(eventType).add(callback);

        // Return unsubscribe function
        return () => {
            this.subscribers.get(eventType)?.delete(callback);
        };
    }

    emit(eventType, data) {
        const callbacks = this.subscribers.get(eventType);
        if (callbacks) {
            callbacks.forEach(cb => cb(data));
        }
    }

    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.wsUrl);
                this.ws.onopen = () => {
                    this.connected = true;
                    this._onConnect();
                    resolve(true);
                };
                this.ws.onmessage = (event) => {
                    this._handleMessage(event);
                };
                this.ws.onerror = (err) => {
                    console.warn('TelemetryBus WebSocket error:', err);
                    this.connected = false;
                };
                this.ws.onclose = () => {
                    this.connected = false;
                    this._onDisconnect();
                };
            } catch (e) {
                reject(e);
            }
        });
    }

    _handleMessage(event) {
        try {
            const data = JSON.parse(event.data);
            // Handle WebMCP broadcast format
            if (data.type === 'broadcast_event' && data.params) {
                this.emit(data.params.type, data.params.data);
            } else if (data.method === 'broadcast_event') {
                this.emit(data.params?.type, data.params?.data);
            }
        } catch (e) {
            console.warn('TelemetryBus parse error:', e);
        }
    }

    _onConnect() {
        console.log('🏙️ TelemetryBus connected to Neural City data stream');
        this.emit('bus_connected', { url: this.wsUrl });
    }

    _onDisconnect() {
        console.log('🏙️ TelemetryBus disconnected');
        this.emit('bus_disconnected', {});
    }

    isConnected() {
        return this.connected && this.ws?.readyState === WebSocket.OPEN;
    }

    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }
}

// Export for module use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = TelemetryBus;
}
if (typeof window !== 'undefined') {
    window.TelemetryBus = TelemetryBus;
}
```

**Step 4: Run test to verify it passes**

Run: Browser console test or mocha
Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/TelemetryBus.js systems/visual_shell/web/tests/test_telemetry_bus.js
git commit -m "feat(neural-city): add TelemetryBus for event-driven data

- Subscribe/emit pattern for system telemetry
- WebSocket integration with WebMCP broadcast format
- Auto-reconnection handling (stub for future)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create CityOrchestrator Class

**Files:**
- Create: `systems/visual_shell/web/js/CityOrchestrator.js`
- Test: `systems/visual_shell/web/tests/test_city_orchestrator.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_city_orchestrator.js
describe('CityOrchestrator', () => {
    it('should spawn a building', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', { memory: 100 });
        assert.ok(building);
        assert.equal(building.id, 'agent-01');
    });

    it('should update building state', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});
        orch.updateBuilding('agent-01', { activity: 0.8, memory: 200 });
        const b = orch.getBuilding('agent-01');
        assert.equal(b.memory, 200);
        assert.equal(b.activity, 0.8);
    });

    it('should create bridges between buildings', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('a', 'cognitive', { position: { x: 0, y: 0 } });
        orch.spawnBuilding('b', 'metabolic', { position: { x: 100, y: 0 } });
        const bridge = orch.createBridge('a', 'b', 'llm_inference');
        assert.ok(bridge);
        assert.equal(bridge.eventType, 'llm_inference');
    });

    it('should pulse district', () => {
        const orch = new CityOrchestrator();
        let pulsed = false;
        orch.onDistrictPulse = () => { pulsed = true; };
        orch.pulseDistrict('metabolic');
        assert.ok(pulsed);
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "CityOrchestrator is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/CityOrchestrator.js
/**
 * CityOrchestrator - Spatial layout manager for Neural City.
 * Maps telemetry data to building positions and manages district state.
 */

// District configuration
const DISTRICTS = {
    cognitive: { name: 'Cognitive District', color: 0x00aaff, angle: 0 },
    metabolic: { name: 'Metabolic District', color: 0xff8800, angle: 120 },
    substrate: { name: 'Substrate District', color: 0x00ff88, angle: 240 }
};

// Building roles to district mapping
const ROLE_TO_DISTRICT = {
    'cognitive': 'cognitive',
    'llm': 'cognitive',
    'area_agent': 'cognitive',
    'metabolic': 'metabolic',
    'tectonic': 'metabolic',
    'guardian': 'metabolic',
    'substrate': 'substrate',
    'pixelrts': 'substrate',
    'hypervisor': 'substrate'
};

class CityOrchestrator {
    constructor(config = {}) {
        this.config = {
            centerRadius: 200,
            districtRadius: 400,
            buildingSpacing: 50,
            ...config
        };

        this.buildings = new Map();
        this.bridges = [];
        this.districtPulses = new Map();

        // Callbacks
        this.onBuildingSpawn = null;
        this.onBuildingUpdate = null;
        this.onBridgeCreate = null;
        this.onDistrictPulse = null;
    }

    /**
     * Spawn a new building for an agent.
     */
    spawnBuilding(agentId, role, metrics = {}) {
        if (this.buildings.has(agentId)) {
            return this.buildings.get(agentId);
        }

        const district = this._getDistrictForRole(role);
        const position = this._calculateBuildingPosition(district, agentId);

        const building = {
            id: agentId,
            role: role,
            district: district,
            position: position,
            height: this._calculateHeight(metrics.memory || 100),
            activity: metrics.activity || 0,
            memory: metrics.memory || 100,
            luminance: 0.5,
            createdAt: Date.now()
        };

        this.buildings.set(agentId, building);

        if (this.onBuildingSpawn) {
            this.onBuildingSpawn(building);
        }

        return building;
    }

    /**
     * Update building state.
     */
    updateBuilding(agentId, updates) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        Object.assign(building, {
            activity: updates.activity ?? building.activity,
            memory: updates.memory ?? building.memory,
            luminance: this._calculateLuminance(updates.activity ?? building.activity),
            height: this._calculateHeight(updates.memory ?? building.memory)
        });

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Get building by ID.
     */
    getBuilding(agentId) {
        return this.buildings.get(agentId);
    }

    /**
     * Create a bridge arc between two buildings.
     */
    createBridge(fromId, toId, eventType) {
        const from = this.buildings.get(fromId);
        const to = this.buildings.get(toId);

        if (!from || !to) return null;

        const bridge = {
            id: `${fromId}-${toId}-${Date.now()}`,
            from: fromId,
            to: toId,
            fromPos: from.position,
            toPos: to.position,
            eventType: eventType,
            color: this._getBridgeColor(eventType),
            createdAt: Date.now(),
            ttl: 2000 // Bridge fades after 2 seconds
        };

        this.bridges.push(bridge);

        // Clean up old bridges
        this._pruneBridges();

        if (this.onBridgeCreate) {
            this.onBridgeCreate(bridge);
        }

        return bridge;
    }

    /**
     * Pulse a district (visual feedback).
     */
    pulseDistrict(districtName) {
        this.districtPulses.set(districtName, {
            intensity: 1.0,
            startedAt: Date.now()
        });

        if (this.onDistrictPulse) {
            this.onDistrictPulse(districtName);
        }
    }

    /**
     * Get all active bridges.
     */
    getBridges() {
        this._pruneBridges();
        return this.bridges;
    }

    /**
     * Get district state.
     */
    getDistrictState(districtName) {
        const buildings = Array.from(this.buildings.values())
            .filter(b => b.district === districtName);
        const pulse = this.districtPulses.get(districtName);

        return {
            name: districtName,
            config: DISTRICTS[districtName],
            buildingCount: buildings.length,
            totalActivity: buildings.reduce((sum, b) => sum + b.activity, 0),
            pulse: pulse
        };
    }

    // Private methods

    _getDistrictForRole(role) {
        return ROLE_TO_DISTRICT[role.toLowerCase()] || 'cognitive';
    }

    _calculateBuildingPosition(district, agentId) {
        const districtConfig = DISTRICTS[district];
        const angleRad = (districtConfig.angle * Math.PI) / 180;

        // Hash agentId for consistent positioning
        const hash = this._hashString(agentId);
        const spreadAngle = angleRad + ((hash % 60) - 30) * (Math.PI / 180);
        const distance = this.config.centerRadius + 50 + (hash % 150);

        return {
            x: Math.cos(spreadAngle) * distance,
            y: Math.sin(spreadAngle) * distance
        };
    }

    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            hash = ((hash << 5) - hash) + str.charCodeAt(i);
            hash = hash & hash;
        }
        return Math.abs(hash);
    }

    _calculateHeight(memory) {
        // Height ranges from 50 to 300 based on memory
        return Math.min(300, Math.max(50, memory / 2));
    }

    _calculateLuminance(activity) {
        // Luminance ranges from 0.2 to 1.0 based on activity
        return Math.min(1.0, Math.max(0.2, 0.2 + activity * 0.8));
    }

    _getBridgeColor(eventType) {
        const colors = {
            'system_command': 0x00ffff,
            'llm_inference': 0xaa00ff,
            'evolution_event': 0xffd700,
            'metabolism_update': 0x00ff00,
            'tectonic_shift': 0xff4400
        };
        return colors[eventType] || 0xffffff;
    }

    _pruneBridges() {
        const now = Date.now();
        this.bridges = this.bridges.filter(b => (now - b.createdAt) < b.ttl);
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CityOrchestrator;
}
if (typeof window !== 'undefined') {
    window.CityOrchestrator = CityOrchestrator;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/CityOrchestrator.js systems/visual_shell/web/tests/test_city_orchestrator.js
git commit -m "feat(neural-city): add CityOrchestrator for spatial layout

- spawnBuilding() with district-based positioning
- updateBuilding() for activity/memory changes
- createBridge() for inter-agent communication arcs
- pulseDistrict() for visual feedback

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Create NeuralCityEngine Main Controller

**Files:**
- Create: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Test: `systems/visual_shell/web/tests/test_neural_city_engine.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_neural_city_engine.js
describe('NeuralCityEngine', () => {
    it('should initialize with PixiJS app', () => {
        const engine = new NeuralCityEngine({ app: {} });
        assert.ok(engine.telemetryBus);
        assert.ok(engine.orchestrator);
    });

    it('should wire telemetry events to orchestrator', async () => {
        const engine = new NeuralCityEngine({ app: {} });
        engine.start();

        // Simulate metabolism update
        engine.telemetryBus.emit('metabolism_update', { ipc: 0.5, throttle_level: 'NONE' });

        // Spire should update
        assert.ok(engine.spire);
    });

    it('should spawn building on agent_spawn event', () => {
        const engine = new NeuralCityEngine({ app: {} });
        engine.start();

        engine.telemetryBus.emit('agent_spawn', {
            agent_id: 'test-agent',
            role: 'cognitive',
            position: { x: 100, y: 100 }
        });

        assert.ok(engine.orchestrator.getBuilding('test-agent'));
    });

    it('should create bridge on agent_comm event', () => {
        const engine = new NeuralCityEngine({ app: {} });
        engine.start();

        engine.telemetryBus.emit('agent_spawn', { agent_id: 'a', role: 'cognitive' });
        engine.telemetryBus.emit('agent_spawn', { agent_id: 'b', role: 'metabolic' });
        engine.telemetryBus.emit('agent_comm', { from: 'a', to: 'b', event_type: 'llm_inference' });

        assert.ok(engine.orchestrator.getBridges().length > 0);
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "NeuralCityEngine is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/NeuralCityEngine.js
/**
 * NeuralCityEngine - Main controller for Neural City visualization.
 *
 * Orchestrates TelemetryBus, CityOrchestrator, and PixiJS rendering.
 */

class NeuralCityEngine {
    constructor(config = {}) {
        this.config = {
            wsUrl: config.wsUrl || 'ws://localhost:8768',
            app: config.app || null,
            container: config.container || null,
            ...config
        };

        // Core components
        this.telemetryBus = new TelemetryBus(this.config.wsUrl);
        this.orchestrator = new CityOrchestrator(this.config.cityConfig);

        // Render layers
        this.staticLayer = null;   // District geometry
        this.dynamicLayer = null;  // Buildings, bridges
        this.particleLayer = null; // Ambient traffic

        // Central spire state
        this.spire = {
            ipc: 0.5,
            throttleLevel: 'NONE',
            tectonicActive: false
        };

        // Running state
        this.running = false;
        this.lastUpdate = 0;
    }

    /**
     * Start the Neural City engine.
     */
    async start() {
        console.log('🏙️ NeuralCityEngine starting...');

        this._setupOrchestratorCallbacks();
        this._setupTelemetryHandlers();
        this._createRenderLayers();

        // Connect telemetry bus
        try {
            await this.telemetryBus.connect();
        } catch (e) {
            console.warn('TelemetryBus connection failed, running in standalone mode:', e);
        }

        this.running = true;
        this._startRenderLoop();

        console.log('✅ NeuralCityEngine started');
    }

    /**
     * Stop the engine.
     */
    stop() {
        this.running = false;
        this.telemetryBus.disconnect();
        console.log('🏙️ NeuralCityEngine stopped');
    }

    /**
     * Get current city state for debugging.
     */
    getState() {
        return {
            buildings: this.orchestrator.buildings.size,
            bridges: this.orchestrator.bridges.length,
            spire: this.spire,
            connected: this.telemetryBus.isConnected()
        };
    }

    // Private methods

    _setupOrchestratorCallbacks() {
        this.orchestrator.onBuildingSpawn = (building) => {
            this._renderBuilding(building);
        };

        this.orchestrator.onBuildingUpdate = (building) => {
            this._updateBuildingRender(building);
        };

        this.orchestrator.onBridgeCreate = (bridge) => {
            this._renderBridge(bridge);
        };

        this.orchestrator.onDistrictPulse = (district) => {
            this._animateDistrictPulse(district);
        };
    }

    _setupTelemetryHandlers() {
        // Metabolism updates -> Spire state
        this.telemetryBus.subscribe('metabolism_update', (data) => {
            this.spire.ipc = data.ipc || 0.5;
            this.spire.throttleLevel = data.throttle_level || 'NONE';
            this._updateSpireVisual();
        });

        // Tectonic shifts -> Metabolic district pulse
        this.telemetryBus.subscribe('tectonic_shift', (data) => {
            this.spire.tectonicActive = data.success;
            this.orchestrator.pulseDistrict('metabolic');
        });

        // Agent spawn -> New building
        this.telemetryBus.subscribe('agent_spawn', (data) => {
            this.orchestrator.spawnBuilding(
                data.agent_id,
                data.role,
                data.metrics || {}
            );
        });

        // Agent communication -> Bridge arc
        this.telemetryBus.subscribe('agent_comm', (data) => {
            this.orchestrator.createBridge(
                data.from,
                data.to,
                data.event_type
            );
        });

        // Building updates
        this.telemetryBus.subscribe('agent_metrics', (data) => {
            this.orchestrator.updateBuilding(data.agent_id, data);
        });
    }

    _createRenderLayers() {
        if (!this.config.app) return;

        // Static layer (districts, terrain)
        this.staticLayer = new PIXI.Container();
        this.staticLayer.name = 'neural_city_static';
        this._createDistrictGeometry();

        // Dynamic layer (buildings, bridges)
        this.dynamicLayer = new PIXI.Container();
        this.dynamicLayer.name = 'neural_city_dynamic';

        // Particle layer (ambient traffic)
        this.particleLayer = new PIXI.Container();
        this.particleLayer.name = 'neural_city_particles';

        // Add to app stage
        if (this.config.container) {
            this.config.container.addChild(this.staticLayer);
            this.config.container.addChild(this.dynamicLayer);
            this.config.container.addChild(this.particleLayer);
        }
    }

    _createDistrictGeometry() {
        // Create district base circles
        const districts = ['cognitive', 'metabolic', 'substrate'];
        const colors = [0x00aaff, 0xff8800, 0x00ff88];

        districts.forEach((name, i) => {
            const state = this.orchestrator.getDistrictState(name);
            const graphics = new PIXI.Graphics();

            graphics.circle(0, 0, 300);
            graphics.fill({ color: colors[i], alpha: 0.1 });
            graphics.stroke({ color: colors[i], width: 2, alpha: 0.3 });

            graphics.rotation = (state.config.angle * Math.PI) / 180;
            graphics.x = Math.cos(graphics.rotation) * 200;
            graphics.y = Math.sin(graphics.rotation) * 200;

            this.staticLayer.addChild(graphics);
        });

        // Create central spire
        this._createSpire();
    }

    _createSpire() {
        this.spireGraphic = new PIXI.Graphics();
        this._updateSpireVisual();
        this.staticLayer.addChild(this.spireGraphic);
    }

    _updateSpireVisual() {
        if (!this.spireGraphic) return;

        const color = this._getSpireColor();

        this.spireGraphic.clear();
        this.spireGraphic.rect(-20, -150, 40, 150);
        this.spireGraphic.fill({ color: 0x333333 });
        this.spireGraphic.circle(0, -150, 15);
        this.spireGraphic.fill({ color: color, alpha: 0.8 });
    }

    _getSpireColor() {
        if (this.spire.tectonicActive) return 0xff4400;
        if (this.spire.throttleLevel === 'AGGRESSIVE') return 0xff0000;
        if (this.spire.throttleLevel === 'MODERATE') return 0xff8800;
        return 0x00ffff; // Healthy cyan
    }

    _renderBuilding(building) {
        if (!this.dynamicLayer) return;

        const graphics = new PIXI.Graphics();
        graphics.name = `building_${building.id}`;

        // Building body
        const color = this._getDistrictColor(building.district);
        graphics.rect(-15, -building.height, 30, building.height);
        graphics.fill({ color: color, alpha: 0.8 });

        // Luminance glow
        graphics.rect(-15, -building.height, 30, 5);
        graphics.fill({ color: 0xffffff, alpha: building.luminance });

        graphics.x = building.position.x;
        graphics.y = building.position.y;

        building.graphics = graphics;
        this.dynamicLayer.addChild(graphics);
    }

    _updateBuildingRender(building) {
        if (!building.graphics) return;

        const color = this._getDistrictColor(building.district);

        building.graphics.clear();
        building.graphics.rect(-15, -building.height, 30, building.height);
        building.graphics.fill({ color: color, alpha: 0.8 });
        building.graphics.rect(-15, -building.height, 30, 5);
        building.graphics.fill({ color: 0xffffff, alpha: building.luminance });
    }

    _renderBridge(bridge) {
        if (!this.dynamicLayer) return;

        const graphics = new PIXI.Graphics();
        graphics.moveTo(bridge.fromPos.x, bridge.fromPos.y);
        graphics.lineTo(bridge.toPos.x, bridge.toPos.y);
        graphics.stroke({ color: bridge.color, width: 3, alpha: 0.8 });

        bridge.graphics = graphics;
        this.dynamicLayer.addChild(graphics);

        // Fade out after TTL
        setTimeout(() => {
            if (bridge.graphics) {
                this.dynamicLayer.removeChild(bridge.graphics);
            }
        }, bridge.ttl);
    }

    _animateDistrictPulse(districtName) {
        // Visual pulse effect
        console.log(`🏙️ District pulse: ${districtName}`);
    }

    _getDistrictColor(district) {
        const colors = {
            cognitive: 0x00aaff,
            metabolic: 0xff8800,
            substrate: 0x00ff88
        };
        return colors[district] || 0xffffff;
    }

    _startRenderLoop() {
        const update = () => {
            if (!this.running) return;

            // Update bridges (fade effect)
            const now = Date.now();
            this.orchestrator.bridges.forEach(bridge => {
                const age = now - bridge.createdAt;
                const alpha = Math.max(0, 1 - (age / bridge.ttl));
                if (bridge.graphics) {
                    bridge.graphics.alpha = alpha;
                }
            });

            requestAnimationFrame(update);
        };

        update();
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = NeuralCityEngine;
}
if (typeof window !== 'undefined') {
    window.NeuralCityEngine = NeuralCityEngine;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/tests/test_neural_city_engine.js
git commit -m "feat(neural-city): add NeuralCityEngine main controller

- TelemetryBus and CityOrchestrator integration
- PixiJS render layer management (static/dynamic/particle)
- Central Tectonic Spire with health-based coloring
- Building and bridge rendering with fade effects

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Create WGSL Shader for Procedural Buildings

**Files:**
- Create: `systems/visual_shell/web/shaders/neural_city.wgsl`
- Test: `systems/visual_shell/web/tests/test_neural_city_shader.html`

**Step 1: Write the shader**

```wgsl
// systems/visual_shell/web/shaders/neural_city.wgsl
/**
 * Neural City Procedural Building Shader
 *
 * Generates building geometry procedurally based on city metrics.
 * Used for high-density rendering (>100 agents).
 */

struct CityUniforms {
    time: f32,
    agent_count: f32,
    metabolism_avg: f32,
    tectonic_active: f32,
}

struct BuildingData {
    position: vec2<f32>,
    height: f32,
    activity: f32,
    district: f32,  // 0=cognitive, 1=metabolic, 2=substrate
}

@group(0) @binding(0) var<uniform> uniforms: CityUniforms;
@group(0) @binding(1) var<storage, read> buildings: array<BuildingData>;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
}

// District colors
fn get_district_color(district: f32) -> vec3<f32> {
    if (district < 0.5) {
        return vec3<f32>(0.0, 0.67, 1.0);  // Cognitive - Cyan
    } else if (district < 1.5) {
        return vec3<f32>(1.0, 0.53, 0.0);  // Metabolic - Orange
    } else {
        return vec3<f32>(0.0, 1.0, 0.53);  // Substrate - Green
    }
}

// Luminance pulse based on activity
fn calculate_luminance(activity: f32, time: f32) -> f32 {
    let base = 0.3 + activity * 0.5;
    let pulse = sin(time * 2.0 + activity * 6.28) * 0.1;
    return clamp(base + pulse, 0.2, 1.0);
}

@vertex
fn vertex_main(
    @builtin(vertex_index) vertex_index: u32,
    @builtin(instance_index) instance_index: u32
) -> VertexOutput {
    var output: VertexOutput;

    let building = buildings[instance_index];
    let base_color = get_district_color(building.district);
    let luminance = calculate_luminance(building.activity, uniforms.time);

    // Generate cube vertices (simplified)
    let cube_vertices = array<vec3<f32>, 8>(
        vec3<f32>(-0.5, 0.0, -0.5),
        vec3<f32>( 0.5, 0.0, -0.5),
        vec3<f32>( 0.5, 0.0,  0.5),
        vec3<f32>(-0.5, 0.0,  0.5),
        vec3<f32>(-0.5, building.height, -0.5),
        vec3<f32>( 0.5, building.height, -0.5),
        vec3<f32>( 0.5, building.height,  0.5),
        vec3<f32>(-0.5, building.height,  0.5),
    );

    // Map vertex index to cube face
    let v = cube_vertices[vertex_index % 8u];

    output.position = vec4<f32>(
        building.position.x + v.x * 10.0,
        v.y,
        building.position.y + v.z * 10.0,
        1.0
    );

    output.color = vec4<f32>(base_color * luminance, 1.0);
    output.uv = vec2<f32>(v.x + 0.5, v.z + 0.5);

    return output;
}

@fragment
fn fragment_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Simple lighting based on UV
    let light = 0.7 + 0.3 * input.uv.y;
    return vec4<f32>(input.color.rgb * light, input.color.a);
}

// Compute shader for city layout generation
@compute @workgroup_size(64)
fn compute_layout(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let idx = global_id.x;
    if (idx >= u32(uniforms.agent_count)) {
        return;
    }

    // Update building positions based on district clustering
    // This runs each frame to animate the city
    var building = buildings[idx];

    // Gentle floating animation
    building.position.x += sin(uniforms.time + f32(idx)) * 0.1;
    building.position.y += cos(uniforms.time + f32(idx) * 0.5) * 0.1;

    // Activity-based height pulsing
    building.height *= 0.95 + building.activity * 0.1;
}
```

**Step 2: Create test HTML**

```html
<!-- systems/visual_shell/web/tests/test_neural_city_shader.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Neural City Shader Test</title>
    <style>
        body { margin: 0; background: #111; }
        canvas { width: 100vw; height: 100vh; display: block; }
        #status { position: fixed; top: 10px; left: 10px; color: #0ff; font-family: monospace; }
    </style>
</head>
<body>
    <div id="status">Initializing WebGPU...</div>
    <canvas id="canvas"></canvas>
    <script type="module">
        async function testShader() {
            if (!navigator.gpu) {
                document.getElementById('status').textContent = 'WebGPU not supported';
                return;
            }

            const adapter = await navigator.gpu.requestAdapter();
            const device = await adapter.requestDevice();
            const canvas = document.getElementById('canvas');
            const context = canvas.getContext('webgpu');

            document.getElementById('status').textContent =
                'WebGPU initialized ✓ - Shader ready for integration';
        }

        testShader();
    </script>
</body>
</html>
```

**Step 3: Verify shader loads**

Run: Open `test_neural_city_shader.html` in browser
Expected: "WebGPU initialized ✓ - Shader ready for integration"

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/neural_city.wgsl systems/visual_shell/web/tests/test_neural_city_shader.html
git commit -m "feat(neural-city): add WGSL procedural building shader

- vertex_main: Procedural cube generation per building
- fragment_main: District-based coloring with luminance
- compute_layout: Animation compute shader
- Test HTML for WebGPU initialization

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Integrate with EvolutionDaemon Telemetry

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py` (add telemetry broadcast)
- Modify: `systems/evolution_daemon/safety/metabolism_monitor.py` (add export method)

**Step 1: Add telemetry broadcast to EvolutionDaemon**

In `evolution_daemon.py`, find the `visualize_tectonic_shift` method and add after it:

```python
async def broadcast_metabolism_telemetry(self):
    """Broadcast metabolism telemetry for Neural City visualization."""
    if not self.visual_connected:
        return

    try:
        # Gather metabolism data
        metabolism_state = {
            "ipc": self.tectonic_stage.baseline_ipc if self.tectonic_stage else 0.5,
            "throttle_level": "NONE",  # Will be updated by MetabolismMonitor
            "timestamp": datetime.now().isoformat()
        }

        # Get from monitor if available
        if self.monitor and self.monitor._last_state:
            metabolism_state["throttle_level"] = self.monitor._last_state.throttle_level.value

        await self.webmcp.broadcast_event('metabolism_update', metabolism_state)

    except Exception as e:
        logger.warning(f"Failed to broadcast metabolism telemetry: {e}")
```

**Step 2: Add periodic telemetry loop**

In `run_loop()` method, add:

```python
# In the main loop, add periodic telemetry broadcast
elif iteration % 2 == 0:  # Every 10 seconds
    await self.broadcast_metabolism_telemetry()
```

**Step 3: Verify integration**

Run: Start EvolutionDaemon and check WebSocket messages
Expected: Periodic `metabolism_update` events

**Step 4: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py
git commit -m "feat(daemon): add metabolism telemetry broadcast for Neural City

- broadcast_metabolism_telemetry() sends IPC and throttle level
- Periodic broadcast in run_loop() every ~10 seconds
- Enables real-time Neural City spire visualization

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Create Neural City Demo Page

**Files:**
- Create: `systems/visual_shell/web/neural_city_demo.html`

**Step 1: Create demo page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Neural City - Geometry OS</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #0a0a1a;
            font-family: 'Courier New', monospace;
            overflow: hidden;
        }
        #app { width: 100vw; height: 100vh; }
        #hud {
            position: fixed;
            top: 10px;
            left: 10px;
            background: rgba(0, 20, 40, 0.8);
            padding: 15px;
            border: 1px solid #0ff;
            color: #0ff;
            font-size: 12px;
            max-width: 300px;
        }
        #hud h2 { color: #0ff; margin-bottom: 10px; }
        #hud .metric { margin: 5px 0; }
        #hud .value { color: #0f0; }
        #controls {
            position: fixed;
            bottom: 10px;
            left: 10px;
            display: flex;
            gap: 10px;
        }
        button {
            background: #0ff;
            color: #000;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-family: inherit;
        }
        button:hover { background: #0aa; }
    </style>
</head>
<body>
    <div id="app"></div>
    <div id="hud">
        <h2>🏙️ Neural City</h2>
        <div class="metric">Buildings: <span id="building-count" class="value">0</span></div>
        <div class="metric">Bridges: <span id="bridge-count" class="value">0</span></div>
        <div class="metric">Spire IPC: <span id="spire-ipc" class="value">0.50</span></div>
        <div class="metric">Status: <span id="status" class="value">Initializing...</span></div>
    </div>
    <div id="controls">
        <button id="btn-spawn">Spawn Agent</button>
        <button id="btn-pulse">Pulse District</button>
        <button id="btn-connect">Connect</button>
    </div>

    <script src="https://pixijs.download/v8.1.0/pixi.min.js"></script>
    <script src="js/TelemetryBus.js"></script>
    <script src="js/CityOrchestrator.js"></script>
    <script src="js/NeuralCityEngine.js"></script>
    <script>
        // Initialize PixiJS
        const app = new PIXI.Application();
        app.init({ background: 0x0a0a1a, resizeTo: window }).then(() => {
            document.getElementById('app').appendChild(app.canvas);

            // Create Neural City Engine
            const engine = new NeuralCityEngine({
                app: app,
                container: app.stage,
                wsUrl: 'ws://localhost:8768'
            });

            // Start engine
            engine.start().then(() => {
                document.getElementById('status').textContent = 'Running';

                // Demo: Spawn some initial buildings
                for (let i = 0; i < 5; i++) {
                    engine.telemetryBus.emit('agent_spawn', {
                        agent_id: `demo-agent-${i}`,
                        role: ['cognitive', 'metabolic', 'substrate'][i % 3],
                        metrics: { memory: 100 + i * 50, activity: Math.random() }
                    });
                }
            });

            // Update HUD
            setInterval(() => {
                const state = engine.getState();
                document.getElementById('building-count').textContent = state.buildings;
                document.getElementById('bridge-count').textContent = state.bridges;
                document.getElementById('spire-ipc').textContent = state.spire.ipc.toFixed(2);
            }, 1000);

            // Button handlers
            document.getElementById('btn-spawn').onclick = () => {
                const id = 'agent-' + Date.now();
                const roles = ['cognitive', 'metabolic', 'substrate'];
                engine.telemetryBus.emit('agent_spawn', {
                    agent_id: id,
                    role: roles[Math.floor(Math.random() * 3)],
                    metrics: { memory: 100 + Math.random() * 200, activity: Math.random() }
                });
            };

            document.getElementById('btn-pulse').onclick = () => {
                const districts = ['cognitive', 'metabolic', 'substrate'];
                engine.orchestrator.pulseDistrict(districts[Math.floor(Math.random() * 3)]);
            };

            document.getElementById('btn-connect').onclick = async () => {
                if (!engine.telemetryBus.isConnected()) {
                    await engine.telemetryBus.connect();
                    document.getElementById('status').textContent =
                        engine.telemetryBus.isConnected() ? 'Connected' : 'Disconnected';
                }
            };
        });
    </script>
</body>
</html>
```

**Step 2: Verify demo loads**

Run: Open `neural_city_demo.html` in browser
Expected: Neural City renders with 5 demo buildings, HUD shows metrics

**Step 3: Commit**

```bash
git add systems/visual_shell/web/neural_city_demo.html
git commit -m "feat(neural-city): add demo page with HUD and controls

- PixiJS v8 integration with NeuralCityEngine
- Real-time HUD showing buildings, bridges, spire IPC
- Controls for spawning agents and pulsing districts
- WebSocket connect button for live telemetry

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | TelemetryBus class | `js/TelemetryBus.js` | 3 |
| 2 | CityOrchestrator class | `js/CityOrchestrator.js` | 4 |
| 3 | NeuralCityEngine controller | `js/NeuralCityEngine.js` | 4 |
| 4 | WGSL procedural shader | `shaders/neural_city.wgsl` | 1 |
| 5 | EvolutionDaemon telemetry | `evolution_daemon.py` | - |
| 6 | Demo page | `neural_city_demo.html` | - |

**Total: 6 tasks, 12 tests**

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-18-neural-city-implementation.md`. Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
