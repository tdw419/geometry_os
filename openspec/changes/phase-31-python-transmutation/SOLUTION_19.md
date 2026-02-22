# Solution for Task: **Task 3**: Create Frontend Drag-and-Drop Loader

[Task 3] Create Frontend Drag-and-Drop Loaders

#### Proposa
The objective of this task is to implement a "Python-to-PixeL" pipeline that allows users (and AI agents) to drop raw Python scripts onto the map, which are instantly transpiled into RISC-V containers and deployed as executable tiles. This bridge allows AI agents to code the world by leveraging LLVM's ability to generate RISC-V binaries and run them offline.

#### Solution
The solution involves:
1. A backend service (`systems/transmutation/`) that accepts Python source code and parses it to generate a flat binary `.bin` file. The `.bin` file is then optimized using `hibernator_curve`, which emits metadata (entry point, stack size) in the PNG header.
2. A frontend integration (`PythonLoader`) that uploads the `.bin` file to the backend and receives a URL for an executable tile. This tile is then written to a map by calling `InfiniteMap.writeTile()`.
3. Technical constraints: The solution only supports Pythons with fixed integer and floating-point types, and fixed-size stacks per tile. These constraints allow for a subset of the full range of Python code possible.

#### Benefits
1. Rapid Prototyping: Users can write code, see it run instantly, and iterate quickly.
2. AI Compatibility: LLVM's ability to generate RISC-V binaries makes it easy for AI agents to code the world by leveraging LLVM's ability to compile Python scripts directly into RISC-V executables.
3. Visual Debugging: Mapped pixels allow visual inspection of compiled logic, allowing for easier debugging and optimization.

#### Design
1. Transpilation Service (Python): A backend service (`systems/transmutation/`) that accepts Python source code and parses it to generate a flat binary `.bin` file. The `.bin` file is optimized using `hibernator_curve`.
2. Visual Linker (Python): A backend service (`systems/visuallinker/`) that takes the `.bin` file, calculates the optimal `.rtS.png` texture size (power of 2), maps bytes to pixels using hibernator curve, embeds metadata (entry point, stack size) in the PNG header.
3. Frontend Integration (JS): A frontend integration (`PythonLoader`) that uploads the `.bin` file to the backend and receives a URL for an executable tile. This tile is then written to a map by calling `InfiniteMap.writeTile()`.
4. Technical constraints: The solution only supports Pythons with fixed integer and floating-point types, and fixed-size stacks per tile. These constraints allow for a subset of the full range of Python code possible.

#### Planning Steps
1. Define file paths that need to be created or modified.
2. Define a brief snippet of the python or rust code required.
3. Create a 'Next Step' command for the user (e.g. Create a file, run a script).