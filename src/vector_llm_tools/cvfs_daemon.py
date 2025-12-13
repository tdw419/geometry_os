import time
import json
import os
from datetime import datetime
from .cvfs_engine import CVFSEngine
from .vpl_compiler import VPLTextCompiler

class CTRMVectorDaemon:
    """
    Daemon that runs VPL programs using text file storage
    Provides high-performance vector operations to CTRM LLM OS
    """

    def __init__(self, data_dir="./cvfs_data"):
        self.engine = CVFSEngine(data_dir)
        self.compiler = VPLTextCompiler(self.engine)

        # Load standard VPL programs from text files
        self.programs = self._load_programs_from_files()

        # Statistics
        self.queries_processed = 0
        self.operations_log = []

    def _load_programs_from_files(self):
        """Load VPL programs from text files"""
        programs = {}
        programs_dir = f"{self.engine.base_path}/programs"

        os.makedirs(programs_dir, exist_ok=True)

        # Create default programs if they don't exist
        default_programs = {
            'semantic_search.vpl': """
                # Semantic search program
                query = LOAD("$query_id")
                neighbors = HNSW_STEP(query, layer=0, m=16)
                results = GATHER(neighbors)
                distances = []
                FOR i IN RANGE(LEN(neighbors)):
                    dist = L2(query, neighbors[i])
                    distances.append(dist)
                RETURN TOP_K(results, distances, k=$top_k)
            """,

            'concept_cluster.vpl': """
                # Concept clustering
                vectors = LOAD_ALL()
                centroids = IVF_PARTITION(vectors, k=8)
                clusters = ASSIGN_TO_CLUSTERS(vectors, centroids)
                RETURN clusters
            """,

            'hybrid_search.vpl': """
                # Hybrid semantic + metadata search
                query = LOAD("$query_id")
                semantic_results = HNSW_STEP(query, ef=50)
                filtered = FILTER_BY_METADATA(semantic_results, "$filter")
                RETURN filtered
            """
        }

        for filename, content in default_programs.items():
            filepath = f"{programs_dir}/{filename}"
            if not os.path.exists(filepath):
                with open(filepath, 'w') as f:
                    f.write(content)

        # Load all .vpl files
        for filename in os.listdir(programs_dir):
            if filename.endswith('.vpl'):
                with open(f"{programs_dir}/{filename}", 'r') as f:
                    program_name = filename[:-4]
                    programs[program_name] = f.read()

        return programs

    def process_vector_query(self, query_vector, query_type='semantic_search',
                           top_k=10, metadata_filter=None):
        """
        Process a vector query using VPL programs
        """
        self.queries_processed += 1

        # Save query vector to text file
        query_id = f"query_{int(time.time())}_{self.queries_processed}"
        self.engine.save_vector_to_file(query_id, query_vector)

        # Get program template
        program = self.programs.get(query_type, self.programs['semantic_search'])

        # Substitute parameters
        program = program.replace('$query_id', f'"{query_id}"')
        program = program.replace('$top_k', str(top_k))
        if metadata_filter:
            program = program.replace('$filter', metadata_filter)

        # Compile and execute
        start_time = time.time()
        results = self.compiler.compile_and_run(program)
        execution_time = time.time() - start_time

        # Log operation
        log_entry = {
            'timestamp': datetime.now().isoformat(),
            'query_id': query_id,
            'query_type': query_type,
            'execution_time': execution_time,
            'results_count': len(results) if isinstance(results, list) else 1
        }
        self.operations_log.append(log_entry)

        # Save log to text file
        self._save_log_to_file(log_entry)

        return {
            'query_id': query_id,
            'results': results,
            'execution_time': execution_time,
            'operations_log': log_entry
        }

    def build_hnsw_index(self, vectors_dict=None, m=16, ef_construction=200):
        """
        Build HNSW index from vectors and save to text files
        """
        if vectors_dict:
            # Save vectors to text file
            for vec_id, vector in vectors_dict.items():
                self.engine.save_vector_to_file(vec_id, vector)

        # Load all vectors from text file
        all_vectors = {}
        try:
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if '|' in line:
                        parts = line.strip().split('|')
                        if len(parts) >= 2:
                            vec_id = parts[0]
                            vector = json.loads(parts[1])
                            all_vectors[vec_id] = vector
        except:
            pass

        if not all_vectors:
            return {"status": "no_vectors", "count": 0}

        # Simplified HNSW construction
        vector_ids = list(all_vectors.keys())
        vectors = list(all_vectors.values())

        # Build graph layer 0 (simplified)
        print(f"Building HNSW index for {len(vectors)} vectors...")

        for i, vec_id in enumerate(vector_ids):
            if i % 100 == 0:
                print(f"  Processed {i}/{len(vectors)}")

            # Find m nearest neighbors (simplified)
            neighbors = []
            if i > 0:
                # Compare with previous vectors (simplified)
                for j in range(max(0, i-100), i):
                    dist = self.engine.v_l2_reduce(
                        f"dist_{i}_{j}",
                        vec_id,
                        vector_ids[j]
                    )
                    neighbors.append((vector_ids[j], dist))

                # Sort by distance
                neighbors.sort(key=lambda x: x[1])
                neighbor_ids = [n[0] for n in neighbors[:m]]

                # Save to graph file
                self.engine._save_hnsw_neighbors(vec_id, 0, neighbor_ids)

        print(f"HNSW index built with {len(vectors)} vectors")

        # Build higher layers (simplified)
        self._build_hnsw_higher_layers(vector_ids, m)

        return {
            "status": "success",
            "vectors_count": len(vectors),
            "layers_built": 2,  # Layer 0 + 1 higher layer
            "graph_file": self.engine.graph_file
        }

    def _build_hnsw_higher_layers(self, vector_ids, m=16):
        """Build higher HNSW layers (simplified)"""
        # Simplified: every 10th vector goes to higher layer
        higher_layer_ids = vector_ids[::10]

        for vec_id in higher_layer_ids:
            # Connect to other higher layer vectors (simplified)
            neighbors = []
            for other_id in higher_layer_ids:
                if other_id != vec_id:
                    dist = self.engine.v_l2_reduce(
                        f"dist_hl_{vec_id}_{other_id}",
                        vec_id,
                        other_id
                    )
                    neighbors.append((other_id, dist))

            neighbors.sort(key=lambda x: x[1])
            neighbor_ids = [n[0] for n in neighbors[:m]]

            # Save to layer 1
            self.engine._save_hnsw_neighbors(vec_id, 1, neighbor_ids)

    def build_ivf_partitions(self, k=8):
        """Build IVF partitions and save to text file"""
        # Load vectors
        vectors = {}
        try:
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if '|' in line:
                        parts = line.strip().split('|')
                        if len(parts) >= 2:
                            vec_id = parts[0]
                            vector = json.loads(parts[1])
                            vectors[vec_id] = vector
        except:
            pass

        if not vectors:
            return {"status": "no_vectors"}

        # Simplified k-means for centroids
        vector_list = list(vectors.values())
        centroid_ids = list(vectors.keys())[:k]
        centroids = vector_list[:k]

        # Assign vectors to partitions
        partitions = {cid: [] for cid in centroid_ids}

        for vec_id, vector in vectors.items():
            # Find nearest centroid
            min_dist = float('inf')
            nearest_centroid = centroid_ids[0]

            for cid, centroid in zip(centroid_ids, centroids):
                dist = sum((x - y) ** 2 for x, y in zip(vector, centroid))
                if dist < min_dist:
                    min_dist = dist
                    nearest_centroid = cid

            partitions[nearest_centroid].append(vec_id)

        # Save partitions to text file
        partitions_file = f"{self.engine.base_path}/ivf_partitions.txt"
        with open(partitions_file, 'w') as f:
            for centroid_id, vector_ids in partitions.items():
                line = f"{centroid_id}|{','.join(vector_ids)}\n"
                f.write(line)

        return {
            "status": "success",
            "partitions": len(partitions),
            "total_vectors": len(vectors),
            "partitions_file": partitions_file
        }

    def build_pq_codebooks(self, codebook_name="default", subspace_count=4):
        """Build Product Quantization codebooks"""
        return self.engine._build_codebook(codebook_name, subspace_count)

    def semantic_search(self, query_vector, top_k=10, use_hnsw=True):
        """
        High-level semantic search interface
        """
        if use_hnsw and self.engine.vcr.get('hnsw_built', False):
            # Use HNSW for fast search
            return self.process_vector_query(
                query_vector,
                query_type='semantic_search',
                top_k=top_k
            )
        else:
            # Brute-force search (for small datasets)
            results = self._brute_force_search(query_vector, top_k)
            return results

    def _brute_force_search(self, query_vector, top_k=10):
        """Brute-force search through all vectors"""
        query_id = f"query_bf_{int(time.time())}"
        self.engine.save_vector_to_file(query_id, query_vector)

        # Load all vectors
        all_vectors = {}
        try:
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if '|' in line:
                        parts = line.strip().split('|')
                        if len(parts) >= 2:
                            vec_id = parts[0]
                            vector = json.loads(parts[1])
                            all_vectors[vec_id] = vector
        except:
            pass

        # Calculate distances
        distances = []
        for vec_id, vector in all_vectors.items():
            if vec_id != query_id:
                dist = self.engine.v_l2_reduce(
                    f"bf_dist_{vec_id}",
                    query_id,
                    vec_id
                )
                distances.append((vec_id, dist))

        # Sort and return top_k
        distances.sort(key=lambda x: x[1])
        top_results = distances[:top_k]

        return {
            'query_id': query_id,
            'results': top_results,
            'method': 'brute_force',
            'vectors_searched': len(distances)
        }

    def _save_log_to_file(self, log_entry):
        """Save operation log to text file"""
        log_file = f"{self.engine.base_path}/daemon_log.txt"
        with open(log_file, 'a') as f:
            f.write(json.dumps(log_entry) + '\n')

    def run_optimization_cycle(self):
        """
        Run optimization cycles to improve performance
        """
        print("Running CVFS optimization cycle...")

        # 1. Rebuild HNSW if needed
        vector_count = self._count_vectors()
        if vector_count > 1000 and vector_count % 1000 == 0:
            print("  Rebuilding HNSW index...")
            self.build_hnsw_index()
            self.engine.vcr['hnsw_built'] = True

        # 2. Rebuild IVF partitions
        if vector_count > 5000 and vector_count % 5000 == 0:
            print("  Rebuilding IVF partitions...")
            self.build_ivf_partitions()

        # 3. Update PQ codebooks
        if vector_count > 10000 and vector_count % 10000 == 0:
            print("  Updating PQ codebooks...")
            self.build_pq_codebooks()

        # 4. Clean up temporary vectors
        self._cleanup_temp_vectors()

        print(f"Optimization complete. Vectors: {vector_count}")

    def _count_vectors(self):
        """Count vectors in text file"""
        count = 0
        try:
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if '|' in line:
                        count += 1
        except:
            pass
        return count

    def _cleanup_temp_vectors(self):
        """Clean up temporary vectors"""
        lines = []
        try:
            with open(self.engine.vectors_file, 'r') as f:
                lines = f.readlines()
        except:
            pass

        # Keep only non-temporary vectors
        filtered_lines = []
        for line in lines:
            if '|' in line:
                vec_id = line.split('|')[0]
                if not (vec_id.startswith('temp_') or
                       vec_id.startswith('dist_') or
                       vec_id.startswith('query_')):
                    filtered_lines.append(line)

        # Write back
        with open(self.engine.vectors_file, 'w') as f:
            f.writelines(filtered_lines)

    def _process_pending_queries(self):
        """Process pending queries from query file"""
        query_file = f"{self.engine.base_path}/pending_queries.txt"
        if not os.path.exists(query_file):
            return

        try:
            with open(query_file, 'r') as f:
                queries = f.readlines()

            processed_queries = []
            for query_line in queries:
                if not query_line.strip() or query_line.startswith('#'):
                    continue

                try:
                    query_data = json.loads(query_line.strip())
                    query_vector = query_data.get('vector')
                    query_type = query_data.get('type', 'semantic_search')
                    top_k = query_data.get('top_k', 10)

                    if query_vector:
                        results = self.process_vector_query(
                            query_vector,
                            query_type=query_type,
                            top_k=top_k
                        )
                        processed_queries.append({
                            'query': query_data,
                            'results': results,
                            'status': 'processed'
                        })
                except Exception as e:
                    processed_queries.append({
                        'query': query_line.strip(),
                        'error': str(e),
                        'status': 'error'
                    })

            # Save processed queries
            processed_file = f"{self.engine.base_path}/processed_queries.txt"
            with open(processed_file, 'a') as f:
                for result in processed_queries:
                    f.write(json.dumps(result) + '\n')

            # Clear pending queries
            with open(query_file, 'w') as f:
                f.write("# Processed queries\n")

        except Exception as e:
            print(f"Error processing pending queries: {e}")

    def _save_final_state(self):
        """Save final state to text files"""
        state_file = f"{self.engine.base_path}/daemon_state.txt"
        state = {
            'queries_processed': self.queries_processed,
            'vectors_count': self._count_vectors(),
            'hnsw_built': self.engine.vcr.get('hnsw_built', False),
            'last_operation': self.engine.vcr.get('last_operation', 'none'),
            'shutdown_time': datetime.now().isoformat()
        }

        with open(state_file, 'w') as f:
            f.write(json.dumps(state, indent=2) + '\n')

        print(f"Final state saved to {state_file}")