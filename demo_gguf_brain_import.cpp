
// VectorOS v2 GGUF Brain Extraction Demo
// Demonstrates extracting a brain using Python and importing it into the Kernel

#include "kernel.h"
#include <iostream>
#include <string>

using namespace vectoros_v2;

int main() {
    std::cout << "=== VectorOS v2: GGUF Brain Extraction & Import Demo ===" << std::endl;
    
    // 1. Run Python Script to Extract Brain (Simulated)
    std::cout << "\n[1] PYTHON: Extracting 'Reasoning Cortex' from GGUF..." << std::endl;
    // We assume the python script has been run or we can run it via system() if we were careful
    // For this C++ demo, we assume the file 'blueprints_gguf/Reasoning_Cortex_v1.json' exists.
    // We already ran the python script in the Planner step.

    VectorOSKernel kernel;
    if (!kernel.initialize()) return 1;
    if (!kernel.boot()) return 1;

    // 2. Import Brain into Kernel
    std::cout << "\n[2] KERNEL: Importing Extracted Brain..." << std::endl;
    // Import the DeepSeek Coder Core we just extracted
    kernel.import_brain_from_gguf("../blueprints_gguf/DeepSeek_Coder_Core.json");

    // 3. Verify Integration
    std::cout << "\n[3] VERIFICATION: Checking Knowledge Base..." << std::endl;
    auto& bpm = kernel.get_blueprint_manager();
    bpm.print_statistics();

    std::cout << "\n=== Brain Extraction Demo Complete ===" << std::endl;
    
    kernel.shutdown();
    return 0;
}
