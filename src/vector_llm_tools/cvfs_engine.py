import json
import math
import struct
import hashlib
from collections import defaultdict, deque
import heapq
import numpy as np
import os
from datetime import datetime

class CVFSEngine:
    """
    CTRM Vector File System Engine - Implements LDB-V concepts
    using text files as storage and memory
    """

    def __init__(self, base_path="./cvfs_data"):
        self.base_path = base_path
        self.vector_registers = {}  # VRF: In-memory Vector Register File
        self.vcr = {}  # Vector Control Register
        self.hnsw_layers = {}  # HNSW graph layers in memory
        self.ivf_partitions = {}  # IVF partitions
        self.pq_codebooks = {}  # Product Quantization codebooks

        # Text file paths
        self.vectors_file = f"{base_path}/vectors.txt"
        self.index_file = f"{base_path}/index.txt"
        self.graph_file = f"{base_path}/graph.txt"
        self.codebook_file = f"{base_path}/codebooks.txt"

        # Initialize files
        self._init_storage()

    def _init_storage(self):
        """Initialize text file storage structure"""
        os.makedirs(self.base_path, exist_ok=True)

        # Create files if they don't exist
        for filepath in [self.vectors_file, self.index_file,
                        self.graph_file, self.codebook_file]:
            if not os.path.exists(filepath):
                with open(filepath, 'w') as f:
                    f.write("# CVFS Vector Storage\n")

    # ============ V-MATH Instructions (Text-based) ============

    def v_fma_cosine(self, vd, vs1_id, vs2_id):
        """
        LDB.V.FMA.COS implementation using text file vectors
        Returns cosine similarity between two vectors
        """
        # Load vectors from text file
        vs1 = self._load_vector_from_file(vs1_id)
        vs2 = self._load_vector_from_file(vs2_id)

        if not vs1 or not vs2:
            print(f"DEBUG: Failed to load vectors {vs1_id} or {vs2_id}")
            return 0.0

        if len(vs1) != len(vs2):
            print(f"DEBUG: Vector dimension mismatch: {len(vs1)} vs {len(vs2)}")
            return 0.0

        # Fused multiply-add for cosine similarity
        dot = sum(x * y for x, y in zip(vs1, vs2))
        norm1 = math.sqrt(sum(x*x for x in vs1))
        norm2 = math.sqrt(sum(x*x for x in vs2))

        similarity = dot / (norm1 * norm2) if norm1 and norm2 else 0

        # Store result in vector register
        self.vector_registers[vd] = [similarity]

        # Update VCR (Vector Control Register)
        self.vcr['last_similarity'] = similarity
        self.vcr['last_operation'] = 'cosine'

        # Write operation log to text file
        self._log_operation(f"V-FMA-COS {vd} = cosine({vs1_id}, {vs2_id}) = {similarity}")

        return similarity

    def v_l2_reduce(self, vd, vs1_id, vs2_id):
        """
        LDB.V.L2.REDUCE - Squared Euclidean distance
        """
        vs1 = self._load_vector_from_file(vs1_id)
        vs2 = self._load_vector_from_file(vs2_id)

        if not vs1 or not vs2:
            print(f"DEBUG: Failed to load vectors {vs1_id} or {vs2_id} for L2")
            return float('inf')

        if len(vs1) != len(vs2):
            print(f"DEBUG: Vector dimension mismatch for L2: {len(vs1)} vs {len(vs2)}")
            return float('inf')

        squared_distance = sum((x - y) ** 2 for x, y in zip(vs1, vs2))

        self.vector_registers[vd] = [squared_distance]
        self.vcr['last_distance'] = squared_distance

        self._log_operation(f"V-L2-REDUCE {vd} = L2({vs1_id}, {vs2_id}) = {squared_distance}")

        return squared_distance

    # ============ V-GRAPH Instructions (Text-based HNSW) ============

    def v_hnsw_step(self, vd, query_vec_id, layer, m=16):
        """
        LDB.V.HNSW.STEP - Single HNSW traversal step
        Uses text file for graph storage
        """
        query_vec = self._load_vector_from_file(query_vec_id)
        if not query_vec:
            return []

        # Load neighbors from graph text file
        neighbors = self._load_hnsw_neighbors(query_vec_id, layer)

        # Calculate distances to neighbors
        distances = []
        for neighbor_id in neighbors[:m]:
            dist = self.v_l2_reduce(f"temp_{neighbor_id}", query_vec_id, neighbor_id)
            distances.append((neighbor_id, dist))

        # Sort by distance (ascending)
        distances.sort(key=lambda x: x[1])
        best_neighbors = [n for n, _ in distances[:m]]

        # CRITICAL: Update VCR with next addresses
        self.vcr['next_neighbors'] = best_neighbors
        self.vcr['search_layer'] = layer
        self.vcr['search_depth'] = self.vcr.get('search_depth', 0) + 1

        # Store result
        self.vector_registers[vd] = best_neighbors

        self._log_operation(f"V-HNSW-STEP {vd} at layer {layer}, found {len(best_neighbors)} neighbors")

        return best_neighbors

    def _load_hnsw_neighbors(self, node_id, layer):
        """Load HNSW neighbors from text file"""
        neighbors = []
        try:
            with open(self.graph_file, 'r') as f:
                for line in f:
                    if line.startswith(f"{node_id}|{layer}|"):
                        neighbor_str = line.split('|')[2].strip()
                        if neighbor_str:
                            neighbors = neighbor_str.split(',')
                        break
        except:
            pass
        return neighbors

    def _save_hnsw_neighbors(self, node_id, layer, neighbors):
        """Save HNSW neighbors to text file"""
        # Read existing lines
        lines = []
        try:
            with open(self.graph_file, 'r') as f:
                lines = f.readlines()
        except:
            pass

        # Update or add line
        new_line = f"{node_id}|{layer}|{','.join(neighbors)}\n"
        updated = False

        for i, line in enumerate(lines):
            if line.startswith(f"{node_id}|{layer}|"):
                lines[i] = new_line
                updated = True
                break

        if not updated:
            lines.append(new_line)

        # Write back
        with open(self.graph_file, 'w') as f:
            f.writelines(lines)

    # ============ V-QUANT Instructions (Text-based Quantization) ============

    def v_pq_lookup(self, vd, query_vec_id, codebook_name, subspace_count=4):
        """
        LDB.V.PQ.LOOKUP - Product Quantization search
        Uses text file for codebook storage
        """
        query_vec = self._load_vector_from_file(query_vec_id)
        if not query_vec:
            return float('inf')

        # Load codebook from text file
        codebook = self._load_codebook(codebook_name)
        if not codebook:
            # Create codebook if it doesn't exist
            codebook = self._build_codebook(codebook_name, subspace_count)

        # Split vector into subspaces
        dim = len(query_vec)
        sub_dim = dim // subspace_count
        total_dist = 0
        pq_codes = []

        for s in range(subspace_count):
            subvec = query_vec[s*sub_dim:(s+1)*sub_dim]

            # Find nearest centroid in this subspace
            min_dist = float('inf')
            nearest_idx = -1

            for idx, centroid in enumerate(codebook.get(f'subspace_{s}', [])):
                if len(centroid) != sub_dim:
                    continue
                dist = sum((x - y) ** 2 for x, y in zip(subvec, centroid))
                if dist < min_dist:
                    min_dist = dist
                    nearest_idx = idx

            total_dist += min_dist
            pq_codes.append(nearest_idx)

        # Store results
        self.vector_registers[vd] = [total_dist]
        self.vcr['pq_codes'] = pq_codes
        self.vcr['pq_total_dist'] = total_dist

        self._log_operation(f"V-PQ-LOOKUP {vd} using {codebook_name}, dist={total_dist}")

        return total_dist

    def _load_codebook(self, codebook_name):
        """Load PQ codebook from text file"""
        codebook = defaultdict(list)
        try:
            with open(self.codebook_file, 'r') as f:
                for line in f:
                    if line.startswith(f"{codebook_name}|"):
                        parts = line.strip().split('|')
                        if len(parts) >= 3:
                            subspace = parts[1]
                            vectors = json.loads(parts[2])
                            codebook[subspace] = vectors
        except:
            pass
        return codebook

    def _save_codebook(self, codebook_name, codebook):
        """Save PQ codebook to text file"""
        lines = []
        try:
            with open(self.codebook_file, 'r') as f:
                lines = f.readlines()
        except:
            pass

        # Remove existing entries for this codebook
        lines = [l for l in lines if not l.startswith(f"{codebook_name}|")]

        # Add new entries
        for subspace, vectors in codebook.items():
            line = f"{codebook_name}|{subspace}|{json.dumps(vectors)}\n"
            lines.append(line)

        with open(self.codebook_file, 'w') as f:
            f.writelines(lines)

    # ============ V-MEM Instructions (Text-based Memory Access) ============

    def v_gather_vec(self, vd, index_vector, start_id=0):
        """
        LDB.V.GATHER.VEC - Gather vectors by indices
        Reads multiple vectors from text file in one operation
        """
        gathered = []

        for idx in index_vector:
            vector_id = f"vec_{start_id + idx}"
            vector = self._load_vector_from_file(vector_id)
            if vector:
                gathered.append(vector)

        self.vector_registers[vd] = gathered

        self._log_operation(f"V-GATHER-VEC {vd} gathered {len(gathered)} vectors")

        return gathered

    # ============ Text File Operations ============

    def _load_vector_from_file(self, vector_id):
        """Load a single vector from text file"""
        try:
            with open(self.vectors_file, 'r') as f:
                for line in f:
                    if line.startswith(f"{vector_id}|"):
                        # Split by first pipe, then split the vector part from metadata
                        parts = line.split('|', 2)
                        if len(parts) >= 2:
                            vector_str = parts[1].strip()
                            return json.loads(vector_str)
        except Exception as e:
            print(f"DEBUG: Error loading vector {vector_id}: {e}")
        return None

    def save_vector_to_file(self, vector_id, vector, metadata=None):
        """Save a vector to text file"""
        # Read all lines
        lines = []
        try:
            with open(self.vectors_file, 'r') as f:
                lines = f.readlines()
        except:
            pass

        # Create new line
        meta_str = json.dumps(metadata) if metadata else "{}"
        new_line = f"{vector_id}|{json.dumps(vector)}|{meta_str}\n"

        # Update or add
        updated = False
        for i, line in enumerate(lines):
            if line.startswith(f"{vector_id}|"):
                lines[i] = new_line
                updated = True
                break

        if not updated:
            lines.append(new_line)

        # Write back
        with open(self.vectors_file, 'w') as f:
            f.writelines(lines)

        return True

    def _log_operation(self, operation):
        """Log VPL operation to text file"""
        with open(f"{self.base_path}/operations.log", 'a') as f:
            timestamp = datetime.now().isoformat()
            f.write(f"[{timestamp}] {operation}\n")

    def _build_codebook(self, codebook_name, subspace_count=4):
        """Build a PQ codebook from existing vectors"""
        # Load all vectors
        all_vectors = []
        vector_ids = []

        try:
            with open(self.vectors_file, 'r') as f:
                for line in f:
                    if '|' in line:
                        parts = line.strip().split('|')
                        if len(parts) >= 2:
                            vector_id = parts[0]
                            vector = json.loads(parts[1])
                            all_vectors.append(vector)
                            vector_ids.append(vector_id)
        except:
            pass

        if not all_vectors:
            return {}

        # Build codebook
        dim = len(all_vectors[0])
        sub_dim = dim // subspace_count
        codebook = {}

        for s in range(subspace_count):
            # Extract subspace vectors
            subspace_vectors = []
            for vec in all_vectors:
                if len(vec) >= (s+1)*sub_dim:
                    subvec = vec[s*sub_dim:(s+1)*sub_dim]
                    subspace_vectors.append(subvec)

            # Simple clustering (k-means simplified)
            centroids = self._simple_kmeans(subspace_vectors, k=min(256, len(subspace_vectors)))
            codebook[f'subspace_{s}'] = centroids

        # Save codebook
        self._save_codebook(codebook_name, codebook)

        return codebook

    def _simple_kmeans(self, vectors, k=256, max_iters=10):
        """Simplified k-means for codebook generation"""
        if not vectors or len(vectors) < k:
            return vectors

        # Initialize centroids
        centroids = vectors[:k]

        for _ in range(max_iters):
            # Assign vectors to centroids
            clusters = [[] for _ in range(k)]

            for vec in vectors:
                # Find nearest centroid
                min_dist = float('inf')
                nearest_idx = 0
                for i, centroid in enumerate(centroids):
                    dist = sum((x - y) ** 2 for x, y in zip(vec, centroid))
                    if dist < min_dist:
                        min_dist = dist
                        nearest_idx = i
                clusters[nearest_idx].append(vec)

            # Update centroids
            new_centroids = []
            for cluster in clusters:
                if cluster:
                    # Average of cluster
                    avg = [sum(dim)/len(cluster) for dim in zip(*cluster)]
                    new_centroids.append(avg)
                else:
                    # Keep old centroid
                    new_centroids.append(centroids[len(new_centroids)])

            if new_centroids == centroids:
                break
            centroids = new_centroids

        return centroids