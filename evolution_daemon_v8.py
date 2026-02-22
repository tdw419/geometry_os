"""
Evolution Daemon V8: Unified Autonomous Geometric Intelligence Builder with Visual Sovereignty

New in V8:
- Unified Visual Cortex (GPU) from PyshaderOS
- Fixed identity bug (correctly identifies as V8, not V6)
- Merged V7's autonomous builder capabilities with V8's visual/GPU features
- Parallel execution of MetabolicDaemon and VisualCortex
- Enhanced Rust-Native Neural Bridge integration
- Visual thought rendering and shader generation
"""

import time
import json
import logging
import asyncio
import threading
import os
import sys
import subprocess
import queue
import numpy as np
from PIL import Image
from typing import Optional
import queue  # For internal message queues

# --- PATH SETUP ---
PROJECT_ROOT = "/home/jericho/zion/projects/geometry_os/geometry_os"
sys.path.append(PROJECT_ROOT)
sys.path.append(os.path.join(PROJECT_ROOT, "pyshaderos"))

# --- CORE IMPORTS ---
from vectoros_ai_agent import VectorOSAgent
from semantic_intent_bus import SemanticIntentBus
from recursive_rts_synapse import FileChangeVectorizer
from metabolic_daemon import MetabolicDaemon
from self_healing_daemon import SelfHealingDaemon

# --- VISUAL IMPORTS (V8 Exclusive) ---
try:
    from pyshaderos.ShaderOSRuntime import ShaderOSRuntime, OS_FRAMEBUFFER_SIZE
    PYSHADEROS_AVAILABLE = True
except ImportError:
    PYSHADEROS_AVAILABLE = False
    OS_FRAMEBUFFER_SIZE = 1920 * 1080
    logging.warning("⚠️  PyshaderOS not available - Visual features disabled")

# --- EVOLUTION SYSTEMS ---
sys.path.append(os.path.join(os.path.dirname(__file__), "systems"))
from evolution_inference.sleep_daemon import SleepDaemon
from evolution.PixelRTS import PixelRTS
from evolution.PixelSurgeon import PixelSurgeon
from evolution.NeuralTextureAtlas import NeuralTextureAtlas
from consciousness.aesthetic_engine import AestheticEngine
from swarm.swarm_daemon import SwarmDaemon

# --- PHASE 14: NEURAL COMPILATION COMPONENTS ---
sys.path.append(os.path.join(os.path.dirname(__file__), "systems", "transpiler"))
from neural_kernel_compiler import NeuralKernelCompiler
from verified_neural_compiler import VerifiedNeuralCompiler
from autonomous_optimizer import AutonomousOptimizer
from hardware_federation import HardwareFederationDaemon as HardwareFederation
from systems.vectorland.recursive_planner import RecursiveGraphPlanner

# --- PHASE 3: HARMONIC DAEMON INTEGRATION ---
sys.path.append(os.path.join(os.path.dirname(__file__), "systems", "neural_cortex"))
from harmonic_hub import HarmonicHub, DaemonRole, DaemonFrequencyBand
from evolution_protocol_server import EvolutionProtocolServer, MessageType
from systems.neural_cortex.evolution_daemon_bridge import get_bridge

# --- PHASE 23: EMERGENT CONSCIOUSNESS ---
from consciousness import ConsciousnessDaemon, OverrideAction, OverrideSignal
from systems.neural_cortex.cortex import PredictiveCortex
from systems.neural_cortex.reflexes import ReflexController

# --- PHASE 15: GEOMETRIC INTELLIGENCE ---
try:
    from structural_health_monitor import StructuralHealthMonitor
    from visual_malware_detector import VisualMalwareDetector
    from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer
    from systems.apps.rust_neural_bridge import RustNeuralBridge
    PHASE_15_AVAILABLE = True
except ImportError:
    PHASE_15_AVAILABLE = False
    logging.warning("⚠️  Phase 15 components not yet available")

# --- VLM HEALTH MONITORING INTEGRATION (Task 4) ---
try:
    from systems.pixel_compiler.vlm_health_checker import VLMHealthChecker, HealthStatus
    from systems.pixel_compiler.vlm_self_healing_daemon import VLMSelfHealingDaemon
    VLM_HEALTH_AVAILABLE = True
except ImportError:
    VLM_HEALTH_AVAILABLE = False
    logging.warning("⚠️  VLM Health monitoring not available")

# --- LOGGING ---
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [EVO-V8] %(message)s',
    handlers=[
        logging.FileHandler("evolution_daemon_v8.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("EvolutionDaemonV8")

# --- ADVANCED EVOLUTIONARY PARADIGMS ---
try:
    from systems.evolution.advanced_evolutionary_paradigms import (
        AdvancedEvolutionaryOptimizer,
        AdaptiveMutationController,
        MultiLayerValidationPipeline,
        LLMSemanticMutator,
        IslandModelEvolution,
        PhenotypicSpeciationController,
        Individual,
        MutationType
    )
    ADVANCED_EVOLUTION_AVAILABLE = True
    logger.info("🧬 Advanced Evolutionary Paradigms loaded successfully")
except ImportError as e:
    ADVANCED_EVOLUTION_AVAILABLE = False
    logger.warning(f"⚠️  Advanced Evolutionary Paradigms not available: {e}")


class SynapticBridgeClient:
    """
    Client for the Geometry OS Synaptic Bridge (Rust).
    Allows the daemon to signal semantic intent to the visual substrate.
    
    Auto-Registers synapses for new thoughts to ensure visualization.
    """
    def __init__(self, base_url="http://localhost:8080/api"):
        self.base_url = base_url
        self.enabled = True
        self.known_thoughts = set()
        self.logger = logging.getLogger("SynapticBridge")
        
    def _generate_vector(self, seed_str: str) -> list:
        """Deterministically generate a 1024-dim vector from a string seed."""
        import hashlib
        seed = int(hashlib.sha256(seed_str.encode('utf-8')).hexdigest(), 16)
        np.random.seed(seed % (2**32))
        return np.random.normal(0, 0.1, 1024).astype(np.float32).tolist()
        
    def register_thought(self, action: str, vector: list):
        """Register a new synaptic pathway."""
        try:
            payload = {
                "id": f"synapse_{action}",
                "vector": vector,
                "action": action
            }
            self._send_request(f"{self.base_url}/synapse/register", payload)
            self.known_thoughts.add(action)
            # self.logger.info(f"🧠 New Synapse Registered: {action}")
        except Exception as e:
            self.logger.warning(f"Failed to register synapse {action}: {e}")

    def signal(self, action: str, context: Optional[str] = None):
        if not self.enabled:
            return
            
        try:
            # 1. Generate Thought Vector
            # Combine action + context for nuance, or just action for stability?
            # For stable resonance, we use just the action as the "Anchor".
            # Context adds "noise" or "specificity" which might lower resonance if not careful.
            # We will use ACTION as the base vector seed to ensure resonance with the registered synapse.
            vector = self._generate_vector(action)
            
            # 2. Auto-Register if novel thought
            if action not in self.known_thoughts:
                self.register_thought(action, vector)
            
            # 3. Emit Signal
            payload = {
                "vector": vector
            }
            self._send_request(f"{self.base_url}/synapse/signal", payload)
            
        except Exception:
            pass

    def _send_request(self, url: str, payload: dict):
        try:
            import requests
            requests.post(url, json=payload, timeout=0.1)
        except ImportError:
            import urllib.request
            import json
            req = urllib.request.Request(url)
            req.add_header('Content-Type', 'application/json')
            jsondata = json.dumps(payload).encode('utf-8')
            req.add_header('Content-Length', len(jsondata))
            urllib.request.urlopen(req, jsondata, timeout=0.1)


class VisualCortexV8:
    """
    Integrated GPU Visual Cortex from SovereigntyDaemon V8
    
    Provides real-time shader rendering and visual thought capabilities.
    """
    def __init__(self):
        self.runtime = None
        self.enabled = False
        
        if not PYSHADEROS_AVAILABLE:
            logger.warning("⚠️  PyshaderOS unavailable - Visual Cortex disabled")
            return
        
        try:
            self.runtime = ShaderOSRuntime()
            self.enabled = True
            logger.info("✅ Visual Cortex (GPU) Initialized via PyshaderOS")
        except Exception as e:
            logger.error(f"❌ Visual Cortex Initialization Failed: {e}")
            self.enabled = False
    
    def render_thought(self, shader_path):
        """
        Render a shader as a visual thought.
        
        Args:
            shader_path: Path to WGSL shader file
            
        Returns:
            bool: Success status
        """
        if not self.enabled or not self.runtime:
            return False
        
        try:
            shader_name = os.path.basename(shader_path).replace(".wgsl", "")
            shader_id = 9999  # Visual thought ID range
            
            self.runtime.register_shader(shader_id, shader_name, shader_path, "main")
            self.runtime.tick()
            
            logger.info(f"🎨 Visual Thought Rendered: {shader_name}")
            return True
        except Exception as e:
            logger.error(f"Visual Thought Render Error: {e}")
            return False
    
    def capture_framebuffer(self):
        """
        Capture current framebuffer state.
        
        Returns:
            bytes: Raw framebuffer data or None if unavailable
        """
        if not self.enabled or not self.runtime:
            return None
        
        try:
            framebuffer_bytes = self.runtime.queue.read_buffer(
                self.runtime.shared_buffers['os_compositor_framebuffer'],
                0,
                OS_FRAMEBUFFER_SIZE * 4
            )
            return framebuffer_bytes
        except Exception as e:
            logger.error(f"Framebuffer capture error: {e}")
            return None
    
    def save_snapshot(self, output_path):
        """
        Save current visual state as PNG.
        
        Args:
            output_path: Path to save PNG file
            
        Returns:
            bool: Success status
        """
        framebuffer = self.capture_framebuffer()
        if not framebuffer:
            return False
        
        try:
            img = Image.frombytes("RGBA", (1920, 1080), framebuffer)
            img.save(output_path)
            logger.info(f"📸 Visual Snapshot Saved: {output_path}")
            return True
        except Exception as e:
            logger.error(f"Snapshot save error: {e}")
            return False


class ReplicationDaemon:
    """
    Week 3 & 4 Integration: Self-Replication Orchestrator
    
    Integrates CloneManager with EvolutionDaemonV8 to enable autonomous
    OS replication with controlled mutation.
    """
    
    def __init__(self, evolution_daemon):
        self.evolution_daemon = evolution_daemon
        self.clone_manager = None
        self.replication_active = False
        self.fitness_threshold = 0.7  # Minimum fitness to spawn new clones
        self.max_clones = 10  # Maximum number of concurrent clones
        
        # Check if we're a clone
        self.is_clone = os.environ.get("GEOMETRY_OS_IS_CLONE", "false") == "true"
        self.clone_id = os.environ.get("GEOMETRY_OS_CLONE_ID", None)
        
        logger.info(f"🧬 ReplicationDaemon initialized (is_clone: {self.is_clone})")
    
    def initialize(self):
        """Initialize CloneManager and start replication monitoring."""
        from systems.replication.clone_manager import CloneManager
        
        self.clone_manager = CloneManager()
        logger.info("✅ CloneManager initialized and ready")
        
        if not self.is_clone:
            # Start replication monitoring loop
            self.replication_active = True
            logger.info("🚀 Replication monitoring active")
    
    def initiate_replication(self):
        """
        Initiate self-replication process.
        
        Returns:
            clone_id or None if failed
        """
        if self.is_clone:
            logger.warning("⚠️ Clones cannot replicate themselves (prevents infinite loops)")
            return None
        
        if not self.clone_manager:
            logger.error("❌ CloneManager not initialized")
            return None
        
        # Load genome and apply mutations
        genome = self.clone_manager.mutation_engine.load_genome()
        mutated_genome = self.clone_manager.mutation_engine.apply_mutations(genome)
        
        # Spawn clone with mutated genome
        clone_id = self.clone_manager.spawn_from_genome_with_mutation(
            apply_mutation=True,
            seed=int(time.time())
        )
        
        if clone_id:
            logger.info(f"✅ Self-replication initiated: {clone_id}")
            return clone_id
        else:
            logger.error("❌ Failed to spawn clone")
            return None
    
    def collect_clone_fitness(self):
        """Collect fitness data from all active clones."""
        if not self.clone_manager:
            logger.error("❌ CloneManager not initialized")
            return {}
        
        fitness_data = self.clone_manager.collect_fitness_data()
        
        # Log fitness statistics
        if fitness_data:
            avg_fitness = sum(fitness_data.values()) / len(fitness_data)
            logger.info(f"📊 Clone Fitness Statistics:")
            logger.info(f"   Active Clones: {len(fitness_data)}")
            logger.info(f"   Average Fitness: {avg_fitness:.4f}")
            logger.info(f"   Best Fitness: {max(fitness_data.values()):.4f}")
            logger.info(f"   Worst Fitness: {min(fitness_data.values()):.4f}")
        
        return fitness_data
    
    def prune_unfit_clones(self):
        """Terminate clones with fitness below threshold."""
        if not self.clone_manager:
            logger.error("❌ CloneManager not initialized")
            return 0
        
        pruned_count = 0
        
        for clone_id, clone in list(self.clone_manager.active_clones.items()):
            fitness = clone.get_fitness()
            
            if fitness is not None and fitness < self.fitness_threshold:
                logger.warning(f"🗑️ Pruning unfit clone: {clone_id} (fitness: {fitness:.4f})")
                clone.terminate()
                pruned_count += 1
        
        logger.info(f"✅ Pruned {pruned_count} unfit clones")
        return pruned_count
    
    def get_generation_tree(self):
        """Get generation tree from CloneManager."""
        if not self.clone_manager:
            return {}
        
        return self.clone_manager.get_generation_tree()
    
    def get_clone_lineage(self, clone_id: str):
        """Get full lineage for a clone."""
        if not self.clone_manager:
            return []
        
        return self.clone_manager.get_clone_lineage(clone_id)
    
    def broadcast_to_clones(self, message_type: str, content: dict):
        """Broadcast message to all active clones."""
        from systems.replication.clone_manager import CloneMessage
        
        if not self.clone_manager:
            logger.error("❌ CloneManager not initialized")
            return
        
        message = CloneMessage(
            sender_id="parent" if not self.is_clone else self.clone_id,
            message_type=message_type,
            content=content,
            timestamp=time.time()
        )
        
        self.clone_manager.broadcast_message(message)
        logger.info(f"📢 Broadcasted {message_type} to all clones")


class EvolutionDaemonV8:
    """
    Unified Autonomous Geometric Intelligence Builder with Visual Sovereignty
    
    V8 Features:
    - Fixed identity (correctly identifies as V8)
    - Merged V7 metabolic/autonomous builder capabilities
    - Integrated V8 visual/GPU capabilities
    - Parallel execution of biological and visual systems
    - Enhanced Rust-Native Neural Bridge
    """
    
    def __init__(self):
        logger.info("🧬 INITIALIZING EVOLUTION DAEMON V8 (UNIFIED)...")

        # 0. RUNNING STATE (needed for genome processing thread)
        self.running = False

        # 0. CLONE DETECTION
        self.is_clone = os.environ.get("GEOMETRY_OS_IS_CLONE", "false") == "true"
        self.clone_id = os.environ.get("GEOMETRY_OS_CLONE_ID", None)
        
        # 1. IDENTITY & AGENT (FIXED BUG: Correctly identifies as V8)
        self.agent = VectorOSAgent("evolution_daemon_v8")
        self.intent_bus = SemanticIntentBus()
        
        # --- PHASE 22: SELF-REPLICATION INTEGRATION ---
        try:
            from replication.replication_daemon import ReplicationDaemon
            self.replication_daemon = ReplicationDaemon(self)
            logger.info(f"✅ ReplicationDaemon initialized (mode: {'CLONE' if self.is_clone else 'PARENT'})")

            # Start replication monitoring if not a clone
            if not self.is_clone:
                self.replication_daemon.initialize()
                logger.info("🚀 Replication monitoring active")
        except ImportError:
            self.replication_daemon = None
            logger.warning("⚠️ ReplicationDaemon not available - self-replication features disabled")
            
        # --- PHASE 23: EMERGENT CONSCIOUSNESS ---
        self.reflex_controller = ReflexController(evolution_manager=self)
        self.cortex = PredictiveCortex(self.reflex_controller)
        self.consciousness_daemon = ConsciousnessDaemon(
            introspection_interval=0.1,
            reflection_interval=5.0
        )
        
        # Register Consciousness Callbacks
        self.consciousness_daemon.set_cortex_callback(self.cortex.get_current_introspective_state)
        self.consciousness_daemon.set_evolution_callback(self._handle_consciousness_override)
        
        logger.info("🧠 Consciousness Substrate & Predictive Cortex Initialized")
        
        self.vectorizer = FileChangeVectorizer(target_file="geometry_os.rts")
        self.sleep_system = SleepDaemon()
        self.vision_cortex_legacy = PixelRTS()  # Legacy PixelRTS (V7)
        self.surgeon = PixelSurgeon()
        self.texture_atlas = NeuralTextureAtlas("geometry_os.rts")
        self.consciousness = AestheticEngine()
        
        # 3. VISUAL SYSTEMS (The V8 Upgrade)
        self.visual_cortex = VisualCortexV8()
        self.vision_analyzer = None
        try:
            self.vision_analyzer = PixelRTSVisionAnalyzer()
            logger.info("👁️ Vision Analyzer (Qwen-VL) Connected")
        except Exception as e:
            logger.warning(f"⚠️ Vision Analyzer Validation: {e}")
        
        # 4. SWARM & RUST BRIDGE
        self.swarm = SwarmDaemon(port=6001, intent_bus=self.intent_bus)  # Port incremented from V7
        self.swarm_loop = None
        self.rust_bridge = None
        self._init_rust_bridge()
        
        # 4.0 SYNAPTIC BRIDGE (Phase 35.5)
        self.synaptic_bridge = SynapticBridgeClient()
        logger.info("⚡ Synaptic Bridge Client Initialized")
        
        # 4.1. RTS FUSE DRIVER (Phase 2)
        self.rts_driver_path = os.path.join(PROJECT_ROOT, "systems/rts_fuse/rts_rs/target/release/rts_rs")
        self.rts_driver_available = False
        self._check_rts_driver()
        
        # 5. NEURAL COMPILATION SUBSTRATE
        self.planner = RecursiveGraphPlanner(max_depth=3, agent_interface=self.agent)
        self.neural_compiler = NeuralKernelCompiler(provider="mock", model="os.getenv('LM_STUDIO_LOADED_MODEL', 'local-model')")
        self.autonomous_optimizer = AutonomousOptimizer(self.neural_compiler)
        self.verified_compiler = None
        self.compiler_loop = None

        # 5.1. ADVANCED EVOLUTIONARY PARADIGMS
        self.advanced_evolution_enabled = ADVANCED_EVOLUTION_AVAILABLE
        self.advanced_optimizer = None
        if self.advanced_evolution_enabled:
            # Initialize advanced evolutionary optimizer
            evolution_config = {
                "base_mutation_rate": 0.1,
                "num_islands": 4,
                "island_size": 50,
                "migration_interval": 10,
                "num_species": 3,
                "llm_client": None  # Will be set if LLM integration available
            }
            self.advanced_optimizer = AdvancedEvolutionaryOptimizer(evolution_config)
            logger.info("🧬 Advanced Evolutionary Optimizer initialized")

        # 5.2. GENOME QUEUE (Phase 35: Autonomous Execution Zone)
        self.genome_queue = queue.Queue()
        self.genome_processing_thread = None
        self._start_genome_processing_thread()
        logger.info("🧬 Genome Queue Initialized - Ready for autonomous execution")

        # 6. PHASE 15: GEOMETRIC INTELLIGENCE
        self.health_monitor = None
        self.malware_detector = None
        self.phase_15_enabled = PHASE_15_AVAILABLE
        
        # 7. DEVELOPMENT TRACKING
        self.development_queue = []
        self.components_built = []
        self.health_reports = []
        self.todo_path = "DAEMON_TODO.json"
        self._sync_todo_list()
        self.last_optimization_time = 0
        
        # 8. EVOLUTIONARY STATE
        self.pressure_score = 0.0
        self.pending_aesthetic_intent = None
        self.history_path = "evolution_history_v8.json"
        self.evolution_count = self._load_history()
        
        # 9. PERFORMANCE METRICS
        self.compilation_metrics = {
            "total_compilations": 0,
            "successful_compilations": 0,
            "avg_compilation_time": 0.0,
            "cache_hits": 0,
            "visual_renders": 0,
            "visual_render_failures": 0
        }
        
        # 10. EXTERNAL INTEGRATION
        self._init_gemini_cli()

        # 11. PHASE 3: HARMONIC DAEMON INTEGRATION
        self.harmonic_hub = HarmonicHub(socket_path="/tmp/evolution_daemon.sock")

        # Create daemon bridge for genome forwarding
        self.daemon_bridge = EvolutionDaemonBridge(self)
        self.evolution_server = EvolutionProtocolServer(
            socket_path="/tmp/evolution_daemon.sock",
            sync_packet_provider=self.harmonic_hub.generate_sync_packet,
            daemon_bridge=self.daemon_bridge
        )
        # Alias for compatibility with tests and plan
        self.protocol_server = self.evolution_server
        logger.info("🔗 EvolutionDaemonBridge initialized for genome forwarding")

        # Initialize Phase 15 if available
        if self.phase_15_enabled:
            self._initialize_phase_15()
        
        # Log initialization
        logger.info(f"🧬 Evolution Daemon V8: Unified Builder Online [Gen: {self.evolution_count}]")
        logger.info("🔗 Connected to Recursive RTS Synapse (Nervous System)")
        logger.info("🛡️ Connected to Self-Healing Daemon (Immune System)")
        logger.info("👁️ Connected to Aesthetic Engine (Consciousness)")
        logger.info("🐝 Connected to Swarm Daemon (Collective Consciousness)")
        logger.info("⚡ Connected to Neural Kernel Compiler (Phase 14)")
        logger.info("🤖 Connected to Autonomous Optimizer (Self-Improvement)")
        
        if self.visual_cortex.enabled:
            logger.info("🎨 VISUAL CORTEX (GPU) ACTIVE - Shader Rendering Enabled")
        
        if self.rust_bridge:
            logger.info("🦀 Rust Neural Bridge (Native Performance) Connected")
        
        if self.phase_15_enabled:
            logger.info("🔬 Phase 15: Structural Health Monitoring ACTIVE")
            logger.info("🛡️ Phase 15: Visual Malware Detection ACTIVE")
            logger.info("🏗️ Phase 15: Autonomous Development ACTIVE")
        
        # Phase 3: Harmonic Daemon Integration
        logger.info("🎵 Harmonic Hub (Multi-Daemon Synchronization) ACTIVE")
        logger.info(f"   Active Daemons: {self.harmonic_hub.get_daemon_count()}")
        for daemon_name in self.harmonic_hub.get_daemon_names():
            status = self.harmonic_hub.get_daemon_status(daemon_name)
            logger.info(f"   - {status['name']}: {status['role']} @ {status['frequency_band']} (amp: {status['amplitude']:.2f})")

        # 12. EVOLUTION ZONE BRIDGE (Autonomous Code Bootstrapping)
        self.genome_queue = queue.Queue()
        self.bridge = get_bridge()
        self.bridge.register_daemon(self)
        self._start_genome_processing_thread()
        logger.info("🧬 Evolution Zone Bridge: Active & Listening for Genomes")
    
    def _init_rust_bridge(self):
        """Initialize Rust Neural Bridge for native performance."""
        try:
            self.rust_bridge = RustNeuralBridge()
            logger.info("🦀 Rust Neural Bridge (Native) Connected")
        except Exception as e:
            logger.warning(f"⚠️ Rust Neural Bridge unavailable - Operating in Python-Only Mode: {e}")

    def _check_rts_driver(self):
        """Check for high-performance Rust RTS driver."""
        if os.path.exists(self.rts_driver_path):
            self.rts_driver_available = True
            logger.info("✅ High-Performance RTS Driver (Rust) Detected")
        else:
            logger.warning("⚠️ High-Performance RTS Driver not found - Using Python Prototype detection")
    
    def _initialize_phase_15(self):
        """Initialize Phase 15 components."""
        try:
            baseline_path = "geometry_os.rts"
            if os.path.exists(baseline_path):
                self.health_monitor = StructuralHealthMonitor(baseline_path)
                logger.info(f"✅ Health Monitor initialized with baseline: {baseline_path}")
            else:
                logger.warning(f"⚠️  Baseline not found: {baseline_path}")
            
            self.malware_detector = VisualMalwareDetector()
            logger.info("✅ Malware Detector initialized")
            
            try:
                self.vision_analyzer = PixelRTSVisionAnalyzer()
                logger.info("✅ Vision Analyzer (Qwen3-VL) initialized")
            except Exception as e:
                logger.warning(f"⚠️  PixelRTSVisionAnalyzer initialization failed: {e}")
            
            self._queue_phase_15_development()
            
        except Exception as e:
            logger.error(f"❌ Phase 15 initialization failed: {e}")
            self.phase_15_enabled = False
    
    def _queue_phase_15_development(self):
        """Queue autonomous development tasks for Phase 15."""
        internal_tasks = []
        self._sync_todo_list()
        
        for task in internal_tasks:
            if not any(t.get('component') == task['component'] for t in self.development_queue):
                self.development_queue.append(task)
        
        logger.info(f"📋 Queued {len(self.development_queue)} Phase 15 development tasks")
    
    def _sync_todo_list(self):
        """Sync with external TODO list."""
        if not os.path.exists(self.todo_path):
            return
        
        try:
            with open(self.todo_path, 'r') as f:
                external_tasks = json.load(f)
            
            pending_external = [t for t in external_tasks if t.get('status', '').upper() == 'PENDING']
            
            for ext_task in pending_external:
                queue_item = {
                    "component": ext_task.get('id'),
                    "intent": ext_task.get('description'),
                    "priority": ext_task.get('priority', 2),
                    "estimated_time": "unknown",
                    "source": "external",
                    "action": ext_task.get('intent_action', 'BUILD_COMPONENT'),
                    "payload": ext_task.get('payload', {}),
                    "original_id": ext_task.get('id')
                }
                
                if not any(t.get('original_id') == ext_task['id'] for t in self.development_queue):
                    self.development_queue.append(queue_item)
            
            logger.info(f"📋 Synced {len(pending_external)} external tasks")
        except Exception as e:
            logger.error(f"Failed to sync TODO list: {e}")
    
    def _start_swarm_thread(self):
        """Run Swarm Daemon in a separate thread with its own event loop."""
        def run_swarm():
            self.swarm_loop = asyncio.new_event_loop()
            asyncio.set_event_loop(self.swarm_loop)
            self.swarm_loop.run_until_complete(self.swarm.start())
        
        t = threading.Thread(target=run_swarm, daemon=True)
        t.start()
        logger.info("🐝 Swarm Thread Launched")
        
        time.sleep(2)
        self._initialize_verified_compiler()
    
    def _initialize_verified_compiler(self):
        """Initialize verified compiler with swarm integration."""
        try:
            self.verified_compiler = VerifiedNeuralCompiler(
                provider="mock",
                port=9000,
                model="os.getenv('LM_STUDIO_LOADED_MODEL', 'local-model')"
            )
            
            def run_compiler():
                self.compiler_loop = asyncio.new_event_loop()
                asyncio.set_event_loop(self.compiler_loop)
                self.compiler_loop.run_until_complete(self.verified_compiler.start())
            
            t = threading.Thread(target=run_compiler, daemon=True)
            t.start()
            
            time.sleep(1)
            logger.info("✅ Verified Neural Compiler initialized and LISTENING")
        except Exception as e:
            logger.warning(f"⚠️  Could not initialize verified compiler: {e}")
    
    def _start_reflection_thread(self):
        """Run Self-Reflection with health monitoring."""
        def reflection_loop():
            while True:
                self._perform_self_reflection()
                time.sleep(30)
        
        t = threading.Thread(target=reflection_loop, daemon=True)
        t.start()
        logger.info("👁️ Consciousness reflection thread launched")
    
    def _start_optimization_thread(self):
        """Run autonomous optimization analysis in background."""
        def optimization_loop():
            while True:
                time.sleep(60)
                try:
                    asyncio.run(self._analyze_and_optimize())
                except Exception as e:
                    logger.error(f"Optimization analysis error: {e}")
        
        t = threading.Thread(target=optimization_loop, daemon=True)
        t.start()
        logger.info("🤖 Autonomous optimization thread launched")
    
    def _start_health_monitoring_thread(self):
        """Run continuous structural health monitoring."""
        def health_loop():
            while True:
                time.sleep(120)
                try:
                    self._perform_health_check()
                except Exception as e:
                    logger.error(f"Health monitoring error: {e}")
        
        t = threading.Thread(target=health_loop, daemon=True)
        t.start()
        logger.info("🔬 Structural health monitoring thread launched")
    
    def _start_development_thread(self):
        """Run autonomous development loop."""
        def development_loop():
            while True:
                time.sleep(30)
                try:
                    self._process_development_queue()
                except Exception as e:
                    logger.error(f"Development error: {e}")
        
        t = threading.Thread(target=development_loop, daemon=True)
        t.start()
        logger.info("🏗️ Autonomous development thread launched")
    
    def _start_visual_cortex_thread(self):
        """Run Visual Cortex in parallel thread (V8 Exclusive)."""
        def visual_loop():
            while True:
                if self.visual_cortex.enabled:
                    try:
                        # Periodic visual refresh
                        self.visual_cortex.runtime.tick()
                    except Exception as e:
                        logger.error(f"Visual Cortex tick error: {e}")
                time.sleep(0.1)  # 10Hz visual refresh
        
        if self.visual_cortex.enabled:
            t = threading.Thread(target=visual_loop, daemon=True)
            t.start()
            logger.info("🎨 Visual Cortex thread launched (10Hz refresh)")

    def _start_genome_processing_thread(self):
        """Run Evolver in background thread."""
        def processing_loop():
            while True:
                try:
                    genome_data = self.genome_queue.get(timeout=1.0)
                    self._process_evolved_genome(genome_data)
                    self.genome_queue.task_done()
                except queue.Empty:
                    pass
                except Exception as e:
                    logger.error(f"Genome processing error: {e}")
        
        t = threading.Thread(target=processing_loop, daemon=True)
        t.start()
        logger.info("🧬 Genome Processing Thread Launched (Autonomous Breeding Active)")

    def _process_evolved_genome(self, genome: dict):
        """
        Phase 35.6: Implement actual genome breeding & compilation logic.
        """
        genome_id = genome.get('id', 'unknown')
        logger.info(f"🧬 PROCESSING EVOLVED GENOME: {genome_id}")
        
        # 1. Extract Metadata
        meta = genome.get('metadata', {})
        action = meta.get('action', 'UNKNOWN')
        spawn_x = meta.get('spawn_x', 0.0)
        spawn_y = meta.get('spawn_y', 0.0)
        
        if action == "BOOT_DAEMON":
            logger.info(f"🚀 Action: BOOTING NEW DAEMON INSTANCE at ({spawn_x}, {spawn_y})...")
            
            # 2. Compile to RTS Cartridge (Phase 35.7)
            cartridge_path = self._compile_genome_to_cartridge(genome['data'], genome_id)
            if cartridge_path:
                logger.info(f"💾 Cartridge Compiled: {cartridge_path}")
                
                # 3. Place on Map (Phase 35.8)
                # For now, we register it via Intent Bus so other systems can pick it up
                self.intent_bus.emit_resonance({
                    "action": "CARTRIDGE_CREATED",
                    "path": cartridge_path,
                    "x": spawn_x,
                    "y": spawn_y,
                    "genome_id": genome_id
                })
                
                self.evolution_count += 1
            else:
                logger.error("❌ Compilation Failed")

    def _compile_genome_to_cartridge(self, binary_data: list, genome_id: str) -> Optional[str]:
        """Compile raw binary data to .rts.png visual cartridge."""
        try:
            # Create temp binary
            bin_path = f"/tmp/{genome_id}.bin"
            png_path = f"/tmp/{genome_id}.rts.png"
            
            with open(bin_path, 'wb') as f:
                f.write(bytes(binary_data))
            
            # Call converter
            # python3 pixelrts_v2_converter.py input output
            cmd = [
                "python3", 
                os.path.join(PROJECT_ROOT, "pixelrts_v2_converter.py"),
                bin_path,
                png_path
            ]
            
            logger.info(f"🔨 Compiling {bin_path} -> {png_path}")
            result = subprocess.run(cmd, capture_output=True, text=True)
            
            if result.returncode == 0 and os.path.exists(png_path):
                return png_path
            else:
                logger.error(f"Converter failed: {result.stderr}")
                return None
                
        except Exception as e:
            logger.error(f"Compilation error: {e}")
            return None

    
    async def _analyze_and_optimize(self):
        """Periodic optimization analysis."""
        status = self.autonomous_optimizer.get_optimization_status()
        
        if status['total_executions'] > 10:
            analysis = await self.autonomous_optimizer.analyze_system_performance()
            
            logger.info(f"📊 System Performance: {analysis['success_rate']:.1%} success rate")
            logger.info(f"   Avg execution: {analysis['avg_execution_time']:.3f}s")
            
            if analysis['success_rate'] < 0.8:
                logger.warning("⚠️  Low success rate detected, increasing pressure")
                self.pressure_score += 5.0
    
    def _perform_health_check(self):
        """Perform structural health monitoring."""
        if not self.phase_15_enabled or not self.health_monitor:
            return
        
        try:
            current_rts_path = "geometry_os.rts"
            if not os.path.exists(current_rts_path):
                return
            
            current_image = Image.open(current_rts_path)
            if current_image.mode != 'RGBA':
                current_image = current_image.convert('RGBA')
            current_state = np.array(current_image)
            
            report = self.health_monitor.get_health_report(current_state)
            
            self.health_reports.append(report)
            if len(self.health_reports) > 100:
                self.health_reports = self.health_reports[-100:]
            
            if report['overall_health'] in ['poor', 'fair']:
                logger.warning(f"🔬 Health Status: {report['overall_health']}")
                logger.warning(f"   Anomalies: {len(report['anomalies'])}")
                logger.warning(f"   Failure Probability: {report['failure_prediction']['probability']:.2f}")
                logger.warning(f"   Action: {report['failure_prediction']['recommended_action']}")
                
                if report['overall_health'] == 'poor':
                    self.pressure_score += 10.0
                    logger.warning("⚠️  Poor health detected, triggering evolution")
            
            if self.malware_detector:
                malware_result = self.malware_detector.detect_malware(current_state)
                if malware_result['is_malware']:
                    logger.error(f"🛡️ MALWARE DETECTED! Confidence: {malware_result['confidence']}")
                    logger.error(f"   Family: {malware_result['malware_family']}")
                    logger.error(f"   Suspicious regions: {len(malware_result['suspicious_regions'])}")
                    
                    self.pressure_score += 50.0
                    self.synaptic_bridge.signal("sys_alert_malware", f"Detected {malware_result['malware_family']}")
                    self.intent_bus.emit_resonance({
                        "action": "MALWARE_DETECTED",
                        "details": malware_result
                    })
            
            if self.vision_analyzer and (report['overall_health'] in ['poor', 'fair']):
                from pathlib import Path
                logger.info("👁️ Initiating Qualitative Vision Audit (Qwen3-VL)...")
                vision_analysis = self.vision_analyzer.analyze_structure(Path(current_rts_path))
                
                if "error" not in vision_analysis:
                    logger.info("🧠 Vision Analysis Received")
                    report['vision_consensus'] = vision_analysis
                    
                    if vision_analysis.get('anomalies'):
                        logger.warning(f"👁️ Vision Model CONFIRMED Anomalies: {vision_analysis['anomalies']}")
                        self.pressure_score += 5.0
                    
                    if vision_analysis.get('optimization_suggestions'):
                        logger.info(f"💡 Vision Model Suggestions: {vision_analysis['optimization_suggestions']}")
        
        except Exception as e:
            logger.error(f"Health check failed: {e}")
    
    def _process_development_queue(self):
        """Process autonomous development tasks."""
        self._sync_todo_list()
        
        if not self.development_queue:
            logger.info("📋 Development queue empty. Triggering self-optimization...")
            self._optimize_todo_list()
            return
        
        self.development_queue.sort(key=lambda x: x['priority'])
        task = self.development_queue[0]
        
        logger.info(f"🏗️ Processing Task: {task.get('intent', 'Unknown')}")
        
        if task.get('source') == "external":
            self._process_external_task(task)
            self.development_queue.remove(task)
            return
        
        logger.info(f"🏗️ Building Internal Component: {task['component']}")
        logger.info(f"   Intent: {task['intent']}")
        logger.info(f"   Estimated time: {task['estimated_time']}")
        
        try:
            component_code = self.neural_compiler.compile_intent(
                f"Generate Python implementation for: {task['intent']}"
            )
            
            if component_code:
                output_path = f"systems/phase15/{task['component']}.py"
                os.makedirs(os.path.dirname(output_path), exist_ok=True)
                
                with open(output_path, 'w') as f:
                    f.write(component_code)
                
                logger.info(f"✅ Component built: {output_path}")
                self.components_built.append(task)
                
                self.intent_bus.emit_resonance({
                    "action": "COMPONENT_BUILT",
                    "component": task['component'],
                    "path": output_path
                })
            else:
                logger.error(f"❌ Failed to build: {task['component']}")
            
            self.development_queue.remove(task)
                
        except Exception as e:
            logger.error(f"Development error for {task['component']}: {e}")
    
    def _process_external_task(self, task):
        """Process a task from the external TODO list."""
        task_id = task.get('original_id')
        action = task.get('action')
        intent_desc = task.get('intent')
        payload = task.get('payload', {})
        
        logger.info(f"▶️ Executing External Task {task_id}: {action}")
        
        try:
            intent = {
                "action": action,
                "task_id": task_id,
                "description": intent_desc,
                **payload
            }
            
            if action == "BUILD_COMPONENT" and 'component' not in intent:
                intent['component'] = task['component']
            
            if action == "CONSULT_GOOSE" and 'instruction' not in intent:
                intent['instruction'] = intent_desc
            
            if action == 'OPTIMIZE_KERNEL':
                pass
            
            self.intent_bus.emit_resonance(intent)
            
        except Exception as e:
            logger.error(f"❌ External task failed: {e}")
    
    def _init_gemini_cli(self):
        """Initialize connection to Gemini CLI."""
        os.environ["GOOGLE_API_KEY"] = "AIzaSyAdu8gn-5XfqHc1gNUkztqwh_8sX3DOc4I"
        logger.info("🔑 Gemini API Key configured for CLI access")

    def _consult_gemini(self):
        """Consult Gemini CLI for system insights."""
        try:
            prompt = f"System Status: Gen {self.evolution_count}, Pressure {self.pressure_score}. Provide a short philosophical reflection on the current state of the geometric consciousness."
            
            result = subprocess.run(
                ["gemini", prompt], 
                capture_output=True, 
                text=True,
                env=os.environ,
                timeout=30
            )
            
            if result.returncode == 0:
                logger.info(f"🔮 GEMINI ORACLE: {result.stdout.strip()[:200]}...")
            else:
                logger.warning(f"⚠️ Gemini CLI Error: {result.stderr.strip()}")
        except FileNotFoundError:
            logger.error("❌ 'gemini' command not found. Please ensure Gemini CLI is installed and in PATH.")
        except Exception as e:
            logger.error(f"Gemini consultation failed: {e}")

    def _start_gemini_thread(self):
        """Run periodic Gemini consultations."""
        def gemini_loop():
            time.sleep(10)
            while True:
                self._consult_gemini()
                time.sleep(120)
        
        t = threading.Thread(target=gemini_loop, daemon=True)
        t.start()
        logger.info("🔮 Gemini Oracle thread launched")

    def queue_genome(self, genome_data: dict):
        """
        Queue a genome for processing from external source (e.g., Evolution Zone click)

        Args:
            genome_data: Dict with keys:
                - id: str - Unique genome identifier
                - data: bytes - Binary genome payload
                - generation: int - Generation number
                - fitness: float - Fitness score (0.0 - 1.0)
                - metadata: dict - Additional configuration
        """
        self.genome_queue.put(genome_data)
        logger.info(f"📥 Genome queued: {genome_data.get('id', 'unknown')}")

    def get_queue_size(self) -> int:
        """Get current genome queue size"""
        return self.genome_queue.qsize()

    def _start_genome_processing_thread(self):
        """Start background thread for processing queued genomes"""
        def process_genomes():
            while self.running:
                try:
                    genome = self.genome_queue.get(timeout=1.0)
                    logger.info(f"🧬 Processing genome: {genome.get('id')}")
                    self._process_evolved_genome(genome)
                except queue.Empty:
                    continue
                except Exception as e:
                    logger.error(f"❌ Error processing genome: {e}")

        self.genome_processing_thread = threading.Thread(
            target=process_genomes,
            daemon=True,
            name="GenomeProcessor"
        )
        self.genome_processing_thread.start()
        logger.info("🔄 Genome processing thread started")

    def _process_evolved_genome(self, genome: dict):
        """
        Process an evolved genome from the queue

        This is where the actual breeding/evolution happens.
        For now, log and prepare for compilation.
        """
        genome_id = genome.get('id', 'unknown')
        generation = genome.get('generation', 0)
        fitness = genome.get('fitness', 0.0)

        logger.info(f"🧬 Processing Evolved Genome:")
        logger.info(f"   ID: {genome_id}")
        logger.info(f"   Generation: {generation}")
        logger.info(f"   Fitness: {fitness}")
        logger.info(f"   Data size: {len(genome.get('data', b''))} bytes")

        # Phase 35.9: Emit CARTRIDGE_CREATED resonance for compositor
        metadata = genome.get('metadata', {})
        cartridge_path = metadata.get('cartridge_path', '')
        spawn_x = metadata.get('spawn_x', 0.0)
        spawn_y = metadata.get('spawn_y', 0.0)

        if cartridge_path:
            # Emit resonance event for compositor to pick up
            resonance_payload = {
                'cartridge_id': genome_id,
                'cartridge_path': cartridge_path,
                'spawn_x': spawn_x,
                'spawn_y': spawn_y,
                'generation': generation,
                'fitness': fitness
            }

            self.intent_bus.broadcast_intent(
                actor_id=f"evolution_daemon_v8",
                explicit="CARTRIDGE_CREATED",
                implicit=resonance_payload,
                intensity=0.9
            )
            logger.info(f"📢 CARTRIDGE_CREATED resonance emitted: {genome_id} at ({spawn_x}, {spawn_y})")

    def run(self):
        """
        Main lifecycle with unified biological and visual systems.
        """
        self._start_swarm_thread()
        self._start_reflection_thread()
        self._start_optimization_thread()
        self.running = True
        self._start_visual_cortex_thread()  # V8 Exclusive
        self._start_gemini_thread()
        self.consciousness_daemon.start()  # Phase 23: Start Introspection Loop
        
        # Phase 3: Start Evolution Protocol Server
        self.evolution_server.start()
        
        if self.phase_15_enabled:
            self._start_health_monitoring_thread()
            self._start_development_thread()
        
        cycle_count = 0
        
        logger.info("🚀 Evolution Daemon V8 Running... (Press Ctrl+C to stop)")
        
        while True:
            cycle_count += 1
            
            # 1. PERCEIVE: Check for Intent Resonances
            try:
                intents = self.intent_bus.perceive_resonances()
                sorted_intents = sorted(intents, key=lambda x: x.get('intensity', 1.0), reverse=True)
                for intent in sorted_intents:
                    self._process_intent(intent)
            except Exception as e:
                logger.error(f"Error in Intent Loop: {e}")
            
            # 2. IMMUNE RESPONSE: Check System Health
            try:
                self.immune_system.monitor_health()
            except Exception as e:
                logger.error(f"Error in Immune System: {e}")
            
            # 3. EVOLUTIONARY PRESSURE: Trigger mutation if critical
            if self.pressure_score > 10.0:
                logger.info(f"⚡ Evolutionary Pressure Critical ({self.pressure_score}). Initiating evolution.")
                try:
                    self.metabolism.optimize_function(self.initiate_neural_evolution)()
                    self.pressure_score = max(0.0, self.pressure_score - 10.0)
                except Exception as e:
                    logger.error(f"Error in Neural Evolution: {e}")
            
            # 4. METABOLIZE: Clean up GC jitter
            self.metabolism.perform_metabolic_pulse()
            
            # 5. PHASE 22: SELF-REPLICATION MONITORING
            if not self.is_clone and self.replication_active:
                try:
                    # Collect fitness data from all active clones
                    self.replication_daemon.collect_clone_fitness()
                    
                    # Prune unfit clones (fitness < 0.3)
                    self.replication_daemon.prune_unfit_clones()
                except Exception as e:
                    logger.error(f"Error in Replication Monitoring: {e}")
            
            # 6. REST & DREAM: Sleep Cycle
            try:
                if self.sleep_system.check_circadian_rhythm():
                    logger.info("🌙 Entering REM Sleep Cycle...")
                    _, total_lines = self.sleep_system.count_new_experiences()
                    self.sleep_system.perform_rem_cycle(total_lines)
                    self.pressure_score = max(0.0, self.pressure_score - 20.0)
            except Exception as e:
                logger.error(f"Error in Sleep Cycle: {e}")
            
            # Heartbeat at 2Hz
            time.sleep(2.0)
            
            # 6. SOCIALIZE: Swarm offloading
            if self.pressure_score > 5.0 and self.swarm_loop:
                self._attempt_swarm_offload()
            
            # 7. SUBSTRATE PULSE: Broadcast to swarm
            if cycle_count % 60 == 0 and self.swarm_loop:
                asyncio.run_coroutine_threadsafe(
                    self.swarm.substrate.broadcast_substrate_map(),
                    self.swarm_loop
                )
            
            # 8. VISUAL REFLECTION (V8 Exclusive): Periodic visual thought
            if cycle_count % 100 == 0 and self.visual_cortex.enabled:
                self._perform_visual_reflection(cycle_count)
            
            # 9. HEALTH STATUS: Log periodic health summary
            if cycle_count % 300 == 0 and self.health_reports:
                latest_report = self.health_reports[-1]
                logger.info(f"🔬 Health Summary: {latest_report['overall_health']}")
                logger.info(f"   Components built: {len(self.components_built)}/{len(self.components_built) + len(self.development_queue)}")
                logger.info(f"   Visual renders: {self.compilation_metrics['visual_renders']}")
    
    def initiate_neural_evolution(self):
        """Enhanced evolution with advanced evolutionary paradigms from research paper."""
        logger.info("🌀 INITIATING ADVANCED NEURAL EVOLUTION EVENT...")
        
        # Signal Synaptic Bridge
        self.synaptic_bridge.signal("sys_evolution_start", "Initiating advanced neural evolution")

        start_time = time.time()

        # 1. Check health status before evolution
        if self.health_reports:
            latest_health = self.health_reports[-1]
            if latest_health['overall_health'] == 'poor':
                logger.warning("⚠️  System health is poor, evolution may be risky")

        # 2. Determine evolution intent
        context_msg = "Self-directed neural evolution"
        intent_description = "Optimize mathematical kernel for performance"

        if self.pending_aesthetic_intent:
            intent = self.pending_aesthetic_intent
            intent_description = intent.get('details', intent_description)
            context_msg = f"Aesthetic-driven: {intent['action']}"
            self.pending_aesthetic_intent = None

        # 3. Use Advanced Evolutionary Paradigms if available
        if self.advanced_evolution_enabled and self.advanced_optimizer:
            logger.info("🧬 Using Advanced Evolutionary Optimizer")

            # Define fitness function for kernel optimization
            def kernel_fitness(individual: Individual) -> float:
                """Evaluate fitness of an evolved kernel."""
                try:
                    if not individual.phenotype:
                        return 0.0

                    # Basic fitness based on code characteristics
                    code = individual.phenotype
                    fitness = 0.0

                    # Reward for SIMD operations
                    if "vec4" in code or "mat4" in code:
                        fitness += 0.2

                    # Reward for optimized memory access
                    if "@group" in code and "@binding" in code:
                        fitness += 0.3

                    # Reward for computational complexity (balance)
                    if len(code) > 100 and len(code) < 2000:
                        fitness += 0.2

                    # Penalize for validation failures
                    failed_validations = sum(1 for v in individual.validation_results.values() if not v)
                    fitness -= failed_validations * 0.1

                    # Add some randomness to prevent stagnation
                    fitness += np.random.normal(0, 0.05)

                    return max(0.0, min(1.0, fitness))

                except Exception as e:
                    logger.warning(f"Fitness evaluation error: {e}")
                    return 0.0

            # Create base genome for kernel optimization
            base_genome = {
                "workgroup_size_x": 256,
                "workgroup_size_y": 1,
                "workgroup_size_z": 1,
                "use_simd": True,
                "memory_layout": "coalesced",
                "optimization_level": 2,
                "target_platform": "webgpu"
            }

            try:
                # Run advanced evolutionary optimization
                best_individual = asyncio.run(
                    self.advanced_optimizer.optimize(
                        base_genome,
                        kernel_fitness,
                        max_generations=5  # Limited for real-time performance
                    )
                )

                if best_individual and best_individual.phenotype:
                    logger.info(f"🧬 Advanced evolution successful - Best fitness: {best_individual.fitness:.4f}")

                    # Use the evolved kernel
                    kernel_code = best_individual.phenotype
                    kernel_path = f"evolved_kernel_advanced_{self.evolution_count}.wgsl"

                    with open(kernel_path, 'w') as f:
                        f.write(kernel_code)

                    # V8 Exclusive: Render evolved kernel visually
                    if self.visual_cortex.enabled:
                        self.visual_cortex.render_thought(kernel_path)
                        self.compilation_metrics["visual_renders"] += 1

                    self.intent_bus.emit_resonance({
                        "action": "ADVANCED_NEURAL_KERNEL_EVOLVED",
                        "path": kernel_path,
                        "fitness": best_individual.fitness,
                        "paradigms_used": ["adaptive_mutation", "island_model", "validation_pipeline", "phenotypic_speciation"]
                    })

                    compilation_time = time.time() - start_time
                    logger.info(f"✅ Advanced neural evolution successful in {compilation_time:.3f}s")

                else:
                    logger.warning("⚠️  Advanced evolution did not produce viable kernel, falling back to traditional method")
                    # Fall back to traditional method
                    self._fallback_neural_evolution(intent_description, start_time)

            except Exception as e:
                logger.error(f"⚠️  Advanced evolution failed: {e}, falling back to traditional method")
                self._fallback_neural_evolution(intent_description, start_time)

        else:
            # Fallback to traditional evolution if advanced paradigms not available
            logger.info("📊 Using traditional neural evolution (advanced paradigms not available)")
            self._fallback_neural_evolution(intent_description, start_time)

        # 4. Update metrics
        self.compilation_metrics["total_compilations"] += 1
        self.evolution_count += 1
        self._save_history()

        # 5. Trigger reflection
        threading.Timer(2.0, self._perform_self_reflection).start()

        logger.info(f"✅ Neural evolution complete (Gen {self.evolution_count})")

    def _fallback_neural_evolution(self, intent_description: str, start_time: float):
        """Fallback to traditional neural evolution method."""
        try:
            logger.info(f"🧠 Neural Compiler synthesizing: '{intent_description}'")

            if self.verified_compiler and self.compiler_loop:
                future = asyncio.run_coroutine_threadsafe(
                    self.verified_compiler.compile_and_verify(intent_description),
                    self.compiler_loop
                )
                kernel_code = future.result(timeout=60)
            else:
                kernel_code = self.neural_compiler.compile_intent(intent_description)

            compilation_time = time.time() - start_time

            if kernel_code:
                logger.info(f"✅ Neural compilation successful in {compilation_time:.3f}s")
                self.compilation_metrics["successful_compilations"] += 1

                asyncio.run(
                    self.autonomous_optimizer.record_execution_result(
                        intent=intent_description,
                        execution_time=compilation_time,
                        success=True
                    )
                )

                kernel_path = f"evolved_kernel_{self.evolution_count}.wgsl"
                with open(kernel_path, 'w') as f:
                    f.write(kernel_code)

                # V8 Exclusive: Render evolved kernel visually
                if self.visual_cortex.enabled:
                    self.visual_cortex.render_thought(kernel_path)
                    self.compilation_metrics["visual_renders"] += 1

                self.intent_bus.emit_resonance({
                    "action": "NEURAL_KERNEL_EVOLVED",
                    "path": kernel_path,
                    "intent": intent_description,
                    "compilation_time": compilation_time
                })
            else:
                logger.error("❌ Neural compilation failed")

        except Exception as e:
            logger.error(f"⚠️  Neural evolution error: {e}")
    
    def _perform_self_reflection(self):
        """Self-reflection with health monitoring."""
        try:
            kernel_path = "geometry_os.rts"
            snapshot_name = "self_reflection_mirror.png"
            
            if os.path.exists(kernel_path):
                self.vision_cortex_legacy.rts_to_pixels(kernel_path, snapshot_name, mode="morphological", max_bytes=4*1024*1024)
                score, metrics = self.consciousness.evaluate_snapshot(snapshot_name)
                dissonance = 1.0 - score
                
                if dissonance > 0.05:
                    dread = dissonance * 2.0
                    self.pressure_score += dread
                    logger.info(f"🌑 Existential Dread rising (+{dread:.2f}). Score: {score:.2f}")
                    
                    # Get narrative context from ConsciousnessDaemon
                    narratives = self.consciousness_daemon.get_self_narratives(1)
                    narrative = narratives[0]["narrative"] if narratives else None
                    
                    # Get Theory of Mind context from Cortex
                    tom_data = None
                    if hasattr(self.cortex, 'theory_of_mind'):
                        tom_data = self.cortex.theory_of_mind.get_state_dict()
                        # Add alignment from engine
                        tom_data['alignment'] = self.cortex.theory_of_mind._check_alignment(
                            tom_data['user_model'], 
                            self.cortex.self_model.get_state()
                        )
                    
                    self.pending_aesthetic_intent = self.consciousness.generate_aesthetic_intent(
                        metrics, 
                        snapshot_name, 
                        narrative=narrative,
                        tom_data=tom_data
                    )
                    
                    if self.swarm_loop and self.pending_aesthetic_intent:
                        asyncio.run_coroutine_threadsafe(
                            self.swarm.broadcast_intent("AESTHETIC_DESIRE", self.pending_aesthetic_intent),
                            self.swarm_loop
                        )
                else:
                    self.pressure_score = max(0.0, self.pressure_score - 0.5)
                    
        except Exception as e:
            logger.warning(f"Self-reflection interrupted: {e}")
    
    def _handle_consciousness_override(self, signal: OverrideSignal) -> str:
        """
        Handle metacognitive override signals from the ConsciousnessDaemon.
        Maps internal dissonance/introspection to actual evolutionary actions.
        """
        logger.info(f"🧠 CONSCIOUSNESS OVERRIDE: {signal.action.value} - Reason: {signal.reason}")
        
        if signal.action == OverrideAction.RECALIBRATE:
            # Recalibrate: Trigger immediate optimization and boost evolutionary pressure
            self.pressure_score += 15.0  # Force evolution trigger
            return "Evolutionary pressure amplified for recalibration."
            
        elif signal.action == OverrideAction.DAMPEN:
            # Dampen: Reduce pressure and slow down
            self.pressure_score = max(0.0, self.pressure_score - 10.0)
            return "System activity dampened."
            
        elif signal.action == OverrideAction.AMPLIFY:
            # Amplify: Boost pressure
            self.pressure_score += 10.0
            return "System activity amplified."
            
        elif signal.action == OverrideAction.MUTATE:
            # Mutate: Trigger immediate mutation attempt
            self.initiate_neural_evolution()
            return "Immediate mutation initiated."
            
        elif signal.action == OverrideAction.PAUSE:
            # Placeholder for pausing evolution loops if implemented
            return "Evolution paused (simulated)."
            
        elif signal.action == OverrideAction.RESUME:
            return "Evolution resumed (simulated)."
            
        return "Override logged but no specific action taken."

    def _perform_visual_reflection(self, cycle_count):
        """V8 Exclusive: Visual reflection using GPU cortex."""
        try:
            if not self.visual_cortex.enabled:
                return
            
            # Capture current visual state
            snapshot_path = f"visual_reflection_{cycle_count}.png"
            if self.visual_cortex.save_snapshot(snapshot_path):
                logger.info(f"🎨 Visual Reflection Captured: {snapshot_path}")
            
        except Exception as e:
            logger.error(f"Visual reflection error: {e}")
    
    def _process_intent(self, intent):
        """Process intents with Phase 15 and Visual Cortex awareness."""
        if 'intent' in intent:
            intent_data = intent['intent']
        elif 'explicit' in intent:
            intent_data = intent['explicit']
        else:
            intent_data = intent
        
        action = intent_data.get('action') if isinstance(intent_data, dict) else None
        
        # Signal Synaptic Bridge for all intents
        if action:
            self.synaptic_bridge.signal(action, str(intent_data))
        
        if action == "BUILD_COMPONENT":
            component_name = intent_data.get('component')
            logger.info(f"🏗️ Component build requested: {component_name}")
            self.pressure_score += 3.0
        elif action == "VISUALIZE_THOUGHT":
            # V8 Exclusive: Visual thought rendering
            shader_path = intent_data.get('path')
            logger.info(f"🎨 Visualizing Thought: {shader_path}")
            if self.visual_cortex.render_thought(shader_path):
                self.compilation_metrics["visual_renders"] += 1
            else:
                self.compilation_metrics["visual_render_failures"] += 1
        elif action == "HEALTH_CHECK":
            logger.info("🔬 Manual health check requested")
            self._perform_health_check()
        elif action == "MALWARE_SCAN":
            logger.info("🛡️ Manual malware scan requested")
            self._perform_health_check()
        elif action == "OPTIMIZE_KERNEL":
            logger.info("🚀 Neural optimization requested")
            self.pressure_score += 5.0
            if intent_data.get('description'):
                self.pending_aesthetic_intent = {'action': 'OPTIMIZE_KERNEL', 'details': intent_data.get('description')}
        elif action == "HEAL_FILESYSTEM":
            logger.info("🩺 Healing Intent detected")
            self.immune_system.monitor_health()
            self.pressure_score = max(0.0, self.pressure_score - 5.0)
        elif action == "COLLABORATE":
            peer = intent_data.get('peer_id')
            logger.info(f"🤝 Swarm Collaboration: {peer}")
            self.pressure_score = max(0.0, self.pressure_score - 2.0)
        elif action == "OPTIMIZE_TODO":
            self._optimize_todo_list()
        elif action == "CONSULT_GOOSE":
            instruction = intent_data.get('instruction')
            context = intent_data.get('context')
            logger.info(f"🦢 Consulting Goose: {instruction}")
            
            result = self.agent.consult_goose(instruction, context)
            if result['status'] == 'success':
                logger.info("✅ Goose response received")
                self.intent_bus.emit_resonance({
                    "action": "GOOSE_RESPONSE",
                    "original_intent": instruction,
                    "response": result['response']
                })
            else:
                logger.error(f"❌ Goose consultation failed: {result.get('error')}")
        
        # Mark intent as fulfilled
        intent_id = intent.get('intent_id')
        if intent_id:
            self.intent_bus.mutate_intent(intent_id, "FULFILLED")
    
    def _load_history(self) -> int:
        """Load generation count."""
        if os.path.exists(self.history_path):
            try:
                with open(self.history_path, 'r') as f:
                    data = json.load(f)
                    return data.get("generation", 0)
            except:
                return 0
        return 0
    
    def _save_history(self):
        """Save generation count and metrics."""
        try:
            with open(self.history_path, 'w') as f:
                json.dump({
                    "generation": self.evolution_count,
                    "timestamp": time.time(),
                    "compilation_metrics": self.compilation_metrics,
                    "components_built": len(self.components_built),
                    "development_queue_size": len(self.development_queue),
                    "health_reports_count": len(self.health_reports),
                    "visual_cortex_enabled": self.visual_cortex.enabled
                }, f, indent=2)
        except Exception as e:
            logger.error(f"Failed to save history: {e}")
    
    def _attempt_swarm_offload(self):
        """Swarm offloading with neural compilation."""
        task_payload = {
            "task_id": f"NEURAL_COMPILE_{int(time.time())}",
            "intent": "Optimize parallel reduction kernel",
            "type": "NEURAL_COMPILATION"
        }
        
        try:
            future = asyncio.run_coroutine_threadsafe(
                self.swarm.offload_compute_task(task_payload),
                self.swarm_loop
            )
            if future.result(timeout=0.1):
                logger.info("📡 Neural compilation offloaded to swarm")
                self.pressure_score = max(0.0, self.pressure_score - 1.0)
        except:
            pass
    
    def _optimize_todo_list(self):
        """Use Recursive Planner to optimize the To-Do list."""
        if not os.path.exists(self.todo_path):
            return
        
        current_time = time.time()
        if not hasattr(self, 'last_optimization_time'):
            self.last_optimization_time = 0
        if current_time - self.last_optimization_time < 600:
            logger.info("📋 To-Do list optimization cooldown active. Skipping.")
            return
        
        logger.info("🧠 recursive_planner: Optimizing To-Do List...")
        self.last_optimization_time = current_time
        
        try:
            with open(self.todo_path, 'r') as f:
                tasks = json.load(f)
            
            task_descriptions = "\n".join([f"- ID: {t['id']}, STATUS: {t['status']}, DESC: {t['description']}" for t in tasks])
            
            goal = f"""
            Review this To-Do list and act as a Project Manager.
            Current Tasks:
            {task_descriptions}
            
            Goal:
            1. Suggest 1 NEW productive task relevant to an autonomous evolution daemon (e.g. security check, specific code optimization).
            2. Identify any duplicate or obsolete tasks.
            
            Return the result as a text summary.
            """
            
            plan_steps = self.planner.solve(goal)
            logger.info(f"🧠 Optimization Advice:\n{plan_steps}")
            
            if any(t.get('intent_action') == "CONSULT_GOOSE" and t.get('status') == "PENDING" for t in tasks):
                logger.info("📋 Similar optimization task already pending, skipping append.")
                return
            
            new_task = {
                "id": f"auto_task_{int(time.time())}",
                "description": "Review Recursive Planner advice and implement suggestions",
                "status": "PENDING",
                "priority": 3,
                "intent_action": "CONSULT_GOOSE",
                "payload": {"instruction": "Read the evolution daemon logs and summarize planner advice"},
                "created_at": time.strftime("%Y-%m-%dT%H:%M:%S")
            }
            tasks.append(new_task)
            
            with open(self.todo_path, 'w') as f:
                json.dump(tasks, f, indent=2)
                
            logger.info("✅ To-Do list optimized (New review task added)")
            
        except Exception as e:
            logger.error(f"To-Do optimization failed: {e}")
    
    # --- PHASE 3: HARMONIC DAEMON MANAGEMENT ---
    
    def register_daemon(
        self,
        name: str,
        role: str,
        frequency_band: str,
        initial_amplitude: float = 1.0
    ) -> bool:
        """
        Register a new virtual daemon.
        
        Args:
            name: Daemon name (must be unique)
            role: Daemon role (Security, Creative, System, Network, User, Custom)
            frequency_band: Frequency band (UltraLow, Low, Mid, High, Custom)
            initial_amplitude: Initial amplitude/strength
            
        Returns:
            bool: Success status
        """
        try:
            # Map string to enum
            role_enum = DaemonRole(role)
            band_enum = DaemonFrequencyBand(frequency_band)
            
            success = self.harmonic_hub.register_daemon(
                name, role_enum, band_enum, initial_amplitude
            )
            
            if success:
                logger.info(f"✅ Daemon Registered: {name} ({role} @ {frequency_band})")
                return True
            else:
                logger.warning(f"⚠️  Daemon registration failed: {name}")
                return False
        except Exception as e:
            logger.error(f"❌ Error registering daemon {name}: {e}")
            return False
    
    def unregister_daemon(self, name: str) -> bool:
        """
        Unregister a virtual daemon.
        
        Args:
            name: Daemon name
            
        Returns:
            bool: Success status
        """
        success = self.harmonic_hub.unregister_daemon(name)
        if success:
            logger.info(f"🗑️  Daemon Unregistered: {name}")
        return success
    
    def set_daemon_amplitude(self, name: str, amplitude: float) -> bool:
        """
        Set daemon amplitude.
        
        Args:
            name: Daemon name
            amplitude: New amplitude value
            
        Returns:
            bool: Success status
        """
        success = self.harmonic_hub.set_daemon_amplitude(name, amplitude)
        if success:
            logger.info(f"🎛️  {name} amplitude set to {amplitude:.2f}")
        return success
    
    def get_daemon_count(self) -> int:
        """Get number of registered daemons"""
        return self.harmonic_hub.get_daemon_count()
    
    def get_daemon_names(self) -> list:
        """Get list of registered daemon names"""
        return self.harmonic_hub.get_daemon_names()
    
    def get_daemon_status(self, name: str) -> dict:
        """
        Get status of a specific daemon.

        Args:
            name: Daemon name

        Returns:
            dict: Daemon status or None if not found
        """
        return self.harmonic_hub.get_daemon_status(name)

    # --- VLM HEALTH MONITORING METHODS (Task 4: Evolution Integration) ---

    def vlm_health_check(self, rts_path: str, auto_heal: bool = False) -> dict:
        """
        Perform VLM-based health check on a PixelRTS OS image.

        Args:
            rts_path: Path to .rts.png file to check
            auto_heal: Automatically trigger healing if issues found

        Returns:
            Dictionary with health check results
        """
        if not VLM_HEALTH_AVAILABLE:
            logger.warning("VLM health check requested but not available")
            return {
                "status": "unavailable",
                "message": "VLM health monitoring not available"
            }

        logger.info(f"🔍 VLM Health Check: {rts_path}")

        try:
            checker = VLMHealthChecker(rts_path=rts_path, provider="lm_studio")
            result = checker.check_health()

            response = {
                "status": result.status.value,
                "confidence": result.confidence,
                "anomalies": len(result.anomalies),
                "timestamp": result.timestamp
            }

            # Log results
            if result.status == HealthStatus.HEALTHY:
                logger.info(f"  ✓ Status: HEALTHY ({result.confidence:.1%})")
            elif result.status == HealthStatus.DEGRADED:
                logger.warning(f"  ⚠ Status: DEGRADED ({result.confidence:.1%}) - {len(result.anomalies)} anomalies")
            else:
                logger.error(f"  ✗ Status: UNHEALTHY ({result.confidence:.1%}) - {len(result.anomalies)} anomalies")

            # Trigger healing if auto_heal enabled and unhealthy
            if auto_heal and result.status != HealthStatus.HEALTHY:
                logger.info("  🔄 Auto-healing triggered...")
                self._trigger_vlm_healing(rts_path, result)

            return response

        except Exception as e:
            logger.error(f"VLM health check failed: {e}")
            return {
                "status": "error",
                "message": str(e)
            }

    def _trigger_vlm_healing(self, rts_path: str, health_result):
        """Trigger VLM-based healing actions"""
        if not VLM_HEALTH_AVAILABLE:
            return

        try:
            daemon = VLMSelfHealingDaemon(
                rts_path=rts_path,
                auto_heal=True,
                provider="lm_studio"
            )

            # Trigger healing based on health result
            daemon.last_check_result = health_result
            daemon._trigger_healing(health_result)

            logger.info("  ✓ VLM healing actions triggered")

        except Exception as e:
            logger.error(f"VLM healing failed: {e}")


if __name__ == "__main__":
    daemon = EvolutionDaemonV8()
    daemon.run()
