# Roadmap: PixelRTS Boot Improvement

## Milestones

- ✅ **v1.0 MVP** - Phases 1-4 (shipped 2026-02-27)
- ✅ **v1.1 Visual Shell Integration** - Phases 5-6 (shipped 2026-02-27)
- ✅ **v1.2 Network Boot** - Phases 7-11 (shipped 2026-02-28)
- ✅ **v1.3 PXE Boot** - Phases 12-16 (shipped 2026-02-28)
- 🚧 **v1.4 GPU Linux Execution** - Phases 17-22 (in progress)

## Phases

<details>
<summary>✅ v1.0 MVP (Phases 1-4) - SHIPPED 2026-02-27</summary>

### Phase 1: Vision Analysis Pipeline
**Goal**: Analyze OS containers from PNG visuals
**Plans**: 5 plans (Complete)

### Phase 2: FUSE Bridge
**Goal**: Boot PNG directly without extraction
**Plans**: 6 plans (Complete)

### Phase 3: Visual Installer Engine
**Goal**: Install to disk with progress visualization
**Plans**: 7 plans (Complete)

### Phase 4: Visual Catalog Manager
**Goal**: Thumbnail gallery with one-click boot
**Plans**: 5 plans (Complete)

</details>

<details>
<summary>✅ v1.1 Visual Shell Integration (Phases 5-6) - SHIPPED 2026-02-27</summary>

### Phase 5: Desktop Objects
**Goal**: OS containers on infinite canvas with drag-and-drop
**Plans**: 5 plans (Complete)

### Phase 6: Boot Visualization
**Goal**: Real-time boot progress with status indicators
**Plans**: 3 plans (Complete)

</details>

<details>
<summary>✅ v1.2 Network Boot (Phases 7-11) - SHIPPED 2026-02-28</summary>

### Phase 7: Cache Layer
**Goal**: IndexedDB cache with LRU eviction and hash verification
**Plans**: 3 plans (Complete)

### Phase 8: Remote Fetch
**Goal**: Streaming downloads with real-time progress
**Plans**: 3 plans (Complete)

### Phase 9: Catalog Aggregation
**Goal**: Multi-server catalog with stale-while-revalidate
**Plans**: 3 plans (Complete)

### Phase 10: Error Handling
**Goal**: Exponential backoff retry with manual retry button
**Plans**: 3 plans (Complete)

### Phase 11: Cache UI
**Goal**: Cache management UI with clear functionality
**Plans**: 2 plans (Complete)

</details>

<details>
<summary>✅ v1.3 PXE Boot (Phases 12-16) - SHIPPED 2026-02-28</summary>

### Phase 12: DHCP Server
**Goal**: DHCP server with PXE options for network boot
**Plans**: 4 plans (Complete)

### Phase 13: TFTP Server
**Goal**: TFTP server for bootloader delivery
**Plans**: 4 plans (Complete)

### Phase 14: HTTP Container Serving
**Goal**: HTTP server with range requests for container delivery
**Plans**: 4 plans (Complete)

### Phase 15: Boot Menu
**Goal**: iPXE boot menu with container selection
**Plans**: 4 plans (Complete)

### Phase 16: PXE Integration
**Goal**: Visual shell PXE badge and toggle
**Plans**: 4 plans (Complete)

</details>

---

## 🚧 v1.4 GPU Linux Execution (In Progress)

**Milestone Goal:** Execute Linux kernel entirely on GPU via WebGPU compute shaders

### Phase 17: Core Execution Foundation
**Goal**: Users can verify GPU executes RV32I instructions correctly with observable state
**Depends on**: Phase 16 (Visual shell foundation exists)
**Requirements**: CORE-01, CORE-02, CORE-03, CORE-04, CORE-05, CORE-06, CORE-07, CORE-08, CORE-09, MEM-01
**Success Criteria** (what must be TRUE):
  1. User can load a simple RISC-V program into GPU memory and see it execute
  2. User can inspect GPU registers after execution to verify instruction results
  3. User can see arithmetic operations (ADD, SUB, etc.) produce correct results
  4. User can see memory load/store operations work correctly
  5. User can see branch and jump instructions change program flow correctly
**Plans**: TBD

Plans:
- [ ] 17-01: [To be planned]

### Phase 18: Privileged Architecture
**Goal**: Users can run code that requires privilege mode switching (M-mode/S-mode)
**Depends on**: Phase 17
**Requirements**: PRIV-01, PRIV-02, PRIV-03, PRIV-04, PRIV-05, PRIV-06, PRIV-07, PRIV-08
**Success Criteria** (what must be TRUE):
  1. User can execute code that switches from M-mode to S-mode
  2. User can read and write CSRs (mstatus, satp, stvec, etc.) via CSR instructions
  3. User can see trap handling work when exceptions occur
  4. User can see MRET/SRET return from traps correctly
  5. User can see SBI calls for console output reach JavaScript
**Plans**: TBD

Plans:
- [ ] 18-01: [To be planned]

### Phase 19: Memory Management Unit
**Goal**: Users can run Linux with virtual memory enabled via Sv32 page tables
**Depends on**: Phase 18 (requires satp CSR and trap handling)
**Requirements**: MEM-02, MEM-03, MEM-04, MEM-05
**Success Criteria** (what must be TRUE):
  1. User can enable MMU via satp CSR and see virtual addresses translated
  2. User can see page table walks succeed for valid mappings
  3. User can see page faults trigger when accessing unmapped memory
  4. User can access memory-mapped I/O at device address ranges
**Plans**: TBD

Plans:
- [ ] 19-01: [To be planned]

### Phase 20: Device Emulation
**Goal**: Users can see Linux kernel output on the JavaScript console
**Depends on**: Phase 19 (MMU for device memory-mapped I/O)
**Requirements**: DEV-01, DEV-02, DEV-03, DEV-04
**Success Criteria** (what must be TRUE):
  1. User can see kernel printk output appear in browser console
  2. User can see timer interrupts fire based on CLINT mtime comparison
  3. User can interact with UART console (input works if supported)
**Plans**: TBD

Plans:
- [ ] 20-01: [To be planned]

### Phase 21: Boot Integration
**Goal**: Users can boot Alpine Linux to shell prompt from LNX bundle
**Depends on**: Phase 20 (need console output to verify boot)
**Requirements**: BOOT-01, BOOT-02, BOOT-03, BOOT-04, BOOT-05, BOOT-06
**Success Criteria** (what must be TRUE):
  1. User can drag an LNX bundle to visual shell and see it parse correctly
  2. User can see kernel, initrd, and DTB loaded into GPU memory
  3. User can see execution start at kernel entry point (0x1000)
  4. User can see Alpine Linux boot messages in console
  5. User can see shell prompt appear indicating successful boot
**Plans**: TBD

Plans:
- [ ] 21-01: [To be planned]

### Phase 22: Visual Shell Integration
**Goal**: Users have full visual experience for GPU Linux boot with error handling
**Depends on**: Phase 21
**Requirements**: INT-01, INT-02, INT-03, INT-04
**Success Criteria** (what must be TRUE):
  1. User can see boot progress bar during GPU Linux execution
  2. User can see console output in a visual shell terminal panel
  3. User can see clear error messages with actionable guidance when boot fails
  4. User can stop/restart GPU execution from visual shell
**Plans**: TBD

Plans:
- [ ] 22-01: [To be planned]

---

## Progress

**Execution Order:**
Phases execute in numeric order: 17 → 18 → 19 → 20 → 21 → 22

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 17. Core Execution Foundation | v1.4 | 0/TBD | Not started | - |
| 18. Privileged Architecture | v1.4 | 0/TBD | Not started | - |
| 19. Memory Management Unit | v1.4 | 0/TBD | Not started | - |
| 20. Device Emulation | v1.4 | 0/TBD | Not started | - |
| 21. Boot Integration | v1.4 | 0/TBD | Not started | - |
| 22. Visual Shell Integration | v1.4 | 0/TBD | Not started | - |

---

## Coverage Validation

**v1 Requirements:** 34 total

| Category | Requirements | Phase |
|----------|--------------|-------|
| CORE | CORE-01 to CORE-09 | Phase 17 |
| MEM | MEM-01 | Phase 17 |
| MEM | MEM-02 to MEM-05 | Phase 19 |
| PRIV | PRIV-01 to PRIV-08 | Phase 18 |
| DEV | DEV-01 to DEV-04 | Phase 20 |
| BOOT | BOOT-01 to BOOT-06 | Phase 21 |
| INT | INT-01 to INT-04 | Phase 22 |

**Coverage:** 34/34 (100%)

---

*Roadmap updated: 2026-02-28*
*v1.4 GPU Linux Execution milestone initialized*
