#!/usr/bin/env python3
"""
Vector Blueprint Memory System
Advanced semantic blueprint storage and evolution system
Built on top of SimpleVectorStore for enhanced creative capabilities
"""

import numpy as np
import pickle
import time
import json
import hashlib
import zlib
from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass, asdict, field
import math
from datetime import datetime
from enum import IntEnum
import base64
import os

# Pattern types as semantic concepts
class PatternType(IntEnum):
    SOLID = 0          # "pure color", "uniform", "flat"
    GRADIENT = 1       # "transition", "blend", "fade"
    CHECKER = 2        # "grid", "alternating", "tile"
    FRACTAL = 3        # "complex", "detailed", "self-similar"
    NOISE = 4          # "random", "texture", "grain"
    ANIMATED = 5       # "moving", "dynamic", "changing"
    HYBRID = 6         # "mixed", "combined", "complex"
    EMERGENT = 7       # "generated", "learned", "evolved"

@dataclass
class VectorBlueprint:
    """A blueprint represented as a semantic vector point"""
    id: str
    vector: np.ndarray  # 128-dimensional semantic embedding
    rules: List[int]    # Original rule data
    pattern_type: PatternType
    name: str
    description: str
    tags: List[str]
    semantic_keywords: List[str]  # What this blueprint "means"
    created_at: float
    usage_count: int = 0
    quality_score: float = 0.5
    parent_ids: List[str] = field(default_factory=list)  # Lineage
    children_ids: List[str] = field(default_factory=list)  # Evolutions

    def to_dict(self):
        """Convert to dictionary for serialization"""
        data = asdict(self)
        data['vector'] = base64.b64encode(self.vector.tobytes()).decode('utf-8')
        data['pattern_type'] = self.pattern_type.value
        return data

    @classmethod
    def from_dict(cls, data: Dict):
        """Create from dictionary"""
        data = data.copy()
        vector_bytes = base64.b64decode(data['vector'])
        data['vector'] = np.frombuffer(vector_bytes, dtype=np.float32)
        data['pattern_type'] = PatternType(data['pattern_type'])
        return cls(**data)

class SemanticVectorizer:
    """Convert patterns and concepts to semantic vectors"""

    def __init__(self, embedding_dim: int = 128):
        self.embedding_dim = embedding_dim
        self.pattern_embeddings = self._init_pattern_embeddings()
        self.keyword_embeddings = self._init_keyword_embeddings()

    def _init_pattern_embeddings(self) -> Dict[int, np.ndarray]:
        """Initialize semantic embeddings for pattern types"""
        embeddings = {}
        for pattern_type in PatternType:
            # Create deterministic embedding for each pattern type
            seed = f"pattern_{pattern_type.name}_{pattern_type.value}"
            rng = np.random.RandomState(abs(hash(seed)) % (2**32))
            embeddings[pattern_type] = rng.randn(self.embedding_dim)
            embeddings[pattern_type] /= np.linalg.norm(embeddings[pattern_type])
        return embeddings

    def _init_keyword_embeddings(self) -> Dict[str, np.ndarray]:
        """Initialize semantic embeddings for keywords"""
        keywords = [
            # Colors
            "red", "green", "blue", "yellow", "purple", "cyan", "magenta", "white", "black",
            # Qualities
            "bright", "dark", "saturated", "pastel", "vibrant", "muted", "glowing", "shiny",
            # Patterns
            "smooth", "rough", "gradient", "striped", "dotted", "checkered", "swirl", "wave",
            # Emotions
            "calm", "energetic", "mysterious", "happy", "sad", "angry", "peaceful", "chaotic",
            # Complexity
            "simple", "complex", "detailed", "minimal", "intricate", "clean", "busy",
            # Movement
            "static", "dynamic", "flowing", "pulsing", "spinning", "vibrating",
        ]

        embeddings = {}
        for keyword in keywords:
            seed = f"keyword_{keyword}"
            rng = np.random.RandomState(abs(hash(seed)) % (2**32))
            embedding = rng.randn(self.embedding_dim)
            embedding /= np.linalg.norm(embedding)
            embeddings[keyword] = embedding

        return embeddings

    def rules_to_vector(self, rules: List[int], pattern_type: PatternType) -> np.ndarray:
        """Convert rule data to semantic vector"""
        vector = np.zeros(self.embedding_dim, dtype=np.float32)

        # Start with pattern type embedding
        vector += self.pattern_embeddings[pattern_type] * 0.5

        # Add rule-based features
        if rules:
            # Analyze color distribution
            if pattern_type == PatternType.SOLID and len(rules) >= 3:
                # RGB values
                r, g, b = rules[0], rules[1], rules[2]
                # Brightness
                brightness = (r + g + b) / (3 * 255)
                vector += self._get_keyword_vector("bright") * brightness

                # Color hue
                if r > g and r > b:
                    vector += self._get_keyword_vector("red") * 0.3
                elif g > r and g > b:
                    vector += self._get_keyword_vector("green") * 0.3
                elif b > r and b > g:
                    vector += self._get_keyword_vector("blue") * 0.3

            elif pattern_type == PatternType.GRADIENT and len(rules) >= 6:
                # Gradient features
                start_rgb = rules[:3]
                end_rgb = rules[3:6]

                # Color transition magnitude
                color_diff = np.array(end_rgb) - np.array(start_rgb)
                transition_mag = np.linalg.norm(color_diff) / (255 * np.sqrt(3))
                vector += self._get_keyword_vector("gradient") * transition_mag * 0.4

        # Add randomness for uniqueness
        unique_seed = f"unique_{hash(str(rules)) % 10000}"
        rng = np.random.RandomState(abs(hash(unique_seed)) % (2**32))
        vector += rng.randn(self.embedding_dim) * 0.1

        # Normalize
        norm = np.linalg.norm(vector)
        if norm > 0:
            vector /= norm

        return vector

    def text_to_vector(self, text: str) -> np.ndarray:
        """Convert text description to semantic vector"""
        vector = np.zeros(self.embedding_dim, dtype=np.float32)
        words = text.lower().split()

        for word in words:
            if word in self.keyword_embeddings:
                vector += self.keyword_embeddings[word]
            else:
                # Approximate unknown words
                for keyword, embedding in self.keyword_embeddings.items():
                    if keyword.startswith(word[:3]) or word.startswith(keyword[:3]):
                        vector += embedding * 0.3

        # Normalize
        norm = np.linalg.norm(vector)
        if norm > 0:
            vector /= norm

        return vector

    def _get_keyword_vector(self, keyword: str) -> np.ndarray:
        """Get embedding for a keyword, create if doesn't exist"""
        if keyword in self.keyword_embeddings:
            return self.keyword_embeddings[keyword]
        else:
            # Create new embedding for unknown keyword
            seed = f"new_keyword_{keyword}"
            rng = np.random.RandomState(abs(hash(seed)) % (2**32))
            embedding = rng.randn(self.embedding_dim)
            embedding /= np.linalg.norm(embedding)
            self.keyword_embeddings[keyword] = embedding
            return embedding

    def extract_keywords(self, vector: np.ndarray, top_k: int = 5) -> List[str]:
        """Extract most relevant keywords from a vector"""
        similarities = []
        for keyword, keyword_vec in self.keyword_embeddings.items():
            similarity = np.dot(vector, keyword_vec)
            similarities.append((similarity, keyword))

        similarities.sort(reverse=True)
        return [keyword for _, keyword in similarities[:top_k]]

class VectorBlueprintMemory:
    """Pure vector-native blueprint storage and retrieval"""

    def __init__(self, memory_file: str = "blueprint_memory.vec"):
        self.memory_file = memory_file
        self.vectorizer = SemanticVectorizer()
        self.blueprints: List[VectorBlueprint] = []
        self.vector_index: Dict[str, np.ndarray] = {}  # id -> vector
        self.semantic_clusters: Dict[str, List[str]] = {}  # cluster_name -> blueprint_ids

        self._load_memory()

    def _load_memory(self):
        """Load blueprints from memory file"""
        try:
            with open(self.memory_file, 'rb') as f:
                data = pickle.load(f)
                self.blueprints = [VectorBlueprint.from_dict(bp) for bp in data.get('blueprints', [])]
                self.semantic_clusters = data.get('clusters', {})

            # Rebuild vector index
            self.vector_index = {bp.id: bp.vector for bp in self.blueprints}
            print(f"📚 Loaded {len(self.blueprints)} blueprints from memory")

        except FileNotFoundError:
            print("🆕 Creating new blueprint memory")
            self._save_memory()

    def _save_memory(self):
        """Save blueprints to memory file"""
        data = {
            'blueprints': [bp.to_dict() for bp in self.blueprints],
            'clusters': self.semantic_clusters,
            'saved_at': time.time()
        }

        # Ensure directory exists
        dirname = os.path.dirname(self.memory_file)
        if dirname:
            os.makedirs(dirname, exist_ok=True)

        with open(self.memory_file, 'wb') as f:
            pickle.dump(data, f)

        print(f"💾 Saved {len(self.blueprints)} blueprints to memory")

    def _generate_id(self, vector: np.ndarray) -> str:
        """Generate unique ID from vector"""
        vector_hash = hashlib.md5(vector.tobytes()).hexdigest()[:12]
        timestamp = int(time.time() * 1000) % 1000000
        return f"bp_{vector_hash}_{timestamp}"

    def create_blueprint(self,
                        rules: List[int],
                        pattern_type: PatternType,
                        name: str = "",
                        description: str = "",
                        tags: List[str] = None,
                        parent_ids: List[str] = None) -> str:
        """Create and store a new blueprint"""

        # Create semantic vector
        vector = self.vectorizer.rules_to_vector(rules, pattern_type)

        # Extract semantic keywords
        semantic_keywords = self.vectorizer.extract_keywords(vector)

        # Generate ID
        blueprint_id = self._generate_id(vector)

        # Create blueprint object
        blueprint = VectorBlueprint(
            id=blueprint_id,
            vector=vector,
            rules=rules,
            pattern_type=pattern_type,
            name=name or f"Blueprint_{blueprint_id[:8]}",
            description=description or f"Semantic pattern: {', '.join(semantic_keywords[:3])}",
            tags=tags or [],
            semantic_keywords=semantic_keywords,
            created_at=time.time(),
            parent_ids=parent_ids or [],
            children_ids=[]
        )

        # Store
        self.blueprints.append(blueprint)
        self.vector_index[blueprint_id] = vector

        # Update parents
        for parent_id in parent_ids or []:
            self._add_child_to_parent(parent_id, blueprint_id)

        # Auto-cluster
        self._auto_cluster_blueprint(blueprint_id)

        # Save
        self._save_memory()

        print(f"🎨 Created blueprint {blueprint_id}: {name}")
        print(f"   Keywords: {', '.join(semantic_keywords[:5])}")

        return blueprint_id

    def _add_child_to_parent(self, parent_id: str, child_id: str):
        """Add child reference to parent blueprint"""
        for bp in self.blueprints:
            if bp.id == parent_id:
                if child_id not in bp.children_ids:
                    bp.children_ids.append(child_id)
                break

    def _auto_cluster_blueprint(self, blueprint_id: str):
        """Automatically assign blueprint to semantic clusters"""
        blueprint = self.get_blueprint(blueprint_id)
        if not blueprint:
            return

        # Find similar existing clusters
        for cluster_name, cluster_bp_ids in self.semantic_clusters.items():
            if not cluster_bp_ids:
                continue

            # Check similarity to cluster representative
            rep_id = cluster_bp_ids[0]
            rep_bp = self.get_blueprint(rep_id)
            if rep_bp and self.cosine_similarity(blueprint.vector, rep_bp.vector) > 0.7:
                if blueprint_id not in cluster_bp_ids:
                    cluster_bp_ids.append(blueprint_id)
                return

        # Create new cluster based on primary keyword
        if blueprint.semantic_keywords:
            primary_keyword = blueprint.semantic_keywords[0]
            cluster_name = f"cluster_{primary_keyword}"

            if cluster_name not in self.semantic_clusters:
                self.semantic_clusters[cluster_name] = []

            if blueprint_id not in self.semantic_clusters[cluster_name]:
                self.semantic_clusters[cluster_name].append(blueprint_id)

    def get_blueprint(self, blueprint_id: str) -> Optional[VectorBlueprint]:
        """Get blueprint by ID"""
        for bp in self.blueprints:
            if bp.id == blueprint_id:
                return bp
        return None

    def semantic_search(self,
                       query: Any = None,  # Can be vector, text, rules, or blueprint_id
                       query_type: str = "text",  # "text", "rules", "vector", "blueprint"
                       pattern_type: Optional[PatternType] = None,
                       min_similarity: float = 0.3,
                       limit: int = 10) -> List[Tuple[float, VectorBlueprint]]:
        """Search blueprints by semantic similarity"""

        # Convert query to vector
        query_vector = self._query_to_vector(query, query_type)
        if query_vector is None:
            return []

        # Calculate similarities
        similarities = []
        for bp in self.blueprints:
            # Filter by pattern type if specified
            if pattern_type is not None and bp.pattern_type != pattern_type:
                continue

            similarity = self.cosine_similarity(query_vector, bp.vector)
            if similarity >= min_similarity:
                similarities.append((similarity, bp))

        # Sort by similarity
        similarities.sort(key=lambda x: x[0], reverse=True)

        return similarities[:limit]

    def _query_to_vector(self, query: Any, query_type: str) -> Optional[np.ndarray]:
        """Convert various query types to vector"""
        if query_type == "vector":
            if isinstance(query, np.ndarray):
                return query
            return None

        elif query_type == "text":
            if isinstance(query, str):
                return self.vectorizer.text_to_vector(query)
            return None

        elif query_type == "rules":
            if isinstance(query, (list, tuple)) and len(query) > 0:
                # Default to SOLID pattern for rule queries
                return self.vectorizer.rules_to_vector(query, PatternType.SOLID)
            return None

        elif query_type == "blueprint":
            if isinstance(query, str):
                bp = self.get_blueprint(query)
                return bp.vector if bp else None
            return None

        return None

    def cosine_similarity(self, a: np.ndarray, b: np.ndarray) -> float:
        """Calculate cosine similarity between vectors"""
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)

        if norm_a == 0 or norm_b == 0:
            return 0.0

        similarity = np.dot(a, b) / (norm_a * norm_b)
        # Clip to avoid floating point errors
        return float(np.clip(similarity, -1.0, 1.0))

    def evolve_blueprint(self,
                        blueprint_id: str,
                        generations: int = 3,
                        mutation_strength: float = 0.2,
                        exploration: float = 0.3) -> List[str]:
        """Evolve blueprint through vector space exploration"""

        base_bp = self.get_blueprint(blueprint_id)
        if not base_bp:
            return []

        evolved_ids = []
        current_vector = base_bp.vector.copy()

        for gen in range(generations):
            # Blend of mutation and exploration
            mutation = np.random.randn(*current_vector.shape) * mutation_strength

            if exploration > 0:
                # Explore towards interesting directions
                interesting_directions = self._find_interesting_directions(current_vector)
                if interesting_directions is not None:
                    exploration_dir = interesting_directions / np.linalg.norm(interesting_directions)
                    mutation += exploration_dir * exploration

            # Apply mutation
            candidate_vector = current_vector + mutation
            candidate_vector /= np.linalg.norm(candidate_vector)

            # Check if similar blueprint already exists
            similar = self.semantic_search(
                query=candidate_vector,
                query_type="vector",
                min_similarity=0.9,
                limit=1
            )

            if similar and similar[0][0] > 0.95:
                # Use existing similar blueprint
                evolved_bp = similar[0][1]
                evolved_ids.append(evolved_bp.id)
                current_vector = evolved_bp.vector
            else:
                # Create new evolved blueprint
                # Convert vector back to rules (simplified)
                evolved_rules = self._vector_to_rules(candidate_vector, base_bp.pattern_type)

                evolved_id = self.create_blueprint(
                    rules=evolved_rules,
                    pattern_type=base_bp.pattern_type,
                    name=f"Evolved_{gen+1}_{base_bp.name}",
                    description=f"Generation {gen+1} evolution of {blueprint_id}",
                    tags=["evolved", f"gen_{gen+1}"],
                    parent_ids=[blueprint_id] + (evolved_ids[-1:] if evolved_ids else [])
                )

                evolved_ids.append(evolved_id)
                current_vector = candidate_vector

        return evolved_ids

    def _find_interesting_directions(self, vector: np.ndarray) -> Optional[np.ndarray]:
        """Find interesting exploration directions in vector space"""
        # Look for directions that maximize diversity
        directions = []

        # Direction towards unexplored areas (far from existing blueprints)
        for bp in self.blueprints:
            direction = vector - bp.vector
            if np.linalg.norm(direction) > 0.5:  # Only consider significantly different
                directions.append(direction)

        if not directions:
            return None

        # Average of diverse directions
        interesting_dir = np.mean(directions, axis=0)
        norm = np.linalg.norm(interesting_dir)

        if norm > 0:
            return interesting_dir / norm

        return None

    def _vector_to_rules(self, vector: np.ndarray, pattern_type: PatternType) -> List[int]:
        """Convert vector back to simplified rule data"""
        # This is a simplified conversion - in practice would use a trained model
        rules = []

        if pattern_type == PatternType.SOLID:
            # Generate RGB values from vector components
            r = int((vector[0] + 1) * 127.5) % 256
            g = int((vector[1] + 1) * 127.5) % 256
            b = int((vector[2] + 1) * 127.5) % 256
            rules = [r, g, b]

        elif pattern_type == PatternType.GRADIENT:
            # Generate start and end colors
            for i in range(6):
                val = int((vector[i] + 1) * 127.5) % 256
                rules.append(val)

        elif pattern_type == PatternType.FRACTAL:
            # Generate fractal parameters
            rules = [
                int(abs(vector[0]) * 100) % 256,
                int(abs(vector[1]) * 100) % 256,
            ]

        else:
            # Default: use first few vector components
            rules = [int(abs(v) * 255) % 256 for v in vector[:8]]

        return rules

    def combine_blueprints(self,
                          blueprint_id1: str,
                          blueprint_id2: str,
                          blend_ratio: float = 0.5) -> str:
        """Combine two blueprints through vector interpolation"""

        bp1 = self.get_blueprint(blueprint_id1)
        bp2 = self.get_blueprint(blueprint_id2)

        if not bp1 or not bp2:
            raise ValueError("Blueprint not found")

        # Interpolate vectors
        blended_vector = bp1.vector * blend_ratio + bp2.vector * (1 - blend_ratio)
        blended_vector /= np.linalg.norm(blended_vector)

        # Check if similar blueprint exists
        similar = self.semantic_search(
            query=blended_vector,
            query_type="vector",
            min_similarity=0.95,
            limit=1
        )

        if similar and similar[0][0] > 0.97:
            return similar[0][1].id

        # Determine pattern type
        if blend_ratio > 0.7:
            pattern_type = bp1.pattern_type
        elif blend_ratio < 0.3:
            pattern_type = bp2.pattern_type
        else:
            pattern_type = PatternType.HYBRID

        # Convert to rules
        blended_rules = self._vector_to_rules(blended_vector, pattern_type)

        # Create new blueprint
        blended_id = self.create_blueprint(
            rules=blended_rules,
            pattern_type=pattern_type,
            name=f"Blend_{bp1.name}_{bp2.name}",
            description=f"Blend of {blueprint_id1} and {blueprint_id2}",
            tags=["blended", "hybrid"],
            parent_ids=[blueprint_id1, blueprint_id2]
        )

        return blended_id

    def creative_exploration(self,
                           seed_vector: Optional[np.ndarray] = None,
                           steps: int = 20,
                           step_size: float = 0.3) -> List[str]:
        """Explore the creative vector space through random walks"""

        if seed_vector is None:
            # Start from a random point
            seed_vector = np.random.randn(self.vectorizer.embedding_dim)
            seed_vector /= np.linalg.norm(seed_vector)

        exploration_ids = []
        current_vector = seed_vector.copy()

        for step in range(steps):
            # Random direction
            direction = np.random.randn(*current_vector.shape)
            direction /= np.linalg.norm(direction)

            # Step in that direction
            candidate_vector = current_vector + direction * step_size
            candidate_vector /= np.linalg.norm(candidate_vector)

            # Find or create blueprint
            similar = self.semantic_search(
                query=candidate_vector,
                query_type="vector",
                min_similarity=0.85,
                limit=1
            )

            if similar and similar[0][0] > 0.9:
                exploration_id = similar[0][1].id
            else:
                # Create exploration blueprint
                exploration_rules = self._vector_to_rules(candidate_vector, PatternType.EMERGENT)
                exploration_id = self.create_blueprint(
                    rules=exploration_rules,
                    pattern_type=PatternType.EMERGENT,
                    name=f"Exploration_{step+1}",
                    description=f"Creative exploration step {step+1}",
                    tags=["exploration", "creative", f"step_{step+1}"]
                )

            exploration_ids.append(exploration_id)
            current_vector = candidate_vector

        return exploration_ids

    def get_lineage(self, blueprint_id: str, depth: int = 3) -> Dict[str, Any]:
        """Get evolutionary lineage of a blueprint"""
        bp = self.get_blueprint(blueprint_id)
        if not bp:
            return {}

        lineage = {
            "current": bp.id,
            "parents": [],
            "children": [],
            "ancestors": [],
            "descendants": []
        }

        # Get parents recursively
        def get_parents(bp_id: str, current_depth: int):
            if current_depth >= depth:
                return []

            bp_obj = self.get_blueprint(bp_id)
            if not bp_obj or not bp_obj.parent_ids:
                return []

            parents = []
            for parent_id in bp_obj.parent_ids:
                parent_bp = self.get_blueprint(parent_id)
                if parent_bp:
                    parents.append({
                        "id": parent_id,
                        "name": parent_bp.name,
                        "children": get_children(parent_id, current_depth + 1)
                    })

            return parents

        # Get children recursively
        def get_children(bp_id: str, current_depth: int):
            if current_depth >= depth:
                return []

            bp_obj = self.get_blueprint(bp_id)
            if not bp_obj or not bp_obj.children_ids:
                return []

            children = []
            for child_id in bp_obj.children_ids:
                child_bp = self.get_blueprint(child_id)
                if child_bp:
                    children.append({
                        "id": child_id,
                        "name": child_bp.name,
                        "parents": get_parents(child_id, current_depth + 1)
                    })

            return children

        lineage["parents"] = get_parents(blueprint_id, 0)
        lineage["children"] = get_children(blueprint_id, 0)

        return lineage

    def get_statistics(self) -> Dict[str, Any]:
        """Get memory statistics"""
        stats = {
            "total_blueprints": len(self.blueprints),
            "by_pattern_type": {},
            "avg_quality_score": 0,
            "oldest_blueprint": None,
            "newest_blueprint": None,
            "semantic_clusters": len(self.semantic_clusters),
            "avg_lineage_depth": 0
        }

        # Pattern type distribution
        for pattern_type in PatternType:
            count = sum(1 for bp in self.blueprints if bp.pattern_type == pattern_type)
            if count > 0:
                stats["by_pattern_type"][pattern_type.name] = count

        # Quality scores
        if self.blueprints:
            stats["avg_quality_score"] = sum(bp.quality_score for bp in self.blueprints) / len(self.blueprints)

            # Oldest and newest
            oldest = min(self.blueprints, key=lambda bp: bp.created_at)
            newest = max(self.blueprints, key=lambda bp: bp.created_at)
            stats["oldest_blueprint"] = oldest.name
            stats["newest_blueprint"] = newest.name

            # Average lineage depth
            total_depth = 0
            for bp in self.blueprints:
                depth = len(bp.parent_ids)
                total_depth += depth
            stats["avg_lineage_depth"] = total_depth / len(self.blueprints)

        return stats

    def export_memory(self, filepath: str):
        """Export memory to human-readable format"""
        export_data = {
            "export_date": datetime.now().isoformat(),
            "blueprint_count": len(self.blueprints),
            "vectorizer_dimension": self.vectorizer.embedding_dim,
            "blueprints": [],
            "clusters": self.semantic_clusters,
            "statistics": self.get_statistics()
        }

        for bp in self.blueprints:
            bp_dict = bp.to_dict()
            # Add human-readable info
            bp_dict["pattern_type_name"] = bp.pattern_type.name
            bp_dict["created_at_human"] = datetime.fromtimestamp(bp.created_at).isoformat()
            bp_dict["compression_ratio"] = self._calculate_compression(bp.rules)
            export_data["blueprints"].append(bp_dict)

        with open(filepath, 'w') as f:
            json.dump(export_data, f, indent=2, default=str)

        print(f"📤 Exported {len(self.blueprints)} blueprints to {filepath}")

    def _calculate_compression(self, rules: List[int]) -> float:
        """Calculate compression ratio vs raw pixel data"""
        raw_size = 32 * 32 * 4  # 32x32 RGBA image
        blueprint_size = len(rules) * 1  # 1 byte per rule
        return raw_size / blueprint_size if blueprint_size > 0 else 1.0

    def visualize_semantic_space(self,
                               dimension1: int = 0,
                               dimension2: int = 1) -> Dict[str, Any]:
        """Create 2D projection of blueprint semantic space"""
        if not self.blueprints:
            return {}

        # Extract coordinates
        points = []
        for bp in self.blueprints:
            points.append({
                "id": bp.id,
                "name": bp.name,
                "x": float(bp.vector[dimension1]),
                "y": float(bp.vector[dimension2]),
                "pattern_type": bp.pattern_type.name,
                "quality": bp.quality_score,
                "keywords": bp.semantic_keywords[:3]
            })

        return {
            "dimensions": [dimension1, dimension2],
            "points": points,
            "bounds": {
                "x_min": min(p["x"] for p in points),
                "x_max": max(p["x"] for p in points),
                "y_min": min(p["y"] for p in points),
                "y_max": max(p["y"] for p in points)
            }
        }

def test_vector_blueprint_system():
    """Test the pure vector blueprint system"""

    print("🧪 Testing Pure Vector Blueprint System")
    print("=" * 50)

    # Initialize
    memory = VectorBlueprintMemory("test_vector_memory.vec")

    # Create some sample blueprints
    print("\n🎨 Creating sample blueprints:")

    # Solid red
    red_id = memory.create_blueprint(
        rules=[255, 0, 0],
        pattern_type=PatternType.SOLID,
        name="Pure Red",
        description="Vibrant solid red color",
        tags=["red", "solid", "vibrant"]
    )

    # Solid blue
    blue_id = memory.create_blueprint(
        rules=[0, 0, 255],
        pattern_type=PatternType.SOLID,
        name="Deep Blue",
        description="Deep blue ocean color",
        tags=["blue", "solid", "deep"]
    )

    # Gradient
    gradient_id = memory.create_blueprint(
        rules=[255, 0, 0, 0, 0, 255],
        pattern_type=PatternType.GRADIENT,
        name="Red to Blue Gradient",
        description="Smooth transition from red to blue",
        tags=["gradient", "red", "blue", "transition"]
    )

    # Search by text
    print("\n🔍 Semantic search for 'red color':")
    results = memory.semantic_search("red color", query_type="text", limit=3)
    for similarity, bp in results:
        print(f"  {bp.name} - similarity: {similarity:.3f}")

    # Evolve a blueprint
    print("\n🧬 Evolving red blueprint:")
    evolved_ids = memory.evolve_blueprint(red_id, generations=2)
    for i, evolved_id in enumerate(evolved_ids):
        evolved_bp = memory.get_blueprint(evolved_id)
        print(f"  Generation {i+1}: {evolved_bp.name}")

    # Combine blueprints
    print("\n🔄 Combining red and blue:")
    blend_id = memory.combine_blueprints(red_id, blue_id, blend_ratio=0.5)
    blend_bp = memory.get_blueprint(blend_id)
    print(f"  Created: {blend_bp.name}")
    print(f"  Keywords: {', '.join(blend_bp.semantic_keywords[:5])}")

    # Creative exploration
    print("\n🚀 Creative exploration:")
    exploration_ids = memory.creative_exploration(steps=5)
    for i, exp_id in enumerate(exploration_ids):
        exp_bp = memory.get_blueprint(exp_id)
        print(f"  Step {i+1}: {exp_bp.name}")

    # Statistics
    print("\n📊 Memory statistics:")
    stats = memory.get_statistics()
    for key, value in stats.items():
        if isinstance(value, dict):
            print(f"  {key}:")
            for k, v in value.items():
                print(f"    {k}: {v}")
        else:
            print(f"  {key}: {value}")

    # Visualize semantic space
    print("\n🗺️  Semantic space visualization:")
    space = memory.visualize_semantic_space()
    print(f"  Dimensions: {space['dimensions']}")
    print(f"  Points: {len(space['points'])} blueprints")
    print(f"  Bounds: X[{space['bounds']['x_min']:.2f}, {space['bounds']['x_max']:.2f}], "
          f"Y[{space['bounds']['y_min']:.2f}, {space['bounds']['y_max']:.2f}]")

    # Export
    memory.export_memory("blueprint_export.json")

    print("\n✅ Pure Vector Blueprint System test complete!")
    return memory

if __name__ == "__main__":
    # Run tests if executed directly
    test_vector_blueprint_system()