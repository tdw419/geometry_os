# WebMCP Phase B: Expanded 8 Tools — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add 4 new WebMCP tools (query_hilbert_address, trigger_evolution, send_llm_prompt, spawn_area_agent) to enable AI agents to access Hilbert spatial data, evolution cycles, LLM communication, and agent spawning.

**Architecture:** Extend existing `webmcp_bridge.js` with hybrid connectivity — pure JS for Hilbert, WebSocket for evolution/agents, HTTP for LLM. Graceful degradation with helpful error messages when backends unavailable.

**Tech Stack:** JavaScript (ES6+), WebMCP API (Chrome 146+), HilbertLUT, WebSocket, fetch API

---

## Prerequisites

- Phase A complete (webmcp_bridge.js with 4 tools)
- `systems/visual_shell/web/hilbert_lut.js` exists
- Chrome 146+ for testing

---

### Task 1: Add query_hilbert_address Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js` (add after Tool 4)
- Verify: `systems/visual_shell/web/hilbert_lut.js` exists

**Step 1: Verify HilbertLUT is available**

Run: Check that `hilbert_lut.js` is loaded in `index.html`

Expected: Script tag exists for `hilbert_lut.js`

If missing, add to `index.html`:
```html
<script src="hilbert_lut.js"></script>
```

**Step 2: Add registration method for Tool 5**

Add to `webmcp_bridge.js` after the `#registerLoadRTSCartridge` method:

```javascript
// ─────────────────────────────────────────────────────────────
// Tool 5: query_hilbert_address
// ─────────────────────────────────────────────────────────────

async #registerQueryHilbertAddress() {
    const tool = {
        name: 'query_hilbert_address',
        description:
            'Convert a 1D Hilbert index to 2D coordinates and read pixel data ' +
            'from that spatial location. The Hilbert curve preserves spatial ' +
            'locality, so nearby indices map to nearby coordinates.',
        inputSchema: {
            type: 'object',
            properties: {
                hilbert_index: {
                    type: 'number',
                    description: '1D Hilbert index (0 to grid_size²-1)'
                },
                grid_size: {
                    type: 'number',
                    description: 'Hilbert curve grid size, must be power of 2 (default: 256)',
                    default: 256
                },
                read_pixels: {
                    type: 'boolean',
                    description: 'Read RGBA values at the coordinate (default: true)',
                    default: true
                },
                context_range: {
                    type: 'number',
                    description: 'Include surrounding pixels in a radius (0-10, default: 0)',
                    default: 0,
                    minimum: 0,
                    maximum: 10
                }
            },
            required: ['hilbert_index']
        },
        handler: async (params) => {
            return this.#handleQueryHilbertAddress(params);
        }
    };

    await navigator.modelContext.registerTool(tool);
    this.#registeredTools.push(tool.name);
}
```

**Step 3: Add handler method for Tool 5**

```javascript
#handleQueryHilbertAddress({ hilbert_index, grid_size = 256, read_pixels = true, context_range = 0 }) {
    this.#trackCall('query_hilbert_address');

    // Validate input
    if (typeof hilbert_index !== 'number' || hilbert_index < 0) {
        return {
            success: false,
            error: 'hilbert_index must be a non-negative number',
            error_code: 'INVALID_INPUT'
        };
    }

    if (hilbert_index >= grid_size * grid_size) {
        return {
            success: false,
            error: `hilbert_index ${hilbert_index} exceeds maximum for grid_size ${grid_size} (max: ${grid_size * grid_size - 1})`,
            error_code: 'INVALID_INPUT'
        };
    }

    // Check if HilbertLUT is available
    if (typeof HilbertLUT === 'undefined' || !HilbertLUT.d2xy) {
        return {
            success: false,
            error: 'HilbertLUT not available. Ensure hilbert_lut.js is loaded.',
            error_code: 'BACKEND_UNAVAILABLE'
        };
    }

    // Convert Hilbert index to coordinates
    const [x, y] = HilbertLUT.d2xy(grid_size, hilbert_index);

    const result = {
        success: true,
        hilbert_index,
        grid_size,
        coordinates: { x, y }
    };

    // Read pixel data if requested
    if (read_pixels && this.#app.worldContainer) {
        try {
            const pixelData = this.#readPixelAtWorld(x, y, context_range);
            result.rgba = pixelData.center;
            if (context_range > 0) {
                result.context = pixelData.context;
            }
        } catch (err) {
            result.pixelReadError = err.message;
        }
    }

    return result;
}

#readPixelAtWorld(x, y, range) {
    // Create offscreen canvas to read pixels
    const renderer = this.#app.app?.renderer;
    if (!renderer) {
        throw new Error('Renderer not available');
    }

    // For now, return a placeholder - actual pixel reading requires
    // extracting from the WebGL/WebGPU framebuffer
    return {
        center: { r: 0, g: 0, b: 0, a: 0 },
        context: range > 0 ? [] : undefined,
        note: 'Pixel reading from GPU framebuffer requires extract plugin'
    };
}
```

**Step 4: Update #register method to include Tool 5**

In the `#register()` method, add the new tool registration:

```javascript
async #register() {
    if (this.#registered) return;
    this.#registered = true;

    console.log('🔌 WebMCP: Registering Geometry OS tools...');

    try {
        await this.#registerNavigateMap();
        await this.#registerGetOSState();
        await this.#registerExecutePixelProgram();
        await this.#registerLoadRTSCartridge();

        // Phase B tools
        await this.#registerQueryHilbertAddress();

        await this.#publishContext();

        console.log(`🔌 WebMCP: ✅ ${this.#registeredTools.length} tools registered:`);
        this.#registeredTools.forEach(name =>
            console.log(`   • ${name}`)
        );

    } catch (err) {
        console.error('🔌 WebMCP: Registration failed:', err);
    }
}
```

**Step 5: Test in browser console**

Run: Open `http://localhost:8080/test_webmcp_bridge.html`

```javascript
window.webmcpBridge.getStatus().tools
```

Expected: `['navigate_map', 'get_os_state', 'execute_pixel_program', 'load_rts_cartridge', 'query_hilbert_address']`

**Step 6: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add query_hilbert_address tool for Phase B"
```

---

### Task 2: Add trigger_evolution Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add WebSocket helper for evolution backend**

Add to the class (near top, after #toolCallCounts):

```javascript
/** @type {WebSocket|null} */
#evolutionSocket = null;

#connectEvolutionSocket() {
    return new Promise((resolve, reject) => {
        if (this.#evolutionSocket?.readyState === WebSocket.OPEN) {
            resolve(this.#evolutionSocket);
            return;
        }

        const ws = new WebSocket('ws://localhost:8765/evolution');

        ws.onopen = () => {
            this.#evolutionSocket = ws;
            resolve(ws);
        };

        ws.onerror = () => {
            reject(new Error('Evolution backend not running at ws://localhost:8765'));
        };

        // 5 second timeout
        setTimeout(() => {
            if (ws.readyState !== WebSocket.OPEN) {
                reject(new Error('Evolution backend connection timeout'));
            }
        }, 5000);
    });
}
```

**Step 2: Add registration method for Tool 6**

```javascript
// ─────────────────────────────────────────────────────────────
// Tool 6: trigger_evolution
// ─────────────────────────────────────────────────────────────

async #registerTriggerEvolution() {
    const tool = {
        name: 'trigger_evolution',
        description:
            'Trigger a WGSL kernel evolution cycle in the Evolution Zone. ' +
            'The evolution system uses genetic algorithms to optimize shader ' +
            'code based on the specified fitness metric.',
        inputSchema: {
            type: 'object',
            properties: {
                seed_shader: {
                    type: 'string',
                    description: 'WGSL shader code to use as evolution seed'
                },
                generations: {
                    type: 'number',
                    description: 'Number of evolution generations (1-100)',
                    default: 10,
                    minimum: 1,
                    maximum: 100
                },
                fitness_metric: {
                    type: 'string',
                    enum: ['performance', 'visual_quality', 'correctness', 'entropy'],
                    description: 'Fitness evaluation metric (default: performance)',
                    default: 'performance'
                },
                mutation_rate: {
                    type: 'number',
                    description: 'Mutation rate (0.01-0.5)',
                    default: 0.1,
                    minimum: 0.01,
                    maximum: 0.5
                },
                population_size: {
                    type: 'number',
                    description: 'Population size for evolution',
                    default: 20
                }
            },
            required: ['seed_shader']
        },
        handler: async (params) => {
            return this.#handleTriggerEvolution(params);
        }
    };

    await navigator.modelContext.registerTool(tool);
    this.#registeredTools.push(tool.name);
}
```

**Step 3: Add handler method for Tool 6**

```javascript
async #handleTriggerEvolution({
    seed_shader,
    generations = 10,
    fitness_metric = 'performance',
    mutation_rate = 0.1,
    population_size = 20
}) {
    this.#trackCall('trigger_evolution');

    // Validate input
    if (!seed_shader || typeof seed_shader !== 'string') {
        return {
            success: false,
            error: 'seed_shader is required and must be a string',
            error_code: 'INVALID_INPUT'
        };
    }

    try {
        const ws = await this.#connectEvolutionSocket();

        return new Promise((resolve) => {
            const requestId = Date.now().toString(36);

            const handleResponse = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    if (data.requestId === requestId) {
                        ws.removeEventListener('message', handleResponse);
                        resolve({
                            success: true,
                            bestFitness: data.bestFitness,
                            generationsCompleted: data.generationsCompleted,
                            evolvedShader: data.evolvedShader,
                            cartridgeId: data.cartridgeId
                        });
                    }
                } catch (err) {
                    ws.removeEventListener('message', handleResponse);
                    resolve({
                        success: false,
                        error: `Invalid response from evolution backend: ${err.message}`,
                        error_code: 'EXECUTION_FAILED'
                    });
                }
            };

            ws.addEventListener('message', handleResponse);

            ws.send(JSON.stringify({
                type: 'evolve',
                requestId,
                seed: seed_shader,
                generations,
                fitnessMetric: fitness_metric,
                mutationRate: mutation_rate,
                populationSize: population_size
            }));

            // 60 second timeout for evolution
            setTimeout(() => {
                ws.removeEventListener('message', handleResponse);
                resolve({
                    success: false,
                    error: 'Evolution request timed out after 60 seconds',
                    error_code: 'EXECUTION_FAILED'
                });
            }, 60000);
        });

    } catch (err) {
        return {
            success: false,
            error: `Evolution backend unavailable: ${err.message}. Start the evolution daemon at ws://localhost:8765`,
            error_code: 'BACKEND_UNAVAILABLE'
        };
    }
}
```

**Step 4: Update #register method**

Add to the registration sequence:

```javascript
await this.#registerTriggerEvolution();
```

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add trigger_evolution tool for Phase B"
```

---

### Task 3: Add send_llm_prompt Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add registration method for Tool 7**

```javascript
// ─────────────────────────────────────────────────────────────
// Tool 7: send_llm_prompt
// ─────────────────────────────────────────────────────────────

async #registerSendLLMPrompt() {
    const tool = {
        name: 'send_llm_prompt',
        description:
            'Send a prompt to the LM Studio bridge for AI-to-AI communication. ' +
            'Uses the OpenAI-compatible API at localhost:1234.',
        inputSchema: {
            type: 'object',
            properties: {
                prompt: {
                    type: 'string',
                    description: 'The prompt to send to the LLM'
                },
                model: {
                    type: 'string',
                    description: 'Model identifier (use "local" for default)',
                    default: 'local'
                },
                temperature: {
                    type: 'number',
                    description: 'Sampling temperature (0-2)',
                    default: 0.7,
                    minimum: 0,
                    maximum: 2
                },
                max_tokens: {
                    type: 'number',
                    description: 'Maximum tokens in response',
                    default: 2048
                },
                system_prompt: {
                    type: 'string',
                    description: 'Optional system prompt to set context'
                }
            },
            required: ['prompt']
        },
        handler: async (params) => {
            return this.#handleSendLLMPrompt(params);
        }
    };

    await navigator.modelContext.registerTool(tool);
    this.#registeredTools.push(tool.name);
}
```

**Step 2: Add handler method for Tool 7**

```javascript
async #handleSendLLMPrompt({
    prompt,
    model = 'local',
    temperature = 0.7,
    max_tokens = 2048,
    system_prompt
}) {
    this.#trackCall('send_llm_prompt');

    if (!prompt || typeof prompt !== 'string') {
        return {
            success: false,
            error: 'prompt is required and must be a string',
            error_code: 'INVALID_INPUT'
        };
    }

    const startTime = Date.now();

    try {
        const messages = [];

        if (system_prompt) {
            messages.push({ role: 'system', content: system_prompt });
        }
        messages.push({ role: 'user', content: prompt });

        const response = await fetch('http://localhost:1234/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                model: model,
                messages: messages,
                temperature: temperature,
                max_tokens: max_tokens
            })
        });

        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`);
        }

        const data = await response.json();
        const latencyMs = Date.now() - startTime;

        return {
            success: true,
            response: data.choices?.[0]?.message?.content || '',
            model: data.model || model,
            tokensUsed: {
                prompt: data.usage?.prompt_tokens || 0,
                completion: data.usage?.completion_tokens || 0,
                total: data.usage?.total_tokens || 0
            },
            latencyMs
        };

    } catch (err) {
        return {
            success: false,
            error: `LM Studio unavailable: ${err.message}. Ensure LM Studio is running with API server enabled at localhost:1234`,
            error_code: 'BACKEND_UNAVAILABLE'
        };
    }
}
```

**Step 3: Update #register method**

```javascript
await this.#registerSendLLMPrompt();
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add send_llm_prompt tool for Phase B"
```

---

### Task 4: Add spawn_area_agent Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add WebSocket helper for agent backend**

```javascript
/** @type {WebSocket|null} */
#agentSocket = null;

#connectAgentSocket() {
    return new Promise((resolve, reject) => {
        if (this.#agentSocket?.readyState === WebSocket.OPEN) {
            resolve(this.#agentSocket);
            return;
        }

        const ws = new WebSocket('ws://localhost:8765/agents');

        ws.onopen = () => {
            this.#agentSocket = ws;
            resolve(ws);
        };

        ws.onerror = () => {
            reject(new Error('Agent orchestrator not running at ws://localhost:8765'));
        };

        setTimeout(() => {
            if (ws.readyState !== WebSocket.OPEN) {
                reject(new Error('Agent backend connection timeout'));
            }
        }, 5000);
    });
}
```

**Step 2: Add registration method for Tool 8**

```javascript
// ─────────────────────────────────────────────────────────────
// Tool 8: spawn_area_agent
// ─────────────────────────────────────────────────────────────

async #registerSpawnAreaAgent() {
    const tool = {
        name: 'spawn_area_agent',
        description:
            'Create a new area agent to monitor or act on a specific region ' +
            'of the infinite map. Agents can monitor changes, execute code, ' +
            'evolve shaders, or analyze patterns in their assigned region.',
        inputSchema: {
            type: 'object',
            properties: {
                agent_type: {
                    type: 'string',
                    enum: ['monitor', 'executor', 'evolver', 'analyzer'],
                    description: 'Type of agent to spawn'
                },
                region: {
                    type: 'object',
                    properties: {
                        x: { type: 'number', description: 'Region X origin' },
                        y: { type: 'number', description: 'Region Y origin' },
                        width: { type: 'number', description: 'Region width' },
                        height: { type: 'number', description: 'Region height' }
                    },
                    required: ['x', 'y', 'width', 'height'],
                    description: 'Region bounds for the agent to monitor'
                },
                config: {
                    type: 'object',
                    description: 'Agent-specific configuration options'
                },
                auto_start: {
                    type: 'boolean',
                    description: 'Start the agent immediately (default: true)',
                    default: true
                }
            },
            required: ['agent_type', 'region']
        },
        handler: async (params) => {
            return this.#handleSpawnAreaAgent(params);
        }
    };

    await navigator.modelContext.registerTool(tool);
    this.#registeredTools.push(tool.name);
}
```

**Step 3: Add handler method for Tool 8**

```javascript
async #handleSpawnAreaAgent({
    agent_type,
    region,
    config = {},
    auto_start = true
}) {
    this.#trackCall('spawn_area_agent');

    // Validate input
    if (!agent_type || !['monitor', 'executor', 'evolver', 'analyzer'].includes(agent_type)) {
        return {
            success: false,
            error: 'agent_type must be one of: monitor, executor, evolver, analyzer',
            error_code: 'INVALID_INPUT'
        };
    }

    if (!region || typeof region.x !== 'number' || typeof region.y !== 'number') {
        return {
            success: false,
            error: 'region must include x and y as numbers',
            error_code: 'INVALID_INPUT'
        };
    }

    try {
        const ws = await this.#connectAgentSocket();

        return new Promise((resolve) => {
            const requestId = Date.now().toString(36);

            const handleResponse = (event) => {
                try {
                    const data = JSON.parse(event.data);
                    if (data.requestId === requestId) {
                        ws.removeEventListener('message', handleResponse);
                        resolve({
                            success: true,
                            agentId: data.agentId,
                            status: data.status || 'spawned',
                            region: data.region || region,
                            heartbeatInterval: data.heartbeatInterval || 30
                        });
                    }
                } catch (err) {
                    ws.removeEventListener('message', handleResponse);
                    resolve({
                        success: false,
                        error: `Invalid response from agent backend: ${err.message}`,
                        error_code: 'EXECUTION_FAILED'
                    });
                }
            };

            ws.addEventListener('message', handleResponse);

            ws.send(JSON.stringify({
                type: 'spawn',
                requestId,
                agentType: agent_type,
                region,
                config,
                autoStart: auto_start
            }));

            // 10 second timeout
            setTimeout(() => {
                ws.removeEventListener('message', handleResponse);
                resolve({
                    success: false,
                    error: 'Agent spawn request timed out',
                    error_code: 'EXECUTION_FAILED'
                });
            }, 10000);
        });

    } catch (err) {
        return {
            success: false,
            error: `Agent orchestrator unavailable: ${err.message}. Start the agent daemon at ws://localhost:8765`,
            error_code: 'BACKEND_UNAVAILABLE'
        };
    }
}
```

**Step 4: Update #register method**

```javascript
await this.#registerSpawnAreaAgent();
```

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add spawn_area_agent tool for Phase B"
```

---

### Task 5: Update Test Page for Phase B

**Files:**
- Modify: `systems/visual_shell/web/test_webmcp_bridge.html`

**Step 1: Add Phase B tests to the test suite**

Add after the existing tests in the test page:

```javascript
// Phase B Tests
test(
    'query_hilbert_address Tool Registered',
    'Check if the Hilbert query tool is available',
    () => {
        const status = window.webmcpBridge.getStatus();
        const registered = status.tools.includes('query_hilbert_address');
        return {
            pass: registered,
            detail: registered
                ? 'query_hilbert_address is registered'
                : 'Tool not found in registered tools list'
        };
    }
);

test(
    'HilbertLUT Available',
    'Check if HilbertLUT class is loaded for coordinate conversion',
    () => {
        const available = typeof HilbertLUT !== 'undefined';
        return {
            pass: available,
            detail: available
                ? 'HilbertLUT is available for Hilbert index conversion'
                : 'HilbertLUT not loaded - hilbert_lut.js may be missing'
        };
    }
);

test(
    'Hilbert Index 0 → Origin',
    'Verify that Hilbert index 0 maps to (0, 0)',
    () => {
        if (typeof HilbertLUT === 'undefined') {
            return { pass: false, detail: 'HilbertLUT not available' };
        }
        const [x, y] = HilbertLUT.d2xy(256, 0);
        const correct = x === 0 && y === 0;
        return {
            pass: correct,
            detail: correct
                ? 'Hilbert index 0 correctly maps to origin (0, 0)'
                : `Expected (0, 0), got (${x}, ${y})`
        };
    }
);

test(
    'trigger_evolution Tool Registered',
    'Check if the evolution tool is available',
    () => {
        const status = window.webmcpBridge.getStatus();
        const registered = status.tools.includes('trigger_evolution');
        return {
            pass: registered,
            detail: registered
                ? 'trigger_evolution is registered'
                : 'Tool not found in registered tools list'
        };
    }
);

test(
    'send_llm_prompt Tool Registered',
    'Check if the LLM prompt tool is available',
    () => {
        const status = window.webmcpBridge.getStatus();
        const registered = status.tools.includes('send_llm_prompt');
        return {
            pass: registered,
            detail: registered
                ? 'send_llm_prompt is registered'
                : 'Tool not found in registered tools list'
        };
    }
);

test(
    'spawn_area_agent Tool Registered',
    'Check if the agent spawning tool is available',
    () => {
        const status = window.webmcpBridge.getStatus();
        const registered = status.tools.includes('spawn_area_agent');
        return {
            pass: registered,
            detail: registered
                ? 'spawn_area_agent is registered'
                : 'Tool not found in registered tools list'
        };
    }
);
```

**Step 2: Update expected tool count**

Find and update the tool count check:

```javascript
test(
    'All 8 Tools Registered',
    'Verify that all Phase A + Phase B tools are registered',
    () => {
        const status = window.webmcpBridge.getStatus();
        const expected = 8;
        const actual = status.tools.length;
        return {
            pass: actual >= expected,
            detail: actual >= expected
                ? `All ${actual} tools registered`
                : `Expected ${expected} tools, found ${actual}`
        };
    }
);
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_webmcp_bridge.html
git commit -m "test(webmcp): add Phase B verification tests"
```

---

### Task 6: Ensure hilbert_lut.js is Loaded

**Files:**
- Verify: `systems/visual_shell/web/index.html`

**Step 1: Check if hilbert_lut.js is in index.html**

Run: Check for script tag

If missing, add to `index.html` before `webmcp_bridge.js`:

```html
<script src="hilbert_lut.js"></script> <!-- Hilbert curve spatial mapping -->
```

**Step 2: Verify in browser**

Run: Open `http://localhost:8080/index.html`

```javascript
typeof HilbertLUT
```

Expected: `"function"` or `"object"` (not `"undefined"`)

**Step 3: Commit (if changes made)**

```bash
git add systems/visual_shell/web/index.html
git commit -m "fix(webmcp): ensure hilbert_lut.js is loaded for Phase B"
```

---

### Task 7: Final Integration Test

**Files:**
- Test: Browser console

**Step 1: Verify all 8 tools registered**

```javascript
window.webmcpBridge.getStatus().tools
```

Expected:
```javascript
['navigate_map', 'get_os_state', 'execute_pixel_program', 'load_rts_cartridge', 'query_hilbert_address', 'trigger_evolution', 'send_llm_prompt', 'spawn_area_agent']
```

**Step 2: Test query_hilbert_address**

```javascript
await navigator.modelContext.callTool('query_hilbert_address', { hilbert_index: 0, grid_size: 256 })
```

Expected:
```javascript
{ success: true, coordinates: { x: 0, y: 0 }, ... }
```

**Step 3: Test graceful degradation**

```javascript
await navigator.modelContext.callTool('trigger_evolution', { seed_shader: 'test' })
```

Expected (without backend):
```javascript
{ success: false, error: "Evolution backend unavailable...", error_code: "BACKEND_UNAVAILABLE" }
```

**Step 4: Run test page**

Navigate to: `http://localhost:8080/test_webmcp_bridge.html`

Expected: All tests pass with green checkmarks

---

### Task 8: Final Commit and Documentation

**Files:**
- All modified files

**Step 1: Create summary commit (if not already done per-task)**

```bash
git add -A
git commit -m "feat(webmcp): complete Phase B with 4 new tools

Adds 4 new WebMCP tools for AI agent access:
- query_hilbert_address: Convert Hilbert index to coordinates + pixel data
- trigger_evolution: WGSL kernel evolution via WebSocket
- send_llm_prompt: AI-to-AI communication via LM Studio HTTP API
- spawn_area_agent: Region monitoring agents via WebSocket

All tools use hybrid connectivity with graceful degradation.
Test page updated with Phase B verification tests.

Total tools: 8 (Phase A: 4 + Phase B: 4)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Completion Checklist

- [ ] `query_hilbert_address` tool registered and functional
- [ ] `trigger_evolution` tool registered with WebSocket backend
- [ ] `send_llm_prompt` tool registered with HTTP backend
- [ ] `spawn_area_agent` tool registered with WebSocket backend
- [ ] `hilbert_lut.js` loaded in index.html
- [ ] Test page includes Phase B tests
- [ ] All 8 tools return from `getStatus().tools`
- [ ] Graceful degradation works for unavailable backends
- [ ] Commits made with descriptive messages
