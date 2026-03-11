# Solution for Task: Shortcuts are documented

To implement Pixeel CPU - PixiJS Integration (Phase 40), the following design principles can guide the development process:

1. Non-blocking execution: CPU execution should not block the render loop, which is an essential aspect of visualization in Geometry OS. This principle ensures that rendering and CPU processing are performed simultaneously to avoid delays or performance issues.

2. Visual-first: The UI should be designed around the Pixeel CPU and PixiJS integrations, with a focus on providing seamless visualization of CPU state during execution. This ensures that users can understand the status of their system without disrupting rendering.

3. Memory-mapped I/O: Console and framebuffer use memory-mapped I/O to ensure that data is read from and written to the physical memory of the computer. This provides faster loading times, even with large brick files.

4. Incremental load: Brick files are loaded asynchronously to ensure that rendering is not interrupted during CPU execution. This also reduces the overall download time for large bricks.

5. Performance first: Geometry OS should prioritize performance over visualization, and this principle guides the development process by ensuring that CPU processing is performed as quickly as possible.

To achieve these design principles, several components will need to be incorporated into the system architecture. These include:

1. A Virtual Machine (VM) for Pixeel CPU Emulator: The VM will run the Pixeel CPU and PixiJS applications, allowing them to be executed seamlessly on top of the visual shell.

2. InfiniteMap Class: This class will handle infinite scrolling map updates in real-time, providing a non-blocking experience for users.

3. Python or Rust code required: A brief snippet of code should be provided to create or modify file paths required by the InfiniteMap Class. The user interface (UI) should also include clear Markdown formatting and provide instructions on creating new files, running scripts, and more.

Overall, this design approach will provide a seamless integration between Pixeel CPU and PixiJS, resulting in improved performance and real-time visualization of system data.