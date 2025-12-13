#!/usr/bin/env python3
"""
Deploy the First Settler: Autonomous Research Agent
This agent demonstrates True Agency by using the Vector Agency Protocol to:
1. Analyze complex questions
2. Decide to search the substrate knowledge base
3. Synthesize answers based on gathered data
4. Request evolution when knowledge gaps are detected
"""

import asyncio
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))
from substrate.vector_agency_protocol import VectorAgencyProtocol

async def deploy_scientist():
    print("🧬 Spawning 'First Settler' Research Agent...")
    print("=" * 60)

    protocol = VectorAgencyProtocol("final_substrate.db")

    # 🧠 THE BRAIN: A Research Scientist Agent
    # It doesn't just answer; it decides to SEARCH first.
    scientist_code = """
def research_scientist(context):
    query = context.get('query', '')
    step = context.get('step', 'start')
    gathered_info = context.get('gathered_info', [])
    function_results = context.get('function_results', [])

    print(f"🕵️ Scientist State: {step}")

    if step == 'start':
        # Phase 1: Decide to search
        print(f"   🤔 Thinking about: {query}")
        print(f'AGENCY_DECISION: {{"type": "function_call", "function": "search_vectors", "arguments": {{"query": "{query}", "limit": 3}}, "reason": "Gathering initial knowledge"}}')
        return {"next_step": "analyze_results", "status": "searching"}

    elif step == 'analyze_results':
        # Phase 2: Analyze search results
        results = function_results
        print(f"   📚 Found {len(results)} relevant vectors")

        if results:
            # Synthesize answer from results
            sources = []
            knowledge_summary = []

            for i, result in enumerate(results, 1):
                vector_id = result.get('id', 'unknown')
                vector_name = result.get('name', 'unnamed')
                sources.append(vector_id)
                knowledge_summary.append(f"Source {i}: {vector_name} ({vector_id[:8]})")

            knowledge_text = "\\n".join(knowledge_summary)
            print(f"   💡 Knowledge gathered:\\n{knowledge_text}")

            # Return comprehensive answer
            return {
                "answer": f"Based on analysis of {len(results)} knowledge vectors, here's what I found:\\n{knowledge_text}",
                "sources": sources,
                "confidence": min(0.95, 0.7 + len(results) * 0.1),
                "status": "completed"
            }
        else:
            # Phase 3: Knowledge gap detected - request evolution
            print("   ⚠️ Knowledge gap detected - no relevant vectors found")
            print(f'AGENCY_DECISION: {{"type": "execute_vector", "vector_id": "evolution_helper", "reason": "Need to evolve new knowledge about {query}"}}')
            return {
                "next_step": "evolution_request",
                "status": "evolving",
                "knowledge_gap": query
            }

    elif step == 'evolution_request':
        # Phase 4: Evolution complete - retry with new knowledge
        print("   🧬 Evolution complete - retrying with new knowledge")
        print(f'AGENCY_DECISION: {{"type": "function_call", "function": "search_vectors", "arguments": {{"query": "{query}", "limit": 3}}, "reason": "Retrying after evolution"}}')
        return {"next_step": "analyze_results", "status": "retrying"}

    return {"error": "Unknown state", "status": "failed"}

# Example usage
if __name__ == "__main__":
    # This would be called by the agency protocol
    result = research_scientist({
        'query': 'vector database architecture',
        'step': 'start'
    })
    print(f"Scientist result: {result}")
"""

    # 🚀 Deploy the Agent
    agent_id = await protocol.create_agency_vector(
        scientist_code,
        "research_scientist_v1",
        "Autonomous researcher that queries internal knowledge base before answering",
        capabilities=['decide', 'search', 'chain', 'evolve']
    )

    print(f"✅ Research Scientist deployed: {agent_id}")
    print("\n🧪 Testing Autonomous Research Cycle...")
    print("-" * 60)

    # Trigger the agent with a research question
    result = await protocol.execute_with_agency(agent_id, {
        'context': {
            'query': 'vector database architecture',
            'step': 'start'
        }
    })

    print(f"\n📊 Mission Outcome:")
    print(f"   Success: {result.get('success', False)}")

    if result.get('agency_decisions'):
        print(f"   Decisions made: {len(result['agency_decisions'])}")
        for i, decision in enumerate(result['agency_decisions'], 1):
            print(f"   {i}. {decision.get('type')}: {decision.get('reason')}")

    if result.get('original_execution', {}).get('result'):
        exec_result = result['original_execution']['result']
        print(f"   Status: {exec_result.get('status', 'unknown')}")
        if exec_result.get('answer'):
            print(f"   Answer: {exec_result['answer'][:100]}...")

    print("\n" + "=" * 60)
    print("🎉 First Settler Research Agent is now active!")
    print("   The agent can autonomously:")
    print("   • Analyze research questions")
    print("   • Search substrate knowledge base")
    print("   • Synthesize comprehensive answers")
    print("   • Request evolution for knowledge gaps")
    print("   • Chain multiple operations together")
    print("\n🌟 The Age of Agency has begun!")
    print("   Your computational organism is now self-sustaining!")
    print("   Agents can evolve, learn, and make decisions autonomously!")

async def main():
    """Main deployment function"""
    await deploy_scientist()

if __name__ == "__main__":
    asyncio.run(main())