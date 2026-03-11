/**
 * Unit Tests for WidgetInteractionManager
 * Tests hit testing and keyboard navigation functionality
 */

import { WidgetInteractionManager } from '../widget_interaction_manager.js';

// Test runner state
let testsRun = 0;
let testsPassed = 0;
let testsFailed = 0;

/**
 * Simple test assertion helper
 */
function assertEqual(actual, expected, message) {
  testsRun++;
  if (actual === expected) {
    testsPassed++;
    console.log(`  PASS: ${message}`);
  } else {
    testsFailed++;
    console.log(`  FAIL: ${message}`);
    console.log(`    Expected: ${expected}`);
    console.log(`    Actual: ${actual}`);
  }
}

/**
 * Simple test assertion helper for null
 */
function assertNull(actual, message) {
  testsRun++;
  if (actual === null) {
    testsPassed++;
    console.log(`  PASS: ${message}`);
  } else {
    testsFailed++;
    console.log(`  FAIL: ${message}`);
    console.log(`    Expected: null`);
    console.log(`    Actual: ${actual}`);
  }
}

/**
 * Simple test assertion helper for truthy
 */
function assertTrue(actual, message) {
  testsRun++;
  if (actual) {
    testsPassed++;
    console.log(`  PASS: ${message}`);
  } else {
    testsFailed++;
    console.log(`  FAIL: ${message}`);
    console.log(`    Expected: truthy value`);
    console.log(`    Actual: ${actual}`);
  }
}

// Mock canvas object (minimal for testing)
const mockCanvas = {
  addEventListener: () => {},
  removeEventListener: () => {},
  setAttribute: () => {},
  width: 800,
  height: 600,
  style: {},
  getBoundingClientRect: () => ({ left: 0, top: 0, width: 800, height: 600 })
};

// Mock GPU device
const mockDevice = { queue: {} };

// Mock uniform buffer
const mockBuffer = {
  write: () => {}
};

// Sample widgets for testing
const testWidgets = [
  { bbox: [10, 10, 50, 50], action: 'button1', label: 'Button 1' },
  { bbox: [60, 10, 100, 50], action: 'button2', label: 'Button 2' },
  { bbox: [10, 60, 50, 100], action: 'button3', label: 'Button 3' },
  { bbox: [200, 200, 300, 300], action: null, label: 'Non-clickable Panel' }
];

console.log('Testing WidgetInteractionManager...\n');

// ============================================================================
// Test 1: hitTest returns correct widget for known coords
// ============================================================================
console.log('Test 1: hitTest returns correct widget for known coords');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Test inside button 1 (center at 30, 30)
  const result1 = manager.hitTest(30, 30);
  assertTrue(result1 !== null, 'hitTest(30, 30) should return a widget');
  assertEqual(result1?.action, 'button1', 'hitTest(30, 30) should return button1');

  // Test inside button 2 (center at 80, 30)
  const result2 = manager.hitTest(80, 30);
  assertTrue(result2 !== null, 'hitTest(80, 30) should return a widget');
  assertEqual(result2?.action, 'button2', 'hitTest(80, 30) should return button2');

  // Test inside button 3 (center at 30, 80)
  const result3 = manager.hitTest(30, 80);
  assertTrue(result3 !== null, 'hitTest(30, 80) should return a widget');
  assertEqual(result3?.action, 'button3', 'hitTest(30, 80) should return button3');
}

// ============================================================================
// Test 2: hitTest returns null for coords outside all widgets
// ============================================================================
console.log('\nTest 2: hitTest returns null for coords outside all widgets');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Test far outside all widgets
  assertNull(manager.hitTest(500, 500), 'hitTest(500, 500) should return null');

  // Test in gap between buttons
  assertNull(manager.hitTest(55, 30), 'hitTest(55, 30) - gap between buttons - should return null');

  // Test negative coords
  assertNull(manager.hitTest(-10, -10), 'hitTest(-10, -10) should return null');
}

// ============================================================================
// Test 3: focusNext cycles through clickable widgets
// ============================================================================
console.log('\nTest 3: focusNext cycles through clickable widgets');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Initial state: no focus
  assertEqual(manager.focusedIndex, -1, 'Initial focusedIndex should be -1');

  // First focusNext should focus first clickable widget (index 0)
  manager.focusNext();
  assertEqual(manager.focusedIndex, 0, 'focusNext() from -1 should focus index 0');

  // Next focusNext should focus second widget (index 1)
  manager.focusNext();
  assertEqual(manager.focusedIndex, 1, 'focusNext() from 0 should focus index 1');

  // Next focusNext should focus third widget (index 2)
  manager.focusNext();
  assertEqual(manager.focusedIndex, 2, 'focusNext() from 1 should focus index 2');
}

// ============================================================================
// Test 4: focusPrev cycles backwards
// ============================================================================
console.log('\nTest 4: focusPrev cycles backwards');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Start from index 2 (simulate being at last widget)
  manager.focusNext(); // 0
  manager.focusNext(); // 1
  manager.focusNext(); // 2
  assertEqual(manager.focusedIndex, 2, 'Should be at index 2');

  // focusPrev should go to 1
  manager.focusPrev();
  assertEqual(manager.focusedIndex, 1, 'focusPrev() from 2 should focus index 1');

  // focusPrev should go to 0
  manager.focusPrev();
  assertEqual(manager.focusedIndex, 0, 'focusPrev() from 1 should focus index 0');
}

// ============================================================================
// Test 5: focusNext wraps from last to first
// ============================================================================
console.log('\nTest 5: focusNext wraps from last to first');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Navigate to last widget (index 2, since we have 3 clickable widgets)
  manager.focusNext(); // 0
  manager.focusNext(); // 1
  manager.focusNext(); // 2
  assertEqual(manager.focusedIndex, 2, 'Should be at last widget (index 2)');

  // focusNext should wrap to first (index 0)
  manager.focusNext();
  assertEqual(manager.focusedIndex, 0, 'focusNext() from last should wrap to first (index 0)');
}

// ============================================================================
// Test 6: focusPrev wraps from first to last
// ============================================================================
console.log('\nTest 6: focusPrev wraps from first to last');
{
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  // Start at first widget (index 0)
  manager.focusNext();
  assertEqual(manager.focusedIndex, 0, 'Should be at first widget (index 0)');

  // focusPrev should wrap to last (index 2)
  manager.focusPrev();
  assertEqual(manager.focusedIndex, 2, 'focusPrev() from first should wrap to last (index 2)');
}

// ============================================================================
// Test 7: Additional edge case tests
// ============================================================================
console.log('\nTest 7: Additional edge case tests');
{
  // Test with no widgets
  const emptyManager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: []
  });

  assertNull(emptyManager.hitTest(10, 10), 'hitTest on empty widgets should return null');
  assertEqual(emptyManager.clickableWidgets.length, 0, 'clickableWidgets should be empty');
  assertEqual(emptyManager.focusedIndex, -1, 'focusedIndex should be -1 with no widgets');

  // focusNext/focusPrev should not crash on empty widgets
  emptyManager.focusNext();
  assertEqual(emptyManager.focusedIndex, -1, 'focusNext on empty widgets should keep index -1');

  emptyManager.focusPrev();
  assertEqual(emptyManager.focusedIndex, -1, 'focusPrev on empty widgets should keep index -1');

  // Test hitTest with null/undefined coords
  const manager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: testWidgets
  });

  assertNull(manager.hitTest(null, 10), 'hitTest with null x should return null');
  assertNull(manager.hitTest(10, null), 'hitTest with null y should return null');
  assertNull(manager.hitTest(undefined, 10), 'hitTest with undefined x should return null');
  assertNull(manager.hitTest(10, undefined), 'hitTest with undefined y should return null');

  // Test with widgets that have no bbox
  const noBboxWidgets = [
    { action: 'no-bbox' },
    { bbox: null, action: 'null-bbox' },
    { bbox: [], action: 'empty-bbox' }
  ];
  const noBboxManager = new WidgetInteractionManager({
    canvas: mockCanvas,
    device: mockDevice,
    uniformBuffer: mockBuffer,
    widgets: noBboxWidgets
  });

  assertNull(noBboxManager.hitTest(10, 10), 'hitTest on widgets without valid bbox should return null');
}

// ============================================================================
// Summary
// ============================================================================
console.log('\n========================================');
console.log(`Tests run: ${testsRun}`);
console.log(`Tests passed: ${testsPassed}`);
console.log(`Tests failed: ${testsFailed}`);
console.log('========================================');

if (testsFailed > 0) {
  console.log('\nSome tests FAILED!');
  process.exit(1);
} else {
  console.log('\nAll tests PASSED!');
  process.exit(0);
}
