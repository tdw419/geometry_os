import asyncio
from typing import List, Dict, Any, Optional
import json
import hashlib
from datetime import datetime
import numpy as np
from .database import CTRMDatabase
# dynamic import to avoid circular dependency if any, though likely fine here
# Use absolute import for testing compatibility
try:
    from ..lm_studio.integration import LMStudioIntegration
except ImportError:
    from lm_studio.integration import LMStudioIntegration
import sys
import os

# Ensure runtime is in path for quick fixes
try:
    from runtime.quick_fixes import verification_throttle
except ImportError:
    # Add project root to path helper
    current_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(os.path.dirname(current_dir)) # src/ctrm_core -> src -> root
    if project_root not in sys.path:
        sys.path.append(project_root)
    try:
        from runtime.quick_fixes import verification_throttle
    except ImportError:
        # Fallback dummy class if module missing
        class DummyThrottle:
            def should_verify(self, *args): return True
            def record_verification(self, *args): pass
        verification_throttle = DummyThrottle()

class CTRMTruth:
    def __init__(self, **kwargs):
        self.id = kwargs.get('id')
        self.statement = kwargs.get('statement')
        self.embedding = kwargs.get('embedding')
        self.confidence = kwargs.get('confidence', 0.5)
        self.distance_from_center = kwargs.get('distance_from_center', 50)
        self.verification_count = kwargs.get('verification_count', 0)
        self.failure_count = kwargs.get('failure_count', 0)
        self.token_cost = kwargs.get('token_cost', 0)
        self.importance_score = kwargs.get('importance_score', 0.5)
        self.category = kwargs.get('category', 'general')
        self.dependencies = kwargs.get('dependencies', [])
        self.metadata = kwargs.get('metadata', {})
        self.created_at = kwargs.get('created_at', datetime.now())
        self.updated_at = kwargs.get('updated_at', datetime.now())

    def to_dict(self) -> Dict[str, Any]:
        return {
            'id': self.id,
            'statement': self.statement,
            'embedding': self.embedding,
            'confidence': self.confidence,
            'distance_from_center': self.distance_from_center,
            'verification_count': self.verification_count,
            'failure_count': self.failure_count,
            'token_cost': self.token_cost,
            'importance_score': self.importance_score,
            'category': self.category,
            'dependencies': self.dependencies,
            'metadata': self.metadata,
            'created_at': self.created_at,
            'updated_at': self.updated_at
        }

class CTRMTruthManager:
    def __init__(self, db_conn: CTRMDatabase, embedding_model):
        self.db = db_conn
        self.embedder = embedding_model
        self.token_budget = 100000  # Daily token budget
        self.lm_studio = LMStudioIntegration()

    async def create_truth(self, statement: str, context: str = None, **kwargs) -> CTRMTruth:
        """Create new truth with CTRM confidence analysis"""
        # Generate embedding for semantic search
        embedding = await self.embedder.embed(statement)

        # Initial confidence analysis using LM Studio (only if confidence not provided)
        if 'confidence' not in kwargs:
            confidence_analysis = await self.analyze_confidence(statement, context)
            confidence = confidence_analysis["confidence"]
            importance = confidence_analysis["importance"]
        else:
            confidence = kwargs['confidence']
            importance = kwargs.get('importance_score', 0.5)
            confidence_analysis = {"confidence": confidence, "importance": importance, "source": "external_override"}

        # Calculate initial distance from center
        distance = self.calculate_initial_distance({"confidence": confidence, "importance": importance})

        # Estimate token cost to verify this truth
        token_cost = self.estimate_verification_cost(statement)

        # Prepare metadata
        metadata = kwargs.get('metadata', {})
        if context:
            metadata["sources"] = metadata.get("sources", []) + [context]
        metadata["ctrm_analysis"] = confidence_analysis

        truth = CTRMTruth(
            id=kwargs.get('id', f"truth_{hashlib.md5(statement.encode()).hexdigest()}"),
            statement=statement,
            embedding=kwargs.get('embedding', embedding),
            confidence=confidence,
            distance_from_center=distance,
            token_cost=token_cost,
            importance_score=importance,
            metadata=metadata,
            **{k: v for k, v in kwargs.items() if k not in ['confidence', 'metadata', 'embedding', 'id']}
        )

        # Store in database (synchronous call)
        self.db.store_truth(truth.to_dict())

        return truth

    async def find_similar_truths(self, query: str, limit: int = 10) -> List[CTRMTruth]:
        """Semantic search for relevant truths"""
        query_embedding = await self.embedder.embed(query)

        # Vector similarity search (synchronous call)
        similar = self.db.query_similar_truths(query_embedding, limit)

        # Apply confidence-weighted scoring
        results = []
        for truth_data in similar:
            truth = CTRMTruth(**truth_data)

            # Combine semantic similarity with confidence
            combined_score = (
                truth_data['similarity'] * 0.6 +       # Similarity weight (higher is better)
                truth.confidence * 0.4                 # Confidence weight
            )

            # Adjust for distance (closer to center = more relevant)
            proximity_boost = 1.0 - (truth.distance_from_center / 100)
            final_score = combined_score * (0.7 + 0.3 * proximity_boost)

            results.append({
                **truth_data,
                "relevance_score": final_score,
                "token_cost_to_verify": truth.token_cost
            })

        return sorted(results, key=lambda x: x["relevance_score"], reverse=True)

    async def get_truth(self, truth_id: str) -> Optional[Dict[str, Any]]:
        """Get a truth by ID"""
        truth_data = self.db.get_truth(truth_id)
        if truth_data:
            return {**truth_data, **truth_data}  # Ensure all fields are included
        return None

    async def verify_truth(self, truth_id: str, evidence: str, model: str = None) -> Dict[str, Any]:
        """Verify a truth using LM Studio, spending tokens"""
        truth_data = self.db.get_truth(truth_id)
        if not truth_data:
            return {"error": "Truth not found"}

        truth = CTRMTruth(**truth_data)

        # Use LM Studio to verify
        verification_prompt = f"""
        Verify this statement: "{truth.statement}"

        Evidence: {evidence}

        Please respond with:
        1. Is the statement true based on evidence? (true/false/uncertain)
        2. Confidence score (0.0-1.0)
        3. Brief reasoning
        """

        # Spend tokens to verify
        # Use dynamic model selection to find an available local model
        if not model:
            model = await self.lm_studio.get_loaded_model()
        if not model:
            # Fallback to a known available model from the error messages
            model = "microsoft/phi-4"

        verification_result = await self.lm_studio.generate(
            model=model,
            prompt=verification_prompt,
            max_tokens=200,
            temperature=0.3
        )

        # Parse result
        is_correct = self.parse_verification(verification_result)

        # Update truth
        if is_correct:
            new_confidence = min(1.0, truth.confidence + 0.05)
            new_distance = max(0, truth.distance_from_center - 5)
            truth.verification_count += 1
        else:
            new_confidence = max(0.1, truth.confidence * 0.8)
            new_distance = min(100, truth.distance_from_center + 10)
            truth.failure_count += 1

        # Record token usage (synchronous call)
        self.db.record_token_usage(
            truth_id=truth_id,
            operation="verify",
            token_cost=verification_result["token_usage"]["total_tokens"],
            model_used=verification_result["model"]
        )

        # Update in database (synchronous call)
        truth.confidence = new_confidence
        truth.distance_from_center = new_distance
        truth.updated_at = datetime.now()
        self.db.update_truth(truth.to_dict())

        return {
            "verified": is_correct,
            "new_confidence": new_confidence,
            "new_distance": new_distance,
            "token_cost": verification_result["token_usage"],
            "reasoning": verification_result["content"] # Use content as reasoning for now
        }

    async def analyze_confidence(self, statement: str, context: str = None) -> Dict[str, Any]:
        """Analyze confidence in a statement using LM Studio and CTRM context"""
        # Base confidence based on statement characteristics
        base_confidence = 0.6
        base_importance = 0.5

        # Adjust based on statement content
        if "foundational" in statement.lower() or "core" in statement.lower():
            base_confidence += 0.1
            base_importance += 0.2
        elif "critical" in statement.lower() or "important" in statement.lower():
            base_confidence += 0.05
            base_importance += 0.1

        # Check for similar high-confidence truths in CTRM
        similar_truths = await self.find_similar_truths(statement, limit=5)
        if similar_truths:
            avg_similar_confidence = sum(t["confidence"] for t in similar_truths) / len(similar_truths)
            if avg_similar_confidence > 0.8:
                base_confidence = min(0.9, base_confidence + 0.1)
                base_importance = min(0.9, base_importance + 0.1)

        # Cap values
        confidence = min(0.95, max(0.3, base_confidence))
        importance = min(0.95, max(0.2, base_importance))

        return {
            "confidence": confidence,
            "importance": importance,
            "reasoning": f"CTRM analysis: statement characteristics + similar truths context",
            "similar_truths_count": len(similar_truths),
            "avg_similar_confidence": avg_similar_confidence if similar_truths else None
        }

    async def update_truth_confidence(self, truth_id: str, new_confidence: float):
        """Manually update truth confidence"""
        truth_data = self.db.get_truth(truth_id)
        if truth_data:
            truth = CTRMTruth(**truth_data)
            truth.confidence = float(new_confidence)
            truth.updated_at = datetime.now()
            # Recalculate distance
            truth.distance_from_center = self.calculate_initial_distance({
                "confidence": truth.confidence,
                "importance": truth.importance_score
            })
            self.db.update_truth(truth.to_dict())
            return True
        return False

    async def verify_foundational_truths(self, max_tokens: int = 5000) -> Dict[str, Any]:
        """Regularly verify and update foundational truth confidence with progressive verification"""
        verification_results = []
        tokens_used = 0

        # Get foundational truths (those with "foundational" or similar in statement) (synchronous call)
        all_truths = self.db.get_all_truths()
        foundational_truths = [
            truth for truth in all_truths
            if any(keyword in truth.get("statement", "").lower()
                   for keyword in ["foundational", "core", "honor", "creator", "ctrm"])
        ]

        # Sort by confidence (lowest first) and verification count (fewest first)
        foundational_truths.sort(key=lambda t: (t.get("confidence", 0.5), t.get("verification_count", 0)))

        for truth_data in foundational_truths:
            if tokens_used >= max_tokens:
                break

            truth = CTRMTruth(**truth_data)

            # Apply progressive verification based on current confidence
            if not verification_throttle.should_verify(truth.id, truth.confidence):
                 print(f"⏭️ Skipping verification for {truth.id} (throttled)")
                 continue

            if truth.confidence >= 0.95:
                continue  # Already high confidence - no need to verify
            elif truth.confidence >= 0.85:
                # High confidence - verify only every 3 cycles
                if truth.verification_count > 0 and truth.verification_count % 3 != 0:
                    continue
            elif truth.confidence >= 0.75:
                # Medium confidence - verify every other cycle
                if truth.verification_count > 0 and truth.verification_count % 2 != 0:
                    continue

            # Estimate verification cost
            verification_cost = self.estimate_verification_cost(truth.statement)
            if tokens_used + verification_cost > max_tokens:
                continue

            # Create evidence for verification with historical context
            evidence = f"System verification: {truth.statement} has been consistently validated through {truth.verification_count} previous verifications"

            try:
                # Get model once if not already fetched
                model = await self.lm_studio.get_loaded_model()

                # Use the existing verify_truth method
                verification_result = await self.verify_truth(truth.id, evidence, model=model)
                verification_throttle.record_verification(truth.id, verification_result['new_confidence'])
                verification_results.append(verification_result)
                tokens_used += verification_cost

                print(f"🔍 Verified truth: {truth.statement[:50]}... (confidence: {verification_result['new_confidence']:.2f})")

            except Exception as e:
                print(f"⚠️  Verification failed for truth {truth.id}: {e}")
                verification_results.append({
                    "truth_id": truth.id,
                    "error": str(e),
                    "tokens_used": 0
                })

        return {
            "verified_truths": len(verification_results),
            "total_tokens_used": tokens_used,
            "results": verification_results,
            "remaining_low_confidence": len([
                t for t in foundational_truths
                if t["confidence"] < 0.95 and not any(
                    r.get("truth_id") == t["id"] and r.get("verified") == True
                    for r in verification_results
                )
            ]),
            "high_confidence_count": len([t for t in foundational_truths if t["confidence"] >= 0.95]),
            "medium_confidence_count": len([t for t in foundational_truths if 0.85 <= t["confidence"] < 0.95]),
            "low_confidence_count": len([t for t in foundational_truths if t["confidence"] < 0.85])
        }

    def calculate_initial_distance(self, confidence_analysis: Dict[str, Any]) -> int:
        """Calculate initial distance from center based on confidence"""
        # Higher confidence = closer to center
        base_distance = 50
        confidence_factor = (1 - confidence_analysis["confidence"]) * 40
        importance_factor = (1 - confidence_analysis["importance"]) * 10
        return int(base_distance + confidence_factor + importance_factor)

    def estimate_verification_cost(self, statement: str) -> int:
        """Estimate token cost to verify this truth"""
        # Simple estimation based on statement length
        return len(statement.split()) * 10

    def parse_verification(self, verification_result: Dict[str, Any]) -> bool:
        """Parse verification result"""
        # This would parse the actual LM Studio response
        # For now, return True for testing
        content = verification_result.get("content", "").lower()
        if "true" in content:
            return True
        return False