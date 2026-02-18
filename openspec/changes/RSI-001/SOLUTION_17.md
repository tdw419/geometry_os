# Solution for Task: **Task 3**: Create Integration Points between Evolution Daemon, Implementation Agent and CTRM component to enable the feedback loop: daemon triggers implementation agent which builds changes tracked by CT M.

Here is the implementation plan for **Task 3** of **RSI-001**.

This plan focuses on the "Glue Logic" required to connect the **Evolution Daemon** (Producer) to the **Implementation Agent** (Consumer) while ensuring the **CTRM Component** (Tracker) records the state change.

### 1. File Paths

The following files need to be created or modified to establish the integration points:

*   **`geometry_os/shared/integration_api.py`** (New)
    *   Defines the shared Pydantic schemas (Request/Response objects) to ensure strict type safety between components.
*   **`geometry_os/evolution_daemon/orchestrator.py`** (Modified)
    *   Updated to push triggers to the queue instead of just logging.
*   **`geometry_os/implementation_agent/worker.py`** (New)
    *   The background process that listens for triggers and executes the build.
*   **`geometry_os/ctrm/interface.py`** (Modified)
    *   Updated to accept status signals from the Implementation Agent.

---

### 2. Code Implementation

#### A. Shared Data Structure (`geometry_os/shared/integration_api.py`)
This file ensures the Daemon and Agent speak the same language.

```python
from pydantic import BaseModel, Field
from typing import Optional, Dict, Any
from enum import Enum

class TaskStatus(str, Enum):
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"

class RSITask(BaseModel):
    """
    The payload passed from Evolution Daemon to Implementation Agent.
    """
    change_id: str = Field(..., description="Unique identifier for the change (e.g., RSI-001)")
    target_module: str = Field(..., description="The system component to modify")
    patch_definition: Dict[str, Any] = Field(..., description="JSON describing the code changes")
    priority: int = Field(default=5, description="Task priority 1-10")

class CTRMUpdate(BaseModel):
    """
    The payload passed from Implementation Agent to CTRM.
    """
    task_id: str
    status: TaskStatus
    error_log: Optional[str] = None
    generated_hash: Optional[str] = None # Hash of the generated code for verification
```

#### B. The Implementation Agent Worker (`geometry_os/implementation_agent/worker.py`)
This is the core integration point. It consumes the task, executes the build, and reports back.

```python
import asyncio
import json
from geometry_os.shared.integration_api import RSITask, CTRMUpdate, TaskStatus
# Mocking the CTRM and Daemon interfaces for demonstration
from geometry_os.ctrm.interface import track_change_event 

class ImplementationAgent:
    def __init__(self):
        self.is_running = False

    async def process_task(self, task_data: dict):
        """
        Receives raw task from queue, validates, and executes.
        """
        try:
            # 1. Validate Input Schema
            task = RSITask(**task_data)
            print(f"[Agent] Received Task: {task.change_id}")

            # 2. Notify CTRM: Start
            await track_change_event(CTRMUpdate(
                task_id=task.change_id, 
                status=TaskStatus.IN_PROGRESS
            ))

            # 3. Execute Implementation (Mock Logic)
            # In a real scenario, this calls the CodeGen/Builder modules
            result = await self._build_implementation(task)
            
            # 4. Notify CTRM: Success
            await track_change_event(CTRMUpdate(
                task_id=task.change_id, 
                status=TaskStatus.COMPLETED,
                generated_hash=result['hash']
            ))

        except Exception as e:
            print(f"[Agent] Error processing {task_data.get('change_id')}: {e}")
            # 5. Notify CTRM: Failure
            await track_change_event(CTRMUpdate(
                task_id=task_data.get('change_id'), 
                status=TaskStatus.FAILED,
                error_log=str(e)
            ))

    async def _build_implementation(self, task: RSITask):
        # Simulate building the change
        await asyncio.sleep(1) 
        return {"hash": "abc123", "files_modified": 1}

# Example usage loop
async def main():
    agent = ImplementationAgent()
    # Simulating a trigger received from Evolution Daemon
    mock_trigger = {
        "change_id": "RSI-001",
        "target_module": "core.kernel",
        "patch_definition": {"type": "refactor", "target": "memory_allocator"}
    }
    await agent.process_task(mock_trigger)

if __name__ == "__main__":
    asyncio.run(main())
```

---

### 3. Next Steps

To finalize the integration loop, you need to wire the **Evolution Daemon** to trigger this agent.

**Run the following command to initialize the worker service:**

```bash
# Create the file structure for the agent
mkdir -p geometry_os/implementation_agent
touch geometry_os/implementation_agent/__init__.py

# (You would then start the worker process, which waits for signals from the Daemon)
# python -m geometry_os.implementation_agent.worker
```