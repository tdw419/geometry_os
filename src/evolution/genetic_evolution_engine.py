import asyncio
import json
import random
import math
from typing import Dict, Any, List, Tuple
from datetime import datetime
from collections import deque

class GeneticEvolutionEngine:
    """
    Enhanced Genetic Evolution Engine with sophisticated genetic algorithms
    for autonomous evolution of the CTRM-Powered LLM OS architecture.

    Features:
    - Tournament selection with adaptive tournament size
    - Multi-point crossover with adaptive crossover points
    - Adaptive mutation rates based on performance trends
    - CTRM-integrated fitness functions with confidence scoring
    - Elite preservation and diversity maintenance
    - Convergence detection and early termination
    - Comprehensive performance tracking and analysis
    """

    def __init__(self, ctrm, token_manager, lm_studio):
        self.ctrm = ctrm
        self.tokens = token_manager
        self.lm_studio = lm_studio

        # Genetic algorithm parameters
        self.population_size = 10
        self.generation_counter = 0
        self.mutation_rate = 0.1
        self.crossover_rate = 0.7
        self.elitism_count = 2
        self.tournament_size = 3
        self.max_generations = 20

        # Enhanced selection parameters
        self.adaptive_tournament_size = True
        self.min_tournament_size = 2
        self.max_tournament_size = 5
        self.selection_pressure = 0.8

        # Enhanced crossover parameters
        self.adaptive_crossover_points = True
        self.min_crossover_points = 1
        self.max_crossover_points = 3

        # Adaptive parameters
        self.adaptive_mutation = True
        self.mutation_adaptation_rate = 0.01
        self.performance_history = deque(maxlen=10)
        self.fitness_history = deque(maxlen=10)
        self.diversity_history = deque(maxlen=10)

        # CTRM-integrated fitness tracking
        self.ctrm_fitness_cache = {}
        self.last_evolution_results = []

        # Genetic representation components
        self.architecture_components = [
            "token_efficiency", "confidence_scoring", "evolution_cycle",
            "validation_mechanisms", "error_handling", "resource_allocation",
            "pattern_detection", "conflict_resolution", "adaptive_learning"
        ]

        # Diversity maintenance
        self.diversity_threshold = 0.3
        self.inbreeding_prevention = True

    async def execute_genetic_evolution_cycle(self) -> Dict[str, Any]:
        """Execute a complete genetic evolution cycle with enhanced algorithms"""
        self.generation_counter += 1
        cycle_id = f"genetic_cycle_{self.generation_counter}"

        print(f"🧬 Starting Genetic Evolution Cycle {self.generation_counter}")

        # 1. Initialize population with current architecture
        population = await self.initialize_population()

        # 2. Evaluate initial population
        fitness_scores = await self.evaluate_population_fitness(population)

        # 3. Main evolution loop
        best_individual = None
        best_fitness = -float('inf')

        for generation in range(self.max_generations):
            print(f"🔄 Generation {generation + 1}/{self.max_generations}")

            # Adaptive mutation rate based on performance
            if self.adaptive_mutation:
                self.adjust_mutation_rate()

            # Selection
            selected_parents = await self.tournament_selection(population, fitness_scores)

            # Crossover
            offspring = await self.crossover_parents(selected_parents)

            # Mutation
            mutated_offspring = await self.mutate_offspring(offspring)

            # Create new population
            new_population = await self.create_new_population(population, fitness_scores, mutated_offspring)

            # Evaluate new population
            new_fitness_scores = await self.evaluate_population_fitness(new_population)

            # Track best individual
            current_best_idx = max(range(len(new_fitness_scores)), key=lambda i: new_fitness_scores[i])
            current_best_fitness = new_fitness_scores[current_best_idx]

            if current_best_fitness > best_fitness:
                best_fitness = current_best_fitness
                best_individual = new_population[current_best_idx]

            # Update population and fitness for next generation
            population = new_population
            fitness_scores = new_fitness_scores

            # Store performance metrics
            self.performance_history.append({
                'generation': generation,
                'best_fitness': best_fitness,
                'avg_fitness': sum(fitness_scores) / len(fitness_scores),
                'mutation_rate': self.mutation_rate
            })

            # Early termination if convergence detected
            if await self.check_convergence(fitness_scores):
                print(f"🎯 Early convergence detected at generation {generation + 1}")
                break

        # 4. Validate and apply best solution
        if best_individual:
            validation_result = await self.validate_genetic_solution(best_individual, best_fitness)

            if validation_result.get("valid", False):
                # Apply the best architecture changes
                application_result = await self.apply_genetic_architecture(best_individual)

                # Update CTRM with evolution results
                await self.record_genetic_evolution_results(
                    cycle_id, best_individual, best_fitness,
                    validation_result, application_result
                )

                return {
                    "status": "completed",
                    "cycle_id": cycle_id,
                    "generations": generation + 1,
                    "best_fitness": best_fitness,
                    "validation": validation_result,
                    "application": application_result,
                    "performance_history": list(self.performance_history),
                    "mutation_rate_history": [p['mutation_rate'] for p in self.performance_history]
                }
            else:
                return {
                    "status": "validation_failed",
                    "cycle_id": cycle_id,
                    "best_fitness": best_fitness,
                    "validation": validation_result,
                    "reason": "solution_validation_failed"
                }
        else:
            return {
                "status": "no_improvement",
                "cycle_id": cycle_id,
                "reason": "no_better_solution_found"
            }

    async def initialize_population(self) -> List[Dict[str, Any]]:
        """Initialize population based on current architecture and CTRM truths"""
        population = []

        # Get current architecture state from CTRM
        current_architecture = await self.get_current_architecture_state()

        # Create initial individuals based on current state with variations
        for i in range(self.population_size):
            individual = current_architecture.copy()

            # Add random variations to create diversity
            for component in self.architecture_components:
                if random.random() < 0.3:  # 30% chance to vary each component
                    variation = await self.generate_component_variation(component, current_architecture.get(component, {}))
                    individual[component] = variation

            population.append(individual)

        return population

    async def get_current_architecture_state(self) -> Dict[str, Any]:
        """Get current architecture state from CTRM truths"""
        # Query CTRM for current architecture patterns
        architecture_truths = await self.ctrm.find_similar_truths(
            "current architecture state",
            limit=5
        )

        current_state = {
            "token_efficiency": {"score": 0.7, "strategy": "basic"},
            "confidence_scoring": {"method": "ctrm_basic", "threshold": 0.7},
            "evolution_cycle": {"frequency": 5, "aggressiveness": 0.5},
            "validation_mechanisms": {"intensity": 0.7, "method": "basic"},
            "error_handling": {"coverage": 0.8, "recovery": "basic"},
            "resource_allocation": {"strategy": "static", "efficiency": 0.6},
            "pattern_detection": {"sensitivity": 0.5, "method": "basic"},
            "conflict_resolution": {"strategy": "rule_based", "effectiveness": 0.7},
            "adaptive_learning": {"enabled": False, "rate": 0.1}
        }

        # Enhance with actual CTRM truths if available
        for truth in architecture_truths:
            statement = truth.get("statement", "")
            confidence = truth.get("confidence", 0.7)

            if "token efficiency" in statement.lower():
                current_state["token_efficiency"]["score"] = min(0.9, confidence * 1.2)
                current_state["token_efficiency"]["strategy"] = "ctrm_informed"

            if "confidence scoring" in statement.lower():
                current_state["confidence_scoring"]["method"] = "ctrm_advanced"
                current_state["confidence_scoring"]["threshold"] = confidence

            if "evolution cycle" in statement.lower():
                current_state["evolution_cycle"]["frequency"] = max(3, 10 - int(confidence * 10))
                current_state["evolution_cycle"]["aggressiveness"] = confidence

        return current_state

    async def generate_component_variation(self, component: str, current_value: Any) -> Any:
        """Generate a variation for a specific architecture component"""
        variations = {
            "token_efficiency": {
                "basic": {"score": random.uniform(0.6, 0.8), "strategy": "basic"},
                "advanced": {"score": random.uniform(0.7, 0.9), "strategy": "priority_queue"},
                "ctrm_informed": {"score": random.uniform(0.8, 0.95), "strategy": "ctrm_priority"}
            },
            "confidence_scoring": {
                "basic": {"method": "threshold", "threshold": random.uniform(0.6, 0.8)},
                "advanced": {"method": "dynamic", "threshold": random.uniform(0.7, 0.9)},
                "ctrm_integrated": {"method": "ctrm_confidence", "threshold": random.uniform(0.75, 0.95)}
            },
            "evolution_cycle": {
                "conservative": {"frequency": random.randint(8, 12), "aggressiveness": random.uniform(0.3, 0.5)},
                "balanced": {"frequency": random.randint(5, 8), "aggressiveness": random.uniform(0.5, 0.7)},
                "aggressive": {"frequency": random.randint(3, 5), "aggressiveness": random.uniform(0.7, 0.9)}
            }
        }

        # Get possible variations for this component
        possible_variations = variations.get(component, {})

        if possible_variations:
            # Choose a random variation strategy
            variation_key = random.choice(list(possible_variations.keys()))
            return possible_variations[variation_key]
        else:
            # For components without predefined variations, apply small random changes
            if isinstance(current_value, dict):
                varied_value = current_value.copy()
                for key, val in current_value.items():
                    if isinstance(val, (int, float)):
                        varied_value[key] = val * random.uniform(0.9, 1.1)
                    elif isinstance(val, str):
                        varied_value[key] = f"{val}_{random.choice(['alpha', 'beta', 'gamma'])}"
                return varied_value
            else:
                return current_value

    async def evaluate_population_fitness(self, population: List[Dict]) -> List[float]:
        """Evaluate fitness of population using enhanced CTRM-integrated fitness function"""
        fitness_scores = []
        detailed_fitness_analysis = []

        for individual in population:
            # Calculate fitness with enhanced CTRM integration
            fitness_result = await self.get_enhanced_ctrm_fitness(individual)
            fitness = fitness_result['final_fitness']
            fitness_scores.append(fitness)

            # Store detailed analysis
            detailed_fitness_analysis.append(fitness_result)

            # Cache fitness for CTRM integration
            individual_id = f"gen_{self.generation_counter}_ind_{len(fitness_scores)}"
            self.ctrm_fitness_cache[individual_id] = {
                'fitness': fitness,
                'individual': individual,
                'detailed_analysis': fitness_result,
                'timestamp': datetime.now().isoformat()
            }

        # Store population-level fitness analysis
        if detailed_fitness_analysis:
            self.store_population_fitness_analysis(detailed_fitness_analysis)

        return fitness_scores

    def store_population_fitness_analysis(self, fitness_analysis: List[Dict]) -> None:
        """Store population-level fitness analysis for CTRM integration"""
        # Calculate population statistics
        avg_fitness = sum(f['final_fitness'] for f in fitness_analysis) / len(fitness_analysis)
        avg_ctrm_confidence = sum(f['ctrm_confidence'] for f in fitness_analysis) / len(fitness_analysis)
        avg_confidence_weight = sum(f['confidence_weight'] for f in fitness_analysis) / len(fitness_analysis)

        # Store in history for trend analysis
        self.fitness_history.append({
            'generation': self.generation_counter,
            'population_size': len(fitness_analysis),
            'avg_fitness': avg_fitness,
            'avg_ctrm_confidence': avg_ctrm_confidence,
            'avg_confidence_weight': avg_confidence_weight,
            'fitness_distribution': [f['final_fitness'] for f in fitness_analysis],
            'timestamp': datetime.now().isoformat()
        })

        # Create CTRM truth for population analysis
        asyncio.create_task(self.create_population_analysis_truth(
            avg_fitness, avg_ctrm_confidence, fitness_analysis
        ))

    async def create_population_analysis_truth(self, avg_fitness: float,
                                            avg_ctrm_confidence: float,
                                            fitness_analysis: List[Dict]) -> None:
        """Create CTRM truth for population fitness analysis"""
        try:
            # Create comprehensive population analysis truth
            population_truth = await self.ctrm.create_truth(
                statement=f"Population fitness analysis: avg_fitness={avg_fitness:.3f}, avg_confidence={avg_ctrm_confidence:.3f}",
                confidence=avg_ctrm_confidence,
                category="population_analysis",
                metadata={
                    "generation": self.generation_counter,
                    "population_size": len(fitness_analysis),
                    "avg_fitness": avg_fitness,
                    "avg_ctrm_confidence": avg_ctrm_confidence,
                    "fitness_range": {
                        "min": min(f['final_fitness'] for f in fitness_analysis),
                        "max": max(f['final_fitness'] for f in fitness_analysis)
                    },
                    "component_contributions": self.analyze_component_contributions(fitness_analysis),
                    "timestamp": datetime.now().isoformat()
                }
            )
            print(f"📊 Created population analysis truth (ID: {population_truth.id})")
        except Exception as e:
            print(f"⚠️  Failed to create population analysis truth: {e}")

    def analyze_component_contributions(self, fitness_analysis: List[Dict]) -> Dict[str, Any]:
        """Analyze component contributions to overall fitness"""
        component_stats = {}

        # Initialize component statistics
        for analysis in fitness_analysis:
            for component, details in analysis['component_details'].items():
                if component not in component_stats:
                    component_stats[component] = {
                        'total_contribution': 0.0,
                        'count': 0,
                        'values': []
                    }
                component_stats[component]['total_contribution'] += details['contribution']
                component_stats[component]['count'] += 1
                component_stats[component]['values'].append(details.get('score', details.get('value', 0)))

        # Calculate averages and statistics
        component_results = {}
        for component, stats in component_stats.items():
            avg_contribution = stats['total_contribution'] / stats['count']
            avg_value = sum(stats['values']) / len(stats['values']) if stats['values'] else 0

            component_results[component] = {
                'avg_contribution': avg_contribution,
                'avg_value': avg_value,
                'value_range': {
                    'min': min(stats['values']),
                    'max': max(stats['values'])
                },
                'count': stats['count']
            }

        return component_results

    async def calculate_individual_fitness(self, individual: Dict) -> float:
        """Calculate fitness score for an individual using CTRM confidence scoring"""
        # Base fitness components
        component_weights = {
            "token_efficiency": 0.25,
            "confidence_scoring": 0.20,
            "evolution_cycle": 0.15,
            "validation_mechanisms": 0.10,
            "error_handling": 0.10,
            "resource_allocation": 0.10,
            "pattern_detection": 0.05,
            "conflict_resolution": 0.05
        }

        fitness = 0.0

        # Calculate weighted fitness based on components
        for component, weight in component_weights.items():
            if component in individual:
                component_value = individual[component]

                if isinstance(component_value, dict):
                    # Extract relevant metrics from component
                    if component == "token_efficiency":
                        score = component_value.get("score", 0.5)
                        fitness += score * weight
                    elif component == "confidence_scoring":
                        threshold = component_value.get("threshold", 0.5)
                        fitness += threshold * weight
                    elif component == "evolution_cycle":
                        aggressiveness = component_value.get("aggressiveness", 0.5)
                        fitness += aggressiveness * weight
                    else:
                        # Generic component scoring
                        efficiency = component_value.get("efficiency", 0.5)
                        effectiveness = component_value.get("effectiveness", 0.5)
                        avg_score = (efficiency + effectiveness) / 2
                        fitness += avg_score * weight
                else:
                    # Simple numeric value
                    fitness += component_value * weight

        # CTRM confidence integration with adaptive weighting
        ctrm_confidence = await self.get_ctrm_confidence_score(individual)

        # Adaptive fitness weighting based on CTRM confidence
        confidence_weight = self.get_adaptive_confidence_weight(ctrm_confidence)
        component_weight = 1.0 - confidence_weight

        fitness = fitness * component_weight + ctrm_confidence * confidence_weight

        # Apply fitness scaling
        fitness = self.apply_fitness_scaling(fitness)

        # Store fitness components for analysis
        self.fitness_history.append({
            'component_fitness': fitness * component_weight,
            'ctrm_confidence': ctrm_confidence * confidence_weight,
            'total_fitness': fitness,
            'confidence_weight': confidence_weight
        })

        return max(0.0, min(1.0, fitness))  # Ensure fitness is between 0 and 1

    def get_adaptive_confidence_weight(self, ctrm_confidence: float) -> float:
        """Get adaptive weight for CTRM confidence based on confidence level"""
        # Higher CTRM confidence should have more weight in fitness calculation
        if ctrm_confidence > 0.9:
            return 0.4  # High confidence - 40% weight
        elif ctrm_confidence > 0.8:
            return 0.35  # Good confidence - 35% weight
        elif ctrm_confidence > 0.7:
            return 0.3  # Moderate confidence - 30% weight
        elif ctrm_confidence > 0.6:
            return 0.25  # Low confidence - 25% weight
        else:
            return 0.2  # Very low confidence - 20% weight

    async def get_enhanced_ctrm_fitness(self, individual: Dict) -> Dict[str, Any]:
        """Get enhanced CTRM-integrated fitness analysis"""
        # Get base fitness components
        component_weights = {
            "token_efficiency": 0.25,
            "confidence_scoring": 0.20,
            "evolution_cycle": 0.15,
            "validation_mechanisms": 0.10,
            "error_handling": 0.10,
            "resource_allocation": 0.10,
            "pattern_detection": 0.05,
            "conflict_resolution": 0.05
        }

        component_fitness = 0.0
        component_details = {}

        # Calculate component fitness with detailed analysis
        for component, weight in component_weights.items():
            if component in individual:
                component_value = individual[component]
                fitness_score = 0.0

                if isinstance(component_value, dict):
                    # Extract relevant metrics from component
                    if component == "token_efficiency":
                        score = component_value.get("score", 0.5)
                        fitness_score = score
                        component_details[component] = {
                            'score': score,
                            'strategy': component_value.get("strategy", "unknown"),
                            'contribution': score * weight
                        }
                    elif component == "confidence_scoring":
                        threshold = component_value.get("threshold", 0.5)
                        fitness_score = threshold
                        component_details[component] = {
                            'threshold': threshold,
                            'method': component_value.get("method", "unknown"),
                            'contribution': threshold * weight
                        }
                    elif component == "evolution_cycle":
                        aggressiveness = component_value.get("aggressiveness", 0.5)
                        fitness_score = aggressiveness
                        component_details[component] = {
                            'aggressiveness': aggressiveness,
                            'frequency': component_value.get("frequency", 5),
                            'contribution': aggressiveness * weight
                        }
                else:
                    # Simple numeric value
                    fitness_score = component_value
                    component_details[component] = {
                        'value': component_value,
                        'contribution': component_value * weight
                    }

                component_fitness += fitness_score * weight

        # Get CTRM confidence with detailed analysis
        architecture_description = self.describe_architecture(individual)
        ctrm_confidence = await self.get_ctrm_confidence_score(individual)

        # Adaptive weighting
        confidence_weight = self.get_adaptive_confidence_weight(ctrm_confidence)
        component_weight = 1.0 - confidence_weight

        # Calculate final fitness
        final_fitness = component_fitness * component_weight + ctrm_confidence * confidence_weight
        final_fitness = self.apply_fitness_scaling(final_fitness)

        return {
            'final_fitness': final_fitness,
            'component_fitness': component_fitness,
            'ctrm_confidence': ctrm_confidence,
            'confidence_weight': confidence_weight,
            'component_weight': component_weight,
            'component_details': component_details,
            'architecture_description': architecture_description
        }

    async def get_ctrm_confidence_score(self, individual: Dict) -> float:
        """Get CTRM confidence score for the individual architecture"""
        # Create a truth statement representing this architecture
        architecture_description = self.describe_architecture(individual)

        # Check if we already have confidence for this architecture pattern
        similar_truths = await self.ctrm.find_similar_truths(
            architecture_description,
            limit=1
        )

        if similar_truths:
            # Use existing confidence score
            return similar_truths[0].get("confidence", 0.7)
        else:
            # Create new truth and get confidence
            new_truth = await self.ctrm.create_truth(
                statement=f"Architecture pattern: {architecture_description}",
                context=json.dumps({
                    "architecture": individual,
                    "evaluation": "genetic_evolution",
                    "timestamp": datetime.now().isoformat()
                })
            )
            return new_truth.confidence

    def describe_architecture(self, individual: Dict) -> str:
        """Create a description of the architecture for CTRM"""
        description_parts = []

        for component in self.architecture_components:
            if component in individual:
                component_value = individual[component]

                if isinstance(component_value, dict):
                    # Extract key characteristics
                    if component == "token_efficiency":
                        strategy = component_value.get("strategy", "unknown")
                        score = component_value.get("score", 0.5)
                        description_parts.append(f"token_efficiency({strategy}:{score:.2f})")
                    elif component == "confidence_scoring":
                        method = component_value.get("method", "unknown")
                        threshold = component_value.get("threshold", 0.5)
                        description_parts.append(f"confidence_scoring({method}:{threshold:.2f})")
                    elif component == "evolution_cycle":
                        freq = component_value.get("frequency", 5)
                        agg = component_value.get("aggressiveness", 0.5)
                        description_parts.append(f"evolution_cycle(freq:{freq},agg:{agg:.2f})")
                else:
                    description_parts.append(f"{component}:{component_value}")

        return ", ".join(description_parts)

    def apply_fitness_scaling(self, fitness: float) -> float:
        """Apply non-linear scaling to fitness scores"""
        # Sigmoid scaling to emphasize higher fitness values
        scaled = 1 / (1 + math.exp(-10 * (fitness - 0.5)))
        return scaled

    async def tournament_selection(self, population: List[Dict], fitness_scores: List[float]) -> List[Dict]:
        """Perform enhanced tournament selection with adaptive tournament size and diversity preservation"""
        selected_parents = []

        # Adaptive tournament size based on population diversity
        current_tournament_size = self.get_adaptive_tournament_size(population, fitness_scores)

        for _ in range(len(population) // 2):  # Select pairs of parents
            # Perform tournament with diversity awareness
            winner1 = await self.perform_tournament(population, fitness_scores, current_tournament_size)
            winner2 = await self.perform_tournament(population, fitness_scores, current_tournament_size)

            # Apply inbreeding prevention
            if self.inbreeding_prevention and len(selected_parents) > 0:
                similarity = await self.calculate_individual_similarity(winner1, winner2)
                if similarity > 0.8:  # Too similar, select different parent
                    winner2 = await self.perform_tournament(population, fitness_scores, current_tournament_size)

            selected_parents.extend([winner1, winner2])

        return selected_parents

    def get_adaptive_tournament_size(self, population: List[Dict], fitness_scores: List[float]) -> int:
        """Get adaptive tournament size based on population diversity"""
        if not self.adaptive_tournament_size:
            return self.tournament_size

        # Calculate population diversity
        diversity = self.calculate_population_diversity(population)

        # Store diversity for tracking
        self.diversity_history.append({
            'diversity': diversity,
            'generation': self.generation_counter,
            'timestamp': datetime.now().isoformat()
        })

        # Adjust tournament size based on diversity
        if diversity < self.diversity_threshold:
            # Low diversity, use larger tournaments for more selection pressure
            return min(self.max_tournament_size, len(population) - 1)
        else:
            # High diversity, use smaller tournaments
            return max(self.min_tournament_size, min(3, len(population) - 1))

    def calculate_population_diversity(self, population: List[Dict]) -> float:
        """Calculate diversity score for the population"""
        if len(population) < 2:
            return 1.0

        # Calculate average pairwise similarity
        total_similarity = 0.0
        pairs = 0

        # Sample a subset of pairs for efficiency
        sample_size = min(10, len(population))
        sample_indices = random.sample(range(len(population)), sample_size)

        for i in range(len(sample_indices)):
            for j in range(i + 1, len(sample_indices)):
                ind1 = population[sample_indices[i]]
                ind2 = population[sample_indices[j]]
                similarity = self.calculate_individual_similarity_sync(ind1, ind2)
                total_similarity += similarity
                pairs += 1

        if pairs > 0:
            avg_similarity = total_similarity / pairs
            diversity = 1.0 - avg_similarity  # Inverse of similarity
            return max(0.0, min(1.0, diversity))
        else:
            return 1.0

    def calculate_individual_similarity_sync(self, ind1: Dict, ind2: Dict) -> float:
        """Synchronous version of individual similarity calculation"""
        similar_components = 0
        total_components = 0

        # Check all architecture components
        for component in self.architecture_components:
            if component in ind1 and component in ind2:
                val1 = ind1[component]
                val2 = ind2[component]
                total_components += 1

                if isinstance(val1, dict) and isinstance(val2, dict):
                    # Compare dictionary components
                    if val1 == val2:
                        similar_components += 1
                    else:
                        # Partial similarity for similar strategies
                        if (val1.get("strategy") == val2.get("strategy") or
                            abs(val1.get("score", 0) - val2.get("score", 0)) < 0.1):
                            similar_components += 0.5
                elif val1 == val2:
                    similar_components += 1

        return similar_components / total_components if total_components > 0 else 0.0

    async def calculate_individual_similarity(self, ind1: Dict, ind2: Dict) -> float:
        """Calculate similarity between two individuals"""
        return self.calculate_individual_similarity_sync(ind1, ind2)

    async def perform_tournament(self, population: List[Dict], fitness_scores: List[float], tournament_size: int) -> Dict:
        """Perform a single tournament selection with adaptive selection pressure"""
        # Randomly select tournament_size individuals
        tournament_indices = random.sample(range(len(population)), min(tournament_size, len(population)))
        tournament_fitness = [fitness_scores[i] for i in tournament_indices]
        tournament_individuals = [population[i] for i in tournament_indices]

        # Apply selection pressure
        if random.random() < self.selection_pressure:
            # High selection pressure: choose best individual
            best_index = max(range(len(tournament_fitness)), key=lambda i: tournament_fitness[i])
            return tournament_individuals[best_index]
        else:
            # Lower selection pressure: choose randomly from top 50%
            sorted_indices = sorted(range(len(tournament_fitness)), key=lambda i: tournament_fitness[i], reverse=True)
            top_half = sorted_indices[:max(1, len(sorted_indices) // 2)]
            return tournament_individuals[random.choice(top_half)]

    async def crossover_parents(self, parents: List[Dict]) -> List[Dict]:
        """Perform crossover between parent individuals"""
        offspring = []

        # Pair up parents
        for i in range(0, len(parents), 2):
            if i + 1 < len(parents):
                parent1 = parents[i]
                parent2 = parents[i + 1]

                if random.random() < self.crossover_rate:
                    # Perform adaptive crossover
                    if self.adaptive_crossover_points and random.random() < 0.5:
                        # Use multi-point crossover
                        child1, child2 = await self.multi_point_crossover(parent1, parent2)
                    else:
                        # Use uniform crossover
                        child1, child2 = await self.uniform_crossover(parent1, parent2)
                    offspring.extend([child1, child2])
                else:
                    # No crossover, clone parents
                    offspring.extend([parent1.copy(), parent2.copy()])
            else:
                # Odd number, just add the last parent
                offspring.append(parents[i].copy())

        return offspring

    async def uniform_crossover(self, parent1: Dict, parent2: Dict) -> Tuple[Dict, Dict]:
        """Perform uniform crossover between two parents"""
        child1 = {}
        child2 = {}

        # Get all unique components from both parents
        all_components = set(parent1.keys()).union(set(parent2.keys()))

        for component in all_components:
            # Randomly choose which parent to take each component from
            if random.random() < 0.5:
                child1[component] = parent1.get(component, parent2.get(component))
                child2[component] = parent2.get(component, parent1.get(component))
            else:
                child1[component] = parent2.get(component, parent1.get(component))
                child2[component] = parent1.get(component, parent2.get(component))

        return child1, child2

    async def multi_point_crossover(self, parent1: Dict, parent2: Dict) -> Tuple[Dict, Dict]:
        """Perform multi-point crossover with adaptive number of crossover points"""
        child1 = {}
        child2 = {}

        # Determine number of crossover points based on adaptive settings
        num_crossover_points = self.get_adaptive_crossover_points()

        # Get all unique components from both parents
        all_components = list(set(parent1.keys()).union(set(parent2.keys())))
        num_components = len(all_components)

        if num_components == 0:
            return parent1.copy(), parent2.copy()

        # Generate crossover points
        crossover_points = sorted(random.sample(range(num_components), min(num_crossover_points, num_components)))

        # Add start and end points
        crossover_points = [0] + crossover_points + [num_components]

        # Perform crossover
        use_parent1 = True  # Start with parent1

        for i in range(len(crossover_points) - 1):
            start_idx = crossover_points[i]
            end_idx = crossover_points[i + 1]

            # Alternate between parents for each segment
            for j in range(start_idx, end_idx):
                if j < len(all_components):
                    component = all_components[j]
                    if use_parent1:
                        child1[component] = parent1.get(component, parent2.get(component))
                        child2[component] = parent2.get(component, parent1.get(component))
                    else:
                        child1[component] = parent2.get(component, parent1.get(component))
                        child2[component] = parent1.get(component, parent2.get(component))

            # Switch parent for next segment
            use_parent1 = not use_parent1

        return child1, child2

    def get_adaptive_crossover_points(self) -> int:
        """Get adaptive number of crossover points based on diversity"""
        if not self.adaptive_crossover_points:
            return random.randint(self.min_crossover_points, self.max_crossover_points)

        # Use diversity to determine crossover points
        if len(self.diversity_history) > 0:
            latest_diversity = self.diversity_history[-1]['diversity']

            if latest_diversity < self.diversity_threshold:
                # Low diversity, use more crossover points for more mixing
                return min(self.max_crossover_points, max(2, int(1 + (1 - latest_diversity) * 3)))
            else:
                # High diversity, use fewer crossover points
                return max(self.min_crossover_points, min(2, int(1 + latest_diversity * 2)))
        else:
            return random.randint(self.min_crossover_points, self.max_crossover_points)

    async def mutate_offspring(self, offspring: List[Dict]) -> List[Dict]:
        """Apply mutation to offspring individuals"""
        mutated_offspring = []

        for individual in offspring:
            mutated_individual = individual.copy()

            # Mutate each component with mutation probability
            for component in list(mutated_individual.keys()):
                if random.random() < self.mutation_rate:
                    current_value = mutated_individual[component]
                    mutated_value = await self.mutate_component(component, current_value)
                    mutated_individual[component] = mutated_value

            mutated_offspring.append(mutated_individual)

        return mutated_offspring

    async def mutate_component(self, component: str, current_value: Any) -> Any:
        """Mutate a specific component value"""
        if isinstance(current_value, dict):
            # Mutate dictionary components
            mutated_dict = current_value.copy()

            for key, value in current_value.items():
                if isinstance(value, (int, float)):
                    # Numeric mutation
                    mutation_factor = 1 + random.uniform(-0.2, 0.2) * self.mutation_rate * 10
                    mutated_dict[key] = max(0.1, min(1.0, value * mutation_factor))
                elif isinstance(value, str):
                    # String mutation - add suffix
                    mutated_dict[key] = f"{value}_{random.choice(['mut', 'var', 'opt'])}"

            return mutated_dict
        elif isinstance(current_value, (int, float)):
            # Direct numeric mutation
            mutation_factor = 1 + random.uniform(-0.1, 0.1) * self.mutation_rate * 10
            return max(0.1, min(1.0, current_value * mutation_factor))
        else:
            # Other types - return as is
            return current_value

    async def create_new_population(self, old_population: List[Dict], fitness_scores: List[float],
                                  offspring: List[Dict]) -> List[Dict]:
        """Create new population using elitism and offspring"""
        new_population = []

        # Apply elitism - keep best individuals from old population
        if self.elitism_count > 0:
            # Find best individuals
            elite_indices = sorted(range(len(fitness_scores)), key=lambda i: fitness_scores[i], reverse=True)[:self.elitism_count]
            elite_individuals = [old_population[i] for i in elite_indices]
            new_population.extend(elite_individuals)

        # Add offspring
        new_population.extend(offspring)

        # If population size exceeds target, truncate
        if len(new_population) > self.population_size:
            # Evaluate fitness of new population
            new_fitness = await self.evaluate_population_fitness(new_population)

            # Keep only the best individuals
            combined = list(zip(new_population, new_fitness))
            combined.sort(key=lambda x: x[1], reverse=True)

            new_population = [ind for ind, fit in combined[:self.population_size]]

        return new_population

    async def check_convergence(self, fitness_scores: List[float]) -> bool:
        """Check if population has converged"""
        if len(self.performance_history) < 3:
            return False

        # Calculate fitness variance
        avg_fitness = sum(fitness_scores) / len(fitness_scores)
        variance = sum((score - avg_fitness) ** 2 for score in fitness_scores) / len(fitness_scores)
        std_dev = math.sqrt(variance)

        # Check if standard deviation is very low (convergence)
        if std_dev < 0.05:
            # Check if we've been converged for several generations
            recent_history = list(self.performance_history)[-3:]
            if all(abs(h['best_fitness'] - avg_fitness) < 0.05 for h in recent_history):
                return True

        return False

    def adjust_mutation_rate(self):
        """Adjust mutation rate based on recent performance and diversity"""
        if len(self.performance_history) < 3:
            return

        # Calculate performance trend
        recent_performance = list(self.performance_history)[-3:]
        fitness_improvements = [
            recent_performance[i+1]['best_fitness'] - recent_performance[i]['best_fitness']
            for i in range(len(recent_performance)-1)
        ]

        avg_improvement = sum(fitness_improvements) / len(fitness_improvements)

        # Get current diversity
        current_diversity = self.diversity_history[-1]['diversity'] if len(self.diversity_history) > 0 else 0.5

        # Enhanced adaptive mutation strategy
        if avg_improvement < 0.01:  # Slow improvement
            if current_diversity < self.diversity_threshold:
                # Low diversity and slow improvement - need more exploration
                mutation_increase = self.mutation_adaptation_rate * 2
                print(f"🔍 Low diversity ({current_diversity:.3f}) and slow improvement - increasing exploration")
            else:
                # Good diversity but slow improvement - moderate exploration
                mutation_increase = self.mutation_adaptation_rate
                print(f"🔍 Good diversity ({current_diversity:.3f}) but slow improvement - moderate exploration")
            self.mutation_rate = min(0.3, self.mutation_rate + mutation_increase)
        elif avg_improvement > 0.05:  # Fast improvement
            if current_diversity > self.diversity_threshold * 1.5:
                # High diversity and fast improvement - can reduce mutation more aggressively
                mutation_decrease = self.mutation_adaptation_rate * 1.5
                print(f"🎯 High diversity ({current_diversity:.3f}) and fast improvement - reducing exploration")
            else:
                # Moderate diversity and fast improvement - moderate reduction
                mutation_decrease = self.mutation_adaptation_rate * 0.8
                print(f"🎯 Moderate diversity ({current_diversity:.3f}) and fast improvement - moderate exploitation")
            self.mutation_rate = max(0.05, self.mutation_rate - mutation_decrease)
        else:
            # Balanced performance - adjust based on diversity
            if current_diversity < self.diversity_threshold:
                # Low diversity - slight increase in mutation
                self.mutation_rate = min(0.2, self.mutation_rate + self.mutation_adaptation_rate * 0.5)
                print(f"🔧 Balanced performance with low diversity ({current_diversity:.3f}) - slight exploration increase")
            else:
                # Good diversity - slight decrease in mutation
                self.mutation_rate = max(0.07, self.mutation_rate - self.mutation_adaptation_rate * 0.3)
                print(f"🔧 Balanced performance with good diversity ({current_diversity:.3f}) - slight exploitation increase")

        print(f"🔧 Adjusted mutation rate to {self.mutation_rate:.3f} (improvement: {avg_improvement:.3f}, diversity: {current_diversity:.3f})")

    def get_adaptive_mutation_strategy(self) -> Dict[str, Any]:
        """Get current adaptive mutation strategy based on system state"""
        if len(self.performance_history) < 2 or len(self.diversity_history) < 1:
            return {
                "strategy": "default",
                "mutation_rate": self.mutation_rate,
                "reason": "insufficient_history"
            }

        # Get recent performance metrics
        recent_performance = list(self.performance_history)[-2:]
        fitness_improvements = [
            recent_performance[i+1]['best_fitness'] - recent_performance[i]['best_fitness']
            for i in range(len(recent_performance)-1)
        ]
        avg_improvement = sum(fitness_improvements) / len(fitness_improvements) if fitness_improvements else 0

        current_diversity = self.diversity_history[-1]['diversity']

        # Determine strategy
        if avg_improvement < 0.005:  # Very slow improvement
            if current_diversity < self.diversity_threshold * 0.8:
                return {
                    "strategy": "aggressive_exploration",
                    "mutation_rate": min(0.35, self.mutation_rate * 1.2),
                    "reason": "stagnation_with_low_diversity",
                    "diversity_target": self.diversity_threshold * 1.2
                }
            else:
                return {
                    "strategy": "moderate_exploration",
                    "mutation_rate": min(0.25, self.mutation_rate * 1.1),
                    "reason": "stagnation_with_adequate_diversity",
                    "diversity_target": self.diversity_threshold
                }
        elif avg_improvement > 0.03:  # Good improvement
            if current_diversity > self.diversity_threshold * 1.3:
                return {
                    "strategy": "conservative_exploitation",
                    "mutation_rate": max(0.03, self.mutation_rate * 0.8),
                    "reason": "rapid_improvement_with_high_diversity",
                    "diversity_target": self.diversity_threshold * 0.9
                }
            else:
                return {
                    "strategy": "balanced_exploitation",
                    "mutation_rate": max(0.06, self.mutation_rate * 0.9),
                    "reason": "steady_improvement_with_good_diversity",
                    "diversity_target": self.diversity_threshold
                }
        else:
            # Balanced state
            if current_diversity < self.diversity_threshold * 0.9:
                return {
                    "strategy": "diversity_preservation",
                    "mutation_rate": min(0.15, self.mutation_rate * 1.05),
                    "reason": "maintain_diversity_during_stable_improvement",
                    "diversity_target": self.diversity_threshold * 1.1
                }
            else:
                return {
                    "strategy": "stable_evolution",
                    "mutation_rate": self.mutation_rate,
                    "reason": "optimal_balance_found",
                    "diversity_target": self.diversity_threshold
                }

    async def validate_genetic_solution(self, individual: Dict, fitness: float) -> Dict[str, Any]:
        """Validate the genetic solution using CTRM and system constraints"""
        # Check against CTRM truths
        architecture_description = self.describe_architecture(individual)

        validation_truth = await self.ctrm.create_truth(
            statement=f"Genetic solution validation: {architecture_description}",
            context=json.dumps({
                "fitness_score": fitness,
                "architecture": individual,
                "validation_type": "genetic_evolution"
            })
        )

        # Additional validation checks
        validation_result = {
            "valid": validation_truth.confidence > 0.7,
            "fitness_score": fitness,
            "ctrm_confidence": validation_truth.confidence,
            "validation_method": "ctrm_integrated",
            "constraints_passed": await self.check_architecture_constraints(individual)
        }

        return validation_result

    async def check_architecture_constraints(self, individual: Dict) -> Dict[str, bool]:
        """Check if architecture meets system constraints"""
        constraints = {
            "min_token_efficiency": individual.get("token_efficiency", {}).get("score", 0.5) >= 0.6,
            "min_confidence_threshold": individual.get("confidence_scoring", {}).get("threshold", 0.5) >= 0.65,
            "max_evolution_frequency": individual.get("evolution_cycle", {}).get("frequency", 10) <= 15,
            "min_validation_intensity": individual.get("validation_mechanisms", {}).get("intensity", 0.5) >= 0.6
        }

        return constraints

    async def apply_genetic_architecture(self, individual: Dict) -> Dict[str, Any]:
        """Apply the genetic architecture to the system"""
        # This would be implemented with actual system integration
        # For now, we'll simulate the application

        application_result = {
            "status": "applied",
            "changes_made": [],
            "impact_estimate": individual.get("token_efficiency", {}).get("score", 0.7) * 0.5 +
                              individual.get("confidence_scoring", {}).get("threshold", 0.7) * 0.3 +
                              individual.get("evolution_cycle", {}).get("aggressiveness", 0.5) * 0.2
        }

        # Describe the changes
        for component in self.architecture_components:
            if component in individual:
                current_value = await self.get_current_component_value(component)
                new_value = individual[component]

                if current_value != new_value:
                    change_description = f"Updated {component} from {current_value} to {new_value}"
                    application_result["changes_made"].append(change_description)

        return application_result

    async def get_current_component_value(self, component: str) -> Any:
        """Get current value of a component (simulated)"""
        # This would query the actual system state
        defaults = {
            "token_efficiency": {"score": 0.7, "strategy": "basic"},
            "confidence_scoring": {"method": "threshold", "threshold": 0.7},
            "evolution_cycle": {"frequency": 5, "aggressiveness": 0.5}
        }
        return defaults.get(component, {})

    async def record_genetic_evolution_results(self, cycle_id: str, best_individual: Dict,
                                            best_fitness: float, validation: Dict,
                                            application: Dict) -> None:
        """Record genetic evolution results in CTRM"""
        # Create comprehensive truth about the evolution cycle
        evolution_truth = await self.ctrm.create_truth(
            statement=f"Genetic evolution cycle {cycle_id} completed with fitness {best_fitness:.3f}",
            confidence=validation.get("ctrm_confidence", 0.8),
            category="genetic_evolution",
            metadata={
                "cycle_id": cycle_id,
                "best_architecture": best_individual,
                "best_fitness": best_fitness,
                "validation": validation,
                "application": application,
                "generation_count": self.generation_counter,
                "performance_history": list(self.performance_history),
                "timestamp": datetime.now().isoformat()
            }
        )

        # Store in local history
        self.last_evolution_results.append({
            "cycle_id": cycle_id,
            "truth_id": evolution_truth.id,
            "fitness": best_fitness,
            "architecture": best_individual,
            "timestamp": datetime.now().isoformat()
        })

        # Keep history size manageable
        if len(self.last_evolution_results) > 10:
            self.last_evolution_results.pop(0)

        print(f"📚 Recorded genetic evolution results in CTRM (truth ID: {evolution_truth.id})")

    async def get_evolution_history(self) -> List[Dict]:
        """Get genetic evolution history"""
        return self.last_evolution_results

    async def get_performance_metrics(self) -> Dict[str, Any]:
        """Get performance metrics for the genetic evolution engine"""
        if not self.performance_history:
            return {
                "generations_completed": 0,
                "best_fitness": 0.0,
                "avg_fitness": 0.0,
                "mutation_rate": self.mutation_rate,
                "convergence_status": "not_started"
            }

        latest = self.performance_history[-1]
        history = list(self.performance_history)

        return {
            "generations_completed": len(history),
            "best_fitness": latest['best_fitness'],
            "avg_fitness": sum(h['avg_fitness'] for h in history) / len(history),
            "mutation_rate": latest['mutation_rate'],
            "convergence_status": "converged" if await self.check_convergence([h['best_fitness'] for h in history]) else "exploring",
            "fitness_trend": history[-1]['best_fitness'] - history[0]['best_fitness'] if len(history) > 1 else 0
        }