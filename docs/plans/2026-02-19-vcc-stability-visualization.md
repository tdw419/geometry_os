# VCC Stability Visualization Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add visual PAS (Pixel Alignment Score) stability indicators to Neural City buildings, with critical state effects when scores drop below threshold.

**Architecture:** Stability bars rendered above buildings show PAS scores (green/yellow/red). When PAS drops critically (<0.5), buildings exhibit visual glitches, color changes, tremor animation, and system alerts. Mock data generator provides realistic scores for demo.

**Tech Stack:** JavaScript (ES6+), PixiJS v8, CSS3

---

## Task 1: Add Stability to Building Data Model

**Files:**
- Modify: `systems/visual_shell/web/js/CityOrchestrator.js`
- Modify: `systems/visual_shell/web/js/MockAgentData.js`
- Test: `systems/visual_shell/web/tests/test_city_orchestrator.js`

**Step 1: Write the failing test**

```javascript
// Add to systems/visual_shell/web/tests/test_city_orchestrator.js

describe('VCC Stability', () => {
    it('should initialize building with stability score', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', { memory: 100 });
        assert.ok(building.stability !== undefined);
        assert.ok(building.stability.pas >= 0 && building.stability.pas <= 1);
    });

    it('should update stability score', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});
        orch.updateStability('agent-01', 0.45);
        const building = orch.getBuilding('agent-01');
        assert.equal(building.stability.pas, 0.45);
    });

    it('should classify stability states correctly', () => {
        const orch = new CityOrchestrator();
        assert.equal(orch._classifyStability(0.9), 'stable');
        assert.equal(orch._classifyStability(0.6), 'degraded');
        assert.equal(orch._classifyStability(0.3), 'critical');
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "updateStability is not a function"

**Step 3: Write minimal implementation**

In `CityOrchestrator.js`, modify `spawnBuilding()` and add new methods:

```javascript
// In spawnBuilding(), add after activity/memory:
stability: {
    pas: metrics.pas || MockAgentData.generatePAS(agentId),
    state: 'stable',
    lastUpdate: Date.now()
},

// Add new methods:

/**
 * Update building stability score.
 */
updateStability(agentId, pasScore) {
    const building = this.buildings.get(agentId);
    if (!building) return null;

    building.stability.pas = pasScore;
    building.stability.state = this._classifyStability(pasScore);
    building.stability.lastUpdate = Date.now();

    if (this.onBuildingUpdate) {
        this.onBuildingUpdate(building);
    }

    return building;
}

/**
 * Classify stability state from PAS score.
 */
_classifyStability(pas) {
    if (pas >= 0.7) return 'stable';
    if (pas >= 0.5) return 'degraded';
    return 'critical';
}

/**
 * Get all critical stability buildings.
 */
getCriticalBuildings() {
    return Array.from(this.buildings.values())
        .filter(b => b.stability.state === 'critical');
}
```

In `MockAgentData.js`, add PAS generator:

```javascript
// Add to MockAgentData object:

generatePAS(agentId) {
    const hash = this._hashString(agentId);
    // Generate PAS between 0.3 and 1.0
    return 0.3 + (hash % 70) / 100;
},

// Add PAS to generate() method return:
// In generate(), add:
pas: this.generatePAS(agentId),
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/CityOrchestrator.js systems/visual_shell/web/js/MockAgentData.js systems/visual_shell/web/tests/test_city_orchestrator.js
git commit -m "feat(neural-city): add VCC stability to building model

- Buildings now have stability.pas score (0-1)
- updateStability() method for real-time updates
- _classifyStability() returns stable/degraded/critical
- MockAgentData generates PAS scores

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Render Stability Bars Above Buildings

**Files:**
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Test: `systems/visual_shell/web/tests/test_neural_city_engine.js`

**Step 1: Write the failing test**

```javascript
// Add to systems/visual_shell/web/tests/test_neural_city_engine.js

describe('Stability Bars', () => {
    it('should render stability bar for each building', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._createRenderLayers();
        engine.orchestrator.spawnBuilding('test', 'cognitive', { memory: 100 });
        engine._renderBuilding(engine.orchestrator.getBuilding('test'));

        const building = engine.orchestrator.getBuilding('test');
        assert.ok(building.stabilityBar);
    });

    it('should color bar based on PAS score', () => {
        const engine = new NeuralCityEngine({ app: null });
        const color = engine._getStabilityColor(0.9);
        assert.equal(color, 0x00ff00); // Green for stable

        const colorCrit = engine._getStabilityColor(0.3);
        assert.equal(colorCrit, 0xff0000); // Red for critical
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "_getStabilityColor is not a function"

**Step 3: Write minimal implementation**

In `NeuralCityEngine.js`, add stability bar rendering:

```javascript
// Add new method for stability color:

_getStabilityColor(pas) {
    if (pas >= 0.7) return 0x00ff00;  // Green - Stable
    if (pas >= 0.5) return 0xffff00;  // Yellow - Degraded
    return 0xff0000;                   // Red - Critical
}

// Modify _renderBuilding() to add stability bar:

_renderBuilding(building) {
    // ... existing building rendering code ...

    // Add stability bar ABOVE building
    const barWidth = 30;
    const barHeight = 4;
    const barY = -building.height - 10; // 10px above building top

    const stabilityBar = new PIXI.Graphics();
    stabilityBar.name = `stability_${building.id}`;

    // Background (dark)
    stabilityBar.rect(-barWidth/2, barY, barWidth, barHeight);
    stabilityBar.fill({ color: 0x333333 });

    // Fill (colored by PAS)
    const fillWidth = barWidth * building.stability.pas;
    stabilityBar.rect(-barWidth/2, barY, fillWidth, barHeight);
    stabilityBar.fill({ color: this._getStabilityColor(building.stability.pas) });

    this.dynamicLayer.addChild(stabilityBar);
    building.stabilityBar = stabilityBar;
}

// Modify _updateBuildingRender() to update bar:

_updateBuildingRender(building) {
    // ... existing code ...

    // Update stability bar
    if (building.stabilityBar) {
        building.stabilityBar.clear();

        const barWidth = 30;
        const barHeight = 4;
        const barY = -building.height - 10;

        building.stabilityBar.rect(-barWidth/2, barY, barWidth, barHeight);
        building.stabilityBar.fill({ color: 0x333333 });

        const fillWidth = barWidth * building.stability.pas;
        building.stabilityBar.rect(-barWidth/2, barY, fillWidth, barHeight);
        building.stabilityBar.fill({ color: this._getStabilityColor(building.stability.pas) });
    }
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/tests/test_neural_city_engine.js
git commit -m "feat(neural-city): render stability bars above buildings

- Green bar for stable (PAS >= 0.7)
- Yellow bar for degraded (PAS >= 0.5)
- Red bar for critical (PAS < 0.5)
- Bar width proportional to PAS score

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Implement Critical State Effects

**Files:**
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Modify: `systems/visual_shell/web/neural_city_demo.html`

**Step 1: Add tremor animation**

In `NeuralCityEngine.js`, modify `_startRenderLoop()`:

```javascript
_startRenderLoop() {
    const update = () => {
        if (!this.running) return;

        const now = Date.now();

        // Update bridges (fade effect)
        this.orchestrator.bridges.forEach(bridge => {
            const age = now - bridge.createdAt;
            const alpha = Math.max(0, 1 - (age / bridge.ttl));
            if (bridge.graphics) {
                bridge.graphics.alpha = alpha;
            }
        });

        // Apply tremor to critical buildings
        this.orchestrator.getCriticalBuildings().forEach(building => {
            if (building.graphics) {
                const tremor = Math.sin(now * 0.03) * 2; // 5Hz oscillation, ±2px
                building.graphics.x = building.position.x + tremor;
            }
        });

        requestAnimationFrame(update);
    };

    update();
}
```

**Step 2: Add visual glitch effect**

In `_updateBuildingRender()`, add glitch for critical:

```javascript
_updateBuildingRender(building) {
    // ... existing code ...

    // Apply visual glitch for critical state
    if (building.stability.state === 'critical' && building.graphics) {
        // Random color channel offset (glitch effect)
        const glitchOffset = Math.random() * 5 - 2.5;
        building.graphics.pivot.x = glitchOffset;

        // Reduce alpha slightly
        building.graphics.alpha = 0.8 + Math.random() * 0.2;
    } else if (building.graphics) {
        building.graphics.pivot.x = 0;
        building.graphics.alpha = 1;
    }
}
```

**Step 3: Add CSS for critical state styling**

In `neural_city_demo.html`, add to `<style>`:

```css
/* VCC Critical State Styling */
.stability-critical {
    animation: critical-pulse 0.5s ease-in-out infinite;
}

@keyframes critical-pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
}

.stability-alert {
    position: fixed;
    bottom: 60px;
    left: 10px;
    background: rgba(255, 0, 0, 0.9);
    color: white;
    padding: 10px 15px;
    border-radius: 4px;
    font-size: 12px;
    z-index: 1001;
    display: none;
}

.stability-alert.visible {
    display: block;
    animation: alert-flash 1s ease-in-out infinite;
}

@keyframes alert-flash {
    0%, 100% { background: rgba(255, 0, 0, 0.9); }
    50% { background: rgba(255, 100, 0, 0.9); }
}
```

**Step 4: Add alert HUD element**

In `neural_city_demo.html`, add to body:

```html
<div id="stability-alert" class="stability-alert">
    ⚠️ <span id="alert-agent">Agent</span>: PAS <span id="alert-pas">0.00</span>
    <button onclick="this.parentElement.classList.remove('visible')">Dismiss</button>
</div>
```

**Step 5: Add alert trigger in demo script**

In demo script, add:

```javascript
// Check for critical stability
setInterval(() => {
    const critical = engine.orchestrator.getCriticalBuildings();
    const alertEl = document.getElementById('stability-alert');

    if (critical.length > 0) {
        const agent = critical[0];
        document.getElementById('alert-agent').textContent = agent.id;
        document.getElementById('alert-pas').textContent = agent.stability.pas.toFixed(2);
        alertEl.classList.add('visible');
        console.warn(`⚠️ VCC CRITICAL: ${agent.id} PAS=${agent.stability.pas.toFixed(2)}`);
    } else {
        alertEl.classList.remove('visible');
    }
}, 2000);

// Add periodic stability fluctuation for demo
setInterval(() => {
    const buildings = Array.from(engine.orchestrator.buildings.values());
    if (buildings.length > 0) {
        const random = buildings[Math.floor(Math.random() * buildings.length)];
        const newPas = 0.3 + Math.random() * 0.7; // Random 0.3-1.0
        engine.orchestrator.updateStability(random.id, newPas);
        engine._updateBuildingRender(random);
    }
}, 5000);
```

**Step 6: Commit**

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/neural_city_demo.html
git commit -m "feat(neural-city): add critical state visual effects

- Tremor animation: ±2px oscillation at 5Hz for critical buildings
- Visual glitch: random pivot offset and alpha flicker
- System alert HUD: red flashing banner with agent ID and PAS
- Periodic stability fluctuation for demo testing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Add Stability to Glass Box Panel

**Files:**
- Modify: `systems/visual_shell/web/js/AgentDataPanel.js`
- Modify: `systems/visual_shell/web/js/GlassBoxOverlay.js`

**Step 1: Add stability section to AgentDataPanel**

In `AgentDataPanel.js`, modify `_createElement()`:

```javascript
_createElement() {
    const el = document.createElement('div');
    el.className = 'agent-data-panel';
    el.innerHTML = `
        <div class="data-section" id="stability-section">
            <h3>🔒 VCC Stability</h3>
            <div class="stability-content"></div>
        </div>
        <div class="data-section" id="thought-stream">
            <h3>💭 Thought Stream <span class="live-indicator">Live</span></h3>
            <div class="thought-log"></div>
        </div>
        <!-- ... existing sections ... -->
    `;
    return el;
}
```

**Step 2: Add setStability method**

```javascript
setStability(stability) {
    this.data.stability = stability;
    const content = this.element.querySelector('.stability-content');

    const stateColors = {
        'stable': '#00ff00',
        'degraded': '#ffff00',
        'critical': '#ff0000'
    };

    const stateLabels = {
        'stable': '✓ Stable',
        'degraded': '⚠ Degraded',
        'critical': '✕ CRITICAL'
    };

    content.innerHTML = `
        <div class="metric">
            <label>PAS Score:</label>
            <div class="bar"><div style="width:${stability.pas * 100}%;background:${stateColors[stability.state]}"></div></div>
            <span class="value" style="color:${stateColors[stability.state]}">${stability.pas.toFixed(2)}</span>
        </div>
        <div class="stability-state" style="color:${stateColors[stability.state]}">
            ${stateLabels[stability.state]}
        </div>
    `;
}
```

**Step 3: Update setAllData**

```javascript
setAllData(agentData) {
    if (agentData.thoughts) this.setThoughts(agentData.thoughts);
    if (agentData.intent) this.setIntent(agentData.intent);
    if (agentData.metabolism) this.setMetabolism(agentData.metabolism);
    if (agentData.communications) this.setCommunications(agentData.communications);
    if (agentData.stability) this.setStability(agentData.stability); // NEW
}
```

**Step 4: Update GlassBoxOverlay to include stability**

In `GlassBoxOverlay.js`, modify `_getMockAgentData()`:

```javascript
_getMockAgentData(agentId) {
    const data = MockAgentData.generate(agentId);
    // Add stability from orchestrator if available
    const building = this.engine?.orchestrator?.getBuilding(agentId);
    if (building) {
        data.stability = building.stability;
    }
    return data;
}
```

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/AgentDataPanel.js systems/visual_shell/web/js/GlassBoxOverlay.js
git commit -m "feat(glass-box): add VCC stability section to introspection

- New stability section with PAS bar and state label
- Color-coded: green (stable), yellow (degraded), red (critical)
- Integrated with building stability data from orchestrator

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Stability data model | `CityOrchestrator.js`, `MockAgentData.js` | 3 |
| 2 | Render stability bars | `NeuralCityEngine.js` | 2 |
| 3 | Critical state effects | `NeuralCityEngine.js`, `neural_city_demo.html` | - |
| 4 | Glass Box integration | `AgentDataPanel.js`, `GlassBoxOverlay.js` | - |

**Total: 4 tasks, 5 tests**

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-19-vcc-stability-visualization.md`. Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
