#include "kernel/gguf_desktop_simple.h"
#include <iostream>

int main() {
    std::cout << "VectorOS v2 - GGUF Desktop Demo\n";
    std::cout << "=================================\n\n";
    
    // Initialize GGUF Desktop
    VectorOS::GGUFDesktopSimple desktop("./workspace");
    
    if (!desktop.initialize()) {
        std::cerr << "Failed to initialize GGUF Desktop\n";
        return 1;
    }
    
    // Show available programs
    std::cout << "Current Programs:\n";
    desktop.list_programs();
    
    // Run interactive desktop
    desktop.run_interactive();
    
    return 0;
}