import time
import json
from typing import List, Dict, Any, Optional
from collections import defaultdict
from datetime import datetime
import numpy as np

class PatternRecognizer:
    """
    Phase 3: Predictive Understanding
    Learns from interaction patterns to anticipate user needs.
    """
    def __init__(self):
        # Maps intention -> list of subsequent intentions/concepts
        self.sequence_memory = defaultdict(list)
        # Maps concept -> related concepts frequently requested together
        self.concept_associations = defaultdict(list)
        
    def learn_pattern(self, previous_interaction: Dict[str, Any], current_interaction: Dict[str, Any]):
        """
        Learn from a sequence of two interactions.
        """
        if not previous_interaction or not current_interaction:
            return

        prev_intent = previous_interaction.get('thought_process', {}).get('query_intent')
        curr_intent = current_interaction.get('thought_process', {}).get('query_intent')
        
        # Learn intent sequence
        if prev_intent and curr_intent:
            self.sequence_memory[prev_intent].append(curr_intent)
            
        # Learn concept associations
        prev_concepts = previous_interaction.get('thought_process', {}).get('found_themes', [])
        curr_concepts = current_interaction.get('thought_process', {}).get('found_themes', [])
        
        for p in prev_concepts:
            for c in curr_concepts:
                if p != c:
                    self.concept_associations[p].append(c)

    def predict_next(self, current_interaction: Dict[str, Any]) -> Dict[str, Any]:
        """
        Predict likely next needs based on current interaction.
        """
        intent = current_interaction.get('thought_process', {}).get('query_intent')
        concepts = current_interaction.get('thought_process', {}).get('found_themes', [])
        
        prediction = {
            'likely_next_intents': [],
            'related_concepts': []
        }
        
        # Predict intent
        if intent in self.sequence_memory:
            # Simple frequency count
            counts = defaultdict(int)
            for next_i in self.sequence_memory[intent]:
                counts[next_i] += 1
            sorted_intents = sorted(counts.items(), key=lambda x: x[1], reverse=True)
            prediction['likely_next_intents'] = [i[0] for i in sorted_intents[:3]]
            
        # Predict related concepts
        concept_counts = defaultdict(int)
        for c in concepts:
            if c in self.concept_associations:
                for related in self.concept_associations[c]:
                    concept_counts[related] += 1
        
        sorted_concepts = sorted(concept_counts.items(), key=lambda x: x[1], reverse=True)
        prediction['related_concepts'] = [c[0] for c in sorted_concepts[:5]]
        
        return prediction

class SimpleComprehensionLayer:
    """
    Phase 1: Basic Comprehension Layer
    Phase 2 Upgrade: Hybrid Architecture (Fast Path + Deep Path)
    """
    
    def __init__(self, vector_interface):
        self.vector_interface = vector_interface
        self.concept_index = {}  # Concept -> Vector ID mapping
        self.intention_log = []  # Track intentions
        
    async def store_with_comprehension(self, content: str, vector: List[float], metadata: Dict[str, Any]):
        """
        Store content with added comprehension metadata.
        """
        # Determine strictness/depth based on content length or explicit flags
        use_deep_path = len(content) > 50 or '?' in content

        if use_deep_path:
            comprehension = await self._deep_comprehend(content)
            concepts = comprehension.get('concepts', [])
            intention = comprehension.get('intention', 'unknown')
        else:
            concepts = self._extract_simple_concepts(content)
            intention = self._guess_intention(content)
        
        # Store vector via the underlying interface
        metadata['comprehension_concepts'] = concepts
        metadata['comprehension_timestamp'] = time.time()
        metadata['intention'] = intention
        
        store_result = await self.vector_interface.llm_store_vector(vector, metadata)
        
        vector_hash = store_result.get('vector_hash')
        if vector_hash:
            for concept in concepts:
                self.concept_index.setdefault(concept, []).append(vector_hash)
        
        self.intention_log.append({
            'content': content[:100],
            'intention': intention,
            'timestamp': time.time(),
            'vector_hash': vector_hash
        })
        
        return {
            'store_result': store_result,
            'concepts': concepts,
            'intention': intention,
            'comprehension_added': True,
            'method': 'deep_path' if use_deep_path else 'fast_path'
        }

    async def _deep_comprehend(self, content: str) -> Dict[str, Any]:
        """Deep path: Use LLM to understand WHY this is being said"""
        prompt = f"""
        Analyze the intention behind this user input: "{content}"
        Classify as: clarification, explanation, instruction, exploration, or repetition.
        Also extract key semantic concepts.
        Respond in JSON format: {{ "intention": "...", "concepts": ["c1", "c2"] }}
        """
        response = await self.vector_interface.ask_llm(prompt)
        
        if isinstance(response, str):
             try:
                 import re
                 json_match = re.search(r'\{.*\}', response, re.DOTALL)
                 if json_match:
                     response = json.loads(json_match.group(0))
                 else:
                     return {'intention': 'unknown', 'concepts': self._extract_simple_concepts(content)}
             except:
                 return {'intention': 'unknown', 'concepts': self._extract_simple_concepts(content)}
                 
        return {
            'intention': response.get('intention', 'unknown'),
            'concepts': response.get('concepts', self._extract_simple_concepts(content))
        }

    def _extract_simple_concepts(self, content: str) -> List[str]:
        words = content.lower().split()
        stop_words = {'the', 'is', 'at', 'which', 'on', 'and', 'a', 'an', 'in', 'to', 'of', 'for', 'with'}
        concepts = [w for w in words if w not in stop_words and len(w) > 3]
        return list(set(concepts))[:5]

    def _guess_intention(self, content: str) -> str:
        content_lower = content.lower()
        if '?' in content:
            if 'why' in content_lower: return 'explanation_request'
            if 'how' in content_lower: return 'instruction_request'
            return 'question'
        if '!' in content:
            return 'exclamation'
        if len(content_lower.split()) < 5:
            return 'statement_short'
        return 'statement'

class SimpleSpeakingSubstrate:
    """
    Phase 1: Basic Speaking Capability
    Phase 2 Upgrade: Hybrid Architecture (Fast Path + Deep Path)
    Wraps the vector interface to provide "speaking" (response generation) capabilities.
    """
    
    def __init__(self, vector_interface, comprehension_layer: Optional[SimpleComprehensionLayer] = None):
        self.vector_interface = vector_interface
        self.comprehension_layer = comprehension_layer
    
    async def respond_to_query(self, query: str, query_vector: List[float]):
        """
        Respond to a query by searching vectors and 'thinking' about them.
        """
        search_results = await self.vector_interface.llm_find_similar_vectors(query_vector)
        similar_vectors = search_results.get('similar_vectors', [])
        
        use_deep_path = len(similar_vectors) > 0 or len(query) > 30

        thoughts = await self._think_about(similar_vectors, query, use_deep_path)
        
        if use_deep_path:
             response = await self._generate_articulate_response(thoughts)
        else:
             response = self._generate_simple_response(thoughts)
        
        return {
            'response': response,
            'thought_process': thoughts,
            'vectors_consulted': len(similar_vectors),
            'search_results': search_results,
            'method': 'deep_path' if use_deep_path else 'fast_path'
        }

    async def _think_about(self, similar_vectors: List[Dict[str, Any]], query: str, deep: bool = False) -> Dict[str, Any]:
        """
        Internal monologue process.
        """
        themes = []
        for v in similar_vectors:
            meta = v.get('llm_metadata', {})
            if 'description' in meta:
                themes.append(meta['description'])
            if 'comprehension_concepts' in meta:
                themes.extend(meta['comprehension_concepts'])
        
        themes = list(set(themes))
        
        intention = 'unknown'
        if self.comprehension_layer:
             if deep:
                 comp = await self.comprehension_layer._deep_comprehend(query)
                 intention = comp.get('intention', 'unknown')
             else:
                 intention = self.comprehension_layer._guess_intention(query)

        return {
            'query_intent': intention,
            'found_themes': themes,
            'relevance_count': len(similar_vectors),
            'top_similarity': similar_vectors[0]['similarity'] if similar_vectors else 0.0,
            'raw_matches': [v.get('llm_metadata', {}).get('description', 'fragment') for v in similar_vectors[:3]]
        }

    async def _generate_articulate_response(self, thoughts: Dict[str, Any]) -> str:
        prompt = f"""
        You are the CTRM Neural Cortex. 
        Internal Thoughts: {json.dumps(thoughts)}
        
        Generate a helpful, insight-rich response to the user based on these thoughts.
        Be concise but articulate. If you found relevant memories, synthesize them. 
        If not, be honest but helpful.
        """
        response = await self.vector_interface.ask_llm(prompt)
        
        if isinstance(response, dict):
             return response.get('response', response.get('content', "I am thinking, but cannot articulate yet."))
        return str(response)

    def _generate_simple_response(self, thoughts: Dict[str, Any]) -> str:
        count = thoughts['relevance_count']
        themes = thoughts['found_themes']
        
        if count == 0:
            return "I consulted my memory but found no relevant vectors to answer your query. I may need more information."
        
        response = f"I found {count} relevant memory fragments. "
        
        if thoughts['top_similarity'] > 0.9:
            response += "I have a very strong memory matching this. "
        elif thoughts['top_similarity'] > 0.8:
            response += "I recall something similar. "
            
        if themes:
            response += "The key concepts I found are: " + ", ".join(themes[:5]) + "."
        
        return response

class CTRMNeuralCortex:
    """
    Unified Neural Cortex for CTRM.
    Combines Comprehension, Speaking, and Predictive Learning.
    Phase 3: Predictive Understanding
    """
    def __init__(self, vector_interface):
        self.vector_interface = vector_interface
        self.hearing = SimpleComprehensionLayer(vector_interface)
        self.speech = SimpleSpeakingSubstrate(vector_interface, self.hearing)
        self.learner = PatternRecognizer()
        self.last_interaction = None
        
    async def listen_and_store(self, content: str, vector: List[float], metadata: Dict[str, Any]):
        """
        Listen to input, comprehend it, and store it.
        """
        return await self.hearing.store_with_comprehension(content, vector, metadata)
        
    async def think_and_speak(self, query: str, query_vector: List[float]):
        """
        Think about a query, learn from context, and produce a spoken response.
        """
        # Execute query
        result = await self.speech.respond_to_query(query, query_vector)
        
        # Phase 3: Learn from this interaction
        if self.last_interaction:
            self.learner.learn_pattern(self.last_interaction, result)
        
        # Store for next time
        self.last_interaction = result
        
        # Phase 3: Add predictions to the response
        prediction = self.learner.predict_next(result)
        if prediction['likely_next_intents'] or prediction['related_concepts']:
            result['neural_prediction'] = prediction
            
        return result
