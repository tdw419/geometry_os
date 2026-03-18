# ASCII-First Architecture Specification

## Overview

The ASCII-First Architecture makes ASCII the primary interface for the Session Analyzer application. GUI becomes an optional mirror that reads from ASCII state.

## Core Components

### 1. Core Business Logic (`src/core/`)

Extracted from presentation layer:

```
src/core/
├── index.ts           # Unified exports
├── providers/
│   ├── registry.ts    # Provider registry singleton
│   ├── types.ts       # LLMProviderAdapter, ModelDefinition types
│   └── *.ts           # Provider implementations
├── scanner/
│   └── SourceScanner.ts
├── scheduler/
│   └── SchedulerEngine.ts
├── config/
│   └── ConfigManager.ts
└── llm/
    └── LLMClient.ts
```

### 2. ASCII State Machine (`src/ascii/state/`)

Central state management:

```typescript
// types.ts
export type AsciiState = 'DASHBOARD' | 'SOURCES' | 'CONFIG' | 'HISTORY' | 'PROVIDERS'

export interface AsciiStateData {
  state: AsciiState
  projectPath: string
  lastRun: string | null
  status: 'READY' | 'RUNNING' | 'ERROR'
  runsToday: number
  successRate: string
  provider: string
  modelId: string
  sources: Array<{ id: string; label: string; enabled: boolean }>
  runs: Array<{ id: string; timestamp: string; status: string }>
}

// store.ts
export class AsciiStateStore {
  private _state: AsciiState
  private _data: Partial<AsciiStateData>
  private _listeners: Set<() => void>

  getState(): AsciiState
  getData(): Partial<AsciiStateData>
  setData(data: Partial<AsciiStateData>): void
  transition(label: string): boolean
  subscribe(listener: () => void): () => void
}
```

### 3. Template-Driven Rendering (`src/ascii/states/`)

Mustache-style templates:

```
src/ascii/states/
├── dashboard.ascii
├── sources.ascii
├── config.ascii
├── history.ascii
└── providers.ascii
```

Template syntax:
- `{{variable}}` - Variable substitution
- `{{#each items}}...{{/each}}` - List iteration
- `{{#if condition}}...{{/if}}` - Conditional rendering

### 4. API Layer

Endpoints:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/view` | GET | Returns rendered ASCII for current state |
| `/control` | POST | Accepts `{ "label": "X" }` to trigger actions |
| `/bindings` | GET | Returns label-to-action mappings |
| `/state` | GET | Returns current state data as JSON |

### 5. GUI Integration

GUI mirrors ASCII state:

```typescript
// In mainview/index.ts
stateStore.subscribe(() => {
  const state = stateStore.getState()
  // Update active tab
  document.querySelectorAll('.tab').forEach(tab => {
    tab.classList.toggle('active', tab.dataset.tab === state.toLowerCase())
  })
})
```

## Data Flow

```
User Action (GUI or API)
    ↓
/control {"label": "B"}
    ↓
AsciiStateStore.transition("B")
    ↓
State changes: DASHBOARD → SOURCES
    ↓
Notify subscribers
    ↓
┌─────────────────┬──────────────────┐
│ GUI Update      │ ASCII Render     │
│ (tab highlight) │ (template)       │
└─────────────────┴──────────────────┘
```

## File Structure After Refactor

```
apps/session-analyzer-app/
├── src/
│   ├── core/                    # Business logic (NEW)
│   │   ├── index.ts
│   │   ├── providers/
│   │   ├── scanner/
│   │   ├── scheduler/
│   │   ├── config/
│   │   └── llm/
│   ├── ascii/                   # ASCII interface
│   │   ├── state/
│   │   │   ├── store.ts        # NEW: Central state store
│   │   │   └── types.ts        # NEW: State types
│   │   ├── states/             # Template files
│   │   └── bindings.json
│   ├── bun/                     # Bun server
│   │   ├── index.ts            # Bootstrap only
│   │   ├── api.ts              # HTTP endpoints
│   │   ├── ascii-generator.ts  # Template renderer
│   │   └── ascii-state-manager.ts  # Delegates to store
│   └── mainview/               # GUI (optional mirror)
│       ├── index.html
│       ├── index.css
│       └── index.ts
└── tests/
    ├── core/
    ├── ascii/
    └── api.test.ts
```

## Success Criteria

1. **API Works Without GUI**: App runs headless, `/view` returns ASCII
2. **GUI Mirrors ASCII**: GUI updates when ASCII state changes
3. **Label Control Works**: `/control {"label": "X"}` triggers correct action
4. **Tests Pass**: All unit and integration tests pass
5. **No Breaking Changes**: Existing API endpoints remain compatible
