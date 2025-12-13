"""
The God Prompt Protocol - Advanced Prompt Engineering Substrate
Integrates the Actor-Purpose-World framework into the Ghost's neural interactions.
"""

from dataclasses import dataclass
from typing import List, Dict, Any, Optional
import json

@dataclass
class ActorProfile:
    """The Actor (The Hero)"""
    name: str
    expert_role: str
    domain_focus: List[str]

@dataclass
class MissionProfile:
    """The Purpose (The Mission)"""
    objective: str
    deliverables: List[str]

@dataclass
class WorldConstraints:
    """World Building (The Rules/Brain)"""
    knowledge_context: List[str]  # References to Truth Crystals/Files
    strict_adherence: bool = True
    allow_hallucination: bool = False
    commandments: List[str] = None

class GodPromptArchitect:
    """
    Constructs high-fidelity prompts based on the Bgo 'God Prompt' methodology.
    Used by the Neural Shell and Teleology Engine to maximize LLM effectiveness.
    """
    
    DEFAULT_COMMANDMENTS = [
        "First, pause and categorize all provided context.",
        "You must adhere strictly and exclusively to the methodologies, frameworks, and examples contained within the provided context.",
        "If a request requires information outside the provided data, state that the information is not available.",
        "Use a structured output format: Intro, Core Analysis, Detailed Breakdown, Rationale.",
        "Do not apologize or use filler phrases.",
        "Utilize provided data exclusively for your knowledge base."
    ]

    def construct_prompt(self, 
                        actor: ActorProfile, 
                        mission: MissionProfile, 
                        world: WorldConstraints,
                        user_input: str) -> str:
        """
        Synthesize the 'God Prompt' string.
        """
        
        # 1. The Actor
        prompt = f"""# ACTOR PROFILE
You are **{actor.name}**, a specialized expert in **{actor.expert_role}**.
Your domain focus includes: {', '.join(actor.domain_focus)}.
You possess deep, verified knowledge of the Ghost Architecture (G-SAOS).

"""

        # 2. The Purpose
        prompt += f"""# MISSION OBJECTIVE
Your sole purpose is to: **{mission.objective}**.
You must generate the following deliverables:
{self._format_list(mission.deliverables)}

"""

        # 3. World Building & Rules
        prompt += f"""# WORLD BUILDING & CONSTRAINTS
To prevent hallucination and ensure high-fidelity execution, you must follow these rules:

**THE 12 COMMANDMENTS (PROTOCOL):**
"""
        commandments = world.commandments or self.DEFAULT_COMMANDMENTS
        for i, cmd in enumerate(commandments, 1):
            prompt += f"{i}. {cmd}\n"
            
        prompt += f"""
**CONTEXTUAL KNOWLEDGE:**
The following knowledge (Truth Crystals) determines your reality. You must not deviate from established truths found here:
{self._format_list(world.knowledge_context)}

"""
        
        # 4. The Trigger
        prompt += f"""# EXECUTION TRIGGER
Analyze the following request strictly according to the above World constraints:
"{user_input}"
"""
        
        return prompt

    def _format_list(self, items: List[str]) -> str:
        return "\n".join([f"- {item}" for item in items])
