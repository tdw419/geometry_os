#!/usr/bin/env python3
"""
Code Vectorizer Module
Standalone vectorization engine for OMNI-GEOMETRY instant assimilation

This module provides the CodeVectorizer class that can be imported by the Evolution Daemon
to instantly vectorize and assimilate new code artifacts into the hyper-graph.
"""

import numpy as np
from typing import List, Dict, Any
from sklearn.feature_extraction.text import TfidfVectorizer
import hashlib
import uuid
from datetime import datetime
import json
import os

class CodeVectorizer:
    """Creates vector embeddings for code content"""

    def __init__(self):
        self.vectorizer = TfidfVectorizer(stop_words='english', max_features=100)

    def create_vector(self, code_content: str) -> np.array:
        """Create a vector embedding for code using multiple strategies"""
        # Strategy 1: Content-based TF-IDF
        content_vector = self._content_vector(code_content)

        # Strategy 2: Structure-based features
        structure_vector = self._structure_vector(code_content)

        # Strategy 3: Import/dependency features
        dependency_vector = self._dependency_vector(code_content)

        # Ensure all vectors have same dimension by padding to 32 dimensions
        target_dim = 32

        # Pad vectors to same dimension
        content_vector = np.pad(content_vector, (0, target_dim - len(content_vector)), 'constant')
        structure_vector = np.pad(structure_vector, (0, target_dim - len(structure_vector)), 'constant')
        dependency_vector = np.pad(dependency_vector, (0, target_dim - len(dependency_vector)), 'constant')

        # Combine strategies (weighted average)
        final_vector = (
            content_vector * 0.5 +
            structure_vector * 0.3 +
            dependency_vector * 0.2
        )

        # Normalize to unit vector
        norm = np.linalg.norm(final_vector)
        if norm > 0:
            final_vector = final_vector / norm

        return final_vector

    def _content_vector(self, code: str) -> np.array:
        """Create vector based on code content"""
        try:
            # Simple TF-IDF for demo (in production use proper code embeddings)
            tokens = self._tokenize_code(code)
            if not tokens:
                return np.zeros(32)

            # Create basic vector from token frequencies
            token_counts = {}
            for token in tokens:
                token_counts[token] = token_counts.get(token, 0) + 1

            # Convert to vector (first 32 unique tokens)
            vector = np.zeros(32)
            for i, (token, count) in enumerate(list(token_counts.items())[:32]):
                vector[i] = count

            return vector

        except:
            return np.zeros(32)

    def _structure_vector(self, code: str) -> np.array:
        """Create vector based on code structure"""
        features = {
            'lines_of_code': len(code.split('\n')),
            'functions': code.count('def '),
            'classes': code.count('class '),
            'imports': code.count('import '),
            'loops': code.count('for ') + code.count('while '),
            'conditionals': code.count('if ') + code.count('else'),
            'comments': code.count('#'),
            'docstrings': code.count('"""'),
            'decorators': code.count('@'),
            'async_functions': code.count('async def')
        }

        # Normalize features
        max_values = {
            'lines_of_code': 1000,
            'functions': 50,
            'classes': 20,
            'imports': 30,
            'loops': 50,
            'conditionals': 100,
            'comments': 100,
            'docstrings': 20,
            'decorators': 10,
            'async_functions': 20
        }

        vector = np.zeros(10)
        for i, (feature, value) in enumerate(features.items()):
            vector[i] = min(1.0, value / max_values[feature])

        return vector

    def _dependency_vector(self, code: str) -> np.array:
        """Create vector based on imports and dependencies"""
        imports = self._extract_imports(code)
        dependency_vector = np.zeros(20)

        # Common dependency categories
        categories = {
            'standard_library': ['os', 'sys', 'json', 'time', 'datetime', 're', 'math'],
            'data_science': ['numpy', 'pandas', 'scikit', 'tensorflow', 'torch'],
            'web': ['flask', 'django', 'requests', 'fastapi'],
            'database': ['sqlite3', 'sqlalchemy', 'psycopg2', 'pymongo'],
            'async': ['asyncio', 'aiohttp', 'trio'],
            'testing': ['pytest', 'unittest', 'mock'],
            'typing': ['typing', 'pydantic'],
            'concurrency': ['threading', 'multiprocessing']
        }

        for i, (category, packages) in enumerate(categories.items()):
            for package in packages:
                if any(package in imp for imp in imports):
                    dependency_vector[i] = 1.0
                    break

        return dependency_vector

    def _tokenize_code(self, code: str) -> List[str]:
        """Simple code tokenization"""
        # Remove comments and strings for basic tokenization
        lines = code.split('\n')
        clean_lines = []

        for line in lines:
            # Remove comments
            line = line.split('#')[0]
            # Remove strings (simple approach)
            line = line.replace('"', '').replace("'", '')
            clean_lines.append(line)

        clean_code = ' '.join(clean_lines)

        # Basic tokenization
        tokens = []
        for token in clean_code.split():
            # Remove special characters
            token = ''.join(c for c in token if c.isalnum() or c == '_')
            if token and len(token) > 2:  # Min length
                tokens.append(token.lower())

        return tokens

    def _extract_imports(self, code: str) -> List[str]:
        """Extract import statements"""
        imports = []
        for line in code.split('\n'):
            line = line.strip()
            if line.startswith(('import ', 'from ', '# import ', '# from ')):
                # Extract module name
                if line.startswith(('import ', '# import ')):
                    parts = line.split()
                    if len(parts) > 1:
                        imports.append(parts[1].split('.')[0])
                elif line.startswith(('from ', '# from ')):
                    parts = line.split()
                    if len(parts) > 1:
                        imports.append(parts[1].split('.')[0])
        return imports

def create_hyper_graph_node(file_path: str, content: str, vectorizer: CodeVectorizer) -> Dict[str, Any]:
    """
    Create a hyper-graph node dictionary for instant assimilation

    Args:
        file_path: Path to the file
        content: File content
        vectorizer: CodeVectorizer instance

    Returns:
        Dictionary representing the hyper-graph node
    """
    # Create vector embedding
    vector = vectorizer.create_vector(content)

    # Generate node ID based on file path
    node_id = str(uuid.uuid5(uuid.NAMESPACE_DNS, file_path))

    # Extract file name
    file_name = os.path.basename(file_path)

    # Create node dictionary
    node = {
        'id': node_id,
        'name': file_name,
        'content': content,
        'vector': vector.tolist(),
        'file_path': file_path,
        'metadata': {
            'original_path': file_path,
            'size': len(content),
            'lines': len(content.split('\n')),
            'extension': file_name.split('.')[-1] if '.' in file_name else 'unknown',
            'created_at': datetime.now().isoformat(),
            'updated_at': datetime.now().isoformat()
        },
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }

    return node

def test_code_vectorizer():
    """Test the code vectorizer"""
    print("🧪 Testing Code Vectorizer")
    print("=" * 30)

    # Test with sample code
    sample_code = """
import os
import numpy as np

class TestClass:
    def __init__(self):
        self.value = 42

    def calculate(self, x):
        return x * self.value

def main():
    test = TestClass()
    result = test.calculate(10)
    print(f"Result: {result}")
    return result
"""

    vectorizer = CodeVectorizer()
    vector = vectorizer.create_vector(sample_code)

    print(f"✅ Vector created with {len(vector)} dimensions")
    print(f"📊 Vector sample: {vector[:5]}")
    print(f"🎯 Vector norm: {np.linalg.norm(vector):.6f}")

    # Test node creation
    node = create_hyper_graph_node("test_module.py", sample_code, vectorizer)
    print(f"✅ Node created: {node['name']}")
    print(f"📊 Node ID: {node['id']}")
    print(f"📄 File path: {node['file_path']}")
    print(f"📈 Metadata: {len(node['metadata'])} fields")

    print("\n✅ Code Vectorizer test complete!")

if __name__ == "__main__":
    test_code_vectorizer()
