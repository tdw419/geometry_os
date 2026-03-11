# Glass Box Introspection Interface Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a street-level introspection overlay for Neural City that reveals agent internal state when clicking on buildings.

**Architecture:** GlassBoxOverlay component slides in from right when building clicked. Contains AgentDataPanel (4 sections) and AgentController (4 actions). NeuralCityEngine dispatches click events. Mock data generator provides demo agent state.

**Tech Stack:** JavaScript (ES6+), PixiJS v8, CSS3, WebSocket

---

## Task 1: Create GlassBoxOverlay Component

**Files:**
- Create: `systems/visual_shell/web/js/GlassBoxOverlay.js`
- Test: `systems/visual_shell/web/tests/test_glass_box_overlay.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_glass_box_overlay.js
describe('GlassBoxOverlay', () => {
    it('should create overlay element on construction', () => {
        const overlay = new GlassBoxOverlay();
        assert.ok(overlay.element);
        assert.ok(overlay.element.classList.contains('glass-box-overlay'));
    });

    it('should be hidden by default', () => {
        const overlay = new GlassBoxOverlay();
        assert.equal(overlay.isVisible(), false);
    });

    it('should show overlay when open() is called', () => {
        const overlay = new GlassBoxOverlay();
        overlay.open({ agentId: 'test-agent' });
        assert.equal(overlay.isVisible(), true);
    });

    it('should hide overlay when close() is called', () => {
        const overlay = new GlassBoxOverlay();
        overlay.open({ agentId: 'test-agent' });
        overlay.close();
        assert.equal(overlay.isVisible(), false);
    });

    it('should emit close event when clicking outside', () => {
        const overlay = new GlassBoxOverlay();
        let closed = false;
        overlay.onClose = () => { closed = true; };
        overlay.open({ agentId: 'test' });

        // Simulate click outside
        const event = new MouseEvent('click', { target: document.body });
        overlay._handleOutsideClick(event);

        assert.equal(closed, true);
    });
});
```

**Step 2: Run test to verify it fails**

Run: Open in browser console with mocha or use Node.js
Expected: FAIL with "GlassBoxOverlay is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/GlassBoxOverlay.js
/**
 * GlassBoxOverlay - Street-level agent introspection panel.
 * Slides in from right when clicking on a Neural City building.
 */
class GlassBoxOverlay {
    constructor(config = {}) {
        this.config = {
            width: config.width || 400,
            ...config
        };

        this.visible = false;
        this.currentAgent = null;
        this.onClose = null;

        // Create overlay element
        this.element = this._createElement();
        document.body.appendChild(this.element);

        // Bind outside click handler
        this._boundOutsideClick = this._handleOutsideClick.bind(this);
    }

    _createElement() {
        const el = document.createElement('div');
        el.className = 'glass-box-overlay';
        el.style.cssText = `
            position: fixed;
            top: 0;
            right: -${this.config.width}px;
            width: ${this.config.width}px;
            height: 100vh;
            background: rgba(0, 20, 40, 0.95);
            border-left: 2px solid #0ff;
            transition: right 0.3s ease;
            z-index: 1000;
            overflow-y: auto;
            padding: 20px;
            box-sizing: border-box;
        `;
        return el;
    }

    open(agentData) {
        this.currentAgent = agentData;
        this.visible = true;
        this.element.style.right = '0px';

        // Add outside click listener
        setTimeout(() => {
            document.addEventListener('click', this._boundOutsideClick);
        }, 100);

        this._render();
    }

    close() {
        this.visible = false;
        this.currentAgent = null;
        this.element.style.right = `-${this.config.width}px`;

        document.removeEventListener('click', this._boundOutsideClick);

        if (this.onClose) {
            this.onClose();
        }
    }

    isVisible() {
        return this.visible;
    }

    _handleOutsideClick(event) {
        if (!this.element.contains(event.target)) {
            this.close();
        }
    }

    _render() {
        this.element.innerHTML = `
            <div class="glass-box-header">
                <h2>🔍 Glass Box</h2>
                <span class="agent-id">${this.currentAgent.agentId || 'Unknown'}</span>
                <button class="close-btn" onclick="this.closest('.glass-box-overlay').glassBox.close()">✕</button>
            </div>
            <div class="glass-box-content">
                <p>Select an agent to inspect</p>
            </div>
        `;
        this.element.glassBox = this;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.GlassBoxOverlay = GlassBoxOverlay;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = GlassBoxOverlay;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/GlassBoxOverlay.js systems/visual_shell/web/tests/test_glass_box_overlay.js
git commit -m "feat(glass-box): add overlay component with open/close

- GlassBoxOverlay slides in from right
- Click outside to close
- Basic agent data display

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create AgentDataPanel Component

**Files:**
- Create: `systems/visual_shell/web/js/AgentDataPanel.js`
- Test: `systems/visual_shell/web/tests/test_agent_data_panel.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_agent_data_panel.js
describe('AgentDataPanel', () => {
    it('should create panel with 4 data sections', () => {
        const panel = new AgentDataPanel();
        assert.ok(panel.element);
        assert.equal(panel.element.querySelectorAll('.data-section').length, 4);
    });

    it('should render thought stream', () => {
        const panel = new AgentDataPanel();
        panel.setThoughts([
            { time: '14:32:01', text: 'Analyzing request', type: 'inference' }
        ]);
        assert.ok(panel.element.innerHTML.includes('Analyzing request'));
    });

    it('should render intent map', () => {
        const panel = new AgentDataPanel();
        panel.setIntent({
            goal: 'Optimize rendering',
            steps: [
                { text: 'Profile FPS', complete: true },
                { text: 'Find bottleneck', complete: false }
            ]
        });
        assert.ok(panel.element.innerHTML.includes('Optimize rendering'));
    });

    it('should render metabolic pulse', () => {
        const panel = new AgentDataPanel();
        panel.setMetabolism({
            ipc: 0.78,
            memory: { used: 248, total: 512 },
            activity: 0.85
        });
        assert.ok(panel.element.innerHTML.includes('0.78'));
    });

    it('should render communication log', () => {
        const panel = new AgentDataPanel();
        panel.setCommunications([
            { direction: 'out', target: 'agent-2', type: 'request' }
        ]);
        assert.ok(panel.element.innerHTML.includes('agent-2'));
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "AgentDataPanel is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/AgentDataPanel.js
/**
 * AgentDataPanel - Four-section data display for Glass Box.
 * Contains: Thought Stream, Intent Map, Metabolic Pulse, Communication Log.
 */
class AgentDataPanel {
    constructor() {
        this.data = {
            thoughts: [],
            intent: { goal: '', steps: [] },
            metabolism: { ipc: 0, memory: { used: 0, total: 0 }, activity: 0 },
            communications: []
        };

        this.element = this._createElement();
    }

    _createElement() {
        const el = document.createElement('div');
        el.className = 'agent-data-panel';
        el.innerHTML = `
            <div class="data-section" id="thought-stream">
                <h3>💭 Thought Stream <span class="live-indicator">Live</span></h3>
                <div class="thought-log"></div>
            </div>
            <div class="data-section" id="intent-map">
                <h3>🎯 Intent Map</h3>
                <div class="intent-content"></div>
            </div>
            <div class="data-section" id="metabolic-pulse">
                <h3>📊 Metabolic Pulse</h3>
                <div class="metabolism-content"></div>
            </div>
            <div class="data-section" id="communication-log">
                <h3>📡 Communication Log</h3>
                <div class="comm-log"></div>
            </div>
        `;
        return el;
    }

    setThoughts(thoughts) {
        this.data.thoughts = thoughts;
        const log = this.element.querySelector('.thought-log');
        log.innerHTML = thoughts.map(t => `
            <div class="thought-item type-${t.type}">
                <span class="time">${t.time}</span>
                <span class="arrow">▸</span>
                <span class="text">${t.text}</span>
            </div>
        `).join('');
    }

    setIntent(intent) {
        this.data.intent = intent;
        const content = this.element.querySelector('.intent-content');
        content.innerHTML = `
            <div class="current-goal">
                <strong>Current Goal:</strong><br>
                "${intent.goal}"
            </div>
            <div class="trajectory">
                <strong>Planned Trajectory:</strong>
                <ol>
                    ${intent.steps.map(s => `
                        <li class="${s.complete ? 'complete' : ''}">
                            ${s.complete ? '✓' : '○'} ${s.text}
                        </li>
                    `).join('')}
                </ol>
            </div>
        `;
    }

    setMetabolism(metabolism) {
        this.data.metabolism = metabolism;
        const content = this.element.querySelector('.metabolism-content');
        const memPct = (metabolism.memory.used / metabolism.memory.total * 100).toFixed(0);
        const actLabel = metabolism.activity > 0.7 ? 'High' : metabolism.activity > 0.3 ? 'Medium' : 'Low';

        content.innerHTML = `
            <div class="metric">
                <label>IPC:</label>
                <div class="bar"><div style="width:${metabolism.ipc * 100}%"></div></div>
                <span class="value">${metabolism.ipc.toFixed(2)}</span>
            </div>
            <div class="metric">
                <label>Memory:</label>
                <div class="bar"><div style="width:${memPct}%"></div></div>
                <span class="value">${metabolism.memory.used}MB / ${metabolism.memory.total}MB</span>
            </div>
            <div class="metric">
                <label>Activity:</label>
                <div class="bar"><div style="width:${metabolism.activity * 100}%"></div></div>
                <span class="value">${actLabel}</span>
            </div>
        `;
    }

    setCommunications(comms) {
        this.data.communications = comms;
        const log = this.element.querySelector('.comm-log');
        log.innerHTML = comms.map(c => `
            <div class="comm-item">
                <span class="direction">${c.direction === 'out' ? '→' : '←'}</span>
                <span class="target">${c.target}:</span>
                <span class="type">${c.type}</span>
            </div>
        `).join('');
    }

    setAllData(agentData) {
        if (agentData.thoughts) this.setThoughts(agentData.thoughts);
        if (agentData.intent) this.setIntent(agentData.intent);
        if (agentData.metabolism) this.setMetabolism(agentData.metabolism);
        if (agentData.communications) this.setCommunications(agentData.communications);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.AgentDataPanel = AgentDataPanel;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentDataPanel;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/AgentDataPanel.js systems/visual_shell/web/tests/test_agent_data_panel.js
git commit -m "feat(glass-box): add AgentDataPanel with 4 sections

- Thought Stream: scrolling log of agent decisions
- Intent Map: current goal and trajectory
- Metabolic Pulse: IPC, memory, activity metrics
- Communication Log: inbound/outbound messages

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Create AgentController Component

**Files:**
- Create: `systems/visual_shell/web/js/AgentController.js`
- Test: `systems/visual_shell/web/tests/test_agent_controller.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_agent_controller.js
describe('AgentController', () => {
    it('should create control bar with 4 buttons', () => {
        const ctrl = new AgentController();
        assert.ok(ctrl.element);
        assert.equal(ctrl.element.querySelectorAll('button').length, 4);
    });

    it('should emit relocate event', () => {
        const ctrl = new AgentController();
        let eventFired = false;
        ctrl.onRelocate = () => { eventFired = true; };
        ctrl.element.querySelector('.btn-relocate').click();
        assert.equal(eventFired, true);
    });

    it('should emit evict event with confirmation', () => {
        const ctrl = new AgentController();
        let eventFired = false;
        ctrl.onEvict = () => { eventFired = true; };

        // Mock confirm dialog
        window.confirm = () => true;
        ctrl.element.querySelector('.btn-evict').click();

        assert.equal(eventFired, true);
    });

    it('should emit debug event', () => {
        const ctrl = new AgentController();
        let eventFired = false;
        ctrl.onDebug = () => { eventFired = true; };
        ctrl.element.querySelector('.btn-debug').click();
        assert.equal(eventFired, true);
    });

    it('should show command input on command click', () => {
        const ctrl = new AgentController();
        ctrl.element.querySelector('.btn-command').click();
        assert.ok(ctrl.element.querySelector('.command-input'));
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "AgentController is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/AgentController.js
/**
 * AgentController - Control action bar for Glass Box.
 * Provides: Relocate, Evict, Debug, Command actions.
 */
class AgentController {
    constructor(config = {}) {
        this.agentId = null;
        this.onRelocate = null;
        this.onEvict = null;
        this.onDebug = null;
        this.onCommand = null;

        this.element = this._createElement();
    }

    _createElement() {
        const el = document.createElement('div');
        el.className = 'agent-controller';
        el.innerHTML = `
            <div class="control-bar">
                <button class="btn-relocate" title="Relocate Agent">📍 Relocate</button>
                <button class="btn-evict" title="Evict Agent">🗑️ Evict</button>
                <button class="btn-debug" title="Debug Dump">🐛 Debug</button>
                <button class="btn-command" title="Send Command">💬 Command</button>
            </div>
            <div class="command-panel" style="display:none;">
                <input type="text" class="command-input" placeholder="Enter command...">
                <button class="btn-send">Send</button>
                <button class="btn-cancel">Cancel</button>
            </div>
        `;

        // Wire up handlers
        el.querySelector('.btn-relocate').addEventListener('click', () => this._handleRelocate());
        el.querySelector('.btn-evict').addEventListener('click', () => this._handleEvict());
        el.querySelector('.btn-debug').addEventListener('click', () => this._handleDebug());
        el.querySelector('.btn-command').addEventListener('click', () => this._toggleCommandPanel());

        el.querySelector('.btn-send').addEventListener('click', () => this._handleCommand());
        el.querySelector('.btn-cancel').addEventListener('click', () => this._hideCommandPanel());

        return el;
    }

    setAgent(agentId) {
        this.agentId = agentId;
    }

    _handleRelocate() {
        const district = prompt('Enter target district (cognitive/metabolic/substrate):');
        if (district && this.onRelocate) {
            this.onRelocate(this.agentId, district);
        }
    }

    _handleEvict() {
        const confirmed = confirm(`Evict agent ${this.agentId}? This cannot be undone.`);
        if (confirmed && this.onEvict) {
            this.onEvict(this.agentId);
        }
    }

    _handleDebug() {
        if (this.onDebug) {
            this.onDebug(this.agentId);
        }
    }

    _toggleCommandPanel() {
        const panel = this.element.querySelector('.command-panel');
        panel.style.display = panel.style.display === 'none' ? 'block' : 'none';
    }

    _hideCommandPanel() {
        this.element.querySelector('.command-panel').style.display = 'none';
    }

    _handleCommand() {
        const input = this.element.querySelector('.command-input');
        const command = input.value.trim();
        if (command && this.onCommand) {
            this.onCommand(this.agentId, command);
            input.value = '';
            this._hideCommandPanel();
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.AgentController = AgentController;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentController;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/AgentController.js systems/visual_shell/web/tests/test_agent_controller.js
git commit -m "feat(glass-box): add AgentController with 4 actions

- Relocate: Move agent to different district
- Evict: Remove agent (with confirmation)
- Debug: Dump agent state to console
- Command: Send text command to agent

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Wire GlassBoxOverlay into NeuralCityEngine

**Files:**
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Modify: `systems/visual_shell/web/js/CityOrchestrator.js`

**Step 1: Add click handler to NeuralCityEngine**

In `NeuralCityEngine.js`, add after constructor:

```javascript
// In constructor, add:
this.glassBox = null;
this._setupGlassBox();

// Add new methods:
_setupGlassBox() {
    this.glassBox = new GlassBoxOverlay({
        width: 400
    });

    // Wire up control callbacks
    this.glassBox.onRelocate = (agentId, district) => {
        this.orchestrator.relocateAgent(agentId, district);
        this._renderBuilding(this.orchestrator.getBuilding(agentId));
    };

    this.glassBox.onEvict = (agentId) => {
        this.orchestrator.evictAgent(agentId);
        this.glassBox.close();
    };

    this.glassBox.onDebug = (agentId) => {
        const building = this.orchestrator.getBuilding(agentId);
        console.log('Agent Debug Dump:', building);
    };

    this.glassBox.onCommand = (agentId, command) => {
        this.telemetryBus.emit('agent_command', {
            agent_id: agentId,
            command: command
        });
    };
}

_handleBuildingClick(agentId, event) {
    event.stopPropagation();

    const building = this.orchestrator.getBuilding(agentId);
    if (!building) return;

    // Get mock data for this agent
    const agentData = this._getMockAgentData(agentId);

    // Open Glass Box
    this.glassBox.open({
        agentId: agentId,
        ...agentData
    });

    // Highlight building
    this._highlightBuilding(agentId);
}
```

**Step 2: Modify _renderBuilding to add click handler**

```javascript
_renderBuilding(building) {
    // ... existing code ...

    // Add click handler
    graphics.eventMode = 'static';
    graphics.cursor = 'pointer';
    graphics.on('click', (e) => this._handleBuildingClick(building.id, e));

    // ... rest of existing code ...
}
```

**Step 3: Add methods to CityOrchestrator**

```javascript
// In CityOrchestrator.js, add:

relocateAgent(agentId, newDistrict) {
    const building = this.buildings.get(agentId);
    if (!building) return null;

    building.district = newDistrict;
    building.position = this._calculateBuildingPosition(newDistrict, agentId);

    if (this.onBuildingUpdate) {
        this.onBuildingUpdate(building);
    }

    return building;
}

evictAgent(agentId) {
    const building = this.buildings.get(agentId);
    if (!building) return false;

    // Remove from graphics
    if (building.graphics && building.graphics.parent) {
        building.graphics.parent.removeChild(building.graphics);
    }

    this.buildings.delete(agentId);
    return true;
}
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/js/CityOrchestrator.js
git commit -m "feat(glass-box): wire overlay into NeuralCityEngine

- Add click handler on buildings to open Glass Box
- Wire relocate/evict/debug/command callbacks
- Add relocateAgent() and evictAgent() to CityOrchestrator

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Create Mock Data Generator

**Files:**
- Create: `systems/visual_shell/web/js/MockAgentData.js`
- Test: `systems/visual_shell/web/tests/test_mock_agent_data.js`

**Step 1: Write the failing test**

```javascript
describe('MockAgentData', () => {
    it('should generate mock data for an agent', () => {
        const data = MockAgentData.generate('agent-01');
        assert.ok(data.thoughts);
        assert.ok(data.intent);
        assert.ok(data.metabolism);
        assert.ok(data.communications);
    });

    it('should return consistent data for same agent ID', () => {
        const data1 = MockAgentData.generate('agent-01');
        const data2 = MockAgentData.generate('agent-01');
        assert.equal(data1.intent.goal, data2.intent.goal);
    });

    it('should return different data for different agents', () => {
        const data1 = MockAgentData.generate('agent-01');
        const data2 = MockAgentData.generate('agent-02');
        assert.notEqual(data1.metabolism.ipc, data2.metabolism.ipc);
    });
});
```

**Step 2: Write implementation**

```javascript
// systems/visual_shell/web/js/MockAgentData.js
/**
 * MockAgentData - Generates realistic agent data for Glass Box demo.
 */
const MockAgentData = {
    goals: [
        'Optimize rendering pipeline',
        'Analyze user intent patterns',
        'Monitor substrate health',
        'Coordinate agent swarm',
        'Process visual telemetry'
    ],

    thoughtTemplates: [
        { text: 'Analyzing input data...', type: 'inference' },
        { text: 'Querying knowledge base', type: 'inference' },
        { text: 'Formulating response', type: 'inference' },
        { text: 'Executing action plan', type: 'action' },
        { text: 'Verifying result', type: 'action' },
        { text: 'Waiting for dependencies', type: 'inference' },
        { text: 'Broadcasting status update', type: 'action' }
    ],

    generate(agentId) {
        const hash = this._hashString(agentId);
        const now = new Date();

        return {
            thoughts: this._generateThoughts(hash, now),
            intent: this._generateIntent(hash),
            metabolism: this._generateMetabolism(hash),
            communications: this._generateCommunications(hash, agentId)
        };
    },

    _generateThoughts(hash, now) {
        const count = 3 + (hash % 5);
        const thoughts = [];

        for (let i = 0; i < count; i++) {
            const template = this.thoughtTemplates[(hash + i) % this.thoughtTemplates.length];
            const time = new Date(now - (count - i) * 1000);
            thoughts.push({
                time: time.toTimeString().slice(0, 8),
                text: template.text,
                type: template.type
            });
        }

        return thoughts;
    },

    _generateIntent(hash) {
        const goal = this.goals[hash % this.goals.length];
        const stepCount = 3 + (hash % 3);
        const steps = [];

        const stepTemplates = [
            'Initialize process',
            'Gather requirements',
            'Analyze constraints',
            'Generate candidates',
            'Evaluate options',
            'Select best path',
            'Execute plan',
            'Verify outcome'
        ];

        for (let i = 0; i < stepCount; i++) {
            steps.push({
                text: stepTemplates[(hash + i) % stepTemplates.length],
                complete: i < (hash % stepCount)
            });
        }

        return { goal, steps };
    },

    _generateMetabolism(hash) {
        return {
            ipc: 0.4 + (hash % 100) / 200,
            memory: {
                used: 100 + (hash % 400),
                total: 512
            },
            activity: 0.2 + (hash % 80) / 100
        };
    },

    _generateCommunications(hash, agentId) {
        const targets = ['agent-hypervisor', 'agent-memory', 'agent-cognitive', 'broadcast'];
        const types = ['request', 'response', 'ack', 'event'];

        return [
            {
                direction: 'out',
                target: targets[hash % targets.length],
                type: types[hash % types.length]
            },
            {
                direction: 'in',
                target: targets[(hash + 1) % targets.length],
                type: types[(hash + 2) % types.length]
            }
        ];
    },

    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            hash = ((hash << 5) - hash) + str.charCodeAt(i);
            hash = hash & hash;
        }
        return Math.abs(hash);
    }
};

// Export
if (typeof window !== 'undefined') {
    window.MockAgentData = MockAgentData;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MockAgentData;
}
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/js/MockAgentData.js systems/visual_shell/web/tests/test_mock_agent_data.js
git commit -m "feat(glass-box): add mock data generator

- Generate consistent mock data per agent ID
- Thoughts, intent, metabolism, communications
- Used for demo before real integration

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Integration with Demo Page

**Files:**
- Modify: `systems/visual_shell/web/neural_city_demo.html`

**Step 1: Add Glass Box imports to demo page**

Add after existing script imports:

```html
<script src="js/MockAgentData.js"></script>
<script src="js/GlassBoxOverlay.js"></script>
<script src="js/AgentDataPanel.js"></script>
<script src="js/AgentController.js"></script>
```

**Step 2: Add Glass Box CSS**

Add to `<style>` section:

```css
/* Glass Box Styles */
.glass-box-overlay h2 { color: #0ff; margin: 0 0 10px 0; }
.glass-box-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; border-bottom: 1px solid #0ff; padding-bottom: 10px; }
.close-btn { background: #f44; border: none; color: white; padding: 5px 10px; cursor: pointer; border-radius: 3px; }
.agent-id { color: #888; font-family: monospace; }
.data-section { margin-bottom: 20px; padding: 10px; background: rgba(0, 50, 100, 0.3); border-radius: 5px; }
.data-section h3 { color: #0ff; margin: 0 0 10px 0; font-size: 14px; }
.live-indicator { color: #0f0; font-size: 10px; animation: pulse 1s infinite; }
@keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.5; } }
.thought-item { font-size: 12px; margin: 5px 0; }
.thought-item.type-inference { color: #0af; }
.thought-item.type-action { color: #0f0; }
.metric { display: flex; align-items: center; gap: 10px; margin: 5px 0; }
.metric label { width: 60px; color: #888; }
.metric .bar { flex: 1; height: 10px; background: #333; border-radius: 5px; overflow: hidden; }
.metric .bar div { height: 100%; background: linear-gradient(90deg, #0f0, #0ff); }
.control-bar { display: flex; gap: 5px; margin-top: 20px; flex-wrap: wrap; }
.control-bar button { flex: 1; min-width: 80px; padding: 8px; font-size: 11px; }
.command-panel { display: flex; gap: 5px; margin-top: 10px; }
.command-panel input { flex: 1; padding: 5px; background: #111; border: 1px solid #0ff; color: #0ff; }
```

**Step 3: Verify Glass Box opens on click**

Open `neural_city_demo.html` in browser
Expected: Click building → Glass Box slides in with agent data

**Step 4: Commit**

```bash
git add systems/visual_shell/web/neural_city_demo.html
git commit -m "feat(glass-box): integrate with demo page

- Add Glass Box component imports
- Add CSS styling for overlay
- Click on building opens introspection panel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | GlassBoxOverlay component | `js/GlassBoxOverlay.js` | 5 |
| 2 | AgentDataPanel component | `js/AgentDataPanel.js` | 5 |
| 3 | AgentController component | `js/AgentController.js` | 5 |
| 4 | Wire into NeuralCityEngine | `NeuralCityEngine.js` | - |
| 5 | Mock data generator | `js/MockAgentData.js` | 3 |
| 6 | Demo integration | `neural_city_demo.html` | - |

**Total: 6 tasks, 18 tests**

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-19-glass-box-introspection-implementation.md`. Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
