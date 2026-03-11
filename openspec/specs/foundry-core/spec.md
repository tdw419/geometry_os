# foundry-core Specification

## Purpose
TBD - created by archiving change integrate-foundry-rag. Update Purpose after archive.
## Requirements
### Requirement: Context-Aware Shader Generation
The `FoundryDaemon` SHALL utilize a vector database (LanceDB) to retrieve relevant project context when generating shaders from intents.

#### Scenario: RAG Context Injection
- **WHEN** a user creates an `.intent` file
- **THEN** the daemon queries the vector database for semantically similar code
- **AND** injects the top 3 results into the LLM prompt
- **VISUAL** The generated shader uses helper functions present in the retrieved context.

#### Scenario: Graceful Degradation
- **WHEN** the vector database or dependencies are unavailable
- **THEN** the daemon proceeds with context-free generation
- **AND** logs a warning "RAG disabled".

