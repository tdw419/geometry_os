# Requirements: v1.6 Ephemeral Boot

## Requirements

### Core

- [ ] **EPHEM-01**: User can boot container with `--ephemeral` flag
- [ ] **EPHEM-02**: Changes are discarded on container exit
- [ ] **EPHEM-03**: Original .rts.png file remains unchanged

### Integration

- [ ] **EPHEM-04**: Works with all boot types (bootable, vm-snapshot)
- [ ] **EPHEM-05**: Works with multi-container boot
- [ ] **EPHEM-06**: `pixelrts ps` shows ephemeral containers with indicator

### Safety

- [ ] **EPHEM-07**: Temp files cleaned up on exit (normal or crash)
- [ ] **EPHEM-08**: User can save ephemeral changes with `pixelrts commit`

## Out of Scope

| Feature | Reason |
|---------|--------|
| Persistent snapshots of ephemeral | Use commit instead |
| Network isolation for ephemeral | Works with existing networking |
| Ephemeral install | Contradicts ephemeral nature |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| EPHEM-01 | 18 | Pending |
| EPHEM-02 | 18 | Pending |
| EPHEM-03 | 18 | Pending |
| EPHEM-04 | 18 | Pending |
| EPHEM-05 | 18 | Pending |
| EPHEM-06 | 18 | Pending |
| EPHEM-07 | 18 | Pending |
| EPHEM-08 | 18 | Pending |

---
*Created: 2026-03-09*
