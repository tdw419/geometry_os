# Webmcp Bridge Verification Plan - Tasks

## 1. Verify Script Loading

- [ ] Verify: `systems/visual_shell/web/index.html`

## 2. Verify Bridge Status API

- [ ] Test: `systems/visual_shell/web/webmcp_bridge.js:726-735`

## 3. Test navigate_map Tool

- [ ] Test: `systems/visual_shell/web/webmcp_bridge.js:114-216`

## 4. Test get_os_state Tool

- [ ] Test: `systems/visual_shell/web/webmcp_bridge.js:222-350`

## 5. Test load_rts_cartridge Tool

- [ ] Test: `systems/visual_shell/web/webmcp_bridge.js:522-663`

## 6. Test execute_pixel_program Tool

- [ ] Test: `systems/visual_shell/web/webmcp_bridge.js:356-516`

## 7. Integration Test — Complete Workflow

**Step 1: Simulate AI agent workflow**

In DevTools console, run the complete agent workflow:

```javascript
// 1. Get current state
const state = await navigator.modelContext.callTool('get_os_state', { include: ['camera'] });
console.log('Starting at:', state.camera);

// 2. Navigate to neural nursery
await navigator.modelContext.callTool('navigate_map', { region: 'neural_nursery', zoom: 1.5 });

// 3. Load a cartridge there
const loadResult = await navigator.modelContext.callTool('load_rts_cartridge', {
  url: '/alpine.rts.png',
  position: { x: 1024, y: 1024 },
  autoNavigate: false
});
console.log('Loaded:', loadResult.sha256);

// 4. Verify final state
const finalState = await navigator.modelContext.callTool('get_os_state', { include: ['all'] });
console.log('Final state:', finalState);
```

**Step 2: Verify metrics**

```javascript
window.webmcpBridge.getStatus()
```

Expected:
```javascript
{
  available: true,
  registered: true,
  tools: [...],
  totalCalls: 5,
  callBreakdown: {
    get_os_state: 2,
    navigate_map: 1,
    load_rts_cartridge: 1
  },
  appConnected: true
}
```

---

### Task 8: Document Results

- [ ] Create ``systems/visual_shell/web/test_webmcp_bridge.html``
