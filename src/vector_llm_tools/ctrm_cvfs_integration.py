"""
CTRM CVFS Integration Module
Integrates the CTRM Vector File System with the CTRM LLM OS
"""

import os
import json
import time
from datetime import datetime
from typing import List, Dict, Any, Optional
from .cvfs_engine import CVFSEngine
from .vpl_compiler import VPLTextCompiler
from .cvfs_daemon import CTRMVectorDaemon

class CTRMCVFSIntegration:
    """
    Integration layer between CTRM LLM OS and CVFS Vector File System
    Provides vector-based truth management and semantic operations
    """

    def __init__(self, data_dir: str = "./ctrm_cvfs_data"):
        """
        Initialize CTRM-CVFS integration
        """
        self.data_dir = data_dir
        self.daemon = CTRMVectorDaemon(data_dir)
        self.engine = self.daemon.engine
        self.compiler = self.daemon.compiler

        # CTRM-specific configuration
        self.truth_threshold = 0.95  # Similarity threshold for truth confirmation
        self.confidence_weights = {
            'cosine': 0.7,
            'l2': 0.3
        }

        # Initialize CTRM vector storage
        self._init_ctrm_storage()

    def _init_ctrm_storage(self):
        """Initialize CTRM-specific vector storage"""
        # Create CTRM-specific directories
        ctrm_dir = f"{self.data_dir}/ctrm"
        os.makedirs(ctrm_dir, exist_ok=True)

        # Create CTRM truth vectors file
        self.ctrm_vectors_file = f"{ctrm_dir}/truth_vectors.txt"
        if not os.path.exists(self.ctrm_vectors_file):
            with open(self.ctrm_vectors_file, 'w') as f:
                f.write("# CTRM Truth Vectors\n")

        # Create CTRM evidence file
        self.ctrm_evidence_file = f"{ctrm_dir}/evidence_vectors.txt"
        if not os.path.exists(self.ctrm_evidence_file):
            with open(self.ctrm_evidence_file, 'w') as f:
                f.write("# CTRM Evidence Vectors\n")

    def store_truth_vector(self, truth_id: str, vector: List[float], metadata: Dict[str, Any] = None):
        """
        Store a truth vector in CTRM-CVFS system
        """
        if metadata is None:
            metadata = {
                'truth_type': 'factual',
                'source': 'ctrm_system',
                'timestamp': datetime.now().isoformat()
            }

        # Add CTRM-specific metadata
        metadata['ctrm_truth_id'] = truth_id
        metadata['ctrm_truth_status'] = 'verified'

        # Store in main CVFS
        self.engine.save_vector_to_file(truth_id, vector, metadata)

        # Also store in CTRM-specific file
        with open(self.ctrm_vectors_file, 'a') as f:
            f.write(f"{truth_id}|{json.dumps(vector)}|{json.dumps(metadata)}\n")

        return True

    def store_evidence_vector(self, evidence_id: str, vector: List[float], claim_id: str = None):
        """
        Store evidence vector for truth verification
        """
        metadata = {
            'evidence_type': 'supporting',
            'source': 'ctrm_evidence',
            'timestamp': datetime.now().isoformat()
        }

        if claim_id:
            metadata['claim_id'] = claim_id

        # Store in main CVFS
        self.engine.save_vector_to_file(evidence_id, vector, metadata)

        # Also store in evidence file
        with open(self.ctrm_evidence_file, 'a') as f:
            f.write(f"{evidence_id}|{json.dumps(vector)}|{json.dumps(metadata)}\n")

        return True

    def verify_truth_claim(self, claim_vector: List[float], claim_id: str = None) -> Dict[str, Any]:
        """
        Verify a truth claim using CTRM-CVFS vector operations
        Returns confidence score and verification result
        """
        if claim_id is None:
            claim_id = f"claim_{int(time.time())}"

        # Store the claim vector
        self.engine.save_vector_to_file(claim_id, claim_vector, {
            'claim_type': 'verification',
            'timestamp': datetime.now().isoformat()
        })

        # Load all truth vectors
        truth_vectors = self._load_ctrm_truth_vectors()

        if not truth_vectors:
            return {
                'claim_id': claim_id,
                'status': 'no_truth_base',
                'confidence': 0.0,
                'similarity': 0.0,
                'distance': float('inf'),
                'verification': 'UNVERIFIED'
            }

        # Calculate similarities and distances
        results = []
        for truth_id, truth_vector in truth_vectors.items():
            similarity = self.engine.v_fma_cosine(f"sim_{claim_id}_{truth_id}", claim_id, truth_id)
            distance = self.engine.v_l2_reduce(f"dist_{claim_id}_{truth_id}", claim_id, truth_id)

            # Calculate confidence score
            confidence = (self.confidence_weights['cosine'] * similarity) + \
                        (self.confidence_weights['l2'] * (1.0 / (1.0 + distance)))

            results.append({
                'truth_id': truth_id,
                'similarity': similarity,
                'distance': distance,
                'confidence': confidence
            })

        # Find best match
        best_match = max(results, key=lambda x: x['confidence'])

        # Determine verification status
        if best_match['confidence'] >= self.truth_threshold:
            verification = "TRUTH_CONFIRMED"
        elif best_match['confidence'] >= 0.8:
            verification = "LIKELY_TRUE"
        elif best_match['confidence'] >= 0.6:
            verification = "POSSIBLY_TRUE"
        else:
            verification = "UNVERIFIED"

        return {
            'claim_id': claim_id,
            'status': 'verified',
            'best_match': best_match['truth_id'],
            'similarity': best_match['similarity'],
            'distance': best_match['distance'],
            'confidence': best_match['confidence'],
            'verification': verification,
            'all_results': results
        }

    def _load_ctrm_truth_vectors(self) -> Dict[str, List[float]]:
        """Load all CTRM truth vectors"""
        vectors = {}
        try:
            with open(self.ctrm_vectors_file, 'r') as f:
                for line in f:
                    if line.startswith('#') or '|' not in line:
                        continue
                    parts = line.strip().split('|', 2)
                    if len(parts) >= 2:
                        vec_id = parts[0]
                        vector = json.loads(parts[1])
                        vectors[vec_id] = vector
        except:
            pass
        return vectors

    def semantic_truth_search(self, query_vector: List[float], top_k: int = 5) -> Dict[str, Any]:
        """
        Perform semantic search for truth verification
        """
        # Use the daemon's semantic search
        search_result = self.daemon.semantic_search(query_vector, top_k=top_k)

        # Enhance with CTRM-specific metadata
        enhanced_results = []
        for vec_id, distance in search_result['results']:
            # Load metadata
            metadata = self._load_vector_metadata(vec_id)

            enhanced_results.append({
                'vector_id': vec_id,
                'distance': distance,
                'metadata': metadata,
                'truth_score': self._calculate_truth_score(metadata)
            })

        # Sort by truth score
        enhanced_results.sort(key=lambda x: x['truth_score'], reverse=True)

        return {
            'query_id': search_result['query_id'],
            'results': enhanced_results,
            'method': search_result['method'],
            'vectors_searched': search_result['vectors_searched'],
            'ctrm_enhanced': True
        }

    def _load_vector_metadata(self, vector_id: str) -> Dict[str, Any]:
        """Load metadata for a vector"""
        try:
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if line.startswith(f"{vector_id}|"):
                        parts = line.strip().split('|', 2)
                        if len(parts) >= 3:
                            return json.loads(parts[2])
        except:
            pass
        return {}

    def _calculate_truth_score(self, metadata: Dict[str, Any]) -> float:
        """Calculate CTRM truth score from metadata"""
        if not metadata:
            return 0.5

        score = 0.5  # Default neutral score

        # Boost for verified truths
        if metadata.get('ctrm_truth_status') == 'verified':
            score += 0.3

        # Boost for reliable sources
        if metadata.get('source') in ['ctrm_system', 'reliable']:
            score += 0.1

        # Penalty for unverified
        if metadata.get('truth_status') == 'unverified':
            score -= 0.2

        return min(max(score, 0.0), 1.0)

    def run_ctrm_vpl_program(self, vpl_code: str, params: Dict[str, Any] = None) -> Any:
        """
        Run a CTRM-specific VPL program
        """
        if params is None:
            params = {}

        # Add CTRM-specific functions to params
        params['CTRM_TRUTH_THRESHOLD'] = self.truth_threshold

        return self.compiler.compile_and_run(vpl_code, params)

    def create_truth_verification_program(self, claim_vector: List[float], claim_id: str) -> str:
        """
        Create a CTRM truth verification VPL program
        """
        # Store the claim first
        self.engine.save_vector_to_file(claim_id, claim_vector)

        vpl_program = f"""
        # CTRM Truth Verification Program
        # Generated: {datetime.now().isoformat()}

        # Load claim vector
        claim = LOAD("{claim_id}")

        # Load truth vectors (this would be dynamic in real implementation)
        truth1 = LOAD("truth_1")
        truth2 = LOAD("truth_2")

        # Calculate similarities
        sim1 = COSINE(claim, truth1)
        sim2 = COSINE(claim, truth2)

        # Calculate distances
        dist1 = L2(claim, truth1)
        dist2 = L2(claim, truth2)

        # Calculate confidence scores
        conf1 = 0.7 * sim1 + 0.3 * (1.0 / (1.0 + dist1))
        conf2 = 0.7 * sim2 + 0.3 * (1.0 / (1.0 + dist2))

        # Determine result
        IF conf1 > CTRM_TRUTH_THRESHOLD OR conf2 > CTRM_TRUTH_THRESHOLD:
            RETURN "TRUTH_CONFIRMED"
        ELSE IF conf1 > 0.8 OR conf2 > 0.8:
            RETURN "LIKELY_TRUE"
        ELSE:
            RETURN "NEEDS_VERIFICATION"
        """

        return vpl_program

    def batch_verify_claims(self, claims: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """
        Batch verify multiple claims
        """
        results = []
        for claim in claims:
            claim_id = claim.get('claim_id', f"batch_claim_{len(results)}")
            claim_vector = claim['vector']

            verification_result = self.verify_truth_claim(claim_vector, claim_id)
            results.append({
                'claim_id': claim_id,
                'original_claim': claim,
                'verification': verification_result
            })

        return results

    def get_ctrm_vector_stats(self) -> Dict[str, Any]:
        """Get statistics about CTRM vector storage"""
        truth_count = self._count_vectors_in_file(self.ctrm_vectors_file)
        evidence_count = self._count_vectors_in_file(self.ctrm_evidence_file)
        total_count = self.daemon._count_vectors()

        return {
            'truth_vectors': truth_count,
            'evidence_vectors': evidence_count,
            'total_vectors': total_count,
            'truth_threshold': self.truth_threshold,
            'last_updated': datetime.now().isoformat()
        }

    def _count_vectors_in_file(self, filepath: str) -> int:
        """Count vectors in a specific file"""
        count = 0
        try:
            with open(filepath, 'r') as f:
                for line in f:
                    if line.strip() and not line.startswith('#') and '|' in line:
                        count += 1
        except:
            pass
        return count

    def optimize_ctrm_storage(self):
        """Run optimization for CTRM vector storage"""
        print("Running CTRM-CVFS optimization...")

        # Run standard CVFS optimization
        self.daemon.run_optimization_cycle()

        # CTRM-specific optimization
        self._optimize_ctrm_indexes()

        print("CTRM-CVFS optimization complete")

    def _optimize_ctrm_indexes(self):
        """Optimize CTRM-specific indexes"""
        # Rebuild HNSW for truth vectors if needed
        truth_count = self._count_vectors_in_file(self.ctrm_vectors_file)
        if truth_count > 50:
            print(f"Rebuilding HNSW index for {truth_count} truth vectors...")
            self.daemon.build_hnsw_index()
            self.engine.vcr['hnsw_built'] = True

        # Clean up old evidence vectors
        self._cleanup_old_evidence()

    def _cleanup_old_evidence(self):
        """Clean up old evidence vectors"""
        try:
            # Read all evidence lines
            with open(self.ctrm_evidence_file, 'r') as f:
                lines = f.readlines()

            # Filter out old evidence (keep last 1000)
            filtered_lines = []
            for line in lines:
                if line.startswith('#'):
                    filtered_lines.append(line)
                elif len(filtered_lines) < 1000:
                    filtered_lines.append(line)

            # Write back
            with open(self.ctrm_evidence_file, 'w') as f:
                f.writelines(filtered_lines)

        except:
            pass

    def get_ctrm_daemon_status(self) -> Dict[str, Any]:
        """Get current status of CTRM-CVFS daemon"""
        return {
            'queries_processed': self.daemon.queries_processed,
            'vector_count': self.daemon._count_vectors(),
            'truth_vectors': self._count_vectors_in_file(self.ctrm_vectors_file),
            'evidence_vectors': self._count_vectors_in_file(self.ctrm_evidence_file),
            'hnsw_built': self.engine.vcr.get('hnsw_built', False),
            'last_optimization': datetime.now().isoformat(),
            'truth_threshold': self.truth_threshold
        }

# Example usage and integration
def example_ctrm_cvfs_usage():
    """Example of how to use CTRM-CVFS integration"""
    print("=== CTRM-CVFS Integration Example ===")

    # Initialize integration
    cvfs_integration = CTRMCVFSIntegration("./example_ctrm_data")

    # Store some truth vectors
    truth_vectors = {
        "truth_1": [0.8, 0.7, 0.9, 0.6],
        "truth_2": [0.7, 0.8, 0.6, 0.9],
    }

    for truth_id, vector in truth_vectors.items():
        cvfs_integration.store_truth_vector(truth_id, vector, {
            'source': 'reliable',
            'category': 'factual'
        })
        print(f"Stored truth vector {truth_id}")

    # Verify a claim
    claim_vector = [0.75, 0.75, 0.75, 0.75]
    verification = cvfs_integration.verify_truth_claim(claim_vector, "test_claim_1")

    print(f"\nTruth verification result:")
    print(f"  Status: {verification['verification']}")
    print(f"  Confidence: {verification['confidence']:.4f}")
    print(f"  Similarity: {verification['similarity']:.4f}")
    print(f"  Distance: {verification['distance']:.4f}")

    # Run a CTRM VPL program
    vpl_program = cvfs_integration.create_truth_verification_program(claim_vector, "test_claim_1")
    vpl_result = cvfs_integration.run_ctrm_vpl_program(vpl_program)

    print(f"\nVPL program result: {vpl_result}")

    # Get system stats
    stats = cvfs_integration.get_ctrm_vector_stats()
    print(f"\nSystem stats: {stats}")

    return cvfs_integration

if __name__ == "__main__":
    # Run example
    example_ctrm_cvfs_usage()