# Evolution Zone Integration Guide

## Overview

The Evolution Zone enables autonomous code execution through visual interaction:

1. **User clicks Evolution Zone window** (gold border in visual shell)
2. **Rust frontend sends WriteEvolvedGenome message** via Unix socket
3. **Python backend receives and queues genome** in EvolutionDaemonV8
4. **Daemon processes genome** (breeding, compilation, execution)
5. **Results rendered back to map**

## Architecture

```
┌─────────────────────────────────────────────────────┐
│ Visual Shell (Rust)                                 │
│  systems/infinite_map_rs/src/app.rs                 │
│   ↓ click                                           │
│  evolution_manager.write_evolved_genome()           │
│   ↓                                                 │
│  Unix Socket: /tmp/evolution_protocol.sock          │
└─────────────────────────────────────────────────────┘
   ↓ WriteEvolvedGenome message
┌─────────────────────────────────────────────────────┐
│ Evolution Protocol Server (Python)                 │
│  systems/neural_cortex/evolution_protocol_server.py │
│   ↓ _handle_write_evolved_genome()                  │
│  daemon_bridge.forward_genome()                     │
└─────────────────────────────────────────────────────┘
   ↓
┌─────────────────────────────────────────────────────┐
│ EvolutionDaemonV8                                   │
│  evolution_daemon_v8.py                             │
│   ↓ genome_queue.put()                              │
│  _process_evolved_genome()                          │
│   ↓ (future: compile to .rts.png)                    │
│  Place on infinite map                              │
└─────────────────────────────────────────────────────┘
```

## Protocol Message Format

**WriteEvolvedGenome** (Rust → Python):

```json
{
  "msg_type": "WriteEvolvedGenome",
  "sequence": 1,
  "payload": {
    "id": "genome-boot-123",
    "data": [0xCA, 0xFE, 0xBA, 0xBE],
    "generation": 1,
    "fitness": 0.99,
    "metadata": {"action": "BOOT_DAEMON"}
  }
}
```

## Testing

Run integration tests:

```bash
# Unit tests
python -m pytest tests/test_evolution_genome_queue.py -v
python -m pytest systems/neural_cortex/tests/test_evolution_daemon_bridge.py -v

# End-to-end
python -m pytest tests/integration/test_evolution_zone_e2e.py -v
```

## Next Steps

- [ ] Phase 35.6: Implement actual genome breeding in `_process_evolved_genome()`
- [ ] Phase 35.7: Compile genomes to .rts.png cartridges
- [ ] Phase 35.8: Place cartridges on infinite map at cursor position
- [ ] Phase 35.9: Add visual feedback for evolution progress
