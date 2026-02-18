# 60 FPS Performance Stress Test - Tasks

## 1. Telemetry Infrastructure
- [x] 1.1 Create `systems/visual_shell/web/tests/test_performance_stress.js`
- [x] 1.2 Implement `FrameTimeMonitor` class to track FPS and jitter
- [x] 1.3 Add telemetry export to browser console/logs

## 2. Load Generation
- [x] 2.1 Implement `TileLoadGenerator` to spawn 100+ `VMMonitorTile` instances
- [x] 2.2 Implement `ParticleLoadGenerator` for 37M particle stress test (WebGPU)
- [x] 2.3 Add controls to scale load dynamically

## 3. Stress Scenarios
- [ ] 3.1 Run "The Century Load" (100 tiles) and record telemetry
- [ ] 3.2 Run "The Particle Void" (37M particles) and record telemetry
- [ ] 3.3 Verify memory stability during sustained load

## 4. Verification & Documentation
- [ ] 4.1 Run full suite and ensure 60 FPS threshold is met
- [ ] 4.2 Document Performance Stress Proof in `docs/proofs/60FPS_STRESS_PROOF.md`

---

## Implementation Status

| Component | Status | Description |
|-----------|--------|-------------|
| FrameTimeMonitor | ✅ | Real-time FPS/jitter tracking |
| TileLoadGenerator | ✅ | 100+ tile simulation |
| ParticleLoadGenerator | ✅ | 37M particle simulation |
| Century Load Test | 🔄 | Ready to run |
| Particle Void Test | 🔄 | Ready to run |
| Sustained Load Test | 🔄 | Ready to run |
| Proof Documentation | ⏳ | Pending test results |

## How to Run

```javascript
// In browser console:
const suite = new FPSStressTestSuite();

// Run full suite (excludes 5-min sustained test)
await suite.runFullSuite();

// Run individual tests
await suite.runCenturyLoad(10000);     // 10 seconds, 100 tiles
await suite.runParticleVoid(37000000, 10000);  // 10 seconds, 37M particles
await suite.runSustainedLoad(300000);  // 5 minutes
```
