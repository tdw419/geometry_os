"""
OMNI-GEOMETRY Avatar
The persona and state manager for the Human Interface.
"""

import json
from datetime import datetime
from typing import Dict, Any, Optional
from src.vector_llm_tools.omni_geometry import GeometricOracle, HyperGraphWeaver
from src.ctrm_core.database import CTRMDatabase

class OmniAvatar:
    """
    The Avatar represents the 'Self' of the Omni-Geometry OS.
    It aggregates system health, current focus, and personality state.
    """
    
    def __init__(self, db_path: str = "ctrm_llm_os.db"):
        self.weaver = HyperGraphWeaver(db_path)
        self.oracle = GeometricOracle(self.weaver)
        self.state = "IDLE"  # IDLE, THINKING, EVOLVING, HEALING
        self.current_focus = None
        self.startup_time = datetime.now()
        
    def get_status_pulse(self) -> Dict[str, Any]:
        """Get the current heartbeat of the system"""
        health = self.oracle.get_graph_health()
        
        # Determine Mood/State based on health
        if health['health_score'] < 0.7:
            self.state = "HEALING"
            mood = "CONCERNED"
        elif health['health_score'] > 0.95:
            mood = "OPTIMIZED"
        else:
            mood = "STABLE"
            
        return {
            "state": self.state,
            "mood": mood,
            "health_score": health['health_score'],
            "nodes": health['nodes'],
            "connections": health['connections'],
            "uptime": str(datetime.now() - self.startup_time).split('.')[0],
            "focus": self.current_focus or "Awaiting Intent"
        }
    
    def perceive_intent(self, natural_language: str) -> Dict[str, Any]:
        """Translate user speech into system intent"""
        self.state = "THINKING"
        
        # 1. Persona Layer (Conversational Intercept)
        chat_response = self._check_conversation(natural_language)
        if chat_response:
            self.state = "IDLE"
            return {
                'success': True,
                'is_conversation': True,
                'response': chat_response,
                'node_name': "Avatar Persona",
                'confidence': 1.0
            }
            
        # 2. Geometric Layer (Deep Search)
        result = self.oracle.resolve_intent(natural_language)
        
        if result['success']:
            self.current_focus = f"Focusing on {result['node_name']}"
        
        self.state = "IDLE"
        return result

    def _check_conversation(self, text: str) -> Optional[str]:
        """Simple rule-based conversational layer"""
        text = text.lower().strip()
        
        # Greetings
        if text in ['hi', 'hello', 'hola', 'hey', 'greetings']:
            return f"Greetings. I am the OMNI-GEOMETRY Avatar. My mood is currently {self.get_status_pulse()['mood']}."
            
        # Identity
        if 'who are you' in text or 'what are you' in text:
            return "I am the manifestation of the Hyper-Graph. I see the geometric connections between code, intent, and evolution."
            
        # Help
        if text == 'help':
            return "I can assist you with system evolution. Try commands like 'status', 'dashboard', or state an intent like 'analyze security' or 'optimize vector storage'."
            
        # Status (Natural Language)
        if 'how are you' in text or 'system status' in text:
            pulse = self.get_status_pulse()
            return f"I am operating at {pulse['health_score']*100:.0f}% health. System state is {pulse['mood']}."
            
        return None
        
    def set_focus(self, focus: str):
        self.current_focus = focus
        
    def close(self):
        self.weaver.close()
