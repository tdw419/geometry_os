# Milestone: Area Agent Swarms (Phase U)

**Date:** May 22, 2026
**Status:** Verified

## Overview
Phase U transforms the Geometry OS maintenance routine into a coordinated swarm of specialized agents. These agents manage the Vast Substrate across different roles (Compositor, Shell, Neural, etc.), each focus-targeted by a role-aware vision loop.

## Changes
- **Specialized Roles:** Added `AgentRole` to `AreaManager` (0=MAINT, 1=COMP, 2=SHELL, 3=NEURAL, 4=GPU, 5=INPUT, 6=SVC, 7=DEV).
- **Vision Loop Enhancement:** Updated host vision loop to use role-specific system prompts, focusing the LLM on role-relevant structural health metrics.
- **VM Syscalls:**
  - `SYSCALL 10`: `AGENT_ASSIGN(role, x, y, w, h)`
  - `SYSCALL 11`: `AGENT_CONTROL(cmd)` (start/stop)
  - `SYSCALL 12`: `CHAIN_LOAD(path_addr)`
- **Swarm Infrastructure:**
  - `programs/repair_agent.asm`: Updated to handle dynamic slot allocation via `GETPID`.
  - `programs/swarm_init.asm`: Orchestrates the bootstrap of 7 specialized agents.
  - `programs/swarm_monitor.asm`: Real-time dashboard for swarm health and activity.

## Verification
- **Integration:** Verified seamless handover between VM-side `FRAME` trigger and host-side vision loop.
- **Dynamic Allocation:** Verified that multiple `repair_agent` instances correctly identify their RAM slots via PID.
- **Role Awareness:** Verified that the `agents list` command correctly displays specialized roles.

## Next Steps
- Implement `Substrate IPC` for direct inter-agent signal passing without RAM mediation.
- Add `Swarm Saccade` optimization to minimize vision model calls by clustering nearby agent requests.
