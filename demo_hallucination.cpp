#include "kernel/hallucination_engine.h"
#include "kernel/neural_model_binder.h"
#include "kernel/neural_project_drive.h"
#include <iostream>
#include <filesystem>

namespace fs = std::filesystem;

int main() {
    std::cout << "===============================================" << std::endl;
    std::cout << "   TEST: Hallucination Engine (Singularity)" << std::endl;
    std::cout << "===============================================" << std::endl;

    // 1. Setup Environment
    fs::create_directory("hallucination_testbed");
    VectorOS::NeuralBlueprintManager bpm;
    VectorOS::NeuralModelBinder binder(bpm);
    VectorOS::NeuralProjectDrive drive(binder);
    VectorOS::HallucinationEngine engine(bpm);

    drive.mount("hallucination_testbed", "dream_layer_0");

    // 2. Create a "Concept Tensor" (The Idea)
    // High value -> Optimization code
    std::vector<float> data = {0.8f, 0.9f, 0.85f, 0.95f}; 
    VectorOS::NeuralTensor idea("optimization_idea", data, {4});

    // 3. Manifest the Idea
    // This should: Generate code -> Inject it -> Compile it
    if (engine.manifest_functionality(drive, idea, "optimizer.cpp")) {
        std::cout << "PASS: Hallucination manifested successfully." << std::endl;
        
        // 4. Verify Execution
        std::cout << "[Test] Running manifested binary..." << std::endl;
        system("./hallucination_testbed/optimizer.bin");
    } else {
        std::cerr << "FAIL: Manifestation failed." << std::endl;
    }

    // Cleanup
    // fs::remove_all("hallucination_testbed");
    return 0;
}
