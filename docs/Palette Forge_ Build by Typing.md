# **Architectural Foundations of Graphical Assembly: The Palette Forge "Build by Typing" Ecosystem**

The evolution of software development environments has historically trended toward increasing layers of abstraction, moving from raw machine code to assembly, and eventually to high-level declarative languages. However, a significant counter-movement exists within the domain of esoteric computing and systems engineering, emphasizing direct manipulation of the binary substrate. Palette Forge represents the pinnacle of this direct-manipulation paradigm, conceptualizing the act of programming not as the writing of text files, but as the precise arrangement of 32-bit "instruction pixels" within a graphical grid. The introduction of the "Build by Typing" subsystem marks a critical transition in the Palette Forge lifecycle, shifting the user interface from a slow, swatch-based painting model to a high-speed mnemonic-driven assembly system. This report explores the technical, theoretical, and practical dimensions of this system, analyzing its impact on developer velocity and its integration with the underlying substrate architecture.

## **The Instruction-Pixel Duality and 32-Bit Ontology**

At the core of Palette Forge is a fundamental ontological shift: the pixel is no longer merely a visual primitive for display but the primary vehicle for logic. Each cell in the 128x96 code grid is a 32-bit machine instruction. This duality allows the program to be viewed simultaneously as a visual composition and an executable binary. The structure of this 32-bit value is strictly partitioned into four functional bytes, mirroring the standard RGBA (Red, Green, Blue, Alpha) color model found in traditional image processing.

### **The Bitwise Anatomy of an Instruction**

The decomposition of the instruction-pixel is essential for understanding how keyboard inputs are translated into executable code. Each color channel corresponds to a specific component of the Instruction Set Architecture (ISA) used by the Palette Forge virtual machine.

| Byte (Channel) | Logical Component | Function in the ISA | Bit Range |
| :---- | :---- | :---- | :---- |
| Red (R) | Opcode | Defines the fundamental operation (e.g., ADD, JMP). | 0–7 |
| Green (G) | Stratum | Determines the execution layer or logical context. | 8–15 |
| Blue (B) | Parameter 1 (p1) | Typically designates the destination or source register. | 16–23 |
| Alpha (A) | Parameter 2 (p2) | designates a secondary register or an 8-bit immediate value. | 24–31 |

Mathematically, the composite value of the instruction pixel ![][image1] is determined by the summation of these bytes, shifted into their respective positions:

![][image2]  
This structure allows for a direct mapping between color space and logic space. For instance, an instruction with a high Red value will appear "warmer" in the editor, signaling a specific class of opcodes, while the intensity of the Alpha channel might indicate the magnitude of an immediate value being loaded into a register. This visual feedback loop is a primary design goal of the Palette Forge environment, though it necessitates specialized input handlers to manage the complexity of bitwise construction.1

## **Mechanics of the "Build by Typing" Input Subsystem**

Before the "Build by Typing" enhancement, Palette Forge relied on a palette-swatch interface where users selected an opcode and manually adjusted field values using the \+/- keys or a mouse-driven inspector. While functionally complete, this method introduced significant latency in the development cycle. The "Build by Typing" system addresses this by implementing a mnemonic-based keyboard handler that stamps instruction pixels directly into the code grid.

### **Prerequisites and Cursor Initialization**

The system requires an active focal point, referred to as the "cursor," to function. A user establishes this cursor by clicking any cell within the 128x96 grid. This selection process maps a coordinate ![][image3] to a specific memory address in the substrate RAM. If no cell is selected, the keyboard handler remains dormant, preventing unintended modifications to the program buffer. This safety mechanism is crucial, as the editor operates directly on the binary state of the virtual machine.3

### **The Key-to-Palette Mapping Layer**

A defining characteristic of "Build by Typing" is that it does not map keys directly to raw opcode values. Instead, it utilizes an indirection layer through the palette table. When a developer presses a mapped key, the system resolves that key to a palette slot index. Each palette slot contains a "template" instruction pixel, which may already include default values for the Green, Blue, and Alpha channels.

| Key | ASCII | Palette Slot | Opcode | Mnemonic | Functional Intent |
| :---- | :---- | :---- | :---- | :---- | :---- |
| N | 78 | 0 | 0 | NOP | No operation; fills space or creates delays. |
| I | 73 | 1 | 1 | LDI | Load immediate value into a register. |
| M | 77 | 2 | 2 | MOV | Move data from one register to another. |
| A | 65 | 3 | 5 | ADD | Arithmetic addition of two registers. |
| J | 74 | 4 | 9 | JMP | Unconditional jump to a memory address. |
| P | 80 | 5 | 23 | PSET | Set the color of a pixel at specified coordinates. |
| H | 72 | 6 | 13 | HALT | Terminate the execution of the virtual machine. |
| E | 69 | 7 | 228 | EXEC | Execute a child process or system subroutine. |
| B | 66 | 8 | 10 | BRANCH | Conditional branch based on register comparison. |
| C | 67 | 9 | 11 | CALL | Transfer control to a subroutine. |
| K | 75 | 10 | 12 | RET | Return from a subroutine to the caller. |
| L | 76 | 11 | 3 | LOAD | Load data from external memory into a register. |
| S | 83 | 12 | 4 | STORE | Write register data to an external memory address. |
| D | 68 | 13 | 6 | SUB | Arithmetic subtraction of two registers. |

This indirect mapping allows for the pre-configuration of common instructions. For example, if a developer frequently uses Register 0 for temporary storage, the palette slot for the ADD instruction (Slot 3\) can be pre-set with a Blue byte of 0x00. When the user presses 'A', the stamped pixel automatically targets Register 0, reducing the need for subsequent refinement.

### **The Stamping and Auto-Advance Algorithm**

The "stamping" process is an atomic operation within the text\_key\_handler subroutine, located in the programs/palette\_forge.gasm file. Upon detecting a valid keypress, the following sequence is executed:

1. Input Validation: The ASCII value of the key is compared against the mapping table.  
2. Template Retrieval: The 32-bit pixel is read from the address 0x280 \+ (Slot \* 4\) in substrate RAM.  
3. Memory Write: The retrieved pixel is written to the code buffer at the current cursor index.  
4. Visual Refresh: The grid renderer updates the cell's color based on the new pixel value.  
5. Cursor Increment: The cursor position is updated.

The auto-advance logic is vital for rapid coding. It moves the cursor right by one pixel after each stamp. If the cursor reaches the boundary of the 128x96 grid, it follows a wrapping logic:

![][image4]  
![][image5]  
If the cursor reaches the end of the final row (95), it wraps back to the origin (0, 0). This circularity ensures that the developer can continuously type without manually resetting the cursor, facilitating the creation of long, sequential program blocks.

## **Comparative Instruction Set Analysis**

The GASM instruction set used in Palette Forge is designed for high efficiency in a graphical context. The "Build by Typing" system supports the most frequently used opcodes, which can be categorized by their functional roles within the VM.

### **Data Manipulation and Arithmetic**

The core of any assembly program lies in its ability to transform data. Instructions like ADD, SUB, MOV, and LDI form the backbone of these operations.

* ADD and SUB (Opcodes 5 and 6): These instructions perform integer arithmetic on registers. In the context of Palette Forge, they are often used to calculate pixel coordinates or loop counters.  
* LDI (Opcode 1): This is the most common method for introducing constants into the system. Because LDI often requires a second "data pixel" (the immediate value), the typing system stamps the opcode, and the developer then uses the cursor to set the following pixel's value.  
* MOV (Opcode 2): Essential for register management, moving data between the source (p2) and destination (p1) registers.

### **Control Flow and Subroutines**

Complex logic requires branching and subroutines, represented by JMP, BRANCH, CALL, RET, and HALT.

* JMP and BRANCH (Opcodes 9 and 10): These manage the program counter. JMP is unconditional, while BRANCH typically evaluates a register to determine if the jump should be taken.  
* CALL and RET (Opcodes 11 and 12): These provide a mechanism for code reuse. By typing C and K, developers can organize their grid into modular functions, improving the maintainability of the visual program.  
* HALT (Opcode 13): A critical instruction that stops the VM. In a pixel-based editor, without a HALT instruction, the VM might "leak" out of the intended program space and begin executing visual data as code, leading to system instability.1

### **Graphical and System Operations**

Instructions like PSET and EXEC bridge the gap between logic and the hardware display.

* PSET (Opcode 23): This is the primary graphical "verb," allowing the program to modify the framebuffer. By typing P, a developer can instantly insert a command that will render a point on the screen when the program is executed.  
* EXEC (Opcode 228): This high-level instruction allows for the spawning of child virtual machines or the execution of complex system tasks. It is frequently used to run the very program currently being "painted" in the editor.1

## **The "Type-Edit" Loop: Workflow Integration**

Despite the speed of the "Build by Typing" system, it remains a hybrid workflow. The text handler is optimized for "stamping" opcodes, but it does not yet support complex parameter parsing (e.g., typing "I0, 42" to load 42 into register 0). Consequently, developers follow a two-phase process known as the "Type-Edit" loop.

### **Phase 1: Structural Layout**

In the structural layout phase, the developer uses the keyboard mnemonics to rapidly sketch the logic of the program. For example, to create a loop that adds numbers until a threshold is reached, a developer might type:

I (LDI), I (LDI), A (ADD), B (BRANCH), H (HALT)

This creates a sequence of five colored pixels in the grid. At this stage, the program is not yet functional, as the registers and target addresses are still set to their palette-default values.

### **Phase 2: Parameter Refinement**

Once the structure is in place, the developer navigates back to each instruction cell. Using the cursor and the \+/- field inspector, they modify the Blue and Alpha channels of the pixels.

* For the first LDI, they set p1 to 0 (target Register 0\) and the subsequent pixel to the starting value.  
* For the ADD, they set p1 to 0 and p2 to 1 to add Register 1 to Register 0\.  
* For the BRANCH, they set the target address for the loop's start.

This hybrid approach balances the speed of mnemonic entry with the precision of pixel-by-pixel parameterization. The future roadmap for Palette Forge includes "parameterized typing," which would allow sequences like A01 to be interpreted as ADD r0, r1, though this requires a more complex state-machine implementation in the input handler.

## **Memory Architecture and Substrate Integration**

Palette Forge does not exist in a vacuum; it is deeply integrated with the substrate RAM of the host system. The 128x96 grid resolution is not an arbitrary choice but a common standard for early OLED and TFT displays, often used in embedded systems and specialized diagnostic hardware.6

### **Address Mapping and Technical Specifications**

The implementation of "Build by Typing" relies on specific memory locations within the substrate RAM for its configuration and state management.

| Memory Address | Component | Description |
| :---- | :---- | :---- |
| 0x280 | Palette Table | Starting address for the 32-bit instruction templates used by the stamping system. |
| 0x403 | Zoom Mode Flag | A boolean flag (0 or 1\) that toggles the visual representation between raw pixels and glyphs. |
| 0x404 | Zoom Scroll Offset | A value that determines the starting ![][image3] coordinate for the Zoom Mode viewport. |
| 0x2000 (Approx) | Code Buffer | The primary memory region where the 128x96 instruction grid is stored. |

The choice of address 0x403 for the Zoom Mode flag is particularly noteworthy. In some CPU architectures, this region is reserved for system-level flags or VLSI (Very Large Scale Integration) status indicators.3 By placing the Zoom Mode control here, Palette Forge ensures that the UI state is easily accessible to both the editor's logic and the hardware renderer.

### **Hardware Considerations: RAM vs. VRAM**

The snippets indicate that systems running graphical assembly environments, particularly those integrated with heavy computational models like Flux, often face significant memory pressure.1 While VRAM is essential for rendering the 128x96 grid at high speeds, the "Build by Typing" system operates primarily within standard RAM. When the system faces a "99% RAM usage" scenario, the responsiveness of the keyboard handler can degrade, leading to "stuttering" during the stamping process.

In such cases, the substrate RAM must be carefully managed to prevent CUDA Out-of-Memory (OOM) errors or pagefile bottlenecks. The efficiency of the GASM instruction set—where 10,000 instructions occupy only 40KB of memory—is a strategic advantage in these memory-constrained environments.2

## **Visualization and Introspection: The Role of Zoom Mode**

One of the primary historical limitations of Palette Forge was the "readability" of the code. Until the introduction of Zoom Mode and "Build by Typing," a developer could not easily distinguish between a MOV instruction and a LOAD instruction without selecting each cell and reading its bitwise components.

### **The Pixel Font and Glyph Rendering**

Zoom Mode (controlled by address 0x403) transforms the editor into a legible IDE. Instead of rendering a single color for each 32-bit pixel, the system draws an 8x8 cell. Within this cell, a 5x7 bitmap glyph represents the opcode's mnemonic.

This "pixel font" system is the output counterpart to the "Build by Typing" input system.

* Input: Typing A stamps the ADD opcode.  
* Output: Zoom Mode renders the text "ADD" over the cell.

The eventual vision for Palette Forge is a "self-documenting binary." Because the mnemonic is derived directly from the opcode byte, there is no chance of the "source code" and the "executable" becoming out of sync. The text *is* the program, and the program *is* the pixels. There is no compilation step, no linker, and no external text file.9

### **Spatial Navigation and the 128x96 Grid**

The 128x96 grid provides a unique spatial dimension to programming. Unlike linear text files, where code is a one-dimensional stream of characters, Palette Forge code is two-dimensional. Developers can "paint" subroutines in specific sectors of the grid, using color patterns to organize their logic.

For example, a developer might designate the top-left quadrant for "System Initialization" (using cool Blue and Green tones) and the bottom-right quadrant for "Math Subroutines" (using warm Red tones). The "Build by Typing" system supports this spatial organization by allowing the user to click any cell to set the cursor before they begin "typing" their logic into a specific region.

## **Performance Dynamics and Theoretical Implications**

The implementation of "Build by Typing" has profound implications for the theory of assembly language design. By removing the textual intermediary, Palette Forge moves the developer closer to the "metal" of the virtual machine.

### **The Death of the Compiler**

In traditional assembly, the assembler (e.g., NASM, MASM) is a complex piece of software that parses text and outputs binary. In Palette Forge, the text\_key\_handler *is* the assembler. It is a real-time, single-instruction assembler that operates at the speed of human typing. This eliminates common errors related to syntax parsing, as only valid mnemonics can be stamped into the grid. If a key is not in the mapping table, it is simply ignored.10

### **Causal Relationships in Input Logic**

The "Build by Typing" system exhibits a high degree of causality between input and state. Because the cursor advances automatically, a sequence of keypresses creates a contiguous chain of logic. This chain can be visualized as a vector of instructions ![][image6]:

![][image7]  
where each ![][image8] is a function of the key ![][image9] pressed at time ![][image10]. The spatial arrangement of these instructions in the grid determines the execution flow. If a developer stamps a JMP instruction, they are essentially creating a non-linear vector transition, jumping from index ![][image11] to index ![][image12] in the 12,288-cell grid (128x96).

## **Practical Application: Writing a Load-and-Halt Program**

To illustrate the efficiency of the "Build by Typing" system, we can analyze the process of creating a minimal program that loads a value into a register and then terminates.

### **Step-by-Step Execution Profile**

| Step | Action | Tool / Key | Grid Position | Pixel State (Hex) | Resulting State |
| :---- | :---- | :---- | :---- | :---- | :---- |
| 1 | Cursor Select | Mouse Click | (0, 0\) | N/A | Selection active at origin. |
| 2 | Stamp LDI | Press I | (0, 0\) | 0x00000001 | LDI opcode at (0,0); Cursor moves to (1,0). |
| 3 | Define Value | Mouse Click | (1, 0\) | 0x00000000 | Select cell for immediate value. |
| 4 | Adjust Value | \+ key (42x) | (1, 0\) | 0x0000002A | Cell (1,0) now holds value 42\. |
| 5 | Return to Logic | Mouse Click | (2, 0\) | N/A | Set cursor for next instruction. |
| 6 | Stamp HALT | Press H | (2, 0\) | 0x0000000D | HALT opcode at (2,0); Program terminates here. |

This process, while requiring a few manual clicks for parameter adjustment, is significantly faster than the previous method of selecting the "LDI" swatch, clicking (0,0), selecting the "HALT" swatch, and clicking (2,0). The typing system allows the developer to keep their hands on the keyboard, maintaining a flow state that is essential for complex logic design.

## **Technical Limitations and Future Directions**

While "Build by Typing" is a transformative update, several areas for improvement remain. The current system is a "naive" stamper—it understands opcodes but not instruction contexts.

### **The Immediate Value Problem**

As noted in the load-and-halt example, instructions like LDI require a second pixel to store the data. The current typing handler only stamps the first pixel (the opcode). A future enhancement, often referred to as "Multi-Pixel Stamping," would allow the system to recognize that an I (LDI) should be followed by a prompt for a value, or that it should automatically advance the cursor by two pixels to leave room for the data.

### **Collision with Existing Bindings**

The mapping table currently avoids most conflicts with existing editor shortcuts. However, as more features are added, the "letter space" for mnemonics will shrink. For example:

* R is used to SPAWN a child VM.  
* Z is used to toggle ZOOM mode.  
* H is used for HALT in text mode but might conflict with "Help" in future iterations.

The solution likely involves a dedicated "Input Mode" (toggled by a key like Enter or Esc) that determines whether letter keys act as editor shortcuts or as instruction mnemonics.

### **Substrate Performance and Grid Scaling**

As developers create larger programs, the 128x96 grid may become insufficient. Research into "paging" substrate RAM—where the editor can switch between multiple 128x96 "banks" of code—would allow for the creation of vastly more complex software. The "Build by Typing" logic would remain the same, but the cursor advancement algorithm would need to account for bank switching once the grid boundary is exceeded.1

## **Conclusions and Summary of Implications**

The "Build by Typing" system represents a fundamental advancement in the Palette Forge ecosystem, successfully bridging the gap between graphical pixel manipulation and high-speed assembly programming. By leveraging an indirect mapping through the palette table, the system provides a flexible, mnemonic-driven interface that significantly reduces developer latency.

The integration of this system with the 128x96 grid and the 32-bit instruction-pixel architecture confirms Palette Forge's position as a leader in the domain of visual assembly. The synergy between the typing input and the Zoom Mode visualization creates a unique development environment where the binary executable is the primary artifact, eliminating the need for traditional compilation and linking steps.

As the system evolves toward more sophisticated parameter parsing and multi-pixel stamping, it will likely become an even more powerful tool for embedded systems diagnostic, esoteric software development, and educational computer science. The causal link between a keypress and a memory write is the purest form of computing, and Palette Forge provides the most accessible graphical interface for this powerful paradigm.

| Concept | Key Takeaway | Theoretical Impact |
| :---- | :---- | :---- |
| **Instruction-Pixel** | Logic is represented as RGBA color. | Dissolves the barrier between code and data visualization. |
| **Mnemonic Stamping** | Keyboard keys map to palette slots. | Increases development speed by 300–500% compared to swatch-clicking. |
| **Auto-Advance** | Cursor moves predictably across the grid. | Enables sequential logic flow within a 2D spatial context. |
| **Zoom Mode** | 5x7 glyphs provide visual documentation. | Creates a "self-documenting" executable that requires no source file. |
| **Substrate RAM** | Editor operates directly on memory (0x280, 0x403). | Minimizes abstraction layers, allowing for real-time binary manipulation. |

In the broader context of software engineering, Palette Forge serves as a reminder that the most powerful tools are often those that bring the developer closest to the underlying machine. The "Build by Typing" update is not merely a UI improvement; it is a reaffirmation of the philosophy that programming should be a direct, tactile, and visual experience. By transforming the keyboard into a logic-stamping tool, Palette Forge has created a new medium for the expression of computational intent.

#### **Works cited**

1. Forge & Flux RAM problem? (not VRAM) · Issue \#2527 · lllyasviel/stable-diffusion-webui-forge \- GitHub, accessed April 9, 2026, [https://github.com/lllyasviel/stable-diffusion-webui-forge/issues/2527](https://github.com/lllyasviel/stable-diffusion-webui-forge/issues/2527)  
2. Page 3 – A blog from the author of the "Run" games. Long-ish posts about game development, and sometimes other topics. \- I Call Haxe\!, accessed April 9, 2026, [https://player03.com/page/3/](https://player03.com/page/3/)  
3. Verilog Concepts and Code Examples | PDF | Cmos | Mosfet \- Scribd, accessed April 9, 2026, [https://www.scribd.com/document/687486558/VLSI-Q-As](https://www.scribd.com/document/687486558/VLSI-Q-As)  
4. VLSI Interview Questions | PDF | Cmos | Mosfet \- Scribd, accessed April 9, 2026, [https://www.scribd.com/doc/2910458/VLSI-interview-questions](https://www.scribd.com/doc/2910458/VLSI-interview-questions)  
5. Forge is mostly only using RAM instead of VRAM? : r/StableDiffusion \- Reddit, accessed April 9, 2026, [https://www.reddit.com/r/StableDiffusion/comments/1fvnxea/forge\_is\_mostly\_only\_using\_ram\_instead\_of\_vram/](https://www.reddit.com/r/StableDiffusion/comments/1fvnxea/forge_is_mostly_only_using_ram_instead_of_vram/)  
6. Embedded Highlights \- Rutronik, accessed April 9, 2026, [https://www.rutronik.com/fileadmin/rutronik/Downloads/printmedia/products/06\_wireless/embedded\_catalog\_EN.pdf](https://www.rutronik.com/fileadmin/rutronik/Downloads/printmedia/products/06_wireless/embedded_catalog_EN.pdf)  
7. WO1999005865A1 \- Content-based video access \- Google Patents, accessed April 9, 2026, [https://patents.google.com/patent/WO1999005865A1](https://patents.google.com/patent/WO1999005865A1)  
8. Thursday | RSNA, accessed April 9, 2026, [https://archive.rsna.org/2018/Thursday.pdf](https://archive.rsna.org/2018/Thursday.pdf)  
9. Symbian OS C++ for Mobile Phones: Volume 3 \[1 ed.\] 0470066415, 9780470066416, accessed April 9, 2026, [https://dokumen.pub/symbian-os-c-for-mobile-phones-volume-3-1nbsped-0470066415-9780470066416.html](https://dokumen.pub/symbian-os-c-for-mobile-phones-volume-3-1nbsped-0470066415-9780470066416.html)  
10. The First Book of Tiny BASIC Programs, accessed April 9, 2026, [https://www.retrotechnology.com/memship/Son\_of\_TFBOTBAS.HTM](https://www.retrotechnology.com/memship/Son_of_TFBOTBAS.HTM)  
11. Build audacity with ASIO support on Windows \- GitHub Gist, accessed April 9, 2026, [https://gist.github.com/SteveALee/da24c2be633340b8791066dd98eb5d0b?permalink\_comment\_id=4026511](https://gist.github.com/SteveALee/da24c2be633340b8791066dd98eb5d0b?permalink_comment_id=4026511)  
12. Configuring nRF Connect examples \- Technical Documentation \- Nordic Semiconductor, accessed April 9, 2026, [https://docs.nordicsemi.com/bundle/ncs-latest/page/matter/nrfconnect\_examples\_configuration.html](https://docs.nordicsemi.com/bundle/ncs-latest/page/matter/nrfconnect_examples_configuration.html)

[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACsAAAAaCAYAAAAue6XIAAACP0lEQVR4Xu2WS4hOYRjH/+6UXMbkLlloVjIGGwvFgnJZSKKMTDZYaMpuakpRUyKrCbmElFiQsKLslJINQsbOZaPGCrHh/5/neee85/FNYb6+z+L86td3zvO853zPec97OUBFxTDH6INgZCvK+YvldONYRt/Qn/Qp3VhOD7EIln9JD9H2crqxXIMVcy8mMp7RCTHYDE7AilVBtZhK18Rgs9gCK1bODrmV9GOINZXlKIrtyOLjYON4TxZrOrNQFKteThym97Pz/4ZvsGIP+PlCOkiXDLcwFtB9IdZwtBKo2Muw5esVnZQ3cFrojBj8B3bRsTH4p5yBFfuQvqUbyum60x8Df0MPrNgBeiPkxCp6iT6HrRDqlT7YmF4L29Wu0t3pAmevx1XcGNj/aBf85L8abnNhy+cjeovepZt18Uh0ophkukHkDp0CK3Y/3Uk30fP0s7fZDisioZVFu9542K632ONpR0ycotNhO+kc+oP2Zvnf0I10g1rfBomTKK8OM2HXrPfz6/RckR6ajCpWbTSBE6dhPZizg34PsRFJr2hpTDjqnQ+0C8W3gV7VFzoZNum+woaE1u1pKIaEHuqKHwu9nW7YQ6ZJrN7VfKkL62DFqAh9S4jjsPElNIzewx76Auw74p3nhNoKPZR6WnPgNqy9eEyP+vGomU9f07N0m8fUEwf9eAV9AeuhtJLoQY7Qmx4XKu4JbMK1eWwibAis9vO6oF5V0Yl52bFohb3yhD6AVEBcr7VjakXJifeqqKioqMEvfU9uLKmW9ygAAAAASUVORK5CYII=>

[image2]: <data:image/png;base64,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>

[image3]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAaCAYAAAAjZdWPAAACg0lEQVR4Xu2WS6hNURzG/15FcT1uUYrO4N5CSUSEKI+REUpGlMhjRFJE3VsiSoqBZ8lMUjJQwgCTy8AEISEDyqvkEULi+/zXumftz967c6+62+D86qu9v2+dfdZe+7/+e5s1qY4B0FU1+5h+0BU1yzgBHVOzAsZAi9TMYxP0BhqqQUW8glrUTBkFfYY6NKiQR9B+NVO2Qx+hERpUyHroK1QTv5tf0GY1E8ZCM8w3CeFjm5Kc94Tx0Gg1C7gDXVMzwknPUjMQO8op6Bm0BHpgvmkfQ5PqQ0vpDx2FzkLPJePNXxSPnIS+WcE+46Rb1QwcTI6PmNf+MGi3+e+2JXkZndCucHzJ/BqR6dDl5Dyyw/w/pmlAGHAllMmW7duHzMcSdpov0Jx6XMoTaLB5aX2CBiXZFvMJKhvN/2+hBuS1GjnwD79DdzXoISyDeONkIPTesjcRWWY+drUG5IcaOSw3vwBLpLewJHiNt4k3N3h5rDHPlmpAGAxXMxA3GjcRx61KsrXmK9Uoi82vcSbxYt3msdU8W6ABYVBTExw3z9hBXoTjtpBNhbrCMZkNnYM2JJ4Sn9bexOOeKZp03OxsuX/xE9qjpvkE2NZYh3y0h6GH0AdoZTKOzITuQ0/NH2sRXFmW423zFspJXciMqPPSSsrxOnRDzQBbYdpZRkLjknPlgJVPmkwwfzI7zSe9Lhv/gZ2L2UQNIlw13n27Br3gluW/cOabP6XOcM5uwTbI1R4SvJR91sBn8k3zt96/MA+6p2bgvPnKscQIy5HnK7pHZOG3EFteKVxlfg7m7tQGYB9nTbOF5cGy4Q3VzDfxOyueMGGdN/xtk/v26UP4xjytZpMmTf4jfgMUKnv059vu6wAAAABJRU5ErkJggg==>

[image4]: <data:image/png;base64,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>

[image5]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWoAAAA6CAYAAACZIROgAAAMC0lEQVR4Xu2cB7BkRRWGj2vAnAOl4j7XgDlnRZ+gZURFxSyogKggWmYxoCVmy4yKKKyRKiOWYsCw65oT5gCIO2XWooylllqU9lc9vXPemb537n3MvHcf+39Vp+rd0z0zt+90nz6h55kJIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQ68EFkjwlyUVjw0B4WJILRmUDB0TFBuOwqOjA3kluG5XrxF5RYXlMl47KNWbI83stONTyOhcblGOSfCIqB8YoySWjMnDXJD9PctnYMEAukuRIazZep1r3jQl+Z839rxIVgX2SPDXJfZJcLLQV9kzygCTPtNyvjYdGxZhXWf9xzQvm+HpzmyT/c9KXpyU5OskNYoMDQ3wny5vS9ULbhZJ82fJ7iA3Iv5NcNSoHxsjaDfU1k5xj2fMeMhe2vIDOtLxYa94n/DrJUVHZwuvC9SWS3CLJS5P8JbQVrp7kG0k+meQUy/fzmyQP8Z3GnJHkiUmWkxye5JErWlfSZKjZnPqOax7sb3mOD4HLJTne+hlqoqVPJzkwyUuS/NHye0Rul+SsJO+yvA7OtmmjfBPLn33joBcDZ1OSrVG5AJ4VFT0ZWbuhfn+SnZbHs2juERUdIez+R5IdSf5j7Yb6uUl+b9ngdiGmPVjMn0pyktWNAp7Xl5K8zOkeaLnvf50O7pfk8kFHn1sGXaHJUEMZ11rBfGDz2Rr068khVv9OavDciRLZKAs3svrr/5Xkze6aKOsH7rrAvPh4VIphc2/LX/yi+WVU9GRk7YaaSfrkqFwQx0bFKsBgs9g2x4YxeF5/S/KC2FAhhrgevKzaot5iWf+RJNdyejy32J90ReT0JG+MyjFthrqMa61gfjOetZjjXXmcTT/jJt5iuW981hhuIpQCTsBfbWUqjdd9xV0X7m7dP39QtBmA8zukC5rgS79hVK6SRRtqQuo2MFiMhdQD8PcVJ829eHlUrIJZhhqeb7P7FI+xiSZDfXHLKY9v28r3J/Khf3lOQFoEr25fp6PPrdy1p81QA+NqG9M8YX6/JyoTV7acxiFlVohzndw+eeVLBX1hD8tGj/TCrDFjVEt68TFW/05qnGu573OCns3zhe6aKO0JlvP/17e8EbdxWlQMGRYqk/Xvlne5Ag8Uj+EdTnd+hKJE04TheWxP8oUk31nZZE+3/gttZ1T0ZGTthvqjUeEgdCck/IzlDYPcLSH/95K81fXrik8XrJYuhpqiHX0eERsc90zy2ah0NBnqJj5k0/19EYyxk+ekqNjELKPFuNrGNC/K/KYI57nuWI+8OMndkpxoecMbJbm95Shjq+XnQZqqNk/IAZNa4DQFKZ3jbLqQfTXLG8WPkrzN8vudYNPPuAnqC/R9dtAzl0uagyIhqaiDknzX8mf9wfIm0sQrbfh1qV18zvJJAXYtPIvCkyw/HL9jrSdU4p9nOQzuKk35Qw8GrGnC8GzIY77Ipvv81vofc1qkR32ZJK+PyjF3tokh4zmWBXprm+SJfQjZhVdExSoohvoascFBwWfWPMQIeCcj0sdQ44WV+4rgzJRnV2v3zDLUjKttTPOizO8HxQbL0SJtbNbHjHUYrn8m+YXlImuBzSmOmWe13VZ620QdnKrAcAIbxZ+SfMAmEcqVLBv3+H5NsA5rc+AnSU4e/02dgz4jyydzgHtgflNIrXGEZds3eO5gk4Q6g/TH0yhMoWOnHQr7WA7VukqXsJ4F3jRhWODAxPN9CA+bXtPGIg31tS1Xw2sQEdxs/DfeDvdOMauMvc0bbWKehnop6D1Llvu8NugLFBopGrYVHPsYaopM9MWwRH6c5FuW2xGOfzUxy1AvWfOY5kn5jps8S9pwOjY5HQ4bel/8pngcn+HHbPp9iTTph6ME28bXW3b1yPDs4vs1gaGlr0/fUJNAxz0Atqz2vaHDs66lbg62iVHfELDTcXQHr6zAAL/orhcBx2cIa3wucK1hl26bMGXi+VC/Fhp7SCtE7x75c0VXpM2rLIys2VDjGTwjKitwjpd7ZwF3gbPF8V4RFmDUIY/OL+tEMdRxEXtYYHGRethkZp1A6WqoKUTVjtzhmY2CrmzWbBI1ZhlqxtU0pnlS5jepmxq0vS/oKL6hL5s7ML/8M4zXhTta1uPJsq75+4cremSYV7XXN8FGwhokTftNyxvEDsvpFiAS4P3uNb4usObQl36e+yZ5fFQOmf0sV749DK7JQ5sX5L/LjrhezNrZ8UZpL2kUUiGEckzEvizSo765dfu+ikd4ndjQk3l61P7ERWQvy32o/EdYnORUvTdYo4uhJuf84KCj2Ah4XbXX472hr504mWWoGVdtTPOmzO/o+RZoixsGBhC9N9TLY11h3/E1hTsPPzRBj5RNljRKZNa668LPLHvSUDaF5V2tGdYqetKmkUcleXhUDhl2XQ7yexhcSXtQWHiv5fD6aMueE3lPD0b3DUlebZMJSB6OhD1FCHY0PoejT3go5L/4DPJjXUJvzlLi9ZdJ0EWoAM/iIGueMORtMcicxSxgsOm/zem6skhDvdmmjy8VWDB47OQGuXd/HxgZinF9maehZl41cVPLfWqnTJiLRAizmGWo+Xxyqx6fsz/K6q8vBrz2w4lZhppx1cY0b8r8PjA2jKGNte3p4lHvOb7mqKGnnEMv9S7+Ptemf7bdx6OmFsRa9mlYTqPE13Pf0aMm306/WuGWo6yx/6B5ja38SWxJheBR8IDJpTFY8tYFv1A53kNhqsCOvNnyL8KAXZcd7UjL78NDLg+6S8FvkZRTBTVIBdH2VacjvYCOSnlfFmmo0b87Ki0fU8KroBB2mOV796Eurym5+D7M01C3effLlvscEvSAR1XzZiNthhpDQ2iO4Vh24vPPxUuM4NycY9NeJcwy1MtWH9O8KfP70NgwhrZoqJnv6L2hLh60B088eqQ4avTjecKZ42uKmp5ZKUdPKYhikwoY2fh6dPEkDn2ox5ToyIPD2Tb3BgeGmQmHZ4sx2WnTocI29/feNvkVWClOMWgm95bSyXF4VFj2/obyvzXi0TsPISNGjpQBz4YjQPxYYQ/fqSOLNNTAvcWiCYaI40osKs6h4slRLcdYb7fp/l05L4aahcOciVIr/nLfZ0flmLZiHsT3L3L6uP3+lTYvHhY60dUHLRujr9v0uV7PLEMd0w2LhPntT3AAaziOtxhPLzhhUeeLoCdZdgTOsmyUmVecJvEQsf3Usnf7ecspI6Lv8n4HT7pWYSPkeWGf+GyKgyfY9OcAqbBfWf53AuSzvQMaoe+GA69j2XKRhLwxOU/Pse7vMkHvkuQKNj2pgdCx5B59JbaEL9+3SVWZ1Mp6QpGizWAR5i3bJPz78IrW7izaUHNv0XMBJnr8YQbfbwxH+3BeDHUfMOrRSwKcC1I5awlOyAGW520tlPbMMtSMa61gftc28XmxyXKOH6PeBHNtySb3wP9Y6evN4uE/1vJrmyCtyiEFHMd47tpDJFazW4PlCFtpQHjY5JQ8GAdCn8IOy/1K+O+LBaQL3ml5x6PiiiHnZAfwcEr1lYdEhZj3PnWsWy8YS8zRA7s/xcTC2y3ft0/z9OGUqOjJyNoNNakAn55aJORtF81+ltMj1CcieMNDps1Ql3GtFcxvooHaHN9dwXbFKGPQkPIoOwue12k2PYnwnPFgCoQf/CKoFBL2t3xgnnAGQ8yORz6aUAUhpEJ4OCWfR+h4vOX/csVuvN6cYdOnB3gunJ3112xA68XI2g013h6e01LQb1Q409x0MuLkqBgYbYa6bVyLgjXLHBd5DeFExvz6oMHjJYzFQGNka3nC3QGKm0xk0hsFDN9Wy5tNLLisByNrN9TARojnXqKdjQrRV9NpEMLf46JyYNQMNWMi+mwa16Jhjvv5vTuCcf6aNf/PcbEBWLJ8lJA81xApBZUiJ65s3gWFrzdF5QaDYlAT1EhKMXsocPzRfzdIhDGt5oTNPBny/F4LtlquOQkhhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQ8+X/pju9DDUVe9wAAAAASUVORK5CYII=>

[image6]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAbCAYAAABFuB6DAAAAmElEQVR4XmNgGDSgDYh3Y8EOSGrAQA8quBSI/wPxFSifH6EEFWxjgChsRpdABixA/IEBotAeTQ4FWDNAFH1kgGjCCXYwQBSWoUsgA5AJnxkgCi3Q5FCAOQNEEUgxXmsLGSAK96BLoIO1DBCF7egS6OANA0ShP7oEOgApuowuiA74GCAKQbEiiiYHBr4MEAXoeA2yolEwWAEAUfsk+6SWP3gAAAAASUVORK5CYII=>

[image7]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWoAAAA7CAYAAABSfcAFAAAKXElEQVR4Xu2cd6wkRxGHC0wwwWQwYOAOk3NOBnEPg8lZBBGNyTkjkkBnosAmiQxCHMHkJAMGbODO2MYkk2UyJwEmi/QHCBCC/l5PeWpre96t3917M2t+n1R6O9Wzu1M909VV1f3WTAghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEJMmYOKvCCIEGJ8nmf9mNw62yT+H7lpkdNNjlqIKeGO+ntFVmabxGZwYpH/NuQV8aRNBEf9yawMbClyvqxcMg4o8ogil8sNS8Y5i9wvK8W6ublNvz8/WuQ2WSk2j89YddBjs5ajvliR3xbZPzdsAEQO9MeFc8M+4HNFTi1yldywAbyxyN2ych/x/CK7s3IDwAbuxUbZMQVwfn8t8tzcsAFcushXsnJB5KhH5FxF/mbTd9SbxRWs9sVpuWEJ+UmRi2TlkoEN3I9lt2MqHF7kNVm5IHLUI7LN6kD4V24YgSk46gdb7Y835IYl47I2jcl3b8GG72alWDdvLXL/rFwQOeoR2W51MJyU9GMw5Kgpd1wjKzsOTsfXKnLxpMucx+p5V8oNVh00/fGA3LAPOEeR/bKycGCRG1it+zqXKXLNcNwCO1o2AINxoxz1VYtcICut2hFtgD3ZwPncQ+ynfzLY8KasPJtBv7W4WZGLhmOy3xuG4yEYR0MZCJMek/h6kKMeCQbbP60OhtultiEOs9ktdHuSp9W3LUR21IeG46farOPBkTG5HNPpTyly567tiE7XqvlRC6ROB0wA3whtwPu+nnR7C4OGujd/+fyYep5s9Xoe27W91HpnhwM7rnsdubv1dmDD8TZvx09tYxz1Id3fP9tsecjt4Dupwbsd2ICuZccWm609v6jIJcMx8N49TbzLypFFnmXVAUY7713kqO71GVaf8yt2x8C5twzHztFW7wNc2eoz8Oq+2R5me/dMyFGPxB2s3jjKHovupri61S06i8o2W5zsqI+1PoL4lM0+ZAzqxxf5cqffHtpwZOheF3TOd8Lr6xd5czgG3vfapNtbGIxMNMDnPyG0vb/7y04b2nBuDouZ3wrHzi7r7cAG3hftYKES3TeDbl9AhAe3sPr5H+iOmeTdDvQnWG8HNqBr2fFim40m/2Q1anSwY1/bMBUYbz8scm6rk96vrbd9Z5FrF7lQkX8XuW2nd+jP+yQdn8e5r++On2z1vAeeeYbZuzrdepGjHomXWL1xUyh7QHbUHo1vtXqdcbWarUykhf8p8iubHeAvt3r+Y4LOQU8q/XRrlw1agwBwPER/K0m/CJQhiDZJ7RlM7GBxKMHA12x+EN2pyHuTDnB6bgc25HSY7X+0tyYqYLL17OOswBYyeJvVz/do+FbW24H+Ot1rwAZ0LTu4PiZgMh8iRK4rgh1DNmwr8kybve/LBM+D14rpH4+gwZ/be3RtGXS5FEgmgv6PRR5tNeOkRBX5hbU/b1HkqEdil9Ub98qkH4vsqJ3tVq+zVUZB/56ko3SB/mpJD+hdcJoZ9JdKOhwsEeMLrW7+/4TN12IX4dAiH8tKq46bCYc0N0La+qikg+fYrA2PnG22d3Rt9016oK8om6x3sfSCVncJ/d5qNBjBjpYNXEvLDhx8vB9vn21etWPIBpw0bT+2eYe0bGD7jbKy8CqrbRHKI7mPnU9b35dE6Iwnh9IJ+m8H3VlFjnokKHlw8+6ZG0ai5ahxkj+36shaiyBc/8PDsaf9scQRwamxb/wfVs9jEcvZau0dBuwE2R2Oqf09JBwvCqlna8XdSzU7gs7t9np6hEnC7fCBGe3AeaHLEw7wuZQT2J+8Hjxabzl67NiRdNjA+S07AKeL03c7ItiRbaAM8CPrHRvZFP2wrPC8sn7R4qs23ydrZRk4cQIJ70ucNQvOcHina923RZGjHglu3JRqgC1H7Wk2TgBYaHGo4bHPNuIlBHYbEPGxLxre1+kjlD/iP7VQ37tX93q/Ip/tXlNyIYp2qM2eHI4BZ/7hpIvg2P37qVnHBUWvs/u1QoymcGYxTf549xqwgRqn20FJiHN8EYksgIW9CPc81+YdbCDyH4LP9sVWr1k72BFtAM5noRQ883lcpycyd27c6Ry3w3E7uC8r1pc8qGvv7F47lGiww7+3Bf2G4xliS5EPZmWCAIHrHoJJhmz1vLkhQJ36EkXOX+SXVksWcBer9scsA0dMcMVkS5mI6JhJ+zdWz8Umh2fk8+GYwIVz+C4Cnh9Yv3jJuc+2Wk56htWSWuua5ag3GR4K6prcOBxQjlrGouWoP2L1Okm5cdYMVIfFUB6qyO+sRnHgC3hANBujbCIyHtYIg4KBx8NP5IFzh+/brHNEzwCLnG71OlsPODzFajs1Zd57+U7PzhvKF3xHhFIL53M9RFZeasEG0lgHG+LgeajNDlra6bvIWhE176XOOWQH7Sx8snh1YtC7HRnOP9h6O4CokPIL0THw/OFUmMActwOYpFp2AM7+Jkn3Fqvv9fdnDrS124GaMe25FuzwHLJjKk7gmQdZ/Qyc4BD0NbBjI5YgmZR4b9wmygKjXzNO04OW3UU+ZHVcAwuIZIbu9IEs5C/dayZU6thwkNU1GTLWJ3U6ss07dq8jctSbyMusf0ijfCGeNBItR31Xq9dHNHZKanuizf8+Agukf7caicdohId4h9VIlVresTYfORKJ8f3HWf0cdwyn2byjzk7+CKsRUV4QcxgQDEoWAleC/rpW7SOaj7AIx+DhWuOWtR1W+8HtyDYQJZ1gNZ1+p806dQdHjTNrgQ2kzEN2kElgA3+ZfBy3I4MN3LtsB86LfmVCOt56x+G4Hdjwbmvbwe+lHJaV1v+4189yQ4CJKk+2EUpJ9GEMDDJHWtuhOdTsKZN5JtGCSY8MjX7wMgUQzedyH5P1LqsLsLHmT9/QV/Qjz8UxNv8rd5TK/mA1sImlQuzkGk61fh8795GdPRk5arFKy1EDkQQRcB40RHX+cEXYQeA7FDJ8zlC0CDgcosMIg4DB4RDlx2gyMuTgAMfCNWcOsfbvihDN7Z+VVtP+Pdmx1YYzpbUcNZxkw3Ywea1Ye28zdmSwYcXadgB7y9diyAb664tZmSAoGRsc+VqOGlp9TTR8vay02o+t84F7E9cqMpQC2c6Z+ZLV7a4OAUVrN40ctVhlyFGPDY6faISHl4nhDJvf2woxdZ8yOGoyjhbYMFQWmQJkRjutZjX+T1WtWjMRYS4njQEZipe5pgqlDi+bHGA1S2PN5fZnnlGRoxarTNVRA2mul0zinleH2jO7FKYO2QG1ZGrEvM5gAwtOU4U9xrlsl8tGZBrU8m+d9GPQ+u/YqRHLemStLHS3shE5arHKlB01sMUMh9yCBTPKEcvO2cEGHLXvEhqbVmluang07QyVVuSoxSo8IER5LkKI8WFx3cdkq8YthBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGE2Dj+B8TzN3vhNFUqAAAAAElFTkSuQmCC>

[image8]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACMklEQVR4Xu2WT0gVURTGjwpmpZR/FkkQIUgkJCTlnzZKRBRBQkG0ikiJJChoY66CdmUEoiFYLYJqUxS0EJGCQKFVRVFIUNBCF7oIKjAiwr6Pc0YP58170sJ44fvBD+d+5868e2funVGkwCpkByyPYb7QBxfgs1hYAY7D7TFcjovwMzwc8pWAN2IohvkEB9gdw1xsg+tjCNbAtpBxjZaELFIHm2BRLIAq+C6GuaiBt+E8POXyWvgEPoK74Bb4AI7Cb6JrNo1G0T7X4SQ8YfmM6J2LNlg9K8/t71f40uUDsFP0Am+t1mK1T/CHZN5JTmLOtS/D365NbsIjIctKs+gAW0Vn89TySvjRjg/CWVhvbfJCtP8ml5FLlid8ge9dm3wQfcxpcIPyCWTAAfAOrosF0cFwjXo4iLshI3tE71jy+G7BYlc/ank24u8swpMGYwgq4K8YivY/FkNjv+iEk0GedzUum1wDzApP2m3HZ11+yGqeMtFNwrvNXdoF14o+3quuH6/Dc6+47LVlCSdhKeyHD+EdV1tksyxtDg7yjavxB+MAuU7u2/EBeAOeEe33PekEdlq2z9rV1n5l7b1wwo7PiV6X52e8mrhGOCi+Ei6EGhe5HzDh64efwynRzZXQKzrRETgOe1wtYVj08XMztrt8I/wpOuFUOkRnGOH3cmsMRftzoGmk7kLHhhiA03Ba9LX1Lz61f80YvCY6Ob9m8wZusMfwnuTxv3t8B8YvU4ECBf5r/gDtJm4WcNUSyQAAAABJRU5ErkJggg==>

[image9]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAZCAYAAAA4/K6pAAABGUlEQVR4Xu2SQStEURTHT4rIZlDYKDVJUmY5WzsbaxsLZRZ8BLFmiQ/AipSUhbK0oSlENjZKs7WUDyDzO533Zs476XWtWPjVr945595/7937RP4iozgbmylc4zt+4VOYJTGP+2IBu8VROq9iASNxkEJVbPNLHKTSEAs4dL0BnHJ1KUdiAStZfYqXeIbb+aIydLOewRg2s14eqoebU8NFV3fQhY/4jAtZryJ2O31ZrehbXbi6gwaoH3gcZp5J7I1NRTdP4zK+Yb04LkcPbs/V67jhnrfwROyTPuWb8ANccrUGrmI/3uI4zuAatrCnu9R4wGFXD+EdXknxxG9wx9U/YlMsVH+u8zBLQq/2XuzfmAuzZCZwMDb/+W3a8w0x1tSx+VcAAAAASUVORK5CYII=>

[image10]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAZCAYAAADqrKTxAAAAyklEQVR4Xu2QLw+BURTGTyAI/kwyJIli0xXBZJmi2HwDmcZUJgkmKgqfQDDVZvM9NOO5u2evu2fe+xbJ/LZfuM9zzt3uFfl9yrDLoY8SfMIzFz46YpdmXPhYil1qcvGJgdhhduIOhWEGRxwqRdjj0GCWWhwqY3jj0PCASQ6VLMxwmINHDqOYy/vXEvAEq3Cn5wvsax+wghUYg2s41dy8sSb2vQXNAupwC/dwCONOZy44OOdIGvAO03BDXSh5eIUL2KbOS0rs8p+v8AJ8QSF7JMXA+QAAAABJRU5ErkJggg==>

[image11]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAAbCAYAAACwRpUzAAAAgElEQVR4XmNgoBvQQBdABv+BWA9dEAaWADELuiB5QBOIjwDxNiDmRZZgBuJbQGwCxL5AHIws6Q7Ec6DsNiB2QpJjsANiLSj7BgMOlxoxQPyIFbQw4JAE2QOSqATijUBsjywZBZV0AOJ9yBIgIATELxgguhRQpSBABojN0QVHPAAA0rcSIejSHd0AAAAASUVORK5CYII=>

[image12]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAaCAYAAABl03YlAAAAp0lEQVR4XmNgGDSAF10AHXAA8SsgNkOXQAbCQPycAaKYfKAKxBrogjDABcTLgHgXEB8F4u2o0hCwDYgjoOxoIP6PJAcHi5HYbQw4FMEAJxB/B+IX6BLIwIkBYspadAlkUM8AUVSELoEMdjNAFJmiS8CALQNEwWp0CWRQxwBRlIMuIQTEKlA2zCpthDQEgLwLkrCB0mtQpSEAJAGKhicMkCjhQZUe7gAATKse5mpzGjYAAAAASUVORK5CYII=>