#include "kernel/neural_binary_loader.h"
#include <iostream>
#include <fstream>
#include <cstdlib>

int main() {
    std::cout << "========================================" << std::endl;
    std::cout << "   TEST: Nested GGUF Program Execution" << std::endl;
    std::cout << "========================================" << std::endl;

    // 1. Create a dummy binary (The "App")
    std::cout << "[Test] Creating dummy binary 'hello_world'..." << std::endl;
    std::ofstream src("hello.c");
    src << "#include <stdio.h>\nint main() { printf(\"Hello from inside a GGUF!\\n\"); return 0; }";
    src.close();
    system("gcc hello.c -o hello_app");
    
    // 2. Tensorize it (Binary -> GGUF)
    std::cout << "[Test] Tensorizing binary to 'app.gguf'..." << std::endl;
    system("python3 ../tools/binary_to_gguf.py hello_app app.gguf --name HelloApp");
    
    // 3. Load & Execute (GGUF -> Memory -> Execution)
    VectorOS::NeuralBinaryLoader loader;
    if (loader.execute_gguf_program("app.gguf")) {
        std::cout << "PASS: Nested GGUF Program Executed Successfully." << std::endl;
    } else {
        std::cerr << "FAIL: Execution failed." << std::endl;
        return 1;
    }

    return 0;
}
