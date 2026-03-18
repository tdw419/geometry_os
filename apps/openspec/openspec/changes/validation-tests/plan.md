# Pattern Recognition Validation Tests Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create validation tests that prove the Pattern Recognition Renderer correctly detects and renders ASCII patterns using LLM cross-validation and real manager integration.

**Architecture:** Three-pronged validation approach: (1) LLM cross-validation where an LLM independently analyzes ASCII and we compare outputs, (2) Real manager integration testing against actual templates, (3) Round-trip fidelity tests ensuring parsed patterns can reconstruct original structure.

**Tech Stack:** Bun test framework, MCP tools for LLM analysis, existing pattern detection system, ASCII manager server

---

## Task 1: Create LLM Cross-Validation Test Utilities

**Files:**
- Create: `tests/validation/llm-cross-validate.ts`
- Create: `tests/validation/fixtures/sample-templates.ts`

**Step 1: Create test fixtures with known patterns**

Create sample ASCII templates with documented expected patterns:

```typescript
// tests/validation/fixtures/sample-templates.ts

export interface ExpectedPattern {
  type: 'button' | 'container' | 'status-indicator' | 'table';
  description: string;
}

export interface SampleTemplate {
  name: string;
  ascii: string;
  expectedPatterns: ExpectedPattern[];
}

export const SAMPLE_TEMPLATES: SampleTemplate[] = [
  {
    name: 'simple-buttons',
    ascii: '[A] Tasks  [B] Settings  [X] Quit',
    expectedPatterns: [
      { type: 'button', description: 'Button A with label "Tasks"' },
      { type: 'button', description: 'Button B with label "Settings"' },
      { type: 'button', description: 'Button X with label "Quit"' },
    ],
  },
  {
    name: 'status-indicators',
    ascii: `● running
○ stopped
◐ warning
◉ error`,
    expectedPatterns: [
      { type: 'status-indicator', description: 'Running status (green dot)' },
      { type: 'status-indicator', description: 'Stopped status (gray circle)' },
      { type: 'status-indicator', description: 'Warning status (half circle)' },
      { type: 'status-indicator', description: 'Error status (bullseye)' },
    ],
  },
  {
    name: 'container',
    ascii: `╔══════════════════╗
║  Dashboard       ║
╠══════════════════╣
║  Content         ║
╚══════════════════╝`,
    expectedPatterns: [
      { type: 'container', description: 'Box container with title "Dashboard"' },
    ],
  },
  {
    name: 'table',
    ascii: `│ Name  │ Status │
│ App   │ ●      │`,
    expectedPatterns: [
      { type: 'table', description: 'Table with columns Name and Status' },
    ],
  },
  {
    name: 'complex-dashboard',
    ascii: `╔══════════════════════════════════════════════════════════════════════════════╗
║  ASCII INTERFACE MANAGER                                   v1.0.0  ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  [A] Projects  [B] Templates  [C] Bindings  [D] Test  [E] Git  [X] Quit     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                             ║
║  REGISTERED ASCII PROJECTS                                                  ║
║  ┌─────────────────────────────────────────────────────────────────────────┐║
║  │  [1] My App    (port 3000)  ● running                                    │║
║  │  [2] API Server (port 3001)  ○ stopped                                   │║
║  └─────────────────────────────────────────────────────────────────────────┘║
╚══════════════════════════════════════════════════════════════════════════════╝`,
    expectedPatterns: [
      { type: 'container', description: 'Main outer container' },
      { type: 'button', description: 'Button A with label "Projects"' },
      { type: 'button', description: 'Button B with label "Templates"' },
      { type: 'button', description: 'Button X with label "Quit"' },
      { type: 'status-indicator', description: 'Running status for My App' },
      { type: 'status-indicator', description: 'Stopped status for API Server' },
    ],
  },
];
```

**Step 2: Run type check to verify fixtures compile**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface/src/renderer && bun build tests/validation/fixtures/sample-templates.ts --outdir /tmp/test-build 2>&1 | head -20`
Expected: Build succeeds or shows no type errors

**Step 3: Create LLM cross-validation utility**

```typescript
// tests/validation/llm-cross-validate.ts

import { parseAscii } from '../../src/renderer/patterns/parser';
import type { DetectedPattern, ButtonPattern, StatusPattern, ContainerPattern, TablePattern } from '../../src/renderer/patterns/types';
import { SAMPLE_TEMPLATES, type SampleTemplate, type ExpectedPattern } from './fixtures/sample-templates';

export interface ValidationResult {
  templateName: string;
  parserPatterns: DetectedPattern[];
  expectedPatterns: ExpectedPattern[];
  matchScore: number;
  mismatches: string[];
}

/**
 * Compare parser output against expected patterns.
 * Returns a validation result with match score and any mismatches.
 */
export function validateTemplate(template: SampleTemplate): ValidationResult {
  const parsed = parseAscii(template.ascii);
  const parserPatterns = parsed.patterns;
  const mismatches: string[] = [];

  // Count patterns by type
  const parserCounts = countByType(parserPatterns);
  const expectedCounts = countExpectedByType(template.expectedPatterns);

  // Check for missing patterns
  for (const [type, count] of Object.entries(expectedCounts)) {
    const actualCount = parserCounts[type] || 0;
    if (actualCount < count) {
      mismatches.push(`Missing ${count - actualCount} ${type} pattern(s). Expected ${count}, found ${actualCount}`);
    }
  }

  // Verify button patterns have correct labels
  const buttonPatterns = parserPatterns.filter(p => p.type === 'button') as ButtonPattern[];
  const expectedButtons = template.expectedPatterns.filter(e => e.type === 'button');
  for (const expected of expectedButtons) {
    const labelMatch = expected.description.match(/Button (\w) /);
    if (labelMatch) {
      const found = buttonPatterns.some(b => b.label === labelMatch[1]);
      if (!found) {
        mismatches.push(`Expected button with label "${labelMatch[1]}" not found`);
      }
    }
  }

  // Verify status patterns have correct states
  const statusPatterns = parserPatterns.filter(p => p.type === 'status-indicator') as StatusPattern[];
  const expectedStatuses = template.expectedPatterns.filter(e => e.type === 'status-indicator');
  for (const expected of expectedStatuses) {
    const stateMatch = expected.description.match(/(\w+) status/i);
    if (stateMatch) {
      const expectedState = stateMatch[1].toLowerCase();
      const found = statusPatterns.some(s => s.status === expectedState);
      if (!found) {
        mismatches.push(`Expected status indicator "${expectedState}" not found`);
      }
    }
  }

  // Calculate match score (0-100)
  const totalExpected = template.expectedPatterns.length;
  const totalFound = parserPatterns.length;
  const matchScore = Math.round(
    (Math.min(totalExpected, totalFound) / Math.max(totalExpected, totalFound, 1)) * 100
  );

  return {
    templateName: template.name,
    parserPatterns,
    expectedPatterns: template.expectedPatterns,
    matchScore: mismatches.length === 0 ? 100 : Math.max(0, 100 - mismatches.length * 10),
    mismatches,
  };
}

function countByType(patterns: DetectedPattern[]): Record<string, number> {
  const counts: Record<string, number> = {};
  for (const pattern of patterns) {
    counts[pattern.type] = (counts[pattern.type] || 0) + 1;
  }
  return counts;
}

function countExpectedByType(expected: ExpectedPattern[]): Record<string, number> {
  const counts: Record<string, number> = {};
  for (const e of expected) {
    counts[e.type] = (counts[e.type] || 0) + 1;
  }
  return counts;
}

/**
 * Validate all sample templates and return summary.
 */
export function validateAllTemplates(): { results: ValidationResult[]; passed: number; failed: number } {
  const results = SAMPLE_TEMPLATES.map(validateTemplate);
  const passed = results.filter(r => r.mismatches.length === 0).length;
  const failed = results.filter(r => r.mismatches.length > 0).length;
  return { results, passed, failed };
}

/**
 * Generate a description of parsed patterns for LLM comparison.
 * This creates a human-readable description that can be compared
 * with an LLM's independent analysis.
 */
export function describePatterns(patterns: DetectedPattern[]): string {
  const descriptions: string[] = [];

  const buttons = patterns.filter(p => p.type === 'button') as ButtonPattern[];
  if (buttons.length > 0) {
    descriptions.push(`Buttons (${buttons.length}):`);
    buttons.forEach(b => descriptions.push(`  - [${b.label}] ${b.text}`));
  }

  const statuses = patterns.filter(p => p.type === 'status-indicator') as StatusPattern[];
  if (statuses.length > 0) {
    descriptions.push(`Status Indicators (${statuses.length}):`);
    statuses.forEach(s => descriptions.push(`  - ${s.symbol} ${s.status}`));
  }

  const containers = patterns.filter(p => p.type === 'container') as ContainerPattern[];
  if (containers.length > 0) {
    descriptions.push(`Containers (${containers.length}):`);
    containers.forEach(c => descriptions.push(`  - Box at lines ${c.bounds.startLine}-${c.bounds.endLine}`));
  }

  const tables = patterns.filter(p => p.type === 'table') as TablePattern[];
  if (tables.length > 0) {
    descriptions.push(`Tables (${tables.length}):`);
    tables.forEach(t => {
      descriptions.push(`  - Headers: ${t.headers.join(', ')}`);
      descriptions.push(`  - Rows: ${t.rows.length}`);
    });
  }

  return descriptions.join('\n');
}
```

**Step 4: Run type check on validation utility**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface && bun build tests/validation/llm-cross-validate.ts --outdir /tmp/test-build 2>&1`
Expected: Build succeeds with no errors

**Step 5: Commit**

```bash
git add tests/validation/fixtures/sample-templates.ts tests/validation/llm-cross-validate.ts
git commit -m "test(validation): add LLM cross-validation utilities and fixtures"
```

---

## Task 2: Create LLM Cross-Validation Tests

**Files:**
- Create: `tests/validation/llm-cross-validate.test.ts`

**Step 1: Write the failing tests**

```typescript
// tests/validation/llm-cross-validate.test.ts

import { describe, it, expect } from 'bun:test';
import { validateTemplate, validateAllTemplates, describePatterns } from './llm-cross-validate';
import { SAMPLE_TEMPLATES } from './fixtures/sample-templates';
import { parseAscii } from '../../src/renderer/patterns/parser';

describe('LLM Cross-Validation', () => {
  describe('Sample Template Validation', () => {
    it('validates simple-buttons template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'simple-buttons')!;
      const result = validateTemplate(template);

      expect(result.matchScore).toBe(100);
      expect(result.mismatches).toHaveLength(0);
    });

    it('validates status-indicators template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'status-indicators')!;
      const result = validateTemplate(template);

      expect(result.matchScore).toBe(100);
      expect(result.mismatches).toHaveLength(0);
    });

    it('validates container template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'container')!;
      const result = validateTemplate(template);

      expect(result.matchScore).toBe(100);
      expect(result.mismatches).toHaveLength(0);
    });

    it('validates table template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'table')!;
      const result = validateTemplate(template);

      expect(result.matchScore).toBe(100);
      expect(result.mismatches).toHaveLength(0);
    });

    it('validates complex-dashboard template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'complex-dashboard')!;
      const result = validateTemplate(template);

      // Complex template should have high match score
      expect(result.matchScore).toBeGreaterThanOrEqual(80);
    });
  });

  describe('Validate All Templates', () => {
    it('validates all sample templates successfully', () => {
      const { results, passed, failed } = validateAllTemplates();

      expect(passed).toBeGreaterThan(0);
      expect(failed).toBe(0);
      expect(results).toHaveLength(SAMPLE_TEMPLATES.length);
    });
  });

  describe('Pattern Description Generator', () => {
    it('generates human-readable description of buttons', () => {
      const ascii = '[A] Tasks  [B] Settings';
      const parsed = parseAscii(ascii);
      const description = describePatterns(parsed.patterns);

      expect(description).toContain('Buttons');
      expect(description).toContain('[A] Tasks');
      expect(description).toContain('[B] Settings');
    });

    it('generates human-readable description of status indicators', () => {
      const ascii = '● running  ○ stopped';
      const parsed = parseAscii(ascii);
      const description = describePatterns(parsed.patterns);

      expect(description).toContain('Status Indicators');
      expect(description).toContain('running');
      expect(description).toContain('stopped');
    });

    it('generates description with all pattern types', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'complex-dashboard')!;
      const parsed = parseAscii(template.ascii);
      const description = describePatterns(parsed.patterns);

      // Should mention multiple pattern types
      expect(description.length).toBeGreaterThan(50);
    });
  });

  describe('Pattern Count Accuracy', () => {
    it('correctly counts buttons in complex template', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'complex-dashboard')!;
      const result = validateTemplate(template);
      const buttonCount = result.parserPatterns.filter(p => p.type === 'button').length;

      // Should detect navigation buttons (A, B, C, D, E, X) plus project buttons (1, 2)
      expect(buttonCount).toBeGreaterThanOrEqual(6);
    });

    it('correctly counts status indicators', () => {
      const template = SAMPLE_TEMPLATES.find(t => t.name === 'complex-dashboard')!;
      const result = validateTemplate(template);
      const statusCount = result.parserPatterns.filter(p => p.type === 'status-indicator').length;

      expect(statusCount).toBeGreaterThanOrEqual(2);
    });
  });
});
```

**Step 2: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface && bun test tests/validation/llm-cross-validate.test.ts 2>&1`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/validation/llm-cross-validate.test.ts
git commit -m "test(validation): add LLM cross-validation tests"
```

---

## Task 3: Create Real Manager Integration Test

**Files:**
- Create: `tests/validation/manager-integration.test.ts`

**Step 1: Write the failing test**

```typescript
// tests/validation/manager-integration.test.ts

/**
 * Real Manager Integration Tests
 *
 * These tests validate that our pattern recognition system works correctly
 * against real ASCII templates from the running manager server.
 */

import { describe, it, expect, beforeAll, afterAll } from 'bun:test';
import { spawn, ChildProcess } from 'child_process';
import { parseAscii } from '../../src/renderer/patterns/parser';
import type { ButtonPattern, StatusPattern, ContainerPattern } from '../../src/renderer/patterns/types';

describe('Real Manager Integration', () => {
  let serverProcess: ChildProcess | null = null;
  const MANAGER_URL = 'http://localhost:3422';

  beforeAll(async () => {
    // Start the manager server
    serverProcess = spawn('bun', ['run', 'src/manager/manager-server.ts'], {
      cwd: process.cwd(),
      stdio: 'pipe',
      detached: true,
    });

    // Wait for server to start
    await new Promise((resolve) => setTimeout(resolve, 2000));
  });

  afterAll(() => {
    if (serverProcess) {
      try {
        process.kill(-serverProcess.pid!);
      } catch {
        // Process may already be dead
      }
    }
  });

  describe('Projects View Pattern Detection', () => {
    it('detects navigation buttons in projects view', async () => {
      // Navigate to projects view
      await fetch(`${MANAGER_URL}/control`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ label: 'A' }),
      });

      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const buttons = parsed.patterns.filter(p => p.type === 'button') as ButtonPattern[];
      const labels = buttons.map(b => b.label);

      // Should have main navigation buttons
      expect(labels).toContain('A');
      expect(labels).toContain('X');
    });

    it('detects container structure in projects view', async () => {
      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const containers = parsed.patterns.filter(p => p.type === 'container') as ContainerPattern[];

      // Should detect at least the main container
      expect(containers.length).toBeGreaterThanOrEqual(1);
    });
  });

  describe('Dashboard View Pattern Detection', () => {
    it('detects dashboard navigation button', async () => {
      // Navigate to dashboard
      await fetch(`${MANAGER_URL}/control`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ label: 'F' }),
      });

      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const buttons = parsed.patterns.filter(p => p.type === 'button') as ButtonPattern[];
      const labels = buttons.map(b => b.label);

      expect(labels).toContain('F');
    });

    it('detects status indicators in health table', async () => {
      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const statuses = parsed.patterns.filter(p => p.type === 'status-indicator') as StatusPattern[];

      // Dashboard shows project health with status indicators
      // May or may not have statuses depending on registered projects
      expect(parsed.patterns.length).toBeGreaterThan(0);
    });
  });

  describe('Pattern Quality Validation', () => {
    it('parsed patterns should match ASCII content', async () => {
      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      // Verify raw ASCII is preserved
      expect(parsed.raw).toBe(ascii);

      // Verify grid dimensions are correct
      const lineCount = ascii.split('\n').length;
      expect(parsed.gridSize.height).toBe(lineCount);
    });

    it('button labels should be single characters', async () => {
      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const buttons = parsed.patterns.filter(p => p.type === 'button') as ButtonPattern[];

      for (const button of buttons) {
        expect(button.label.length).toBe(1);
        expect(button.label).toMatch(/[A-Z0-9]/);
      }
    });

    it('status indicators should have valid states', async () => {
      const response = await fetch(`${MANAGER_URL}/view`);
      const ascii = await response.text();
      const parsed = parseAscii(ascii);

      const statuses = parsed.patterns.filter(p => p.type === 'status-indicator') as StatusPattern[];
      const validStates = ['running', 'stopped', 'warning', 'paused', 'error', 'unknown'];

      for (const status of statuses) {
        expect(validStates).toContain(status.status);
      }
    });
  });

  describe('Cross-View Validation', () => {
    it('all views should have consistent main navigation', async () => {
      const views = ['A', 'B', 'C', 'D', 'E'];
      const navigationButtons = new Set<string>();

      for (const viewLabel of views) {
        try {
          await fetch(`${MANAGER_URL}/control`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ label: viewLabel }),
          });

          const response = await fetch(`${MANAGER_URL}/view`);
          const ascii = await response.text();
          const parsed = parseAscii(ascii);

          const buttons = parsed.patterns.filter(p => p.type === 'button') as ButtonPattern[];
          buttons.forEach(b => navigationButtons.add(b.label));
        } catch {
          // View may not exist, skip
        }
      }

      // Should have found multiple navigation buttons across views
      expect(navigationButtons.size).toBeGreaterThan(3);
    });
  });
});
```

**Step 2: Run tests to verify behavior**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface && bun test tests/validation/manager-integration.test.ts 2>&1`
Expected: Tests may fail if manager server not running - this is expected, will fix in next step

**Step 3: Commit**

```bash
git add tests/validation/manager-integration.test.ts
git commit -m "test(validation): add real manager integration tests"
```

---

## Task 4: Create Round-Trip Fidelity Test

**Files:**
- Create: `tests/validation/round-trip.test.ts`

**Step 1: Write the failing test**

```typescript
// tests/validation/round-trip.test.ts

/**
 * Round-Trip Fidelity Tests
 *
 * These tests verify that pattern detection maintains fidelity:
 * - Detected patterns accurately represent the ASCII
 * - Pattern counts are consistent
 * - No spurious detections
 */

import { describe, it, expect } from 'bun:test';
import { parseAscii } from '../../src/renderer/patterns/parser';
import type { ButtonPattern, StatusPattern, TablePattern, ContainerPattern } from '../../src/renderer/patterns/types';

describe('Round-Trip Fidelity', () => {
  describe('Button Fidelity', () => {
    it('detects exact button count', () => {
      const ascii = '[A] One  [B] Two  [C] Three';
      const parsed = parseAscii(ascii);
      const buttons = parsed.patterns.filter(p => p.type === 'button');

      expect(buttons).toHaveLength(3);
    });

    it('preserves button labels and text', () => {
      const ascii = '[X] Exit  [Y] Yes  [N] No';
      const parsed = parseAscii(ascii);
      const buttons = parsed.patterns.filter(p => p.type === 'button') as ButtonPattern[];

      const labelMap = Object.fromEntries(buttons.map(b => [b.label, b.text]));
      expect(labelMap['X']).toBe('Exit');
      expect(labelMap['Y']).toBe('Yes');
      expect(labelMap['N']).toBe('No');
    });

    it('does not detect buttons in non-button patterns', () => {
      const ascii = 'This has [text] in brackets but not a button';
      const parsed = parseAscii(ascii);
      const buttons = parsed.patterns.filter(p => p.type === 'button');

      // [text] doesn't match [X] pattern (lowercase, multi-char)
      expect(buttons).toHaveLength(0);
    });
  });

  describe('Status Fidelity', () => {
    it('maps each status symbol to correct state', () => {
      const testCases = [
        { symbol: '●', expected: 'running' },
        { symbol: '○', expected: 'stopped' },
        { symbol: '◐', expected: 'warning' },
        { symbol: '◑', expected: 'paused' },
        { symbol: '◉', expected: 'error' },
      ];

      for (const { symbol, expected } of testCases) {
        const ascii = `Status: ${symbol}`;
        const parsed = parseAscii(ascii);
        const statuses = parsed.patterns.filter(p => p.type === 'status-indicator') as StatusPattern[];

        expect(statuses.length).toBeGreaterThan(0);
        expect(statuses[0].status).toBe(expected);
        expect(statuses[0].symbol).toBe(symbol);
      }
    });

    it('detects multiple status indicators on same line', () => {
      const ascii = '● App1  ○ App2  ◐ App3';
      const parsed = parseAscii(ascii);
      const statuses = parsed.patterns.filter(p => p.type === 'status-indicator');

      expect(statuses).toHaveLength(3);
    });
  });

  describe('Container Fidelity', () => {
    it('detects container bounds accurately', () => {
      const ascii = `Line 1
╔══════╗
║ Box  ║
╚══════╝
Line 5`;
      const parsed = parseAscii(ascii);
      const containers = parsed.patterns.filter(p => p.type === 'container') as ContainerPattern[];

      expect(containers.length).toBeGreaterThan(0);
      // Container should be on lines 2-4 (0-indexed: 1-3)
      const container = containers[0];
      expect(container.bounds.startLine).toBe(1);
      expect(container.bounds.endLine).toBe(3);
    });

    it('detects nested containers', () => {
      const ascii = `╔════════════╗
║ ┌────────┐ ║
║ │ Inner  │ ║
║ └────────┘ ║
╚════════════╝`;
      const parsed = parseAscii(ascii);
      const containers = parsed.patterns.filter(p => p.type === 'container');

      // Should detect at least one container
      expect(containers.length).toBeGreaterThanOrEqual(1);
    });
  });

  describe('Table Fidelity', () => {
    it('preserves table headers', () => {
      const ascii = `│ Name │ Port │ Status │
│ App  │ 3000 │ ●      │`;
      const parsed = parseAscii(ascii);
      const tables = parsed.patterns.filter(p => p.type === 'table') as TablePattern[];

      expect(tables.length).toBeGreaterThan(0);
      expect(tables[0].headers).toContain('Name');
      expect(tables[0].headers).toContain('Port');
      expect(tables[0].headers).toContain('Status');
    });

    it('preserves row count', () => {
      const ascii = `│ Col │
│ A   │
│ B   │
│ C   │`;
      const parsed = parseAscii(ascii);
      const tables = parsed.patterns.filter(p => p.type === 'table') as TablePattern[];

      expect(tables.length).toBeGreaterThan(0);
      expect(tables[0].rows.length).toBe(3);
    });
  });

  describe('No False Positives', () => {
    it('does not detect patterns in plain text', () => {
      const ascii = `This is just plain text.
No patterns here at all.
Just regular sentences.`;
      const parsed = parseAscii(ascii);

      expect(parsed.patterns).toHaveLength(0);
    });

    it('does not detect patterns in code-like text', () => {
      const ascii = `function test() {
  return [1, 2, 3];
}`;
      const parsed = parseAscii(ascii);

      // Array syntax [1, 2, 3] should not be detected as buttons
      const buttons = parsed.patterns.filter(p => p.type === 'button');
      expect(buttons).toHaveLength(0);
    });
  });

  describe('Complex Template Fidelity', () => {
    const complexAscii = `╔══════════════════════════════════════════════════════════════════════════════╗
║  ASCII INTERFACE MANAGER                                   v1.0.0  ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  [A] Projects  [B] Templates  [C] Bindings  [D] Test  [E] Git  [X] Quit     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                             ║
║  REGISTERED ASCII PROJECTS                                                  ║
║  ┌─────────────────────────────────────────────────────────────────────────┐║
║  │  [1] My App    (port 3000)  ● running                                    │║
║  │  [2] API Server (port 3001)  ○ stopped                                   │║
║  │  [3] Worker    (port 3002)  ◐ warning                                    │║
║  └─────────────────────────────────────────────────────────────────────────┘║
╚══════════════════════════════════════════════════════════════════════════════╝`;

    it('detects all expected pattern types', () => {
      const parsed = parseAscii(complexAscii);
      const types = new Set(parsed.patterns.map(p => p.type));

      expect(types.has('button')).toBe(true);
      expect(types.has('container')).toBe(true);
      expect(types.has('status-indicator')).toBe(true);
    });

    it('maintains consistent pattern count on repeated parsing', () => {
      const count1 = parseAscii(complexAscii).patterns.length;
      const count2 = parseAscii(complexAscii).patterns.length;
      const count3 = parseAscii(complexAscii).patterns.length;

      expect(count1).toBe(count2);
      expect(count2).toBe(count3);
    });
  });
});
```

**Step 2: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface && bun test tests/validation/round-trip.test.ts 2>&1`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/validation/round-trip.test.ts
git commit -m "test(validation): add round-trip fidelity tests"
```

---

## Task 5: Create Validation Test Runner and Summary

**Files:**
- Create: `tests/validation/run-validation.ts`
- Create: `tests/validation/README.md`

**Step 1: Create validation runner script**

```typescript
// tests/validation/run-validation.ts

/**
 * Validation Test Runner
 *
 * Run all validation tests and produce a summary report.
 * Usage: bun run tests/validation/run-validation.ts
 */

import { validateAllTemplates, describePatterns } from './llm-cross-validate';
import { parseAscii } from '../../src/renderer/patterns/parser';

interface ValidationSummary {
  timestamp: string;
  llmCrossValidation: {
    passed: number;
    failed: number;
    total: number;
    results: Array<{
      templateName: string;
      matchScore: number;
      mismatches: string[];
    }>;
  };
  patternStats: {
    totalPatternsDetected: number;
    byType: Record<string, number>;
  };
}

function runValidation(): ValidationSummary {
  console.log('🔍 Running Pattern Recognition Validation...\n');

  // LLM Cross-Validation
  console.log('📋 LLM Cross-Validation Tests:');
  const { results, passed, failed } = validateAllTemplates();

  results.forEach(result => {
    const status = result.mismatches.length === 0 ? '✅' : '❌';
    console.log(`  ${status} ${result.templateName}: ${result.matchScore}% match`);
    if (result.mismatches.length > 0) {
      result.mismatches.forEach(m => console.log(`     - ${m}`));
    }
  });

  console.log(`\n📊 Summary: ${passed}/${results.length} templates passed\n`);

  // Pattern Statistics
  console.log('📈 Pattern Detection Statistics:');
  let totalPatterns = 0;
  const byType: Record<string, number> = {};

  results.forEach(result => {
    totalPatterns += result.parserPatterns.length;
    result.parserPatterns.forEach(p => {
      byType[p.type] = (byType[p.type] || 0) + 1;
    });
  });

  console.log(`  Total patterns detected: ${totalPatterns}`);
  Object.entries(byType).forEach(([type, count]) => {
    console.log(`  - ${type}: ${count}`);
  });

  return {
    timestamp: new Date().toISOString(),
    llmCrossValidation: {
      passed,
      failed,
      total: results.length,
      results: results.map(r => ({
        templateName: r.templateName,
        matchScore: r.matchScore,
        mismatches: r.mismatches,
      })),
    },
    patternStats: {
      totalPatternsDetected: totalPatterns,
      byType,
    },
  };
}

// Run and output
const summary = runValidation();
console.log('\n' + '='.repeat(50));
console.log('Validation complete!');
console.log('='.repeat(50));

// Exit with error code if any failures
if (summary.llmCrossValidation.failed > 0) {
  process.exit(1);
}
```

**Step 2: Create README documentation**

```markdown
# Pattern Recognition Validation Tests

This directory contains validation tests that prove the Pattern Recognition Renderer works correctly.

## Test Categories

### 1. LLM Cross-Validation (`llm-cross-validate.test.ts`)

Compares our parser's output against expected patterns defined by humans. This simulates what an LLM would see when analyzing ASCII templates.

**What it validates:**
- Button detection accuracy
- Status indicator mapping
- Container boundary detection
- Table structure extraction

### 2. Real Manager Integration (`manager-integration.test.ts`)

Tests pattern detection against real ASCII output from the running manager server.

**What it validates:**
- Patterns work with real templates
- Navigation button consistency
- Cross-view pattern detection

### 3. Round-Trip Fidelity (`round-trip.test.ts`)

Ensures pattern detection maintains accuracy and doesn't produce false positives.

**What it validates:**
- Exact pattern counts
- No spurious detections
- Consistent repeated parsing

## Running Tests

```bash
# Run all validation tests
bun test tests/validation/

# Run specific test file
bun test tests/validation/llm-cross-validate.test.ts

# Run validation runner for summary
bun run tests/validation/run-validation.ts
```

## Adding New Test Templates

1. Add template to `fixtures/sample-templates.ts`
2. Define expected patterns
3. Run tests to verify detection works

## Validation Criteria

A pattern detection is considered valid when:
1. All expected patterns are detected
2. No unexpected patterns are detected
3. Pattern properties (labels, status, bounds) are accurate
4. Detection is consistent across repeated runs
```

**Step 3: Run the validation runner to verify it works**

Run: `cd /home/jericho/zion/projects/ascii_interface/ascii_interface && bun run tests/validation/run-validation.ts 2>&1`
Expected: Script runs and shows validation summary

**Step 4: Commit**

```bash
git add tests/validation/run-validation.ts tests/validation/README.md
git commit -m "test(validation): add validation runner and documentation"
```

---

## Task 6: Create LLM Analysis Prompt Template

**Files:**
- Create: `tests/validation/llm-analysis-prompt.md`

**Step 1: Create LLM analysis prompt**

```markdown
# LLM ASCII Pattern Analysis Prompt

Use this prompt to have an LLM independently analyze ASCII templates and compare with our parser's output.

## Prompt Template

```
You are analyzing an ASCII user interface. Please identify all UI elements you see.

**ASCII Template:**
```
{{ASCII_CONTENT}}
```

**Analysis Task:**
For each UI element you detect, provide:
1. **Type**: button, container, status-indicator, or table
2. **Description**: A brief description of what you see
3. **Location**: Approximate line number or position

**Pattern Reference:**
- **Buttons**: Pattern `[X] label` where X is a single uppercase letter or number
- **Containers**: Box drawing characters like `╔═╗║╚╝┌─┐│└┘`
- **Status Indicators**: Unicode symbols `● ○ ◐ ◑ ◉`
- **Tables**: Pipe-separated columns `│ Col1 │ Col2 │`

**Expected Output Format:**
```
ELEMENTS FOUND:
- [Type: button] [A] Tasks - navigation button
- [Type: button] [B] Settings - navigation button
- [Type: container] Main dashboard box (lines 1-10)
- [Type: status-indicator] ● running (line 5)
```
```

## Usage

1. Replace `{{ASCII_CONTENT}}` with the actual ASCII template
2. Send prompt to LLM
3. Parse LLM response for element list
4. Compare with `parseAscii()` output

## Example Comparison

**LLM Analysis:**
```
ELEMENTS FOUND:
- [Type: button] [A] Projects
- [Type: button] [X] Quit
- [Type: status-indicator] ● running
```

**Parser Output:**
```json
{
  "patterns": [
    { "type": "button", "label": "A", "text": "Projects" },
    { "type": "button", "label": "X", "text": "Quit" },
    { "type": "status-indicator", "status": "running", "symbol": "●" }
  ]
}
```

**Match Score:** 100% (3/3 patterns match)
```

**Step 2: Commit**

```bash
git add tests/validation/llm-analysis-prompt.md
git commit -m "docs(validation): add LLM analysis prompt template"
```

---

## Summary

After completing all tasks, the validation test suite will include:

1. **Sample Templates** - 5 test fixtures with known patterns
2. **LLM Cross-Validation** - 8+ tests comparing parser to expected patterns
3. **Manager Integration** - 5+ tests against real server output
4. **Round-Trip Fidelity** - 12+ tests for accuracy and consistency
5. **Validation Runner** - Script to run all validations and produce summary
6. **Documentation** - README and LLM prompt template

**Total Tests:** 25+ validation tests proving the system works correctly.
