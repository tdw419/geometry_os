#include "kernel.h"
#include <iostream>

int main() {
    std::cout << "VectorOS v2 - Next Generation Neural Operating System" << std::endl;
    
    vectoros_v2::VectorOSKernel kernel;
    
    // Initialize the kernel first
    if (!kernel.initialize()) {
        std::cerr << "Failed to initialize VectorOS v2 kernel" << std::endl;
        return 1;
    }
    
    // Then boot the system
    if (!kernel.boot()) {
        std::cerr << "Failed to boot VectorOS v2" << std::endl;
        return 1;
    }
    
    std::cout << "VectorOS v2 booted successfully!" << std::endl;
    std::cout << "Ready for neural operations..." << std::endl;
    
    return 0;
}
