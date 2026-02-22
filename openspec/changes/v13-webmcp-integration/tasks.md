# V13 Webmcp Integration - Tasks

## 1. Create EvolutionSafetyBridge Module

- [ ] Create ``systems/visual_shell/web/evolution_safety_bridge.js``

## 2. Add WebMCP Tool Definitions for Safety

- [ ] Modify ``systems/visual_shell/web/webmcp_bridge.js:95-97` (after Phase O tools)`

## 3. Wire EvolutionSafetyBridge into HTML

- [ ] Modify ``systems/visual_shell/web/index.html` (add script tag)`

## 4. Enhance get_os_state with V13 Metrics

- [ ] Modify ``systems/visual_shell/web/webmcp_bridge.js` (get_os_state handler)`

## 5. Enhance load_rts_cartridge with Health Prediction

- [ ] Modify ``systems/visual_shell/web/webmcp_bridge.js` (load_rts_cartridge handler)`

## 6. Write Integration Tests

- [ ] Create ``systems/evolution_daemon/tests/test_webmcp_safety_integration.py``

## 7. Update Memory Documentation

- [ ] Modify ``memory/evolution_daemon_v13.md``
