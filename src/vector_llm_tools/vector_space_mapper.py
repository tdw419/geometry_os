import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib

class VectorSpaceMapper:
    """Help LLMs navigate and understand vector spaces"""

    def __init__(self, ctrm, lm_studio, db):
        self.ctrm = ctrm
        self.lm_studio = lm_studio
        self.db = db

    async def create_vector_space_map(self, vectors: List[List[float]], labels: List[str] = None) -> Dict[str, Any]:
        """Create LLM-friendly map of vector space"""

        if not vectors:
            return {"error": "No vectors provided"}

        # Reduce dimensions for visualization (but keep original for operations)
        reduced_3d = self.reduce_to_3d(vectors)

        # Calculate space metrics
        space_metrics = self.calculate_space_metrics(vectors)

        # Ask LLM to describe the vector space
        space_description = await self.ask_llm(
            f"Vector space with {len(vectors)} vectors in {len(vectors[0])} dimensions. "
            f"Space metrics: {space_metrics}. "
            f"3D reduction shows the following coordinate ranges: "
            f"X: {np.min(reduced_3d[:,0]):.2f}-{np.max(reduced_3d[:,0]):.2f}, "
            f"Y: {np.min(reduced_3d[:,1]):.2f}-{np.max(reduced_3d[:,1]):.2f}, "
            f"Z: {np.min(reduced_3d[:,2]):.2f}-{np.max(reduced_3d[:,2]):.2f}. "
            f"Describe what semantic regions this space might contain and "
            f"any apparent clustering or structure."
        )

        # Identify semantic regions
        semantic_regions = await self.identify_semantic_regions(vectors, reduced_3d)

        # Create density map
        density_map = self.create_density_map(reduced_3d)

        # Identify landmark vectors
        landmarks = await self.identify_landmark_vectors(vectors, labels)

        # Create vector map
        vector_map = {
            "vectors": vectors,
            "reduced_3d": reduced_3d.tolist(),
            "llm_space_description": space_description,
            "semantic_regions": semantic_regions,
            "density_map": density_map,
            "landmark_vectors": landmarks,
            "space_metrics": space_metrics
        }

        # Store as CTRM truth
        map_truth = await self.ctrm.create_truth(
            statement=f"Vector space map created: {space_description['summary']}",
            confidence=space_description.get("confidence", 0.8),
            metadata={
                "vector_space_map": vector_map,
                "num_vectors": len(vectors),
                "dimensionality": len(vectors[0]),
                "coverage_score": space_metrics["coverage_score"],
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "space_map": vector_map,
            "ctrm_truth_id": map_truth.id,
            "vector_count": len(vectors),
            "dimensionality": len(vectors[0])
        }

    async def identify_semantic_regions(self, vectors: List[List[float]], reduced_3d: np.ndarray) -> List[Dict]:
        """Identify semantic regions in the vector space"""

        if len(vectors) < 10:
            return [{"region": "entire_space", "description": "Space too small for regional analysis"}]

        # Simple clustering to identify regions
        clusters = await self.simple_spatial_clustering(reduced_3d, min(5, len(vectors) // 10))

        regions = []
        for i, cluster in enumerate(clusters):
            if len(cluster["indices"]) >= 3:  # Only consider substantial clusters
                # Get representative vectors
                rep_indices = cluster["indices"][:min(3, len(cluster["indices"]))]
                rep_vectors = [vectors[idx] for idx in rep_indices]

                # Ask LLM to describe the semantic region
                region_description = await self.ask_llm(
                    f"Semantic region with {len(cluster['indices'])} vectors. "
                    f"Representative vectors have norms: "
                    f"[{', '.join(f'{np.linalg.norm(v):.2f}' for v in rep_vectors)}]. "
                    f"3D coordinates center: {cluster['centroid']}. "
                    f"What semantic theme likely characterizes this region?"
                )

                regions.append({
                    "region_id": f"region_{i}",
                    "vector_indices": cluster["indices"],
                    "representative_vectors": rep_indices,
                    "centroid_3d": cluster["centroid"],
                    "size": len(cluster["indices"]),
                    "description": region_description,
                    "density": cluster["density"]
                })

        return regions

    async def simple_spatial_clustering(self, reduced_3d: np.ndarray, n_clusters: int) -> List[Dict]:
        """Simple clustering in 3D space"""

        if n_clusters < 1:
            n_clusters = 1

        # Initialize centroids using k-means++ approach
        centroids = [reduced_3d[0].tolist()]

        for _ in range(1, n_clusters):
            # Find point farthest from existing centroids
            distances = np.min([
                np.linalg.norm(reduced_3d - c, axis=1)
                for c in centroids
            ], axis=0)
            farthest_idx = np.argmax(distances)
            centroids.append(reduced_3d[farthest_idx].tolist())

        # Assign points to nearest centroid
        clusters = [[] for _ in range(n_clusters)]

        for i, point in enumerate(reduced_3d):
            distances = [np.linalg.norm(point - c) for c in centroids]
            cluster_idx = np.argmin(distances)
            clusters[cluster_idx].append(i)

        # Calculate cluster metrics
        result_clusters = []
        for i, cluster_indices in enumerate(clusters):
            if cluster_indices:
                centroid = np.mean([reduced_3d[idx] for idx in cluster_indices], axis=0)
                density = len(cluster_indices) / len(reduced_3d)

                result_clusters.append({
                    "cluster_id": i,
                    "indices": cluster_indices,
                    "centroid": centroid.tolist(),
                    "size": len(cluster_indices),
                    "density": density
                })

        return result_clusters

    def create_density_map(self, reduced_3d: np.ndarray) -> Dict[str, Any]:
        """Create density map of vector space"""

        if len(reduced_3d) < 10:
            return {"type": "uniform", "description": "Insufficient data for density analysis"}

        # Create grid for density calculation
        x_range = (np.min(reduced_3d[:,0]), np.max(reduced_3d[:,0]))
        y_range = (np.min(reduced_3d[:,1]), np.max(reduced_3d[:,1]))
        z_range = (np.min(reduced_3d[:,2]), np.max(reduced_3d[:,2]))

        # Simple density metrics
        point_densities = []
        for i in range(min(20, len(reduced_3d))):
            point = reduced_3d[i]
            distances = np.linalg.norm(reduced_3d - point, axis=1)
            local_density = len([d for d in distances if d < 1.0])  # Points within radius 1
            point_densities.append(local_density)

        return {
            "type": "point_density",
            "average_density": float(np.mean(point_densities)),
            "density_std": float(np.std(point_densities)),
            "max_density": float(np.max(point_densities)),
            "min_density": float(np.min(point_densities)),
            "coordinate_ranges": {
                "x": [float(x_range[0]), float(x_range[1])],
                "y": [float(y_range[0]), float(y_range[1])],
                "z": [float(z_range[0]), float(z_range[1])]
            },
            "density_distribution": self.analyze_density_distribution(point_densities)
        }

    async def identify_landmark_vectors(self, vectors: List[List[float]], labels: List[str] = None) -> List[Dict]:
        """Identify important 'landmark' vectors in the space"""

        landmarks = []

        if not vectors:
            return landmarks

        # Find centroid (most central vector)
        centroid = np.mean(vectors, axis=0)
        centroid_idx = np.argmin([np.linalg.norm(v - centroid) for v in vectors])

        landmarks.append({
            "vector": vectors[centroid_idx],
            "vector_hash": self.hash_vector(vectors[centroid_idx]),
            "role": "centroid",
            "explanation": "Most central vector in the space",
            "label": labels[centroid_idx] if labels else None,
            "metrics": {
                "norm": float(np.linalg.norm(vectors[centroid_idx])),
                "position": "central"
            }
        })

        # Find boundary vectors (most extreme in each dimension)
        for dim in range(min(3, len(vectors[0]))):
            # Find max and min in this dimension
            dim_values = [v[dim] for v in vectors]
            max_idx = np.argmax(dim_values)
            min_idx = np.argmin(dim_values)

            landmarks.append({
                "vector": vectors[max_idx],
                "vector_hash": self.hash_vector(vectors[max_idx]),
                "role": f"boundary_max_dim_{dim}",
                "explanation": f"Extreme vector in dimension {dim} (maximum)",
                "label": labels[max_idx] if labels else None,
                "metrics": {
                    "norm": float(np.linalg.norm(vectors[max_idx])),
                    "position": "boundary",
                    "extreme_dimension": dim,
                    "extreme_value": float(vectors[max_idx][dim])
                }
            })

            landmarks.append({
                "vector": vectors[min_idx],
                "vector_hash": self.hash_vector(vectors[min_idx]),
                "role": f"boundary_min_dim_{dim}",
                "explanation": f"Extreme vector in dimension {dim} (minimum)",
                "label": labels[min_idx] if labels else None,
                "metrics": {
                    "norm": float(np.linalg.norm(vectors[min_idx])),
                    "position": "boundary",
                    "extreme_dimension": dim,
                    "extreme_value": float(vectors[min_idx][dim])
                }
            })

        # Ask LLM to provide semantic descriptions for landmarks
        landmark_descriptions = await self.ask_llm_to_describe_landmarks(landmarks)

        # Merge descriptions
        for i, desc in enumerate(landmark_descriptions):
            if i < len(landmarks):
                landmarks[i]["semantic_description"] = desc

        return landmarks

    async def ask_llm_to_describe_landmarks(self, landmarks: List[Dict]) -> List[str]:
        """Ask LLM to provide semantic descriptions for landmarks"""

        descriptions = []
        for landmark in landmarks:
            vector = landmark["vector"]
            metrics = {
                "norm": np.linalg.norm(vector),
                "mean": np.mean(vector),
                "std": np.std(vector),
                "role": landmark["role"]
            }

            description = await self.ask_llm(
                f"Landmark vector with role {landmark['role']}. "
                f"Metrics: {metrics}. "
                f"Provide a concise semantic description of what this landmark "
                f"likely represents in the vector space."
            )

            descriptions.append(description.get("description", "semantic_landmark"))

        return descriptions

    async def navigate_vector_space(self, vector: List[float], space_map: Dict[str, Any]) -> Dict[str, Any]:
        """Help LLM navigate to related vectors in the space"""

        query_vector_3d = self.reduce_to_3d([vector])[0]

        # Find nearest landmarks
        nearest_landmarks = self.find_nearest_landmarks(query_vector_3d, space_map["landmark_vectors"])

        # Find nearest semantic regions
        nearest_regions = self.find_nearest_regions(query_vector_3d, space_map["semantic_regions"])

        # Ask LLM for navigation suggestions
        navigation_advice = await self.ask_llm(
            f"Query vector at 3D position {query_vector_3d}. "
            f"Nearest landmarks: {nearest_landmarks[:3]}. "
            f"Nearest regions: {nearest_regions[:2]}. "
            f"Provide navigation advice for finding semantically related vectors."
        )

        return {
            "query_vector_3d": query_vector_3d.tolist(),
            "nearest_landmarks": nearest_landmarks,
            "nearest_regions": nearest_regions,
            "navigation_advice": navigation_advice,
            "space_coverage": space_map["space_metrics"]["coverage_score"]
        }

    def find_nearest_landmarks(self, query_3d: np.ndarray, landmarks: List[Dict]) -> List[Dict]:
        """Find nearest landmarks to query vector"""

        if not landmarks:
            return []

        # Calculate distances
        landmark_distances = []
        for landmark in landmarks:
            landmark_pos = np.array(landmark["metrics"]["position_3d"]) if "position_3d" in landmark["metrics"] else np.array(landmark["centroid_3d"])
            distance = np.linalg.norm(query_3d - landmark_pos)
            landmark_distances.append((landmark, distance))

        # Sort by distance
        landmark_distances.sort(key=lambda x: x[1])

        # Return top 5
        return [{
            "landmark": ld[0],
            "distance": float(ld[1]),
            "similarity": 1.0 / (1.0 + ld[1])  # Simple similarity from distance
        } for ld in landmark_distances[:5]]

    def find_nearest_regions(self, query_3d: np.ndarray, regions: List[Dict]) -> List[Dict]:
        """Find nearest semantic regions to query vector"""

        if not regions:
            return []

        # Calculate distances to region centroids
        region_distances = []
        for region in regions:
            centroid = np.array(region["centroid_3d"])
            distance = np.linalg.norm(query_3d - centroid)
            region_distances.append((region, distance))

        # Sort by distance
        region_distances.sort(key=lambda x: x[1])

        # Return top 3
        return [{
            "region": rd[0],
            "distance": float(rd[1]),
            "similarity": 1.0 / (1.0 + rd[1])
        } for rd in region_distances[:3]]

    def calculate_space_metrics(self, vectors: List[List[float]]) -> Dict[str, float]:
        """Calculate metrics about the vector space"""

        if not vectors:
            return {
                "vector_count": 0,
                "dimensionality": 0,
                "avg_norm": 0.0,
                "norm_std": 0.0,
                "coverage_score": 0.0
            }

        norms = [np.linalg.norm(v) for v in vectors]
        pairwise_similarities = []

        # Sample some pairwise similarities
        sample_size = min(100, len(vectors))
        for i in range(sample_size):
            for j in range(i+1, min(i+10, len(vectors))):
                pairwise_similarities.append(self.cosine_similarity(vectors[i], vectors[j]))

        return {
            "vector_count": len(vectors),
            "dimensionality": len(vectors[0]),
            "avg_norm": float(np.mean(norms)),
            "norm_std": float(np.std(norms)),
            "avg_pairwise_similarity": float(np.mean(pairwise_similarities)) if pairwise_similarities else 0.0,
            "similarity_std": float(np.std(pairwise_similarities)) if pairwise_similarities else 0.0,
            "coverage_score": self.calculate_coverage_score(vectors)
        }

    def reduce_to_3d(self, vectors: List[List[float]]) -> np.ndarray:
        """Reduce vectors to 3D for visualization"""

        if not vectors:
            return np.array([])

        vectors_array = np.array(vectors)

        # Simple approach: use first 3 dimensions
        # In practice, use proper PCA
        return vectors_array[:, :3]

    def calculate_coverage_score(self, vectors: List[List[float]]) -> float:
        """Calculate how well the vectors cover the semantic space"""

        if len(vectors) < 2:
            return 0.5

        # Calculate pairwise distances
        distances = []
        sample_size = min(50, len(vectors))
        for i in range(sample_size):
            for j in range(i+1, min(i+5, len(vectors))):
                dist = np.linalg.norm(np.array(vectors[i]) - np.array(vectors[j]))
                distances.append(dist)

        if not distances:
            return 0.5

        # Higher variance in distances suggests better coverage
        dist_std = np.std(distances)
        dist_mean = np.mean(distances)

        # Coverage score based on distance variance
        coverage = min(1.0, dist_std / max(dist_mean, 0.1))

        return float(coverage)

    def analyze_density_distribution(self, densities: List[float]) -> Dict[str, float]:
        """Analyze distribution of densities"""
        return {
            "mean": float(np.mean(densities)),
            "std": float(np.std(densities)),
            "min": float(np.min(densities)),
            "max": float(np.max(densities)),
            "median": float(np.median(densities)),
            "q25": float(np.percentile(densities, 25)),
            "q75": float(np.percentile(densities, 75))
        }

    def hash_vector(self, vector: List[float]) -> str:
        """Generate hash for vector"""
        vector_json = json.dumps(vector, sort_keys=True)
        return hashlib.md5(vector_json.encode()).hexdigest()

    def cosine_similarity(self, vec1: List[float], vec2: List[float]) -> float:
        """Calculate cosine similarity between two vectors"""
        dot_product = np.dot(vec1, vec2)
        norm1 = np.linalg.norm(vec1)
        norm2 = np.linalg.norm(vec2)
        return dot_product / (norm1 * norm2) if norm1 and norm2 else 0.0

    async def ask_llm(self, prompt: str) -> Dict[str, Any]:
        """Helper method to ask LLM questions"""
        model = await self.lm_studio.get_loaded_model()
        if not model:
            return {"response": "LLM unavailable", "confidence": 0.5}

        response = await self.lm_studio.generate(model, prompt, max_tokens=300)

        try:
            return json.loads(response["content"])
        except (json.JSONDecodeError, KeyError):
            return {
                "response": response["content"],
                "confidence": 0.7
            }