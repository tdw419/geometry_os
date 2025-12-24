
// VectorOS v2 Phase 34: Holonomic Memory Demo
// Demonstrates Distributed Holographic Storage and Data Recovery from Damage

#include "kernel.h"
#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <cmath>

using namespace vectoros_v2;

void print_data(const std::string& label, const std::vector<double>& data) {
    std::cout << "   " << label << ": [ ";
    for (size_t i = 0; i < std::min(data.size(), size_t(5)); ++i) {
        std::cout << std::fixed << std::setprecision(2) << data[i] << " ";
    }
    if (data.size() > 5) std::cout << "... ";
    std::cout << "]" << std::endl;
}

double calculate_mse(const std::vector<double>& original, const std::vector<double>& reconstructed) {
    double mse = 0.0;
    for (size_t i = 0; i < original.size(); ++i) {
        double diff = original[i] - reconstructed[i];
        mse += diff * diff;
    }
    return mse / original.size();
}

int main() {
    std::cout << "=== VectorOS v2 Phase 34: Holonomic Memory Demo ===" << std::endl;
    
    VectorOSKernel kernel;
    if (!kernel.initialize()) return 1;
    if (!kernel.boot()) return 1;

    std::cout << "\n1. Encoding Data into Holographic Substrate..." << std::endl;
    std::vector<double> original_memory;
    for (int i = 0; i < 20; ++i) original_memory.push_back(std::sin(i * 0.5));
    
    print_data("Original Memory", original_memory);
    kernel.encode_hologram("Pattern_Alpha_001", original_memory);

    std::cout << "\n2. Testing Perfect Recall..." << std::endl;
    std::vector<double> recall = kernel.recall_hologram("Pattern_Alpha_001");
    print_data("Recovered Memory", recall);
    std::cout << "   MSE (Error): " << calculate_mse(original_memory, recall) << std::endl;

    std::cout << "\n3. specialized Test: Simulating Brain Damage (30% Loss)..." << std::endl;
    // We remove 30% of the holographic weights (frequencies)
    std::vector<double> damaged_recall = kernel.recall_hologram("Pattern_Alpha_001", 0.30);
    print_data("Recovered (Damaged)", damaged_recall);
    
    double error = calculate_mse(original_memory, damaged_recall);
    std::cout << "   MSE (Error): " << error << std::endl;
    
    if (error < 0.1) {
        std::cout << "   ✅ SUCCESS: Holonomic property confirmed. The whole was recovered from the parts." << std::endl;
    } else {
        std::cout << "   ❌ FAILURE: Too much data lost." << std::endl;
    }

    std::cout << "\n=== Phase 34 Demo Complete: The Brain is Holographic ===" << std::endl;
    
    kernel.shutdown();
    return 0;
}
