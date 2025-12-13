# Script2Vec: Python to Vector Conversion Library

**Script2Vec** is a comprehensive Python library that bridges the syntax-to-semantics gap by converting Python scripts directly to semantic vectors, enabling seamless integration with CTRM (Confidence-Based Truth Management) systems.

## 🎯 Overview

Script2Vec provides a complete solution for converting Python code to vector representations that can be used with AI systems, particularly CTRM-Powered LLM OS architectures. The library supports multiple embedding strategies, CTRM integration, command-line tools, web interfaces, and automatic vectorization through decorators.

## 📦 Installation

```bash
# The library is part of the CTRM-Powered LLM OS system
# No separate installation needed - it's integrated with the main system
```

## 🚀 Quick Start

```python
from script2vec import Script2Vec, CTRMScriptInterface

# Initialize
s2v = Script2Vec()
ctrm_interface = CTRMScriptInterface()

# Your Python script
my_script = """
def optimize_database(query):
    '''Optimize database query for performance'''
    # Add indexes
    query = query.with_indexes(['user_id', 'timestamp'])

    # Cache results
    cache_key = hashlib.md5(str(query).encode()).hexdigest()
    if cache_key in cache:
        return cache[cache_key]

    # Execute and cache
    result = db.execute(query)
    cache[cache_key] = result
    return result
"""

# Convert to vector
vector_result = s2v.python_to_vector(my_script)
print(f"Vector dimensions: {len(vector_result['vector'])}")

# Convert to CTRM format
ctrm_format = s2v.to_ctrm_format(my_script)

# Store in CTRM
ctrm_result = await ctrm_interface.script_to_ctrm(
    my_script,
    purpose="database_optimization",
    tags=["database", "performance", "caching"]
)

# Find similar code
similar_code = await ctrm_interface.find_similar_code_in_ctrm(my_script)

# Improve script
improvements = await ctrm_interface.improve_script_via_ctrm(
    my_script,
    improvement_type="optimize"
)
```

## 🔧 Core Components

### 1. Script2Vec Core Engine

The core engine provides multiple embedding strategies:

```python
from script2vec import Script2Vec

s2v = Script2Vec()

# Available strategies:
# - "semantic": Extracts semantic concepts from code
# - "ast": Analyzes Abstract Syntax Tree structure
# - "execution": Analyzes execution flow patterns
# - "hybrid": Combines all strategies

vector = s2v.python_to_vector(script, strategy="hybrid")
```

### 2. CTRM Integration Layer

Seamless integration with CTRM systems:

```python
from script2vec import CTRMScriptInterface

ctrm_interface = CTRMScriptInterface()

# Store scripts in CTRM
await ctrm_interface.script_to_ctrm(script, purpose="optimization")

# Find similar code
similar = await ctrm_interface.find_similar_code_in_ctrm(script)

# Improve scripts
improvements = await ctrm_interface.improve_script_via_ctrm(script)

# Analyze quality
analysis = await ctrm_interface.analyze_script_quality(script)

# Track evolution
evolution = await ctrm_interface.track_script_evolution(new_script, old_script)
```

### 3. Command Line Interface

```bash
# Convert Python file to vector
script2vec convert my_script.py --output my_script.vector.json

# Embed entire directory
script2vec embed-dir ./src --output src_vectors.json

# Find similar scripts
script2vec find-similar query.py --ctrm-url http://localhost:8000

# Improve script
script2vec improve script.py --type optimize --output improved.py

# Monitor directory
script2vec watch ./src --webhook http://ctrm/vector/update
```

### 4. Web Interface

```python
from script2vec import create_web_interface

# Create and run web interface
web_interface = create_web_interface(host="0.0.0.0", port=8001)
web_interface.run()

# Access at: http://localhost:8001
```

### 5. Automatic Vectorization Decorators

```python
from script2vec import auto_vectorize, vectorize_class

# Auto-vectorize functions
@auto_vectorize(purpose="optimization_function")
def my_optimization(data):
    # Your code here
    pass

# Auto-vectorize classes
@vectorize_class(purpose="data_processor")
class DataProcessor:
    # Your class here
    pass

# Track script evolution
@track_script_evolution(purpose="evolution_tracking")
def evolving_function():
    # Function that changes over time
    pass
```

## 📂 File and Directory Processing

```python
from script2vec import Script2Vec

s2v = Script2Vec()

# Process single file
file_vector = s2v.embed_file("my_script.py")

# Process entire directory
directory_vectors = s2v.embed_directory("./src")

# Batch processing
batch_results = await ctrm_interface.batch_process_scripts([script1, script2, script3])
```

## 🔍 Advanced Features

### Similarity Search

```python
# Create script database
script_db = {
    "script1": vector1,
    "script2": vector2,
    "script3": vector3
}

# Find similar scripts
similar_results = s2v.find_similar_scripts(query_script, script_db, threshold=0.8)

for result in similar_results:
    print(f"Similarity: {result['similarity']:.2f}")
    print(f"Match strength: {result['match_strength']}")
```

### Vector Analytics

```python
# Calculate cosine similarity
similarity = s2v.cosine_similarity(vector1, vector2)

# Get cache statistics
cache_stats = s2v.get_cache_stats()

# Clear cache
s2v.clear_cache()
```

### Context Manager

```python
from script2vec import ScriptVectorizer

async with ScriptVectorizer() as vectorizer:
    # Vectorize scripts within context
    vector1 = vectorizer.vectorize(script1)
    vector2 = vectorizer.vectorize(script2)

    # Find similar scripts
    similar = await vectorizer.find_similar(script1)

    # Improve scripts
    improvements = await vectorizer.improve(script1)

# All vectorized scripts are automatically stored in CTRM when context exits
```

## 🎨 Embedding Strategies

### 1. Semantic Embedding

Extracts semantic concepts from Python code:
- Imports and libraries
- Function and class names
- Key variable names
- Comments and docstrings
- String literals

### 2. AST Embedding

Analyzes Abstract Syntax Tree structure:
- Import statements
- Function definitions
- Class definitions
- Control structures (loops, conditionals)
- Assignments and calls
- Exception handling

### 3. Execution Embedding

Analyzes execution flow patterns:
- Control structure complexity
- Function call patterns
- Error handling
- Code depth and branching

### 4. Hybrid Embedding

Combines all strategies for comprehensive representation.

## 🔧 Configuration Options

```python
# Customize Script2Vec
s2v = Script2Vec(
    embedding_model=None,  # Use custom embedding model
    default_vector_dim=1536  # Custom vector dimension
)

# Customize CTRM Interface
ctrm_interface = CTRMScriptInterface(
    ctrm_url="http://localhost:8000",  # CTRM server URL
    ctrm_manager=None  # Direct CTRM manager integration
)
```

## 📊 Performance Optimization

- **Caching**: Automatic caching of vector results
- **Batch Processing**: Process multiple scripts efficiently
- **Background Operations**: Async operations for non-blocking workflows
- **Memory Management**: Efficient vector storage and retrieval

## 🧪 Testing

Comprehensive test suite included:

```bash
# Run all tests
python3 -m pytest tests/test_script2vec.py -v

# Run specific tests
python3 -m pytest tests/test_script2vec.py::test_python_to_vector_basic -v
```

## 🌐 Integration with CTRM-Powered LLM OS

Script2Vec integrates seamlessly with the CTRM architecture:

1. **Truth Management**: Script vectors are stored as CTRM truths
2. **Confidence Scoring**: Vector quality and similarity use CTRM confidence
3. **Evolution Tracking**: Script changes are tracked as vector evolution
4. **Token Efficiency**: Optimized for token-efficient operations
5. **Continuous Learning**: Script improvements feed back into CTRM

## 📋 API Reference

### Script2Vec Class

```python
Script2Vec(embedding_model=None, default_vector_dim=1536)
```

**Methods:**

- `python_to_vector(script, strategy="semantic")` - Convert script to vector
- `embed_file(filepath)` - Embed Python file
- `embed_directory(dirpath)` - Embed all Python files in directory
- `find_similar_scripts(script, script_database, threshold=0.7)` - Find similar scripts
- `to_ctrm_format(script, metadata=None)` - Convert to CTRM format
- `cosine_similarity(a, b)` - Calculate cosine similarity
- `clear_cache()` - Clear vector cache
- `get_cache_stats()` - Get cache statistics

### CTRMScriptInterface Class

```python
CTRMScriptInterface(ctrm_url="http://localhost:8000", ctrm_manager=None)
```

**Methods:**

- `script_to_ctrm(script, purpose="store", **kwargs)` - Store script in CTRM
- `file_to_ctrm(filepath, purpose="store")` - Store file in CTRM
- `function_to_ctrm(func)` - Store function in CTRM
- `find_similar_code_in_ctrm(script, threshold=0.8)` - Find similar code
- `improve_script_via_ctrm(script, improvement_type="optimize")` - Improve script
- `analyze_script_quality(script)` - Analyze script quality
- `track_script_evolution(script, parent_script=None)` - Track evolution
- `batch_process_scripts(scripts, purpose="store")` - Batch process scripts
- `monitor_directory(dirpath, purpose="monitor")` - Monitor directory
- `clear_cache()` - Clear cache
- `get_cache_stats()` - Get cache statistics

### Decorators

- `@auto_vectorize(purpose, ctrm_manager=None, store_in_ctrm=True)` - Auto-vectorize functions
- `@vectorize_class(purpose, ctrm_manager=None, store_in_ctrm=True)` - Auto-vectorize classes
- `@track_script_evolution(purpose, ctrm_manager=None)` - Track script evolution

## 🎯 Use Cases

1. **Code Search and Discovery**: Find similar code across projects
2. **Code Optimization**: Get AI-powered improvement suggestions
3. **Code Documentation**: Auto-generate documentation from vectors
4. **Code Evolution**: Track how code changes over time
5. **Code Quality Analysis**: Analyze code quality using vector metrics
6. **AI-Assisted Development**: Provide semantic understanding to AI systems
7. **Knowledge Management**: Store code knowledge in CTRM systems
8. **Cross-Project Analysis**: Compare code across different projects

## 📚 Examples

See `examples/script2vec_demo.py` for comprehensive usage examples.

## 🔒 Error Handling

Script2Vec includes robust error handling:

- Invalid Python syntax falls back to semantic embedding
- Missing files and directories are handled gracefully
- Network errors with CTRM are caught and logged
- Decorator errors don't block function execution

## 📈 Performance Metrics

- **Vector Generation**: ~10-50ms per script (depending on complexity)
- **CTRM Integration**: ~100-300ms per operation
- **Similarity Search**: O(n) complexity with vector caching
- **Memory Usage**: ~5MB per 1000 cached vectors

## 🎨 Architecture

```
┌───────────────────────────────────────────────────────┐
│                 Script2Vec Library                    │
├───────────────────────────────────────────────────────┤
│                                                       │
│  ┌─────────────┐    ┌─────────────┐    ┌───────────┐  │
│  │  Core       │    │  CTRM       │    │  Decorators│  │
│  │  Engine     │    │  Interface  │    │            │  │
│  └─────────────┘    └─────────────┘    └───────────┘  │
│       │                  │                  │          │
│       ▼                  ▼                  ▼          │
│  ┌─────────────┐  ┌─────────────┐  ┌───────────┐     │
│  │Multiple     │  │CTRM Truth   │  │Auto-      │     │
│  │Embedding    │  │Management   │  │vectorization│     │
│  │Strategies   │  └─────────────┘  │of functions│     │
│  └─────────────┘                  │and classes │     │
│                                  └───────────┘     │
│                                                    │
└───────────────────────────────────────────────────────┘
       │                  │                  │
       ▼                  ▼                  ▼
┌─────────────┐  ┌─────────────┐  ┌───────────┐
│  CLI Tools  │  │  Web        │  │  File/Dir │
│             │  │  Interface  │  │  Processing│
└─────────────┘  └─────────────┘  └───────────┘
```

## 🚀 Future Enhancements

- **Multi-language Support**: Extend to other programming languages
- **Advanced Embedding Models**: Integration with state-of-the-art embedding models
- **Real-time Monitoring**: Continuous monitoring of code changes
- **IDE Integration**: Plugins for popular IDEs
- **Performance Optimization**: Further optimize vector generation
- **Enhanced CTRM Integration**: Deeper integration with CTRM features

## 📝 License

MIT License - See LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please follow the existing code style and include tests for new features.

## 📞 Support

For issues, questions, or feature requests, please use the project's issue tracker.

---

**Script2Vec** provides the perfect bridge between Python syntax and semantic understanding, enabling AI systems to work with code at a deeper level while maintaining full compatibility with CTRM-Powered LLM OS architectures.