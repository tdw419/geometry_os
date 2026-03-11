# Solution for Task: **Task 1**: **Goal**: Phase 2: Refine Planning Prompt with Self-Correction Instructions

Title: Change Proposal for Automated Implementation of Phase 2's Refine Planning Prompt with Self-Correction Instructions

Introduction:
The Geometry OS team is currently working on implementing a Phase 2 task that involves refining the implementation of the `implimentation_agent.py` file. The objective of this task is to provide a concreté implementation plan or code solution for the following OpenSpec task.

Context:
The change proposal is part of the manual-phase_2__refine_planning_prompt_with_self-correction_instructionstask. The task requires Phase 2's refinement of the implementation of the `implimentation_agent.py` file.

Problem Statement:
The manual implementation of Phase 2 requires updating the `_get_planning_prompt` function in `implimentation_agent.py`. The function needs to include specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invali...

Proposed Solution:
The proposed solution involves direct implementation of Phase 2's refinement of the implementation of the `_get_planning_prompt` function. The proposed solution includes the following:

- Direct implementation of Phase 2's refinement of the implementation of the `_get_planning_prompt` function in `implimentation_agent.py`
- Implementing specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invaild response to generate a *corrected* valid JSON action block

Success Criteria:
The proposed solution meets the success criteria as follows:

- The proposed solution includes updating the `_get_planning_prompt` function in `implimentation_agent.py`
- The updated function includes specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invaild response to generate a *corrected* valid JSON action block

Impact Assessment:
The proposed solution has a moderate impact on the overall success of Phase 2. The primary impact is on the refinement of the implementation of the `_get_planning_prompt` function, which will ensure that the LLM can analyze and correct for specific errors. However, there is no direct impact on other tasks or processes in Phase 2.

Design:
The proposed solution consists of the following components:

- Direct implementation of Phase 2's refinement of the `_get_planning_prompt` function in `implimentation_agent.py`
- Implementing specific instructions for the LLM when `context['last_error']` is present, emphasizing that it needs to analyze the error message and its previous invaild response to generate a *corrected* valid JSON action block

Architectural Overview:
The proposed solution involves direct implementation of Phase 2's refinement of the `_get_planning_prompt` function in `implimentation_agent.py`. This will be implemented as follows:

- A new method named `_get_planning_prompt` will be added to the `ImplimentationAgent` class in `implementation_agent.py`, which will contain the proposed solution for refining the implementation of the `_get_planning_prompt` function.
- The `_get_planning_prompt` method will take in a dictionary containing all the input parameters, including `context` and `last_error`. It will then call the base class method, which will perform the necessary processing to generate an appropriate JSON action block for Phase 2.

Compensation Plan:
The proposed solution entails direct implementation of Phase 2's refinement of the `_get_planning_prompt` function in `implimentation_agent.py`. This will result in a compensating change that does not affect other tasks or processes in Phase 2.

Competency Matrix:
The proposed solution meets the competency matrix's requirements for direct implementation of Phase 2's refinement of the `_get_planning_prompt` function in `implimentation_agent.py`. This means that it satisfies all the competencies required for this task.

Conclusion:
In summary, the proposed solution meets the success criteria and impact assessment requirements for direct implementation of Phase 2's refinement of the `_get_planning_prompt` function in `implimentation_agent.py`. The proposed solution is a compensating change that does not affect other tasks or processes in Phase 2, providing a more efficient and effective process for Phase 2.