import asyncio
import json
import random
import time
from typing import Dict, Any, List
from datetime import datetime
from ctrm_core.database import CTRMDatabase
from ctrm_core.truth_manager import CTRMTruthManager
from token_manager.token_manager import TokenManager
from evolution.evolution_daemon import TokenAwareEvolutionDaemon
from lm_studio.integration import VectorModelRouter, CTRMPromptOptimizer, LMStudioIntegration
from vector_llm_tools.vector_analytics import VectorAnalyticsForLLMs
from vector_llm_tools.vector_qa import VectorQAForLLMs
from vector_llm_tools.vector_evolution_tracker import VectorEvolutionTracker
from vector_llm_tools.vector_protocol import LLMVectorProtocol
from vector_llm_tools.vector_space_mapper import VectorSpaceMapper
from vector_llm_tools.vector_interface import CTRMVectorInterface
from vfs.vector_file_system_pure import VectorFileSystemPure
from vfs.vector_file_system_cvfs import VectorFileSystemCVFS
from vfs.vector_file_system_cvfs import VectorFileSystemCVFS
from code_health_monitor import CodeHealthMonitorDaemon, integrate_code_health_monitoring
import sys
import os

# Ensure runtime is in path for quick fixes
try:
    from runtime.quick_fixes import emergency_cache, smart_cache, verification_throttle
except ImportError:
    # Add project root to path helper
    current_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(os.path.dirname(current_dir)) # src -> root
    if project_root not in sys.path:
        sys.path.append(project_root)
    try:
        from runtime.quick_fixes import emergency_cache, smart_cache, verification_throttle
    except ImportError:
        print("⚠️  Warning: runtime.quick_fixes not found, using dummies")
        class Dummy:
            def check_query(self, *args): return False
            def get(self, *args): return None
            def get_stats(self): return {}
            def should_verify(self, *args): return True
            def record_verification(self, *args): pass
        emergency_cache = Dummy()
        smart_cache = Dummy()
        verification_throttle = Dummy()

class MockEmbedder:
    """Mock embedding model for testing"""
    async def embed(self, text: str) -> list:
        # Simple mock embedding - in reality this would use a proper embedding model
        import numpy as np
        import hashlib

        # Create a deterministic "embedding" based on text hash
        hash_obj = hashlib.md5(text.encode())
        hash_int = int(hash_obj.hexdigest(), 16)

        # Create a 768-dimensional vector (consistent with system requirements)
        # Use a larger modulus to avoid collisions (was 1000)
        np.random.seed(hash_int % 2**32) 
        vec = np.random.randn(768)
        norm = np.linalg.norm(vec)
        if norm > 0:
            vec = vec / norm
        return list(vec)

class CTRMLLMOSDaemon:
    def __init__(self):
        self.embedder = MockEmbedder()
        self.db = CTRMDatabase("data/ctrm_llm_os.db")
        self.ctrm = CTRMTruthManager(self.db, self.embedder)
        self.token_manager = TokenManager()
        self.lm_studio = LMStudioIntegration()
        self.model_router = VectorModelRouter(self.ctrm)
        self.prompt_optimizer = CTRMPromptOptimizer(self.ctrm)
        self.evolution_daemon = TokenAwareEvolutionDaemon(self.ctrm, self.token_manager, self.lm_studio)

        # Initialize LLM-optimized vector tools
        self.vector_analytics = VectorAnalyticsForLLMs(self.ctrm, self.lm_studio)
        self.vector_qa = VectorQAForLLMs(self.ctrm, self.lm_studio)
        self.vector_evolution = VectorEvolutionTracker(self.ctrm, self.lm_studio, self.db)
        self.vector_protocol = LLMVectorProtocol(
            self.ctrm, self.lm_studio,
            self.vector_analytics, self.vector_qa, self.vector_evolution
        )
        self.vector_mapper = VectorSpaceMapper(self.ctrm, self.lm_studio, self.db)
        self.vector_interface = CTRMVectorInterface(
            self.ctrm, self.lm_studio, self.db,
            self.vector_analytics, self.vector_qa,
            self.vector_evolution, self.vector_protocol,
            self.vector_mapper
        )

        # Initialize Vector File System (after database initialization)
        self.vfs = None

        # Initialize with foundational truths
        self.foundational_truths = [
            "We develop this system to honor our Creator",
            "CTRM provides the knowledge management framework",
            "Token efficiency is critical for sustainable operation",
            "Architectural stability is more important than novelty",
            "Validation must precede deployment of changes"
        ]

    async def initialize(self):
        """Initialize system with foundational truths"""
        print("🚀 Initializing CTRM-Powered LLM OS")

        # Initialize database (synchronous call)
        self.db.initialize()

        # Load or create foundational truths
        for truth_statement in self.foundational_truths:
            existing = await self.ctrm.find_similar_truths(truth_statement, limit=1)
            # Only create if it doesn't exist. If it exists but low confidence, we'll verify it later.
            if not existing:
                foundational_truth = await self.ctrm.create_truth(
                    statement=truth_statement,
                    context="system_foundation",
                    confidence=0.85 # Set high initial confidence for foundational truths
                )
                print(f"  📜 {foundational_truth.statement} (confidence: {foundational_truth.confidence:.2f})")
            else:
                print(f"  📜 {existing[0]['statement']} (confidence: {existing[0]['confidence']:.2f})")

        # Initialize token budget
        await self.token_manager.reset_daily_budget()

        # Initialize Pure Vector File System (no database dependency)
        # Use CVFS backend for LDB-V ISA support
        self.vfs = VectorFileSystemCVFS(
            self.ctrm, self.vector_interface, self.lm_studio, data_dir="data/cvfs_storage"
        )

        print("✅ CTRM LLM OS initialized")

    async def run_continual_evolution(self):
        """Main daemon loop with adaptive evolution triggers"""
        print("🔄 Starting continual evolution loop")

        while True:
            await self.token_manager.reset_daily_budget()

            # Get current system metrics for adaptive decision making
            efficiency_status = await self.token_manager.get_efficiency_status()
            budget_status = await self.token_manager.get_budget_status()

            # Check if we should verify foundational truths first (with adaptive frequency)
            should_verify = self.should_verify_foundational_truths(efficiency_status)

            # Adaptive evolution trigger: Check if we should run evolution based on system state
            should_run_evolution = await self.should_run_evolution_cycle(efficiency_status, budget_status)

            if should_verify and await self.token_manager.has_budget_for("verification", 2000):
                print("🔍 Checking foundational truth confidence...")
                verification_result = await self.ctrm.verify_foundational_truths(max_tokens=3000)
                print(f"🔍 Verified {verification_result['verified_truths']} truths, used {verification_result['total_tokens_used']} tokens")

            # Check token budget for evolution
            if not await self.token_manager.has_budget_for("evolution", 2000):
                print("⏸️  Evolution paused - insufficient token budget")
                await asyncio.sleep(300)  # Wait 5 minutes
                continue

            # Only execute evolution if adaptive trigger allows it
            if not should_run_evolution:
                print("🎯 Skipping evolution cycle - adaptive trigger conditions not met")
                sleep_time = self.calculate_sleep_time({"status": "skipped"}, efficiency_status)
                print(f"💤 Sleeping for {sleep_time} seconds before next check")
                await asyncio.sleep(sleep_time)
                continue

            # Execute evolution cycle
            evolution_result = await self.evolution_daemon.execute_evolution_cycle()

            # Consult Gemini every 10 cycles (with adaptive frequency based on efficiency)
            if self.evolution_daemon.cycle_counter % max(5, 10 - int(efficiency_status.get("efficiency_ratio", 0) * 5)) == 0:
                await self.consult_gemini(f"cycle_{self.evolution_daemon.cycle_counter}")

            # Log with CTRM analysis
            evolution_truth = await self.ctrm.create_truth(
                statement=f"Evolution cycle {evolution_result.get('cycle_id', 'N/A')}: {evolution_result.get('status', 'N/A')}",
                context=json.dumps(evolution_result, default=self._json_serializer)
            )

            # Update system state based on results
            if evolution_result.get("status") == "completed":
                await self.update_system_state(evolution_result)

            # Check efficiency and adjust sleep time
            efficiency_status = await self.token_manager.get_efficiency_status()
            sleep_time = self.calculate_sleep_time(evolution_result, efficiency_status)
            print(f"💤 Sleeping for {sleep_time} seconds before next evolution cycle")
            print(f"📊 Efficiency: {efficiency_status.get('average_efficiency', 0):.6f}, Conservation: {efficiency_status.get('conservation_mode', False)}")
            print(f"🎯 Efficiency Health: {efficiency_status.get('efficiency_health_score', 0):.2f}")
            print(f"💡 Recommendations: {', '.join(efficiency_status.get('recommendations', []))}")
            await asyncio.sleep(sleep_time)

    @staticmethod
    def _json_serializer(obj):
        """Convert non-serializable objects (like datetimes) to JSON-safe values."""
        if isinstance(obj, datetime):
            return obj.isoformat()
        if hasattr(obj, "to_dict"):
            return obj.to_dict()
        return str(obj)

    async def process_vfs_operation(self, operation: str, **kwargs) -> Dict[str, Any]:
        """Process VFS operations"""
        print(f"🗃️ Processing VFS operation: {operation}")

        if operation == "list":
            return await self.vfs.vfs_list(**kwargs)
        elif operation == "read":
            return await self.vfs.vfs_read(**kwargs)
        elif operation == "write":
            return await self.vfs.vfs_write(**kwargs)
        elif operation == "search":
            return await self.vfs.vfs_search(**kwargs)
        elif operation == "analyze":
            return await self.vfs.vfs_analyze_space()
        elif operation == "optimize":
            return await self.vfs.vfs_optimize()
        elif operation == "health":
            return await self.vfs.vfs_health_check()
        elif operation == "graph":
            return await self.vfs.vfs_get_knowledge_graph(**kwargs)
        else:
            return {"error": f"Unknown VFS operation: {operation}"}

    async def process_user_query(self, query: str, model: str = "default") -> Dict[str, Any]:
        """Process user query with CTRM-enhanced pipeline and duplicate prevention"""
        # EMERGENCY FIX: Check for duplicate queries first
        if emergency_cache.check_query(query):
            print(f"🛑 BLOCKED DUPLICATE: {query[:50]}... (saved ~500 tokens)")
            return {
                "response": "Query skipped (recent duplicate detected)",
                "blocked": True,
                "reason": "Duplicate query detected",
                "tokens_saved": 500,
                "cache_stats": emergency_cache.get_stats()
            }

        # SMART CACHE: Check if we have a cached response
        cached_response = smart_cache.get(query)
        if cached_response:
            print(f"💾 Cache hit! Saved ~500 tokens")
            return {
                **cached_response,
                "from_cache": True,
                "cache_stats": smart_cache.get_stats()
            }

        print(f"� Processing query: {query[:50]}...")

        # 0. System context reset for large queries
        if len(query) > 500:  # Large query detected
            print("⚠️  Large query detected, resetting system context")
            # Clear accumulated context by creating a fresh prompt optimizer
            self.prompt_optimizer = CTRMPromptOptimizer(self.ctrm)

        # 1. Route to best model using vector similarity
        if model == "default":
            routing = await self.model_router.route_to_best_model(query, {})
            model_to_use = routing["model"]
            routing_confidence = routing['confidence']
            print(f"🎯 Routed to model: {model_to_use} (confidence: {routing_confidence:.2f})")
        else:
            model_to_use = model
            routing_confidence = 1.0
            print(f"🎯 Using specified model: {model_to_use}")

        # 1.5. Pre-optimization context validation
        context_length = self.lm_studio.get_model_context_length(model_to_use)
        base_query_tokens = self.lm_studio.estimate_token_count(query)

        # If the base query is already too large, truncate it before optimization
        if base_query_tokens > context_length * 0.6:  # More than 60% of context
            print(f"⚠️  Base query too large: {base_query_tokens} tokens vs {context_length} limit")
            # Apply aggressive truncation to the base query
            max_query_words = int((context_length * 0.4) / 1.3)  # Target 40% of context
            query_words = query.split()
            truncated_query = " ".join(query_words[-max_query_words:])  # Keep end of query
            print(f"⚠️  Pre-truncated query from {len(query_words)} to {len(truncated_query.split())} words")
            query = truncated_query

        # 2. Optimize prompt using CTRM truths (with constrained context)
        optimized_prompt = await self.prompt_optimizer.optimize_prompt(
            base_prompt=query,
            objective="answer user query"
        )
        print(f"📝 Optimized prompt (length: {len(optimized_prompt)} chars)")

        # 3. Post-optimization context validation
        estimated_prompt_tokens = self.lm_studio.estimate_token_count(optimized_prompt)

        if estimated_prompt_tokens > context_length * 0.8:  # More than 80% of context
            print(f"⚠️  Optimized prompt too large: {estimated_prompt_tokens} tokens vs {context_length} limit")
            # Apply final truncation to ensure it fits
            max_prompt_words = int((context_length * 0.7) / 1.3)  # Target 70% of context
            prompt_words = optimized_prompt.split()
            truncated_prompt = "[Context truncated] ... " + " ".join(prompt_words[-max_prompt_words:])
            optimized_prompt = truncated_prompt
            print(f"⚠️  Post-truncated prompt to {len(truncated_prompt.split())} words")

        # 4. Check token budget for inference
        estimated_tokens = estimated_prompt_tokens + 1000  # Prompt + response estimate

        if not await self.token_manager.spend_tokens("inference", int(estimated_tokens)):
            return {
                "error": "Inference budget exceeded",
                "suggestion": "Try again later or simplify query"
            }

        # 5. Execute query with LM Studio (context management handled internally)
        try:
            response = await self.lm_studio.generate(
                model=model_to_use,
                prompt=optimized_prompt,
                temperature=0.7,
                max_tokens=min(1000, context_length // 4)  # Limit response to 25% of context
            )
        except Exception as e:
            return {
                "error": f"Query processing failed: {str(e)}",
                "suggestion": "The query may be too complex for the current model context window"
            }

        # 5. Create CTRM truth for this interaction
        interaction_truth = await self.ctrm.create_truth(
            statement=f"User query processed: {query[:50]}...",
            context=json.dumps({
                "query": query,
                "model_used": model_to_use,
                "routing_confidence": routing_confidence,
                "response_length": len(response["content"]),
                "token_usage": response["token_usage"]
            })
        )

        # 6. Update model performance in CTRM
        await self.update_model_performance(
            model=model_to_use,
            query_type=self.classify_query(query),
            quality_score=self.rate_response_quality(query, response["content"]),
            token_efficiency=len(response["content"]) / response["token_usage"]["completion_tokens"]
        )

        return {
            "response": response["content"],
            "model": model_to_use,
            "routing_confidence": routing_confidence,
            "tokens_used": response["token_usage"],
            "ctrm_truth_id": interaction_truth.id
        }

    async def process_vector_operation(self, operation: str, **kwargs) -> Dict[str, Any]:
        """Process vector operations using LLM-optimized tools"""
        print(f"🔢 Processing vector operation: {operation}")

        # Route to appropriate vector tool
        if operation == "store_vector":
            return await self.vector_interface.llm_store_vector(**kwargs)
        elif operation == "find_similar":
            return await self.vector_interface.llm_find_similar_vectors(**kwargs)
        elif operation == "analyze_space":
            return await self.vector_interface.llm_analyze_vector_space(**kwargs)
        elif operation == "track_evolution":
            return await self.vector_interface.track_vector_evolution(**kwargs)
        else:
            # Use vector protocol for other operations
            return await self.vector_interface.llm_vector_operation(operation, **kwargs)

    async def analyze_query_vectors(self, query: str) -> Dict[str, Any]:
        """Analyze vectors related to a user query"""
        print(f"🔍 Analyzing vectors for query: {query[:50]}...")

        # Generate embedding for the query
        model = await self.lm_studio.get_loaded_model()
        if not model:
            return {"error": "No LLM model available for vector analysis"}

        # Generate query embedding
        query_embedding = await self.lm_studio.generate_embedding(model, query)

        # Store the query vector
        query_vector_result = await self.vector_interface.llm_store_vector(
            vector=query_embedding,
            metadata={
                "source": "user_query",
                "description": f"User query: {query[:100]}...",
                "source_llm": model,
                "query_type": self.classify_query(query)
            }
        )

        # Find similar vectors
        similar_vectors = await self.vector_interface.llm_find_similar_vectors(
            query_vector=query_embedding,
            min_similarity=0.6,
            limit=5
        )

        # Analyze the query vector
        vector_analysis = await self.vector_analytics.analyze_vector_for_llm(
            query_embedding, model
        )

        # Create CTRM truth about this analysis
        analysis_truth = await self.ctrm.create_truth(
            statement=f"Query vector analysis: {query[:50]}...",
            confidence=vector_analysis["confidence"],
            vector=query_embedding,
            metadata={
                "query": query,
                "vector_analysis": vector_analysis,
                "similar_vectors": similar_vectors,
                "query_vector_hash": query_vector_result["vector_hash"],
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "query_vector": query_vector_result,
            "similar_vectors": similar_vectors,
            "vector_analysis": vector_analysis,
            "ctrm_truth_id": analysis_truth.id,
            "recommendations": self.get_vector_recommendations(vector_analysis, similar_vectors)
        }

    async def consult_gemini(self, cycle_id: str):
        """Consult Gemini CLI for high-level guidance"""
        print(f"🤖 Consulting Gemini CLI for {cycle_id}...")

        prompt = f"System report: Evolution cycle {cycle_id} complete. System operating within parameters. Provide strategic guidance for next 10 cycles."

        try:
            proc = await asyncio.create_subprocess_exec(
                "gemini", prompt,
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE
            )
            stdout, stderr = await proc.communicate()

            if proc.returncode == 0:
                response = stdout.decode().strip()
                print(f"🤖 Gemini Advice: {response[:100]}...")

                await self.ctrm.create_truth(
                    statement=f"Gemini Strategic Guidance ({cycle_id}): {response[:50]}...",
                    context=json.dumps({
                        "source": "gemini_cli",
                        "full_response": response,
                        "cycle_id": cycle_id
                    }),
                    confidence=0.9
                )
            else:
                print(f"⚠️ Gemini CLI failed: {stderr.decode()}")

        except Exception as e:
            print(f"⚠️ Error calling Gemini CLI: {e}")

    def get_vector_recommendations(self, vector_analysis: Dict, similar_vectors: Dict) -> List[str]:
        """Get recommendations based on vector analysis"""
        recommendations = []

        # Quality-based recommendations
        quality_score = self.get_quality_safe(vector_analysis, 0.5)
        if quality_score < 0.6:
            recommendations.append("query_vector_quality_low")

        # Similarity-based recommendations
        if similar_vectors["found_count"] == 0:
            recommendations.append("no_similar_vectors_found")
        elif similar_vectors["found_count"] >= 3:
            recommendations.append("strong_similarity_pattern_detected")

        # Semantic recommendations
        primary_concepts = vector_analysis.get("primary_concepts", [])
        if primary_concepts:
            recommendations.append(f"focus_on_{primary_concepts[0]['concept']}")

        return recommendations

    async def enhance_evolution_with_vectors(self):
        """Enhance evolution system with vector analysis"""
        print("🔄 Enhancing evolution with vector analysis")

        # Analyze current vector space
        space_analysis = await self.vector_interface.llm_analyze_vector_space()

        # Get evolution patterns
        evolution_patterns = await self.vector_evolution.find_evolution_patterns()

        # Create comprehensive vector-enhanced evolution analysis
        vector_evolution_truth = await self.ctrm.create_truth(
            statement=f"Vector-enhanced evolution analysis: {space_analysis['space_analysis']['vector_count']} vectors analyzed",
            confidence=0.9,
            metadata={
                "space_analysis": space_analysis,
                "evolution_patterns": evolution_patterns,
                "vector_quality": space_analysis["space_analysis"]["quality_trends"],
                "coverage_score": space_analysis["space_analysis"]["coverage_score"],
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "space_analysis": space_analysis,
            "evolution_patterns": evolution_patterns,
            "ctrm_truth_id": vector_evolution_truth.id,
            "recommendations": self.get_evolution_recommendations(space_analysis, evolution_patterns)
        }

    def get_evolution_recommendations(self, space_analysis: Dict, evolution_patterns: Dict) -> List[str]:
        """Get evolution recommendations based on vector analysis"""
        recommendations = []

        # Space coverage recommendations
        if space_analysis["space_analysis"]["coverage_score"] < 0.4:
            recommendations.append("expand_vector_space_coverage")

        # Quality recommendations
        if space_analysis["space_analysis"]["quality_trends"]["average_quality"] < 0.7:
            recommendations.append("improve_vector_quality")

        # Pattern recommendations
        if evolution_patterns["total_patterns"] < 3:
            recommendations.append("encourage_more_evolution_patterns")

        return recommendations

    async def update_system_state(self, evolution_result: Dict[str, Any]):
        """Update system state based on evolution results"""
        # This would update various system components
        print(f"🔧 Updated system state based on evolution {evolution_result['cycle_id']}")

    def should_verify_foundational_truths(self, efficiency_status: Dict[str, Any]) -> bool:
        """Determine if foundational truths should be verified based on efficiency"""
        if not efficiency_status or efficiency_status.get("status") == "no_data":
            return True  # Always verify if no data

        avg_efficiency = efficiency_status.get("average_efficiency", 0)
        conservation_mode = efficiency_status.get("conservation_mode", False)

        # Verify more frequently when efficiency is good
        if avg_efficiency > 0.001:  # High efficiency
            return True
        elif avg_efficiency > 0.0005:  # Medium efficiency
            # Verify every other cycle
            return self.evolution_daemon.cycle_counter % 2 == 0
        else:  # Low efficiency
            # Verify only every 5 cycles
            return self.evolution_daemon.cycle_counter % 5 == 0

    async def should_run_evolution_cycle(self, efficiency_status: Dict[str, Any], budget_status: Dict[str, Any]) -> bool:
        """Determine if evolution cycle should run based on adaptive triggers"""
        # OVERRIDE: Check for catalyst - FORCE RUN
        if os.path.exists("vfs_catalyst.txt"):
            print("🚀 Catalyst detected! Forcing evolution cycle.")
            return True

        if not self.config.get("adaptive_evolution", True):
            return True

        # Always run if we have high efficiency
        avg_efficiency = efficiency_status.get("average_efficiency", 0)
        if avg_efficiency > 0.001:  # High efficiency - run frequently
            return True

        # Check conservation mode
        if efficiency_status.get("conservation_mode", False):
            # In conservation mode, only run if we have critical needs
            remaining_budget = budget_status.get("remaining", 0)
            if remaining_budget < 10000:  # Low budget - skip
                return False

        # Check efficiency health score
        health_score = efficiency_status.get("efficiency_health_score", 0)
        if health_score < 0.3:  # Very poor health - skip to conserve resources
            return False

        # OVERRIDE: Check for catalyst


        # Check recent trend
        recent_trend = efficiency_status.get("recent_trend", "stable")
        # Use dynamic efficiency threshold from TokenEfficiencyTracker
        efficiency_threshold = token_manager.efficiency_tracker.low_efficiency_threshold
        if recent_trend == "declining" and avg_efficiency < efficiency_threshold:
            # Declining efficiency with already low performance - skip
            print(f"⚠️  Declining efficiency trend detected: {avg_efficiency:.6f} < {efficiency_threshold:.6f}")
            return False

        # Default: run evolution cycle
        return True

    def calculate_sleep_time(self, evolution_result: Dict[str, Any], efficiency_status: Dict[str, Any] = None) -> int:
        """Calculate adaptive sleep time based on evolution efficiency and system status"""
        base_sleep = 5  # Base sleep time

        # Adjust based on evolution result
        if evolution_result.get("status") == "completed":
            base_sleep = 5
        elif evolution_result.get("status") == "skipped":
            base_sleep = 5  # Reduced from 10
        else:
            base_sleep = 5  # Reduced from 10

        # Adjust based on efficiency with more granular thresholds
        if efficiency_status:
            avg_efficiency = efficiency_status.get("average_efficiency", 0)
            conservation_mode = efficiency_status.get("conservation_mode", False)
            
            if conservation_mode:
                base_sleep = max(15, base_sleep * 2)  # Sleep slightly longer in conservation mode (Reduced from 30/4x)
            elif avg_efficiency > 0.002:  # Excellent efficiency
                base_sleep = max(2, base_sleep * 0.5)  # Sleep much less when very efficient
            elif avg_efficiency > 0.001:  # Good efficiency
                base_sleep = max(3, base_sleep * 0.7)  # Sleep less when efficient
            elif avg_efficiency > 0.0005:  # Medium efficiency
                base_sleep = base_sleep  # Keep base sleep
            elif avg_efficiency > 0.0001:  # Poor efficiency
                base_sleep = min(10, base_sleep * 1.5)  # Reduced max to 10
            else:  # Very poor efficiency
                base_sleep = min(15, base_sleep * 2)  # Reduced max to 15 (Matches user request)
        
        # Add random jitter to prevent synchronization issues
        jitter = random.uniform(0.8, 1.2)
        return int(base_sleep * jitter)

    async def update_model_performance(self, model: str, query_type: str, quality_score: float, token_efficiency: float):
        """Update model performance metrics in CTRM"""
        # Create truth about model performance
        await self.ctrm.create_truth(
            statement=f"Model {model} performance for {query_type}: quality={quality_score:.2f}, efficiency={token_efficiency:.2f}",
            context=json.dumps({
                "model": model,
                "query_type": query_type,
                "quality_score": quality_score,
                "token_efficiency": token_efficiency,
                "timestamp": datetime.now().isoformat(),
                "category": "model_performance"
            })
        )

    def classify_query(self, query: str) -> str:
        """Classify query type"""
        query_lower = query.lower()
        if "code" in query_lower or "program" in query_lower:
            return "coding"
        elif "math" in query_lower or "calculate" in query_lower:
            return "mathematics"
        elif "write" in query_lower or "compose" in query_lower:
            return "writing"
        else:
            return "general"

    def rate_response_quality(self, query: str, response: str) -> float:
        """Rate response quality (mock implementation)"""
        # Simple mock rating based on response length and query match
        length_factor = min(1.0, len(response) / 500)
        match_factor = 0.5 if query.lower() in response.lower() else 0.2
        return 0.6 + length_factor * 0.2 + match_factor * 0.2

    @staticmethod
    def get_quality_safe(obj, default=0.5):
        """Safely access quality_score attribute from object or dict"""
        try:
            if hasattr(obj, 'quality_score'):
                return obj.quality_score
            elif isinstance(obj, dict):
                return obj.get('quality_score', default)
            elif isinstance(obj, (list, tuple)) and len(obj) > 1:
                # Might be a tuple (similarity, vector_obj)
                if hasattr(obj[1], 'quality_score'):
                    return obj[1].quality_score
            return default
        except Exception:
            return default

async def main():
    """Main entry point"""
    daemon = CTRMLLMOSDaemon()

    # Initialize system
    await daemon.initialize()

    # Integrate code health monitoring
    monitoring_task = await integrate_code_health_monitoring(daemon)

    # Start evolution loop in background
    evolution_task = asyncio.create_task(daemon.run_continual_evolution())

    # Get the loaded model from LM Studio
    loaded_model = await daemon.lm_studio.get_loaded_model()

    # Example: Process a user query once at startup (with persistent check)
    # Example: Process a user query once at startup (with persistent check)
    try:
        startup_marker = "data/.startup_query_ran"
        should_run_query = True
        if os.path.exists(startup_marker):
            # check modification time
            if time.time() - os.path.getmtime(startup_marker) < 300: # 5 minutes cooldown
                should_run_query = False
                print("⚠️ Skipping startup query (recently ran)")

        if should_run_query:
            with open(startup_marker, 'w') as f: f.write(str(time.time()))
            query_result = await daemon.process_user_query(
                "Explain the CTRM-Powered LLM OS architecture and its key innovations",
                model=loaded_model
            )
            print(f"🎉 Query result: {query_result['response'][:100]}...")
            print(f"💰 Tokens used: {query_result['tokens_used']['total_tokens']}")

        # Demonstrate vector analysis
        vector_analysis = await daemon.analyze_query_vectors(
            "Explain the CTRM-Powered LLM OS architecture and its key innovations"
        )
        print(f"🔢 Vector analysis: {len(vector_analysis.get('similar_vectors', {}).get('similar_vectors', []))} similar vectors found")
        print(f"🎯 Primary concepts: {vector_analysis.get('vector_analysis', {}).get('primary_concepts', [])}")

        # Demonstrate vector-enhanced evolution
        evolution_analysis = await daemon.enhance_evolution_with_vectors()
        print(f"🔄 Evolution analysis: {evolution_analysis.get('space_analysis', {}).get('space_analysis', {}).get('vector_count', 0)} vectors analyzed")
        print(f"📊 Coverage score: {evolution_analysis.get('space_analysis', {}).get('space_analysis', {}).get('coverage_score', 0):.2f}")

        # Demonstrate Vector File System
        print("🗃️  Demonstrating Vector File System...")

        # Write test files to VFS
        test_file_1 = await daemon.process_vfs_operation(
            "write",
            path="vfs_root/system/ctrm_architecture.md",
            content="""# CTRM Architecture
The CTRM system provides truth management with confidence scoring.
It integrates vector embeddings with traditional knowledge storage.""",
            metadata={"category": "system", "importance": "high"}
        )

        test_file_2 = await daemon.process_vfs_operation(
            "write",
            path="vfs_root/system/vector_interface.py",
            content="""# Vector Interface
class VectorInterface:
    def __init__(self, vector_store):
        self.vector_store = vector_store

    def find_similar(self, query_vector):
        # Find similar vectors
        pass""",
            metadata={"category": "system", "importance": "medium"}
        )

        test_file_3 = await daemon.process_vfs_operation(
            "write",
            path="vfs_root/docs/vfs_design.md",
            content="""# Vector File System Design
VFS organizes files by semantic meaning rather than hierarchical paths.
It uses vector embeddings to create knowledge relationships between files.""",
            metadata={"category": "documentation", "importance": "high"}
        )

        print(f"📝 Created {len([test_file_1, test_file_2, test_file_3])} test files in VFS")

        # List files in VFS
        vfs_list = await daemon.process_vfs_operation("list", path="vfs_root/system")
        print(f"📁 System files: {len(vfs_list)} files found")

        # Perform semantic search
        semantic_search = await daemon.process_vfs_operation(
            "search",
            semantic_query="vector embeddings and knowledge organization"
        )
        print(f"🔍 Semantic search found {len(semantic_search.get('results', []))} relevant files")

        # Analyze VFS space
        vfs_analysis = await daemon.process_vfs_operation("analyze")
        print(f"📊 VFS analysis: {vfs_analysis.get('analysis', {}).get('total_files', 0)} files, {vfs_analysis.get('analysis', {}).get('indexed_files', 0)} indexed")

        # Get VFS health check
        vfs_health = await daemon.process_vfs_operation("health")
        print(f"❤️  VFS health: {vfs_health.get('status', 'unknown')}")

    except Exception as e:
        print(f"❌ Error processing query: {e}")

    # Keep running until interrupted
    try:
        await asyncio.gather(evolution_task, monitoring_task)  # This will run indefinitely
    except asyncio.CancelledError:
        pass
    except KeyboardInterrupt:
        print("🛑 Received shutdown signal, cancelling evolution loop...")
        evolution_task.cancel()
        monitoring_task.cancel()
        try:
            await asyncio.gather(evolution_task, monitoring_task)
        except asyncio.CancelledError:
            pass

    print("👋 CTRM LLM OS shutting down")

if __name__ == "__main__":
    asyncio.run(main())

# Startup boosts
try:
    from runtime.startup_booster import boost_on_startup
    startup_boosts = boost_on_startup()
except ImportError:
    startup_boosts = {}
    print('⚠️  Startup booster not found, continuing without boosts')
