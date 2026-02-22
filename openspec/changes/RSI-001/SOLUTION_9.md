# Solution for Task: **Task 2**: Implement Evolution Daemon component with parsing logic that can ingest Roadmap JSONs, detect improvement needs based on reliability metrics and complexity thresholds specified in the schema.

Here is the implementation plan for the **Evolution Daemon** component as specified in RSI-001.

### 1. File Paths

The following directory structure and files need to be created to support the Evolution Daemon and the Recursive Self-Improvement (RSI) schema.

*   `src/rsi/daemon.py` (New) - The core daemon logic for polling and parsing.
*   `src/rsi/schema.py` (New) - Pydantic models defining the Roadmap JSON structure.
*   `src/rsi/config.py` (New) - Configuration for thresholds (reliability/complexity).
*   `requirements.txt` (Modified) - Add `pydantic` and `watchdog`.

### 2. Code Implementation

#### A. The Schema Definition (`src/rsi/schema.py`)
This file defines the structure of the Roadmap JSON that allows the system to interpret its own tasks.

```python
from pydantic import BaseModel, Field
from typing import List, Optional, Literal

class SystemMetric(BaseModel):
    """Current state of the system regarding a specific component."""
    reliability: float = Field(..., ge=0.0, le=1.0, description="Current reliability score (0-1)")
    complexity: int = Field(..., ge=1, description="Cyclomatic complexity or estimated effort")

class Task(BaseModel):
    """A single actionable item within the roadmap."""
    id: str
    description: str
    component: str
    target_reliability: float = Field(..., ge=0.0, le=1.0)
    
class Roadmap(BaseModel):
    """The top-level structure for recursive input."""
    version: str = "1.0"
    system_state: dict[str, SystemMetric]
    tasks: List[Task]
    meta: Optional[dict] = None
```

#### B. The Evolution Daemon (`src/rsi/daemon.py`)
This component ingests the JSON, compares current metrics against thresholds, and flags items for the Implementation Agent.

```python
import json
import time
from typing import List
from pathlib import Path
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

# Hypothetical imports for the Geometry OS ecosystem
from geometry_os.log import logger
from geometry_os.agents import ImplementationAgent
from .schema import Roadmap, SystemMetric
from .config import RELIABILITY_THRESHOLD, COMPLEXITY_CEILING

class EvolutionDaemon:
    def __init__(self, watch_path: str):
        self.watch_path = Path(watch_path)
        self.impl_agent = ImplementationAgent()
        self.observer = Observer()

    def analyze_roadmap(self, file_path: Path) -> List[str]:
        """
        Parses Roadmap JSON and detects improvement needs based on 
        reliability metrics and complexity thresholds.
        """
        try:
            with open(file_path, 'r') as f:
                data = json.load(f)
            
            roadmap = Roadmap(**data)
            needs_implementation = []

            logger.info(f"Processing Roadmap v{roadmap.version}...")

            for component, metrics in roadmap.system_state.items():
                # LOGIC: Detect improvement needs
                # 1. Reliability is below threshold
                # 2. Complexity is manageable (to prevent infinite loops on impossible tasks)
                
                reliability_gap = metrics.reliability < RELIABILITY_THRESHOLD
                complexity_ok = metrics.complexity < COMPLEXITY_CEILING

                if reliability_gap and complexity_ok:
                    logger.warning(f"Improvement Detected: {component} (Rel: {metrics.reliability})")
                    needs_implementation.append(component)
                
                elif not complexity_ok:
                    logger.error(f"Complexity Ceiling Hit: {component}. Requires refactoring.")

            return needs_implementation

        except Exception as e:
            logger.error(f"Failed to parse roadmap: {e}")
            return []

    def trigger_evolution(self, targets: List[str]):
        """Passes detected needs to the Implementation Agent."""
        for target in targets:
            logger.info(f"Triggering Implementation Agent for: {target}")
            # In a real scenario, this would queue the job or invoke the agent directly
            # self.impl_agent.execute(target) 

class RoadmapHandler(FileSystemEventHandler):
    def __init__(self, daemon: EvolutionDaemon):
        self.daemon = daemon

    def on_modified(self, event):
        if event.src_path.endswith('.json'):
            targets = self.daemon.analyze_roadmap(Path(event.src_path))
            self.daemon.trigger_evolution(targets)

def start_daemon(watch_dir: str):
    daemon = EvolutionDaemon(watch_dir)
    handler = RoadmapHandler(daemon)
    
    observer = Observer()
    observer.schedule(handler, watch_dir, recursive=False)
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
```

### 3. Next Step

To initialize the Recursive Self-Improvement cycle, you need to create the initial roadmap definition file that the daemon will ingest.

**Command:**
```bash
mkdir -p src/rsi && cat > src/rsi/config.py << 'EOF'
# Configuration for Evolution Daemon
RELIABILITY_THRESHOLD = 0.95  # Trigger improvement if reliability drops below 95%
COMPLEXITY_CEILING = 50       # Do not auto-improve if complexity is above this level
EOF
```