# Solution for Task: **Task 1**: Define JSON Schema Specification for Roadmap Documents with required fields including change_id, title, description, rationale, estimated_effort levels (Small/Medium/Large/XLarge), and decomposed tasks array containing unique identifiers acceptance criteria descriptions dependencies.

Here is the implementation plan for **RSI-001**, defining the JSON schema specification for Roadmap Documents within Geometry OS.

### 1. File Paths

To support the Recursive Self-Improvement (RSI) infrastructure, the following file structure should be established to separate the schema definition from the validation logic.

*   **`src/schemas/roadmap_v1.json`**
    *   *Description*: The canonical JSON Schema definition. This file acts as the "contract" that the Evolution Daemon, Implementation Agent, and Truth Engine must adhere to.
*   **`src/core/validation.py`** (or `validation.rs`)
    *   *Description*: The module responsible for loading the schema and validating roadmap documents against it. This ensures that only valid, structured data enters the feedback loop.

### 2. Implementation Code

#### A. The Schema (`src/schemas/roadmap_v1.json`)
This JSON Schema enforces the structure required for autonomous processing, including unique identifiers for task tracking and specific enums for effort estimation.

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://geometry-os.org/schemas/roadmap_v1.json",
  "title": "Geometry OS Roadmap Document",
  "description": "Schema for recursive self-improvement roadmap documents.",
  "type": "object",
  "required": [
    "meta",
    "change_request"
  ],
  "properties": {
    "meta": {
      "type": "object",
      "description": "Metadata regarding the document version and origin.",
      "properties": {
        "schema_version": { "type": "string", "pattern": "^1\\.0$" },
        "generated_at": { "type": "string", "format": "date-time" },
        "source_component": { "type": "string" }
      }
    },
    "change_request": {
      "type": "object",
      "required": [
        "change_id",
        "title",
        "description",
        "rationale",
        "estimated_effort",
        "decomposed_tasks"
      ],
      "properties": {
        "change_id": {
          "type": "string",
          "pattern": "^[A-Z]{3}-[0-9]{3}$",
          "description": "Unique identifier for the change (e.g., RSI-001)."
        },
        "title": { "type": "string", "minLength": 1 },
        "description": { "type": "string", "minLength": 1 },
        "rationale": { "type": "string", "minLength": 1 },
        "estimated_effort": {
          "type": "string",
          "enum": ["Small", "Medium", "Large", "XLarge"],
          "description": "Estimated complexity level."
        },
        "decomposed_tasks": {
          "type": "array",
          "minItems": 1,
          "items": {
            "type": "object",
            "required": ["task_id", "description", "acceptance_criteria", "dependencies"],
            "properties": {
              "task_id": {
                "type": "string",
                "description": "Unique identifier for the specific task."
              },
              "description": { "type": "string" },
              "acceptance_criteria": { 
                "type": "array", 
                "items": { "type": "string" },
                "minItems": 1 
              },
              "dependencies": {
                "type": "array",
                "items": { "type": "string" },
                "description": "List of task_ids this task depends on."
              }
            }
          }
        }
      }
    }
  }
}
```

#### B. Validation Logic (Python Example)
The `RoadmapValidator` class ensures that any document entering the system is structurally sound before the CTRM component attempts to track it.

```python
import json
from jsonschema import validate, ValidationError
from pathlib import Path

class RoadmapValidator:
    SCHEMA_PATH = Path("src/schemas/roadmap_v1.json")

    @classmethod
    def validate(cls, document: dict) -> bool:
        """
        Validates a roadmap document against the RSI-001 schema.
        Raises ValueError with details if validation fails.
        """
        if not cls.SCHEMA_PATH.exists():
            raise FileNotFoundError(f"Schema file missing at {cls.SCHEMA_PATH}")

        schema = json.loads(cls.SCHEMA_PATH.read_text())
        
        try:
            validate(instance=document, schema=schema)
            return True
        except ValidationError as e:
            raise ValueError(f"Invalid Roadmap Document: {e.message}") from e

# Example Usage
if __name__ == "__main__":
    # A minimal valid document for testing
    sample_doc = {
        "meta": {
            "schema_version": "1.0",
            "generated_at": "2023-10-27T10:00:00Z",
            "source_component": "EvolutionDaemon"
        },
        "change_request": {
            "change_id": "RSI-001",
            "title": "Define JSON Schema",
            "description": "Schema for recursive self-improvement.",
            "rationale": "Required for autonomous feedback loops.",
            "estimated_effort": "Medium",
            "decomposed_tasks": [
                {
                    "task_id": "T-101",
                    "description": "Create JSON file",
                    "acceptance_criteria": ["File exists", "Valid JSON"],
                    "dependencies": []
                }
            ]
        }
    }

    try:
        RoadmapValidator.validate(sample_doc)
        print("[System] Document validated successfully.")
    except ValueError as err:
        print(f"[Error] {err}")
```

### 3. Next Step

**Command:** Create the schema file to establish the data contract.

```bash
mkdir -p src/schemas
cat <<EOF > src/schemas/roadmap_v1.json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://geometry-os.org/schemas/roadmap_v1.json",
  "title": "Geometry OS Roadmap Document",
  "type": "object",
  "required": ["meta", "change_request"],
  "properties": {
    "meta": {
      "type": "object",
      "properties": {
        "schema_version": { "type": "string" },
        "generated_at": { "type": "string", "format": "date-time" }
      }
    },
    "change_request": {
      "type": "object",
      "required": ["change_id", "title", "description", "rationale", "estimated_effort", "decomposed_tasks"],
      "properties": {
        "change_id": { "type": "string", "pattern": "^[A-Z]{3}-[0-9]{3}$" },
        "title": { "type": "string" },
        "description": { "type": "string" },
        "rationale": { "type": "string" },
        "estimated_effort": { "type": "string", "enum": ["Small", "Medium", "Large", "XLarge"] },
        "decomposed_tasks": {
          "type": "array",
          "items": {
            "type": "object",
            "required": ["task_id", "description", "acceptance_criteria", "dependencies"],
            "properties": {
              "task_id": { "type": "string" },
              "description": { "type": "string" },
              "acceptance_criteria": { "type": "array", "items": { "type": "string" } },
              "dependencies": { "type": "array", "items": { "type": "string" } }
            }
          }
        }
      }
    }
  }
}
EOF
```