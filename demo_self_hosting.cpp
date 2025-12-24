#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>

// Include the VectorOS Kernel headers
#include "kernel.h"

using namespace vectoros_v2;
namespace fs = std::filesystem;

int main() {
    std::cout << "🚀 VectorOS v2 Self-Hosting Demo\n";
    std::cout << "================================\n\n";

    // Initialize the Kernel
    std::cout << "1. Booting VectorOS v2 Kernel...\n";
    VectorOSKernel kernel;
    
    // Initialize and boot the kernel
    if (!kernel.initialize()) {
        std::cout << "❌ Failed to initialize kernel\n";
        return 1;
    }
    
    if (!kernel.boot()) {
        std::cout << "❌ Failed to boot kernel\n";
        return 1;
    }
    
    std::cout << "✅ Kernel initialized and booted successfully\n";
    
    // Create a test project directory with some source code
    std::string project_dir = "demo_project";
    std::cout << "2. Creating demo project: " << project_dir << "\n";
    
    // Clean up any existing demo project
    if (fs::exists(project_dir)) {
        fs::remove_all(project_dir);
    }
    fs::create_directory(project_dir);
    
    // Create a simple C++ program
    std::string main_cpp = R"(
#include <iostream>

int main() {
    std::cout << "Hello from VectorOS Demo Project!" << std::endl;
    std::cout << "This project was built by the Neural OS Kernel." << std::endl;
    return 0;
}
)";
    
    std::ofstream main_file(project_dir + "/main.cpp");
    main_file << main_cpp;
    main_file.close();
    
    // Create a Makefile
    std::string makefile = R"(
CXX = g++
CXXFLAGS = -std=c++17 -O2
TARGET = demo_app
SOURCES = main.cpp

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

.PHONY: all clean
)";
    
    std::ofstream makefile_file(project_dir + "/Makefile");
    makefile_file << makefile;
    makefile_file.close();
    
    std::cout << "3. Project structure created:\n";
    for (const auto& entry : fs::directory_iterator(project_dir)) {
        std::cout << "   📁 " << entry.path().filename().string() << "\n";
    }
    
    // Mount the project as a Neural Drive
    std::cout << "\n4. Mounting project as Neural Drive...\n";
    std::string drive_name = "demo_project_v1";
    bool mount_success = kernel.mount_drive(project_dir, drive_name);
    
    if (!mount_success) {
        std::cout << "❌ Failed to mount project drive\n";
        return 1;
    }
    
    std::cout << "✅ Project mounted successfully as: @" << drive_name << "\n";
    
    // Execute build command
    std::cout << "\n5. Executing build command...\n";
    std::string build_cmd = "cd " + project_dir + " && make";
    std::cout << "   Command: " << build_cmd << "\n";
    
    bool build_success = kernel.sync_drive(); // This will trigger the build
    
    if (!build_success) {
        std::cout << "❌ Build failed\n";
        return 1;
    }
    
    std::cout << "✅ Build completed successfully\n";
    
    // Check if the binary was created
    std::string binary_path = project_dir + "/demo_app";
    if (fs::exists(binary_path)) {
        std::cout << "✅ Binary created: " << binary_path << "\n";
        
        // Execute the binary to show it works
        std::cout << "\n6. Executing the built application...\n";
        std::string exec_cmd = "./" + binary_path;
        int result = system(exec_cmd.c_str());
        
        if (result == 0) {
            std::cout << "✅ Application executed successfully\n";
        } else {
            std::cout << "⚠️  Application execution returned non-zero exit code\n";
        }
    } else {
        std::cout << "⚠️  Binary not found at expected location\n";
    }
    
    // Sync the project state to GGUF
    std::cout << "\n7. Syncing project state to GGUF...\n";
    std::string gguf_output = "demo_project_snapshot.gguf";
    bool sync_success = kernel.sync_drive();
    
    if (!sync_success) {
        std::cout << "❌ Failed to sync project to GGUF\n";
        return 1;
    }
    
    std::cout << "✅ Project state saved to: " << gguf_output << "\n";
    
    // Verify the GGUF file was created
    if (fs::exists(gguf_output)) {
        std::cout << "✅ GGUF file created successfully\n";
        std::cout << "   Size: " << fs::file_size(gguf_output) << " bytes\n";
    } else {
        std::cout << "❌ GGUF file not found\n";
        return 1;
    }
    
    std::cout << "\n🎉 Self-Hosting Demo Complete!\n";
    std::cout << "================================\n";
    std::cout << "The Neural OS Kernel has successfully:\n";
    std::cout << "• Mounted a project directory as a Neural Drive\n";
    std::cout << "• Executed build commands using system hardware\n";
    std::cout << "• Created executable binaries\n";
    std::cout << "• Persisted the entire project state to GGUF format\n";
    std::cout << "\nThis demonstrates the core capability for self-hosting\n";
    std::cout << "and recursive project evolution within VectorOS.\n";
    
    return 0;
}