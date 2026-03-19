# ASCII-First Refactoring Guide

> How to transform any existing application into an ASCII-First architecture that AI agents can control.

## Overview

ASCII-First refactoring transforms a GUI-centric application into one where:
- ASCII text is the primary interface
- AI agents can "see" and "control" the app via HTTP
- The GUI becomes an optional mirror of the ASCII state
- All actions are accessible via simple label commands

This guide shows you how to take an existing app and systematically refactor it.

---

## The 7-Phase Refactoring Process

```
┌─────────────────────────────────────────────────────────────┐
│                 ASCII-First Refactoring                      │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  Phase 0: AUDIT     →  Understand existing app              │
│  Phase 1: EXTRACT   →  Separate business logic              │
│  Phase 2: DEFINE    →  Create state machine                 │
│  Phase 3: TEMPLATE  →  Build ASCII templates                │
│  Phase 4: API       →  Expose HTTP endpoints                │
│  Phase 5: CONNECT   →  Link GUI to ASCII state              │
│  Phase 6: BRIDGE    →  Add MCP integration                  │
│  Phase 7: TEST      →  Verify at all levels                 │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

---

## Phase 0: Audit the Existing App

Before writing any code, understand what the app does.

### Step 0.1: Map All Screens/Views

Find every distinct screen or view in the application:

```bash
# For React apps
grep -r "Route\|path=" src/ --include="*.tsx" --include="*.jsx"

# For Vue apps
grep -r "route\|path:" src/ --include="*.vue" --include="*.ts"

# For general web apps
grep -r "page\|screen\|view" src/ --include="*.ts" --include="*.js"

# For Electron apps
grep -r "BrowserWindow\|loadURL" src/ --include="*.ts"
```

**Create a screen inventory:**

| Screen Name | Purpose | Key Data | Actions Available |
|-------------|---------|----------|-------------------|
| Dashboard | Overview | Stats, metrics | Navigate, refresh |
| Users | List users | User list | Add, edit, delete |
| Settings | Config | Settings | Save, reset |
| Details | Item info | Item data | Edit, delete, back |

### Step 0.2: Identify Business Logic

Find code that doesn't depend on UI:

```bash
# Look for:
# - Data processing functions
# - API clients
# - State management
# - Business rules/validation
# - Calculations

grep -r "function\|class" src/ --include="*.ts" | grep -v "component\|view\|page\|test"
```

**Separate into categories:**

| Category | Example | Location |
|----------|---------|----------|
| Data fetching | `fetchUsers()`, `saveSettings()` | API clients |
| Processing | `calculateTotal()`, `validateForm()` | Utilities |
| State | `currentUser`, `isLoading` | Store/context |
| Business rules | `canDelete()`, `isRequired()` | Domain logic |

### Step 0.3: Find State Management

```bash
# Redux
grep -r "createSlice\|reducer" src/

# Context
grep -r "createContext\|useContext" src/

# Local state
grep -r "useState\|this.state" src/

# MobX, Zustand, etc.
grep -r "observable\|create\|store" src/
```

**Document current state:**

```typescript
// Example: What state exists in the app?
interface AppState {
  user: User | null
  items: Item[]
  isLoading: boolean
  error: string | null
  currentScreen: 'dashboard' | 'users' | 'settings'
}
```

### Step 0.4: Map Data Flow

Draw how data moves through the app:

```
┌─────────────┐
│   User      │
│   Action    │
└──────┬──────┘
       │
       ▼
┌─────────────┐     ┌─────────────┐
│   Event     │────▶│   Handler   │
│   Handler   │     │             │
└─────────────┘     └──────┬──────┘
                           │
       ┌───────────────────┼───────────────────┐
       │                   │                   │
       ▼                   ▼                   ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│    API      │     │   State     │     │    Side     │
│   Client    │     │   Update    │     │   Effects   │
└─────────────┘     └─────────────┘     └─────────────┘
```

---

## Phase 1: Extract Core Business Logic

Move all non-UI code to a `core/` directory.

### Step 1.1: Create Core Directory Structure

```
src/
├── core/                    # NEW: Business logic
│   ├── index.ts             # Unified exports
│   ├── api/                 # API clients
│   ├── domain/              # Business rules
│   ├── utils/               # Pure functions
│   └── types/               # Shared types
│
├── presentation/            # RENAMED: Old src/
│   ├── components/          # UI components
│   ├── pages/               # Page components
│   └── App.tsx              # Entry point
│
└── ascii/                   # NEW: ASCII interface (Phase 2)
```

### Step 1.2: Identify Files to Move

**Move these to core:**

| Type | Example | Why |
|------|---------|-----|
| API clients | `api.ts`, `httpClient.ts` | No UI dependency |
| Domain models | `User.ts`, `Product.ts` | Pure data |
| Business rules | `validators.ts`, `rules.ts` | Pure logic |
| Utilities | `formatters.ts`, `calculations.ts` | Pure functions |
| Types | `types.ts`, `interfaces.ts` | Shared contracts |

**Keep in presentation:**

| Type | Example | Why |
|------|---------|-----|
| Components | `Button.tsx`, `Form.tsx` | UI-specific |
| Pages | `Dashboard.tsx` | UI composition |
| Styles | `*.css`, `*.scss` | Visual only |
| Hooks (some) | `useWindowSize.ts` | UI-specific |

### Step 1.3: Move and Update Imports

```bash
# Example move
mv src/api/userApi.ts src/core/api/
mv src/utils/formatters.ts src/core/utils/
mv src/types.ts src/core/types/

# Update all imports
# Before: import { fetchUsers } from '../api/userApi'
# After:  import { fetchUsers } from '@core/api/userApi'
```

### Step 1.4: Create Core Index

```typescript
// src/core/index.ts
// Unified exports for all business logic

export * from './api/userApi'
export * from './api/productApi'
export * from './domain/user'
export * from './domain/product'
export * from './utils/formatters'
export * from './utils/validators'
export * from './types'
```

### Step 1.5: Verify Extraction

```bash
# Run tests to ensure nothing broke
npm test

# Type check
npx tsc --noEmit

# Build check
npm run build
```

---

## Phase 2: Define ASCII State Machine

Create a state machine that represents all screens.

### Step 2.1: Define State Types

```typescript
// src/ascii/state/types.ts

// List all screens from Phase 0 audit
export type AsciiState =
  | 'DASHBOARD'
  | 'USERS'
  | 'USER_DETAILS'
  | 'SETTINGS'
  | 'ERROR'

// Data available in templates
export interface AsciiStateData {
  state: AsciiState

  // Common data
  timestamp: string
  appVersion: string
  status: 'READY' | 'LOADING' | 'ERROR'

  // Screen-specific data (union of all screens)
  users?: User[]
  selectedUser?: User
  settings?: Settings
  errorMessage?: string

  // Navigation helpers
  breadcrumbs: string[]
  availableActions: string[]
}

// Label bindings configuration
export interface BindingConfig {
  stateTransitions: Record<AsciiState, Record<string, AsciiState>>
  actions: Record<string, string>
}
```

### Step 2.2: Create State Store

```typescript
// src/ascii/state/store.ts

import type { AsciiState, AsciiStateData, BindingConfig } from './types'
import bindings from '../bindings.json'

export class AsciiStateStore {
  private _state: AsciiState = 'DASHBOARD'
  private _data: Partial<AsciiStateData> = {}
  private _listeners: Set<() => void> = new Set()
  private bindings: BindingConfig = bindings

  /**
   * Get current state
   */
  getState(): AsciiState {
    return this._state
  }

  /**
   * Get current state data
   */
  getData(): Partial<AsciiStateData> {
    return { ...this._data, state: this._state }
  }

  /**
   * Update state data (triggers notification)
   */
  setData(data: Partial<AsciiStateData>): void {
    this._data = { ...this._data, ...data }
    this._notify()
  }

  /**
   * Transition to new state via label
   * Returns true if transition was valid
   */
  transition(label: string): boolean {
    const transitions = this.bindings.stateTransitions[this._state]
    if (transitions && transitions[label]) {
      this._state = transitions[label]
      this._notify()
      return true
    }
    return false
  }

  /**
   * Get action name for a label (if any)
   */
  getAction(label: string): string | undefined {
    return this.bindings.actions[label]
  }

  /**
   * Subscribe to state changes
   * Returns unsubscribe function
   */
  subscribe(listener: () => void): () => void {
    this._listeners.add(listener)
    return () => this._listeners.delete(listener)
  }

  /**
   * Force set state (for testing/external control)
   */
  setState(state: AsciiState): void {
    this._state = state
    this._notify()
  }

  /**
   * Get all bindings
   */
  getBindings(): BindingConfig {
    return this.bindings
  }

  /**
   * Notify all subscribers
   */
  private _notify(): void {
    this._listeners.forEach(listener => {
      try {
        listener()
      } catch (error) {
        console.error('[AsciiStateStore] Listener error:', error)
      }
    })
  }
}

// Singleton instance
export const asciiStateStore = new AsciiStateStore()
```

### Step 2.3: Create Bindings Configuration

```json
// src/ascii/bindings.json
{
  "stateTransitions": {
    "DASHBOARD": {
      "A": "DASHBOARD",
      "B": "USERS",
      "C": "SETTINGS",
      "X": "QUIT"
    },
    "USERS": {
      "A": "DASHBOARD",
      "B": "USERS",
      "C": "SETTINGS",
      "X": "DASHBOARD"
    },
    "USER_DETAILS": {
      "A": "DASHBOARD",
      "B": "USERS",
      "X": "USERS"
    },
    "SETTINGS": {
      "A": "DASHBOARD",
      "B": "USERS",
      "C": "SETTINGS",
      "X": "DASHBOARD"
    },
    "ERROR": {
      "A": "DASHBOARD",
      "X": "DASHBOARD"
    }
  },
  "actions": {
    "D": "delete",
    "E": "edit",
    "F": "create",
    "G": "save",
    "H": "refresh",
    "R": "retry"
  }
}
```

### Step 2.4: Create State Manager Wrapper

```typescript
// src/bun/ascii-state-manager.ts
// Backward-compatible wrapper around AsciiStateStore

import { AsciiStateStore, asciiStateStore } from '../ascii/state/store'
import type { AsciiState } from '../ascii/state/types'

export class StateManager {
  private store: AsciiStateStore
  private actionHandlers: Map<string, () => void | Promise<void>> = new Map()

  constructor(store?: AsciiStateStore) {
    this.store = store || asciiStateStore
  }

  registerActionHandler(action: string, handler: () => void | Promise<void>) {
    this.actionHandlers.set(action, handler)
  }

  async handleAction(label: string): Promise<{ success: boolean; action?: string; error?: string }> {
    // Try state transition first
    const transitioned = this.store.transition(label)

    if (transitioned) {
      const action = this.store.getAction(label)
      if (action) {
        const handler = this.actionHandlers.get(action)
        if (handler) await handler()
      }
      return { success: true, action }
    }

    // Check if it's an action label
    const action = this.store.getAction(label)
    if (action) {
      const handler = this.actionHandlers.get(action)
      if (handler) await handler()
      return { success: true, action }
    }

    return { success: false, error: `No action for label [${label}]` }
  }

  getState(): AsciiState {
    return this.store.getState()
  }

  setState(state: AsciiState) {
    this.store.setState(state)
  }

  getData() {
    return this.store.getData()
  }

  setData(data: any) {
    this.store.setData(data)
  }

  subscribe(listener: () => void): () => void {
    return this.store.subscribe(listener)
  }
}
```

---

## Phase 3: Create ASCII Templates

For each screen, create a template file.

### Step 3.1: Design Template Layout

Use a consistent 80-column grid:

```
+==============================================================================+
| HEADER                                                    Status: {{status}} |
+==============================================================================+
| NAVIGATION TABS                                                              |
+==============================================================================+
| CONTENT AREA                                                                 |
|                                                                              |
|                                                                              |
|                                                                              |
+==============================================================================+
| ACTIONS                                [Key] Action                          |
+==============================================================================+
```

### Step 3.2: Create Template Files

```
src/ascii/states/
├── dashboard.ascii
├── users.ascii
├── user_details.ascii
├── settings.ascii
└── error.ascii
```

**Example: Dashboard Template**

```
# State: DASHBOARD
# Grid: 80x24
# Generated: {{timestamp}}

+==============================================================================+
| MY APP v{{appVersion}}                                       Status: {{status}} |
+==============================================================================+
|                                                                              |
| [A]Dashboard  [B]Users  [C]Settings                                          |
|  ========                                                                    |
+==============================================================================+
| OVERVIEW                                                                     |
+------------------------------------------------------------------------------+
|                                                                              |
| Total Users: {{totalUsers}}                                                  |
| Active: {{activeCount}}                                                      |
| Last Updated: {{lastUpdated}}                                                |
|                                                                              |
+------------------------------------------------------------------------------+
| RECENT ACTIVITY                                                               |
+------------------------------------------------------------------------------+
{{#each recentActivity}}
| [{{label}}] {{description}}
{{/each}}
+==============================================================================+
| [F] Refresh  [H] Help  [X] Quit                                              |
+==============================================================================+
```

**Example: Users List Template**

```
# State: USERS
# Grid: 80x24
# Generated: {{timestamp}}

+==============================================================================+
| MY APP v{{appVersion}}                                       Status: {{status}} |
+==============================================================================+
|                                                                              |
| [A]Dashboard  [B]Users  [C]Settings                                          |
|               =====                                                          |
+==============================================================================+
| USERS ({{userCount}} total)                                                  |
+------------------------------------------------------------------------------+
| ID    | Name              | Email                | Status                    |
+------------------------------------------------------------------------------+
{{#each users}}
| [{{label}}] {{name}} | {{email}} | {{status}}
{{/each}}
+==============================================================================+
| [F] Create User  [H] Refresh  [X] Back to Dashboard                          |
+==============================================================================+
```

### Step 3.3: Create Template Renderer

```typescript
// src/bun/ascii-generator.ts

import { readFileSync } from 'fs'
import { join } from 'path'

export interface ViewData {
  state: string
  timestamp?: string
  appVersion?: string
  status?: string
  [key: string]: any
}

export class AsciiGenerator {
  private templates: Map<string, string> = new Map()

  constructor() {
    this.loadTemplates()
  }

  private loadTemplates(): void {
    const statesDir = join(import.meta.dir, '..', 'ascii', 'states')
    const states = ['dashboard', 'users', 'user_details', 'settings', 'error']

    for (const state of states) {
      try {
        const path = join(statesDir, `${state}.ascii`)
        this.templates.set(state.toUpperCase(), readFileSync(path, 'utf8'))
      } catch (error) {
        console.error(`Failed to load template for ${state}:`, error)
      }
    }
  }

  public render(data: ViewData): string {
    let template = this.templates.get(data.state)

    if (!template) {
      return `Error: No template found for state ${data.state}`
    }

    // Set defaults
    data.timestamp = data.timestamp || new Date().toISOString()
    data.appVersion = data.appVersion || '1.0.0'
    data.status = data.status || 'READY'

    // Replace variables
    template = this.replaceVariables(template, data)

    // Render loops
    template = this.renderLoops(template, data)

    // Render conditionals
    template = this.renderConditionals(template, data)

    return template
  }

  private replaceVariables(template: string, data: ViewData): string {
    return template.replace(/{{(\w+)}}/g, (match, key) => {
      return String(data[key] ?? '')
    })
  }

  private renderLoops(template: string, data: ViewData): string {
    // Handle {{#each items}}...{{/each}}
    const loopPattern = /{{#each (\w+)}}([\s\S]*?){{\/each}}/g

    return template.replace(loopPattern, (match, arrayName, itemTemplate) => {
      const items = data[arrayName] || []
      return items.map((item: any, index: number) => {
        let rendered = itemTemplate
        // Auto-generate labels (A, B, C...)
        const label = String.fromCharCode(65 + index)
        rendered = rendered.replace(/{{label}}/g, label)
        // Replace item properties
        Object.keys(item).forEach(key => {
          rendered = rendered.replace(new RegExp(`{{${key}}}`, 'g'), String(item[key]))
        })
        return rendered
      }).join('')
    })
  }

  private renderConditionals(template: string, data: ViewData): string {
    // Handle {{#if condition}}...{{/if}}
    const ifPattern = /{{#if (\w+)}}([\s\S]*?){{\/if}}/g

    return template.replace(ifPattern, (match, conditionName, content) => {
      return data[conditionName] ? content : ''
    })
  }
}
```

---

## Phase 4: Create HTTP API

Expose the ASCII interface via HTTP.

### Step 4.1: Create API Server

```typescript
// src/bun/api.ts

import { serve } from 'bun'
import { StateManager } from './ascii-state-manager'
import { AsciiGenerator } from './ascii-generator'

export interface ApiServerOptions {
  port?: number
  stateManager: StateManager
  asciiGenerator: AsciiGenerator
  handlers: {
    [key: string]: (params: any) => Promise<any>
  }
}

export function startApiServer(options: ApiServerOptions) {
  const port = options.port || 3421
  const { stateManager, asciiGenerator } = options

  const server = serve({
    port,
    async fetch(req) {
      const url = new URL(req.url)
      const path = url.pathname

      const headers = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
      }

      if (req.method === 'OPTIONS') {
        return new Response(null, { headers })
      }

      try {
        // Health check
        if (path === '/health') {
          return Response.json({ status: 'healthy' }, { headers })
        }

        // Get ASCII view
        if (path === '/view' && req.method === 'GET') {
          const data = stateManager.getData()
          const ascii = asciiGenerator.render(data as any)
          return new Response(ascii, {
            headers: { ...headers, 'Content-Type': 'text/plain' }
          })
        }

        // Control via label
        if (path === '/control' && req.method === 'POST') {
          const body = await req.json()
          const label = body.label

          if (!label) {
            return Response.json({ error: 'Missing label' }, { status: 400, headers })
          }

          const result = await stateManager.handleAction(label)

          if (result.success) {
            return Response.json({
              status: 'ok',
              state: stateManager.getState(),
              action: result.action
            }, { headers })
          } else {
            return Response.json({ error: result.error }, { status: 400, headers })
          }
        }

        // Get current state
        if (path === '/state' && req.method === 'GET') {
          return Response.json(stateManager.getData(), { headers })
        }

        // Get bindings reference
        if (path === '/bindings' && req.method === 'GET') {
          return Response.json(stateManager['store'].getBindings(), { headers })
        }

        // Metrics
        if (path === '/metrics' && req.method === 'GET') {
          return Response.json({
            requests: 0,
            avgLatencyMs: 0
          }, { headers })
        }

        return Response.json({ error: `Not found: ${path}` }, { status: 404, headers })

      } catch (error: any) {
        console.error(`API Error (${path}):`, error)
        return Response.json({ error: error.message }, { status: 500, headers })
      }
    }
  })

  console.log(`API Server started at http://localhost:${port}`)
  return server
}
```

### Step 4.2: Integrate with Main App

```typescript
// src/bun/index.ts

import { startApiServer } from './api'
import { StateManager } from './ascii-state-manager'
import { AsciiGenerator } from './ascii-generator'

// Initialize ASCII components
const stateManager = new StateManager()
const asciiGenerator = new AsciiGenerator()

// Register action handlers
stateManager.registerActionHandler('refresh', async () => {
  // Call your existing refresh logic
  await refreshData()
})

stateManager.registerActionHandler('create', async () => {
  // Call your existing create logic
  await createItem()
})

// Start API server
startApiServer({
  port: 3421,
  stateManager,
  asciiGenerator,
  handlers: {
    // Your existing handlers
  }
})
```

---

## Phase 5: Connect GUI to ASCII State

Make the GUI mirror the ASCII state.

### Step 5.1: Subscribe to State Changes

```typescript
// In your main GUI component

import { stateManager } from './ascii-state-manager'

// Subscribe to state changes
const unsubscribe = stateManager.subscribe(() => {
  const state = stateManager.getState()
  updateActiveTab(state)
})

function updateActiveTab(state: string) {
  // Update tab highlighting
  document.querySelectorAll('.tab').forEach(tab => {
    tab.classList.toggle('active', tab.dataset.state === state)
  })
}

// Cleanup on unmount
// unsubscribe()
```

### Step 5.2: Add Data Labels to GUI Elements

```html
<!-- Before -->
<button onclick="navigateToUsers()">Users</button>

<!-- After -->
<button data-label="B" onclick="handleLabel('B')">Users [B]</button>
```

```typescript
// Handle label actions
function handleLabel(label: string) {
  fetch('http://localhost:3421/control', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ label })
  })
}
```

---

## Phase 6: Add MCP Bridge (Optional)

Create a Python MCP server for AI integration.

### Step 6.1: Create MCP Server

```python
# mcp_ascii_bridge/src/mcp_ascii_bridge/server.py

import asyncio
import httpx
from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import TextContent, Tool

ASCII_API_URL = "http://localhost:3421"
app = Server("mcp-ascii-bridge")

@app.list_tools()
async def list_tools():
    return [
        Tool(
            name="ascii_view",
            description="Get the current ASCII screen",
            inputSchema={"type": "object", "properties": {}}
        ),
        Tool(
            name="ascii_control",
            description="Execute an action by label",
            inputSchema={
                "type": "object",
                "properties": {
                    "label": {"type": "string", "description": "Label (A-Z)"}
                },
                "required": ["label"]
            }
        ),
        Tool(
            name="ascii_navigate",
            description="Navigate to a specific state",
            inputSchema={
                "type": "object",
                "properties": {
                    "target": {"type": "string", "enum": ["DASHBOARD", "USERS", "SETTINGS"]}
                },
                "required": ["target"]
            }
        )
    ]

@app.call_tool()
async def call_tool(name: str, arguments: dict):
    async with httpx.AsyncClient() as client:
        if name == "ascii_view":
            response = await client.get(f"{ASCII_API_URL}/view")
            return [TextContent(type="text", text=response.text)]

        if name == "ascii_control":
            response = await client.post(
                f"{ASCII_API_URL}/control",
                json={"label": arguments["label"]}
            )
            return [TextContent(type="text", text=response.text)]

        if name == "ascii_navigate":
            label_map = {"DASHBOARD": "A", "USERS": "B", "SETTINGS": "C"}
            response = await client.post(
                f"{ASCII_API_URL}/control",
                json={"label": label_map[arguments["target"]]}
            )
            return [TextContent(type="text", text=response.text)]

async def main():
    async with stdio_server() as (read, write):
        await app.run(read, write, app.create_initialization_options())

if __name__ == "__main__":
    asyncio.run(main())
```

---

## Phase 7: Test at All Levels

### Step 7.1: Unit Tests

```typescript
// tests/ascii/state/store.test.ts

import { describe, test, expect } from 'bun:test'
import { AsciiStateStore } from '../../../src/ascii/state/store'

describe('AsciiStateStore', () => {
  test('initializes with DASHBOARD state', () => {
    const store = new AsciiStateStore()
    expect(store.getState()).toBe('DASHBOARD')
  })

  test('transitions to new state', () => {
    const store = new AsciiStateStore()
    store.transition('B')
    expect(store.getState()).toBe('USERS')
  })

  test('notifies subscribers on change', () => {
    const store = new AsciiStateStore()
    let notified = false
    store.subscribe(() => notified = true)
    store.transition('B')
    expect(notified).toBe(true)
  })
})
```

### Step 7.2: Integration Tests

```typescript
// tests/api/integration.test.ts

import { describe, test, expect } from 'bun:test'

describe('ASCII API', () => {
  test('GET /view returns ASCII', async () => {
    const res = await fetch('http://localhost:3421/view')
    const text = await res.text()
    expect(text).toContain('# State:')
  })

  test('POST /control transitions state', async () => {
    const res = await fetch('http://localhost:3421/control', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ label: 'B' })
    })
    const data = await res.json()
    expect(data.state).toBe('USERS')
  })
})
```

### Step 7.3: E2E Agent Tests

```typescript
// tests/e2e/agent.test.ts

import { describe, test, expect } from 'bun:test'

describe('Agent Workflow', () => {
  test('Agent can navigate all screens', async () => {
    const labels = ['A', 'B', 'C']

    for (const label of labels) {
      await fetch('http://localhost:3421/control', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ label })
      })

      const view = await fetch('http://localhost:3421/view').then(r => r.text())
      expect(view).toContain('[A]')  // Navigation labels exist
    }
  })
})
```

---

## Verification Checklist

After completing all phases, verify:

```markdown
## ASCII-First Verification Checklist

### Core Extraction
- [ ] Business logic in src/core/
- [ ] No UI dependencies in core
- [ ] Core exports via index.ts

### State Machine
- [ ] AsciiStateStore created
- [ ] All states defined
- [ ] Bindings.json complete
- [ ] Subscriptions work

### Templates
- [ ] One template per state
- [ ] 80-column grid layout
- [ ] Variable substitution works
- [ ] Loops render correctly

### API
- [ ] GET /view returns ASCII
- [ ] POST /control works
- [ ] GET /state returns JSON
- [ ] Error handling works

### GUI Integration
- [ ] GUI mirrors ASCII state
- [ ] Labels visible on buttons
- [ ] State changes update GUI

### MCP Bridge (Optional)
- [ ] Tools registered
- [ ] Can get ASCII view
- [ ] Can send control commands

### Tests
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] E2E agent test works
```

---

## Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| Forgetting to call `_notify()` | Always call after state changes |
| Hardcoding template paths | Use `import.meta.dir` for relative paths |
| Not handling missing data | Provide defaults in render() |
| Blocking event loop | Keep API handlers async |
| Forgetting CORS headers | Add to all responses |

---

## Time Estimates

| Phase | Time | Complexity |
|-------|------|------------|
| Phase 0: Audit | 1-2 hours | Low |
| Phase 1: Extract Core | 2-4 hours | Medium |
| Phase 2: State Machine | 2-3 hours | Medium |
| Phase 3: Templates | 1-2 hours | Low |
| Phase 4: API | 1-2 hours | Low |
| Phase 5: GUI Connect | 1-2 hours | Low |
| Phase 6: MCP Bridge | 1-2 hours | Low |
| Phase 7: Testing | 2-3 hours | Medium |
| **Total** | **11-20 hours** | |

---

## Quick Start Template

Copy this structure for new projects:

```
my-app/
├── src/
│   ├── core/
│   │   └── index.ts
│   ├── ascii/
│   │   ├── state/
│   │   │   ├── store.ts
│   │   │   └── types.ts
│   │   ├── states/
│   │   │   └── dashboard.ascii
│   │   └── bindings.json
│   └── bun/
│       ├── api.ts
│       ├── ascii-generator.ts
│       └── ascii-state-manager.ts
└── tests/
    └── ascii/
```
