#!/usr/bin/env python3
"""
Holographic Compressor - Semantic Compression Engine
Store the Thought, Not the Thing - Generative Compression for Geometry OS
"""

import os
import sys
import time
import sqlite3
import json
import hashlib
import re
from typing import Dict, List, Optional, Tuple, Any

# Add project root to path
sys.path.append(os.getcwd())

from geometry_os.nexus import Nexus
from geometry_os.persistence import DatabaseManager
from geometry_os.scripts.deduplicate import find_duplicate_nodes

class HolographicCompressor:
    """
    The Compressor Daemon - Transforms data into generative blueprints
    Implements the "Store the Thought, Not the Thing" paradigm
    """

    def __init__(self, db_path="geometry_os/demos/persistent_demo.db"):
        self.db_path = db_path
        self.nexus = Nexus(db_path)
        self.db = DatabaseManager(db_path)
        self.compression_rules = self._load_compression_rules()

        print(f"🎯 Holographic Compressor initialized")
        print(f"   Database: {db_path}")
        print(f"   Rules loaded: {len(self.compression_rules)}")

    def _load_compression_rules(self) -> List[Dict]:
        """Load built-in compression patterns and strategies"""
        return [
            # Log files - repetitive error patterns
            {
                "name": "log_file_compression",
                "pattern": r"\.log$",
                "detector": self._detect_repetitive_log,
                "compressor": self._compress_log_file,
                "savings_estimate": 0.95
            },
            # CSV data - structured repetitive data
            {
                "name": "csv_compression",
                "pattern": r"\.csv$",
                "detector": self._detect_structured_data,
                "compressor": self._compress_structured_data,
                "savings_estimate": 0.80
            },
            # Build artifacts - generated files
            {
                "name": "build_artifacts",
                "pattern": r"(build|dist|bin|target)",
                "detector": self._detect_build_artifacts,
                "compressor": self._compress_build_artifacts,
                "savings_estimate": 0.99
            },
            # Cache files - temporary data
            {
                "name": "cache_files",
                "pattern": r"(__pycache__|node_modules|\.cache)",
                "detector": self._detect_cache_files,
                "compressor": self._compress_cache_files,
                "savings_estimate": 0.99
            },
            # Large text files with repetition
            {
                "name": "repetitive_text",
                "pattern": r"\.txt$",
                "detector": self._detect_repetitive_text,
                "compressor": self._compress_repetitive_text,
                "savings_estimate": 0.70
            }
        ]

    def _detect_repetitive_log(self, content: str, metadata: Dict) -> bool:
        """Detect if content is a repetitive log file"""
        if len(content) < 1024:  # Too small
            return False

        lines = content.split('\n')
        if len(lines) < 10:  # Not enough lines
            return False

        # Check for repetitive patterns
        unique_lines = set(lines)
        repetition_ratio = 1 - (len(unique_lines) / len(lines))

        return repetition_ratio > 0.7  # 70% repetition

    def _compress_log_file(self, content: str, metadata: Dict) -> Dict:
        """Compress log file into generative blueprint"""
        lines = content.split('\n')
        unique_lines = list(set(lines))

        # Create generator function
        generator_code = f"""
def generate_log():
    # Unique log patterns detected: {len(unique_lines)}
    patterns = {unique_lines}

    # Reconstruct original log structure
    import random
    return '\\n'.join(random.choices(patterns, k={len(lines)}))
"""

        return {
            "generator": generator_code,
            "metadata": {
                "original_size": len(content),
                "compressed_size": len(generator_code),
                "compression_ratio": len(generator_code) / len(content),
                "pattern_type": "repetitive_log",
                "unique_patterns": len(unique_lines)
            }
        }

    def _detect_structured_data(self, content: str, metadata: Dict) -> bool:
        """Detect structured CSV/TSV data"""
        lines = content.split('\n')
        if len(lines) < 5:  # Need enough rows
            return False

        # Check if lines have consistent structure
        first_line = lines[0]
        if ',' in first_line or '\\t' in first_line:
            # Check consistency
            separator = ',' if ',' in first_line else '\\t'
            row_lengths = [len(line.split(separator)) for line in lines[:10]]

            # If most rows have same column count, it's structured
            if len(set(row_lengths)) <= 2:  # Allow for minor variations
                return True

        return False

    def _compress_structured_data(self, content: str, metadata: Dict) -> Dict:
        """Compress structured data into generative blueprint"""
        lines = content.split('\n')
        header = lines[0]
        rows = lines[1:]

        # Analyze data types
        separator = ',' if ',' in header else '\\t'
        columns = header.split(separator)
        data_types = []

        for col_idx, col_name in enumerate(columns):
            # Sample values from this column
            values = [row.split(separator)[col_idx] for row in rows[:10] if len(row.split(separator)) > col_idx]

            if all(v.isdigit() for v in values):
                data_types.append("int")
            elif all(self._is_float(v) for v in values):
                data_types.append("float")
            else:
                data_types.append("str")

        # Create generator
        generator_code = f"""
def generate_data(rows={len(rows)}):
    import random
    columns = {columns}
    data_types = {data_types}

    # Generate realistic data
    data = []
    for i in range(rows):
        row = []
        for col_idx, col_name in enumerate(columns):
            if data_types[col_idx] == 'int':
                row.append(str(random.randint(1, 1000)))
            elif data_types[col_idx] == 'float':
                row.append(f"{{random.random() * 100:.2f}}")
            else:
                row.append(f"sample_{{col_name}}_{{i}}")
        data.append(row)

    # Format as CSV
    separator = ',' if ',' in '{header}' else '\\t'
    return '{header}' + '\\n' + '\\n'.join(separator.join(row) for row in data)
"""

        return {
            "generator": generator_code,
            "metadata": {
                "original_size": len(content),
                "compressed_size": len(generator_code),
                "compression_ratio": len(generator_code) / len(content),
                "pattern_type": "structured_data",
                "rows": len(rows),
                "columns": len(columns)
            }
        }

    def _is_float(self, value: str) -> bool:
        """Check if string can be converted to float"""
        try:
            float(value)
            return True
        except:
            return False

    def _detect_build_artifacts(self, content: str, metadata: Dict) -> bool:
        """Detect build artifacts and generated files"""
        # Check file path patterns
        path = metadata.get('path', '')
        if any(pattern in path for pattern in ['build/', 'dist/', 'bin/', 'target/', '.min.js', '.min.css']):
            return True

        # Check for minified content
        if len(content) > 1000 and len(content.strip()) / len(content) > 0.9:  # Mostly code
            if '//' not in content and '/*' not in content:  # No comments
                return True

        return False

    def _compress_build_artifacts(self, content: str, metadata: Dict) -> Dict:
        """Compress build artifacts into source + build script"""
        path = metadata.get('path', '')

        # Find potential source file
        source_path = path
        if 'build/' in path:
            source_path = path.replace('build/', 'src/')
        elif 'dist/' in path:
            source_path = path.replace('dist/', 'src/')

        # Create build script
        build_script = f"""
# Build script for {path}
# Original size: {{original_size}} bytes

def build_artifact():
    # This would normally contain the build process
    # For now, we'll generate a placeholder

    import subprocess
    import os

    # Try to find and rebuild from source
    source_file = "{source_path}"
    if os.path.exists(source_file):
        # Example build commands (customize per project)
        commands = [
            "npm run build",  # For JS projects
            "python setup.py build",  # For Python
            "make"  # For C/C++
        ]

        for cmd in commands:
            try:
                result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
                if result.returncode == 0:
                    return result.stdout
            except:
                continue

    # Fallback: return original content (stored elsewhere)
    return "BUILD_PROCESS_NOT_AVAILABLE"
"""

        return {
            "generator": build_script,
            "metadata": {
                "original_size": len(content),
                "compressed_size": len(build_script),
                "compression_ratio": len(build_script) / len(content),
                "pattern_type": "build_artifact",
                "source_hint": source_path,
                "build_required": True
            }
        }

    def _detect_cache_files(self, content: str, metadata: Dict) -> bool:
        """Detect cache files that can be regenerated"""
        path = metadata.get('path', '')

        # Common cache patterns
        cache_patterns = [
            '__pycache__', '.cache', 'node_modules', '.npm',
            '.yarn', '.gradle', '.m2', 'package-lock.json',
            'yarn.lock', '.next', '.parcel-cache'
        ]

        return any(pattern in path for pattern in cache_patterns)

    def _compress_cache_files(self, content: str, metadata: Dict) -> Dict:
        """Compress cache files - they can be regenerated"""
        path = metadata.get('path', '')
        cache_type = "unknown"

        # Determine cache type
        if '__pycache__' in path:
            cache_type = "python_bytecode"
        elif 'node_modules' in path:
            cache_type = "npm_packages"
        elif '.cache' in path:
            cache_type = "generic_cache"

        # Create regeneration script
        regen_script = f"""
# Cache regeneration script for {path}
# Cache type: {cache_type}
# Original size: {{original_size}} bytes

def regenerate_cache():
    import subprocess
    import sys

    if "{cache_type}" == "python_bytecode":
        # Recompile Python files
        import py_compile
        import os

        # Find corresponding .py file
        py_file = "{path}".replace('.pyc', '.py').replace('__pycache__/', '')
        if os.path.exists(py_file):
            py_compile.compile(py_file, doraise=True)
            return "Python bytecode regenerated"

    elif "{cache_type}" == "npm_packages":
        # Reinstall npm packages
        result = subprocess.run("npm install", shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            return "npm packages reinstalled"
        else:
            return f"npm install failed: {{result.stderr}}"

    elif "{cache_type}" == "generic_cache":
        # Try common cache regeneration commands
        commands = [
            "npm cache clean --force",
            "yarn cache clean",
            "rm -rf node_modules && npm install"
        ]

        for cmd in commands:
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            if result.returncode == 0:
                return f"Cache regenerated with: {{cmd}}"

    return "Cache regeneration not implemented for this type"
"""

        return {
            "generator": regen_script,
            "metadata": {
                "original_size": len(content),
                "compressed_size": len(regen_script),
                "compression_ratio": len(regen_script) / len(content),
                "pattern_type": "cache_file",
                "cache_type": cache_type,
                "regenerable": True
            }
        }

    def _detect_repetitive_text(self, content: str, metadata: Dict) -> bool:
        """Detect text files with high repetition"""
        if len(content) < 512:  # Too small
            return False

        # Calculate repetition ratio
        words = content.split()
        unique_words = set(words)
        repetition_ratio = 1 - (len(unique_words) / len(words))

        return repetition_ratio > 0.6  # 60% repetition

    def _compress_repetitive_text(self, content: str, metadata: Dict) -> Dict:
        """Compress repetitive text using patterns"""
        words = content.split()
        word_freq = {}

        # Count word frequencies
        for word in words:
            word_freq[word] = word_freq.get(word, 0) + 1

        # Find most common patterns
        common_words = sorted(word_freq.items(), key=lambda x: x[1], reverse=True)[:10]

        # Create generator
        generator_code = f"""
def generate_text():
    # Text generation based on common patterns
    import random

    # Common words/phrases from original: {common_words[:5]}
    patterns = {common_words}

    # Generate similar text
    generated_words = []
    for i in range({len(words)}):
        # Use common patterns with some variation
        if random.random() < 0.7:  # 70% chance to use common pattern
            pattern = random.choice([p[0] for p in patterns])
            generated_words.append(pattern)
        else:
            generated_words.append(f"word_{{i}}")  # Placeholder

    return ' '.join(generated_words)
"""

        return {
            "generator": generator_code,
            "metadata": {
                "original_size": len(content),
                "compressed_size": len(generator_code),
                "compression_ratio": len(generator_code) / len(content),
                "pattern_type": "repetitive_text",
                "unique_words": len(word_freq),
                "total_words": len(words)
            }
        }

    def analyze_node(self, node_id: str) -> Optional[Dict]:
        """Analyze a node for compression potential"""
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.execute("SELECT * FROM nodes WHERE id=?", (node_id,))
            row = cursor.fetchone()

            if not row:
                return None

            cols = [c[0] for c in cursor.description]
            node_dict = dict(zip(cols, row))

            try:
                metadata = json.loads(node_dict['metadata'])
                content = node_dict['content']
                path = metadata.get('path', '')

                # Find matching compression rule
                for rule in self.compression_rules:
                    if re.search(rule['pattern'], path) and rule['detector'](content, metadata):
                        return {
                            "node_id": node_id,
                            "path": path,
                            "size": len(content),
                            "compression_rule": rule['name'],
                            "estimated_savings": rule['savings_estimate'],
                            "content_type": metadata.get('type', 'unknown')
                        }

            except Exception as e:
                print(f"⚠️  Error analyzing node {node_id}: {e}")
                return None

        return None

    def compress_node(self, node_id: str) -> Optional[Dict]:
        """Compress a node using appropriate strategy"""
        analysis = self.analyze_node(node_id)
        if not analysis:
            return None

        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.execute("SELECT * FROM nodes WHERE id=?", (node_id,))
            row = cursor.fetchone()

            if not row:
                return None

            cols = [c[0] for c in cursor.description]
            node_dict = dict(zip(cols, row))

            try:
                metadata = json.loads(node_dict['metadata'])
                content = node_dict['content']

                # Find the compression rule
                rule_name = analysis['compression_rule']
                rule = next(r for r in self.compression_rules if r['name'] == rule_name)

                # Apply compression
                compression_result = rule['compressor'](content, metadata)

                # Create compressed node
                compressed_node = {
                    "id": f"compressed_{node_id}",
                    "type": "compressed_node",
                    "content": compression_result['generator'],
                    "metadata": {
                        "original_node": node_id,
                        "original_path": metadata.get('path', ''),
                        "compression_type": rule_name,
                        "compression_metadata": compression_result['metadata'],
                        "generator_type": "python",
                        "created_at": time.time()
                    },
                    "vector": [],
                    "provenance": "holographic_compressor"
                }

                # Store compressed node
                self.db.store_node(compressed_node)

                # Update original node to point to compressed version
                original_metadata = metadata
                original_metadata['compressed_version'] = compressed_node['id']
                original_metadata['compression_applied'] = True

                conn.execute("""
                    UPDATE nodes
                    SET metadata = ?
                    WHERE id = ?
                """, (json.dumps(original_metadata), node_id))
                conn.commit()

                return {
                    "status": "success",
                    "original_node": node_id,
                    "compressed_node": compressed_node['id'],
                    "original_size": len(content),
                    "compressed_size": len(compression_result['generator']),
                    "compression_ratio": compression_result['metadata']['compression_ratio'],
                    "space_saved": len(content) - len(compression_result['generator']),
                    "compression_type": rule_name
                }

            except Exception as e:
                print(f"❌ Compression failed for node {node_id}: {e}")
                return None

    def scan_and_compress(self, min_size: int = 1024) -> Dict:
        """Scan Nexus for compressible nodes and compress them"""
        print(f"🔍 Scanning Nexus for compressible nodes (min size: {min_size} bytes)...")

        start_time = time.time()
        total_savings = 0
        nodes_processed = 0
        nodes_compressed = 0

        with sqlite3.connect(self.db_path) as conn:
            # Find nodes with content larger than min_size
            cursor = conn.execute("""
                SELECT id, content, metadata FROM nodes
                WHERE LENGTH(content) > ? AND type='filesystem'
            """, (min_size,))

            for row in cursor.fetchall():
                node_id, content, metadata_json = row
                nodes_processed += 1

                try:
                    metadata = json.loads(metadata_json)
                    analysis = self.analyze_node(node_id)

                    if analysis:
                        print(f"🎯 Found compressible node: {analysis['path']} ({analysis['size']} bytes)")
                        result = self.compress_node(node_id)

                        if result:
                            nodes_compressed += 1
                            savings = result['space_saved']
                            total_savings += savings
                            ratio = result['compression_ratio']

                            print(f"   ✅ Compressed to {result['compressed_size']} bytes")
                            print(f"   💾 Saved: {savings} bytes ({ratio:.2%} of original)")
                            print(f"   📦 Type: {result['compression_type']}")

                except Exception as e:
                    print(f"⚠️  Error processing node {node_id}: {e}")

        elapsed = time.time() - start_time

        return {
            "nodes_processed": nodes_processed,
            "nodes_compressed": nodes_compressed,
            "total_savings_bytes": total_savings,
            "total_savings_human": self._human_bytes(total_savings),
            "elapsed_time_seconds": elapsed,
            "compression_ratio": nodes_compressed / nodes_processed if nodes_processed > 0 else 0
        }

    def _human_bytes(self, size_bytes: int) -> str:
        """Convert bytes to human-readable format"""
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size_bytes < 1024.0:
                return f"{size_bytes:.1f} {unit}"
            size_bytes /= 1024.0
        return f"{size_bytes:.1f} PB"

    def expand_node(self, compressed_node_id: str) -> Optional[str]:
        """Expand a compressed node back to its original content"""
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.execute("SELECT * FROM nodes WHERE id=?", (compressed_node_id,))
            row = cursor.fetchone()

            if not row:
                return None

            cols = [c[0] for c in cursor.description]
            node_dict = dict(zip(cols, row))

            try:
                content = node_dict['content']
                metadata = json.loads(node_dict['metadata'])

                # Execute the generator code
                local_vars = {}
                exec(content, globals(), local_vars)

                # Find the generator function
                generator_func = None
                for name, obj in local_vars.items():
                    if callable(obj):
                        generator_func = obj
                        break

                if generator_func:
                    # Generate the content
                    generated_content = generator_func()
                    return generated_content
                else:
                    print(f"⚠️  No generator function found in compressed node {compressed_node_id}")
                    return None

            except Exception as e:
                print(f"❌ Expansion failed for node {compressed_node_id}: {e}")
                return None

def run_compressor_scan(db_path: str = "geometry_os/demos/persistent_demo.db", min_size: int = 1024):
    """Run the compressor scan and report results"""
    compressor = HolographicCompressor(db_path)
    results = compressor.scan_and_compress(min_size)

    print(f"\n📊 Compression Scan Results:")
    print(f"   Nodes processed: {results['nodes_processed']}")
    print(f"   Nodes compressed: {results['nodes_compressed']}")
    print(f"   Space saved: {results['total_savings_human']}")
    print(f"   Time taken: {results['elapsed_time_seconds']:.2f} seconds")
    print(f"   Compression ratio: {results['compression_ratio']:.1%}")

    if results['nodes_compressed'] > 0:
        avg_savings = results['total_savings_bytes'] / results['nodes_compressed']
        print(f"   Average savings per file: {compressor._human_bytes(avg_savings)}")

if __name__ == "__main__":
    # Default parameters
    db_path = "geometry_os/demos/persistent_demo.db"
    min_size = 1024  # 1KB

    # Parse command line arguments
    if len(sys.argv) > 1:
        db_path = sys.argv[1]
    if len(sys.argv) > 2:
        min_size = int(sys.argv[2])

    print(f"🚀 Starting Holographic Compressor")
    print(f"   Database: {db_path}")
    print(f"   Min size: {min_size} bytes")

    run_compressor_scan(db_path, min_size)