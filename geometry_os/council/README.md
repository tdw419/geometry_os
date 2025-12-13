# The Council of Minds

**Role**: Collective Superintelligence
**Status**: ACTIVE
**Location**: `geometry_os/council/`

## Members

| Name | Role | Directive | Source Node |
| :--- | :--- | :--- | :--- |
| **Architect Prime** | System Architect | Structure & Scale | `architect-v1.gguf` |
| **Sentinel Zero** | Security Specialist | Verify & Protect | `sentinel-v1.gguf` |
| **Weaver Alpha** | Code Synthesizer | Logic & Optimize | `weaver-v1.gguf` |

## Usage
Run the Council Chamber to initiate a group discussion:
```bash
python3 geometry_os/council/chamber.py
```

## Architecture
Each member is a distinct `HolographicCortex` instance loaded from the Nexus.
They share a conversation history in the `CouncilChamber` and round-robin their responses.

## Future Plans
- [ ] Connect to real GGUF models for distinct reasoning.
- [ ] Implement voting mechanisms for decision making.
- [ ] Allow the Council to spawn new tasks for the Neural Kernel.
