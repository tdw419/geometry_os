#include <iostream>
#include <fstream>
#include <chrono>
#include <thread>

#include "kernel/neural_ide.h"
#include "kernel/neural_memory_manager.h"
#include "kernel/neural_state_manager.h"
// #include "kernel/tensor_execution_engine.h"  // Removed for compatibility

using namespace vectoros;

void print_header() {
    std::cout << "\n" << "=" << std::string(60, '=') << "\n";
    std::cout << "           NEURAL IDE - VECTOROS V2 DEMONSTRATION\n";
    std::cout << "=" << std::string(60, '=') << "\n";
    std::cout << "The NeuralIDE provides:\n";
    std::cout << "• Code visualization and analysis\n";
    std::cout << "• Self-modification capabilities\n";
    std::cout << "• Interactive development sessions\n";
    std::cout << "• Neural code generation and optimization\n";
    std::cout << "• Integration with NeuralMemoryManager and NeuralStateManager\n";
    std::cout << "\n";
}

void demonstrate_session_management(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Session Management\n";
    std::cout << std::string(50, '-') << "\n";
    
    // Create session
    std::string session_id = ide.create_session("demo_user");
    std::cout << "✓ Created session: " << session_id << "\n";
    
    // Get status
    std::cout << "✓ IDE Status:\n" << ide.get_status() << "\n";
    
    // Get active sessions
    auto sessions = ide.get_active_sessions();
    std::cout << "✓ Active sessions: " << sessions.size() << "\n";
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_file_operations(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: File Operations\n";
    std::cout << std::string(50, '-') << "\n";
    
    // Create test file
    std::string test_file = "demo_neural_ide_test.cpp";
    std::ofstream file(test_file);
    file << "#include <iostream>\n#include <vector>\n#include <algorithm>\n\n";
    file << "int main() {\n";
    file << "    std::vector<int> numbers = {5, 2, 8, 1, 9};\n";
    file << "    \n";
    file << "    // Sort the numbers\n";
    file << "    std::sort(numbers.begin(), numbers.end());\n";
    file << "    \n";
    file << "    std::cout << \"Sorted numbers: \";\n";
    file << "    for(int num : numbers) {\n";
    file << "        std::cout << num << \" \";\n";
    file << "    }\n";
    file << "    std::cout << std::endl;\n";
    file << "    \n";
    file << "    return 0;\n";
    file << "}\n";
    file.close();
    
    std::cout << "✓ Created test file: " << test_file << "\n";
    
    // Open file
    bool opened = ide.open_file(test_file);
    std::cout << "✓ Opened file: " << (opened ? "SUCCESS" : "FAILED") << "\n";
    
    // Get file context
    auto context = ide.get_file_context(test_file);
    std::cout << "✓ File analysis:\n";
    std::cout << "  - Language: " << context.language << "\n";
    std::cout << "  - Lines: " << context.line_count << "\n";
    std::cout << "  - Characters: " << context.char_count << "\n";
    std::cout << "  - Dependencies: ";
    for (const auto& dep : context.dependencies) {
        std::cout << dep << " ";
    }
    std::cout << "\n";
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_code_analysis(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Code Analysis\n";
    std::cout << std::string(50, '-') << "\n";
    
    std::string test_file = "demo_neural_ide_test.cpp";
    
    // Analyze complexity
    std::string complexity = ide.analyze_code_complexity(test_file);
    std::cout << "✓ Code Complexity Analysis:\n" << complexity << "\n";
    
    // Find patterns
    auto patterns = ide.find_code_patterns(test_file);
    std::cout << "✓ Code Patterns Found: ";
    for (const auto& pattern : patterns) {
        std::cout << pattern << ", ";
    }
    std::cout << "\n";
    
    // Suggest optimizations
    auto suggestions = ide.suggest_optimizations(test_file);
    std::cout << "✓ Optimization Suggestions:\n";
    for (const auto& suggestion : suggestions) {
        std::cout << "  - " << suggestion << "\n";
    }
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_visualization(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Code Visualization\n";
    std::cout << std::string(50, '-') << "\n";
    
    std::string test_file = "demo_neural_ide_test.cpp";
    
    // Generate visualizations
    auto visualizations = ide.generate_visualizations(test_file);
    std::cout << "✓ Generated " << visualizations.size() << " visualizations:\n";
    
    for (const auto& viz : visualizations) {
        std::cout << "  - Type: " << viz.type << "\n";
        std::cout << "  - Data: " << viz.data.substr(0, 100) << "...\n";
        std::cout << "  - Timestamp: " << viz.timestamp << "\n";
    }
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_self_modification(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Self-Modification\n";
    std::cout << std::string(50, '-') << "\n";
    
    std::string test_file = "demo_neural_ide_test.cpp";
    
    // Request modification
    NeuralIDE::ModificationRequest request;
    request.target_file = test_file;
    request.operation = "insert";
    request.content = "    // Performance optimization: reserve vector capacity\n    numbers.reserve(numbers.size());";
    request.reason = "Optimize memory allocation";
    request.safety_level = "safe";
    
    bool modified = ide.request_modification(request);
    std::cout << "✓ Modification request: " << (modified ? "APPROVED" : "REJECTED") << "\n";
    
    if (modified) {
        auto context = ide.get_file_context(test_file);
        std::cout << "✓ File content updated. New length: " << context.char_count << " characters\n";
    }
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_interactive_development(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Interactive Development\n";
    std::cout << std::string(50, '-') << "\n";
    
    // Generate code
    std::string generated = ide.generate_code("Create a binary search function", "C++");
    std::cout << "✓ Generated Code:\n" << generated << "\n";
    
    // Explain code
    std::string code_to_explain = "int binary_search(std::vector<int>& arr, int target) { int left = 0, right = arr.size() - 1; while (left <= right) { int mid = left + (right - left) / 2; if (arr[mid] == target) return mid; if (arr[mid] < target) left = mid + 1; else right = mid - 1; } return -1; }";
    std::string explanation = ide.explain_code("binary_search.cpp", code_to_explain);
    std::cout << "✓ Code Explanation:\n" << explanation << "\n";
    
    // Debug code
    std::string debug_info = ide.debug_code("test_file.cpp", "Array index out of bounds");
    std::cout << "✓ Debug Information:\n" << debug_info << "\n";
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void demonstrate_integration(NeuralIDE& ide) {
    std::cout << "\n" << std::string(50, '-') << "\n";
    std::cout << "DEMONSTRATING: Neural Integration\n";
    std::cout << std::string(50, '-') << "\n";
    
    // Test integration
    bool memory_integrated = ide.integrate_with_memory_manager();
    bool state_integrated = ide.integrate_with_state_manager();
    bool tensor_synced = ide.sync_with_tensor_engine();
    
    std::cout << "✓ Memory Manager Integration: " << (memory_integrated ? "SUCCESS" : "FAILED") << "\n";
    std::cout << "✓ State Manager Integration: " << (state_integrated ? "SUCCESS" : "FAILED") << "\n";
    std::cout << "✓ Tensor Engine Sync: " << (tensor_synced ? "SUCCESS" : "FAILED") << "\n";
    
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

void cleanup_test_file() {
    std::remove("demo_neural_ide_test.cpp");
    std::remove("demo_neural_ide_test.cpp.backup.*");
}

int main() {
    print_header();
    
    try {
        // Initialize neural components
        auto memory_manager = std::make_shared<NeuralMemoryManager>();
        auto state_manager = std::make_shared<NeuralStateManager>();
        auto tensor_engine = std::make_shared<TensorExecutionEngine>();
        
        memory_manager->initialize();
        state_manager->initialize();
        tensor_engine->initialize();
        
        // Create and initialize NeuralIDE
        NeuralIDE ide(memory_manager, state_manager, tensor_engine);
        
        std::cout << "Initializing NeuralIDE...\n";
        bool initialized = ide.initialize();
        if (!initialized) {
            std::cerr << "Failed to initialize NeuralIDE\n";
            return 1;
        }
        
        std::cout << "✓ NeuralIDE initialized successfully\n";
        
        // Run demonstrations
        demonstrate_session_management(ide);
        demonstrate_file_operations(ide);
        demonstrate_code_analysis(ide);
        demonstrate_visualization(ide);
        demonstrate_self_modification(ide);
        demonstrate_interactive_development(ide);
        demonstrate_integration(ide);
        
        // Final status
        std::cout << "\n" << std::string(50, '-') << "\n";
        std::cout << "FINAL STATUS\n";
        std::cout << std::string(50, '-') << "\n";
        std::cout << ide.get_status() << "\n";
        
        // Cleanup
        ide.shutdown();
        cleanup_test_file();
        
        std::cout << "\n" << std::string(60, '=') << "\n";
        std::cout << "NEURAL IDE DEMONSTRATION COMPLETED SUCCESSFULLY\n";
        std::cout << std::string(60, '=') << "\n";
        
    } catch (const std::exception& e) {
        std::cerr << "Error during demonstration: " << e.what() << std::endl;
        cleanup_test_file();
        return 1;
    }
    
    return 0;
}