
from geometry_os.persistence import DatabaseManager
import time
import numpy as np

db = DatabaseManager('geometry_os/demos/persistent_demo.db')
db.store_node({
    "id": "model_tiny_brain_v2",
    "type": "model_gguf",
    "content": "FAKE_NEURAL_WEIGHTS_DATA_V2",
    "metadata": {
        "name": "tiny-brain.gguf",
        "path": "/models/tiny-brain.gguf", 
        "size": 1024
    },
    "vector": np.array([]),
    "provenance": "manual_injection"
})
print("✅ Injected tiny-brain.gguf via DatabaseManager")
