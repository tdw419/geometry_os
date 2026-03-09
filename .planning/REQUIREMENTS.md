# Requirements: v1.6 Ephemeral Boot

## Requirements

### Core

- [x] **EPHEM-01**: User can boot container with `--ephemeral` flag
- [x] **EPHEM-02**: Changes are discarded on container exit
- [x] **EPHEM-03**: Original .rts.png file remains unchanged

### Integration

- [x] **EPHEM-04**: Works with all boot types (bootable, vm-snapshot)
- [x] **EPHEM-05**: Works with multi-container boot
- [x] **EPHEM-06**: `pixelrts ps` shows ephemeral containers with indicator

### Safety

- [x] **EPHEM-07**: Temp files cleaned up on exit (normal or crash)
- [x] **EPHEM-08**: User can save ephemeral changes with `pixelrts commit`

## Out of Scope

| Feature | Reason |
|---------|--------|
| Persistent snapshots of ephemeral | Use commit instead |
| Network isolation for ephemeral | Works with existing networking |
| Ephemeral install | Contradicts ephemeral nature |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| EPHEM-01 | 18 | Complete |
| EPHEM-02 | 18 | Complete |
| EPHEM-03 | 18 | Complete |
| EPHEM-04 | 18 | Complete |
| EPHEM-05 | 18 | Complete |
| EPHEM-06 | 18 | Complete |
| EPHEM-07 | 18 | Complete |
| EPHEM-08 | 18 | Complete |

---
*Created: 2026-03-09*
*Completed: 2026-03-09*
