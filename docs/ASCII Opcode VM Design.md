# **Semantic Convergence in Minimalist Computing: A Technical Analysis of ASCII-Direct Instruction Set Architectures**

The history of computational design is characterized by a persistent tension between the abstract symbolic logic required by human programmers and the concrete electronic state transitions executed by hardware. Traditionally, this gap is bridged by multiple layers of translation, including high-level languages, assembly mnemonics, and binary machine code. However, a radical architectural departure has emerged in the domain of minimalist virtual machines and "fantasy consoles" that seeks to collapse these layers entirely. This paradigm, known as the ASCII-Direct Instruction Set Architecture (ISA), posits a literal identity between the character a developer types and the opcode the machine executes. In this system, the ASCII character 'A' (hexadecimal ![][image1]) is not merely a label for addition; it is the functional byte that triggers the arithmetic logic unit. This report provides an exhaustive analysis of the ASCII-Direct principle, its historical lineage, its technical implementation within 32-bit pixel-based memory systems, and its profound implications for security, debugging, and the aesthetics of code.

## **The Principle of Literal Identity**

At the foundation of the ASCII-Direct architecture lies the rejection of the traditional lookup table. In conventional architectures, such as the x86 or ARM sets, opcodes are assigned based on hardware efficiency, bit-field alignment, or historical legacy, with little regard for the human-readable character mapping of those bytes.1 A developer writing in assembly utilizes mnemonics (e.g., MOV, ADD) which an assembler then translates into arbitrary numeric values (e.g., ![][image2] or ![][image3]). The ASCII-Direct model eliminates this indirection. When a programmer presses the 'A' key, the value ![][image1] is stamped directly into memory. When the Virtual Machine (VM) fetches that byte, it interprets ![][image1] as the command to perform an addition.3

This identity transforms the nature of the development environment. The editor ceases to be a text processor and becomes a literal memory manipulator. Programs are no longer "compiled" in the traditional sense; they are visual and numeric artifacts where the character, the hexadecimal value, and the machine operation are one and the same. This approach derives from a philosophy of "tactile computing," where the proximity between the user's intent and the machine's state is minimized to the absolute physical limit of the character set.4

## **The 32-Bit Pixel Program Specification**

In modern implementations of the ASCII-Direct system, particularly those designed for graphical fantasy consoles, the basic unit of storage is often a 32-bit word, colloquially referred to as a "pixel".5 This nomenclature reflects the dual nature of the memory space: a sequence of instructions is simultaneously a linear array of color values.

### **The Anatomy of the Instruction Word**

Because a standard ASCII character occupies only 8 bits, a 32-bit instruction word possesses 24 bits of unused space, frequently termed "dark matter".5 The ASCII-Direct architecture utilizes this space to encode arguments, registers, and immediate values without requiring additional memory fetches for every instruction. The distribution of these bits is critical for maintaining high instruction density while preserving the human-readability of the opcode.

| Byte Position | Bits | Component | Role |
| :---- | :---- | :---- | :---- |
| Byte 0 (LSB) | 0–7 | Opcode | The ASCII character (e.g., 0x41 for 'A') |
| Byte 1 | 8–15 | Argument X | Target register or primary operand |
| Byte 2 | 16–23 | Argument Y | Source register or secondary operand |
| Byte 3 (MSB) | 24–31 | Argument Z | Additional flags, tertiary operand, or high-byte for literals |

Table 1: Standard 32-bit word layout for the ASCII-Direct VM. Note that depending on endianness, the opcode may reside in the most significant byte to facilitate visual inspection of the blue or alpha channels.5

This layout ensures that the "visual" identifier of the instruction remains constant. If a program memory dump is viewed through a standard text decoder, the opcodes appear as a string of recognizable characters, while the arguments appear as non-printable or "glitched" characters following them.6 This semi-readability is a core feature of the architecture, allowing for "disassembler-free" debugging.7

### **Instruction Formats and Addressing Modes**

To accommodate a wide range of operations, the VM supports several instruction formats derived from the 32-bit word structure. These formats are designed to be decoded rapidly in software, a necessity for virtual machines where performance overhead must be minimized.5

1. **Register-Register (R3):** Utilizes the opcode and three 8-bit register identifiers. This format is standard for ALU operations like ADD ('A') and SUB ('U').5  
2. **Register-Immediate (R2U8):** Utilizes two registers and one 8-bit unsigned literal value. This is used for operations like SHL ('K') or SHR ('k') where the shift amount is a constant.8  
3. **Long Immediate (R1U16):** Combines the Y and Z fields into a single 16-bit value, allowing for larger constants to be loaded into a register without secondary fetches.5  
4. **Absolute Addressing (R0I24):** Combines all three argument fields into a 24-bit address or offset, primarily used for unconditional jumps (JMP, 'J') or function calls (CALL, 'C').5

The effective address (![][image4]) for memory operations often employs a displacement mode, where ![][image5].10 In the ASCII-Direct VM, the base register is typically encoded in the X field, while the displacement is retrieved from the combined YZ fields.

## **Primary Operations: The Uppercase Tier**

The uppercase range of the ASCII table (![][image1]–![][image6]) is reserved for the primary instruction set. These are the "Capital Operations," chosen for their frequency and foundational importance to program logic \[User Query\].

### **Arithmetic and Logical Core**

The arithmetic core utilizes intuitive mnemonics that map directly to their ASCII values. This tier emphasizes unsigned integer math, which is standard for the 8-bit and 16-bit logic systems common in fantasy hardware.11

| Key | Hex | Opcode | Description |
| :---- | :---- | :---- | :---- |
| A | 0x41 | ADD | Adds source to destination register. |
| D | 0x44 | DIV | Performs unsigned integer division. |
| M | 0x4D | MOV | Transfers data between registers. |
| O | 0x4F | OR | Performs bitwise inclusive OR. |
| U | 0x55 | SUB | Performs subtraction. |
| X | 0x58 | XOR | Performs bitwise exclusive OR. |

Table 2: Primary arithmetic and logical operations in the Uppercase tier.2

The selection of 'A' for ADD and 'U' for SUB (Subtract) avoids the conflict of using 'S', which is reserved for STORE. This mnemonic mapping requires a careful balance between phonetic intuition and character availability \[User Query\].

### **Control Flow and Subroutines**

Control flow in the ASCII-Direct VM is designed to support both linear procedural code and modern, event-driven structures.

* **BRANCH (B, 0x42):** A conditional branch that evaluates a register (usually a flag register set by a previous operation) and jumps to a relative offset or absolute address if the condition is met.1  
* **CALL (C, 0x43):** Pushes the current Instruction Pointer (IP) onto the stack and jumps to a subroutine. This is the cornerstone of modular programming in the VM.2  
* **RET (R, 0x52):** The inverse of CALL, popping the stack to return to the previous execution context.2  
* **JMP (J, 0x4A):** An unconditional jump used for loops and long-distance code redirection.2

A unique feature of this tier is the **SPAWN (Q, 0x51)** and **SPAWN+ (Z, 0x5A)** instructions. Drawing inspiration from concurrent languages and actor-based models, SPAWN allows the VM to fork a child process at a specified address \[User Query\]. SPAWN+ (Spatial Spawn) takes this further by associating the child process with a specific ![][image7] coordinate on the screen, facilitating the creation of autonomous graphical entities or "sprites" that carry their own logic.16

### **Graphical Primitives and Visualization**

As a "pixel-first" architecture, the ASCII-Direct VM includes hardware-accelerated drawing commands directly in the primary opcode tier. This allows for high-performance graphics without the overhead of external library calls.

| Key | Hex | Name | Function |
| :---- | :---- | :---- | :---- |
| F | 0x46 | RECTF | Draws a filled rectangle at (x, y) with dimensions (w, h). |
| G | 0x47 | CIRCLEF | Draws a filled circle centered at (cx, cy) with radius r. |
| P | 0x50 | PSET | Sets a single pixel to a specific color. |
| T | 0x54 | TEXT | Renders a character string starting at a memory address. |
| V | 0x56 | LINE | Draws a line between two sets of coordinates. |
| W | 0x57 | BLIT | Performs a fast memory-to-memory copy (Block Image Transfer). |

Table 3: Graphical instructions mapped to the Uppercase tier.12

The BLIT instruction ('W', ![][image8]) is particularly vital for game development, enabling the rapid movement of sprite data or the implementation of double-buffering systems.12 By placing these commands in the primary tier, the architecture acknowledges that in a fantasy console, drawing is as fundamental an operation as addition.18

## **Secondary Operations: The Lowercase Tier**

The lowercase tier (![][image9]–![][image10]) contains secondary operations that provide granular control and bit-level utility. These are accessed via Shift+Key in the editor, reinforcing their status as "modifier" or "utility" instructions \[User Query\].

### **Detailed Bit Logic and Multiplication**

While the uppercase tier handles general-purpose math, the lowercase tier provides the more computationally expensive or specialized bitwise logic.

* **AND (a, 0x61):** The bitwise AND operator, complementing the OR and XOR of the uppercase tier.8  
* **MOD (b, 0x62):** Provides the remainder of a division, essential for wrapping coordinates or timing loops.7  
* **MUL (m, 0x6D):** Integer multiplication. In many minimalist VMs, multiplication is relegated to a secondary tier due to its increased cycle cost in hardware-simulated environments.9  
* **NOT (n, 0x6E):** A unary operator that inverts every bit in the destination register.9

### **Stack and Byte-Level Memory Access**

The lowercase tier also provides the interface for the system stack and fine-grained memory manipulation.

| Key | Hex | Name | Purpose |
| :---- | :---- | :---- | :---- |
| p | 0x70 | PUSH | Places a register value onto the stack. |
| r | 0x72 | POP | Removes the top value from the stack into a register. |
| d | 0x64 | LDB | Loads a single byte (8 bits) from memory. |
| s | 0x73 | STB | Stores a single byte (8 bits) to memory. |

Table 4: Stack and byte-level memory operations.13

The inclusion of LDB (Load Byte) and STB (Store Byte) is critical for handling string data and compressed assets, where 32-bit alignment would be wasteful.12 These instructions allow the programmer to "reach inside" the pixel-word and manipulate individual color channels or characters.

## **The LDI Protocol and Code-Data Interleaving**

A significant challenge in any direct-mapping architecture is the representation of immediate data. If every byte is an opcode, how does the machine distinguish between the command LDI (Load Immediate) and the value it is supposed to load? The ASCII-Direct VM solves this through a state-aware fetch cycle \[User Query\].

### **The Data Pixel Mechanism**

The LDI instruction ('I', ![][image11]) signals the VM that the very next 32-bit word in the instruction stream is a **Data Pixel**, not an opcode. The VM retrieves this word as a raw numeric value and places it into the target register, then increments the Instruction Pointer to skip past it \[User Query\].

Example Program: "Load the value 42 into Register 0, then Halt"  
Address 0: 0x49 (I) | Opcode for LDI, ArgX=0 (R0)  
Address 1: 0x2A (\*) | The Data Pixel (42 decimal)  
Address 2: 0x48 (H) | Opcode for HALT

In the editor, this sequence is highly intuitive. The programmer types 'I', then selects the next pixel and adjusts its color until the desired value is reached. In a hex dump, this appears as 49 00 00 00 2A 00 00 00 48 00 00 00\. The letters 'I' and 'H' are immediately visible, framing the raw data in the middle \[User Query\]. This interleaving of code and data is a modern evolution of the "Von Neumann" architecture, where memory is a unified field of executable and non-executable states.9

## **Historical Lineage: From Mainframes to Monitors**

The concept of single-character opcodes is not an invention of the fantasy console era but is rooted in the foundational machines of the mid-20th century. The most prominent ancestor of the ASCII-Direct VM is the **IBM 1401**, released in 1959\.21

### **The IBM 1401 and the Character Opcode**

The IBM 1401 was a decimal-based, variable-wordlength computer that used single characters for its entire instruction set. Its designers chose this approach to maximize the limited memory (often only 4,000 characters) and to provide a direct interface for operators working with punched cards.21

| 1401 Opcode | Meaning | Modern Equivalent |
| :---- | :---- | :---- |
| A | Add | ADD (0x41) |
| B | Branch | BRANCH (0x42) |
| C | Compare | CMP (None) |
| M | Move | MOV (0x4D) |
| S | Subtract | SUB (0x55) |
| , | Set Word Mark | (None) |

Table 5: Comparison of historical IBM 1401 opcodes and the modern ASCII-Direct VM.21

In the 1401, the character was the opcode. There was no assembly mnemonic like "ADD"; the programmer simply wrote 'A' on the coding sheet.22 This allowed for a level of transparency where the program's physical appearance on a card or printout was a direct representation of its logic. The modern ASCII-Direct VM revives this tradition, applying it to the 32-bit color space.23

### **The Monitor Era and Single-Key Interaction**

During the early microcomputer revolution, systems like the Apple I (Woz Monitor) and the KIM-1 established a user interface based on single-letter commands for debugging and memory manipulation.24 Commands like 'G' (Go/Execute), 'M' (Modify memory), and 'L' (List/Disassemble) allowed users to communicate with the machine at a level that felt physical.25

The ASCII-Direct ISA takes this "monitor style" interaction and elevates it to the core processor logic. It assumes that if a single letter is sufficient to tell a monitor to "Go," it should be sufficient to tell a CPU to "Jump" \[User Query\]. This philosophical continuity links the era of vacuum tubes and punched cards to the contemporary interest in minimalist, self-contained virtual environments.

## **Aesthetic and Esoteric Computing: Befunge and Piet**

The ASCII-Direct architecture sits at the intersection of functional programming and "esoteric" languages (esolangs). By prioritizing the visual and character-based nature of code, it shares DNA with languages designed to challenge conventional linear logic.

### **Grid-Based Logic and Befunge**

Befunge-93, created by Chris Pressey, is perhaps the closest relative to the ASCII-Direct philosophy. In Befunge, the program is a 2D grid of ASCII characters where the instruction pointer can move in any cardinal direction (left, right, up, down).4 Commands are single characters: \> to move right, \+ for addition, and : to duplicate the stack.7

The ASCII-Direct VM adopts the single-character command set of Befunge but applies it to the standard linear execution model of a CPU. This results in a "Befunge-like" experience for the developer, where the code is a field of symbols, but with the added power of a 32-bit argument space and graphical primitives.4 This makes the code not just a script, but a spatial arrangement of operations—a "code-map".4

### **Piet and the Visual Identity of Code**

The language Piet, named after painter Piet Mondrian, represents programs as abstract geometric images where transitions in hue and brightness determine the instruction to be executed.27 In Piet, code is art; there is no text at all.

The ASCII-Direct VM achieves a similar "Artistic Computation" through its pixel-program model. Because instructions are 32-bit colors, a well-written program possesses a distinct visual signature. A block of ADD instructions might appear as a series of blue-tinted pixels, while a sequence of RECTF commands creates a different color pattern \[User Query\]. This leads to the "Glitch Art" effect, where program execution and data corruption become visually meaningful.6

## **The Glitch Art Paradigm: Visualizing Memory Corruption**

One of the most profound benefits of the ASCII-Direct mapping is the transformation of the debugging process. In traditional architectures, a memory corruption event—such as a pointer jumping into a data block—results in "random noise" that is difficult for a human to interpret without a disassembler.6

### **Recognizable Corruption**

In the ASCII-Direct VM, data and code are both composed of ASCII characters. If the instruction pointer deviates into a text string or a block of metadata, the "Glitch" is not random; it is legible. A developer looking at a hex dump of a corrupted process might see:

0x0000: 41 00 00 00 42 00 00 00 50 53 45 54 48 45 4c 4c  
         A . . .   B . . .   P  S  E  T  H  E  L  L

The appearance of the characters "PSET" followed by "HELL" (part of the string "HELLO") in the instruction stream immediately alerts the developer that the CPU is executing the character data of a string.6 This semi-legibility allows for rapid pattern recognition in debugging, as the human brain is better at spotting misplaced letters than misplaced hex digits. It effectively turns every memory dump into a semi-disassembled view of the system state.7

## **Security Analysis: ASCII Smuggling and Injection**

The very transparency that makes the ASCII-Direct VM easy to debug also introduces unique security considerations. The core of these risks lies in the "Command-Data Ambiguity" inherent in the architecture.29

### **The Risk of ASCII Smuggling**

ASCII Smuggling is a technique where special Unicode characters that visually mirror ASCII but have different underlying numeric values are used to deceive a user or an automated system.30 While the ASCII-Direct VM uses raw byte values, the threat remains that a user might provide input (e.g., in a "Save Game" name) that contains valid opcodes.

If a developer allows user-input strings to be stored in a memory region that is later marked as executable, they have created a trivial "Instruction Injection" vulnerability.29 In a standard system, an attacker must inject binary shellcode; in this VM, the attacker simply provides a text string that *is* the code.33

Malicious Input Name: "AAAAAAAAAAAAAAAJUMP"  
Result: The VM executes a string of ADDs followed by a JMP to the attacker's payload.

### **Mitigation Strategies**

To secure an ASCII-Direct system, developers must adhere to the principles of "Secure by Design" 29:

1. **Strict Memory Segmentation:** Executable code must be kept in a "Read-Only" or "Code-Only" segment, clearly separated from user data and heap allocations.10  
2. **Opcode Range Validation:** The VM fetch loop should include a "Sanity Check" that validates the opcode byte. If the byte falls outside the allowed uppercase and lowercase ranges (and is not an LDI data pixel), it should be treated as a NOP (No-Op).32  
3. **Instruction Parameterization:** Commands that interact with external systems, such as the ISSUE instruction ('f', ![][image12]), must use built-in library functions that separate the command from its arguments, rather than concatenating raw strings for execution.29

## **ISA Migration and Backward Compatibility**

The introduction of the ASCII-Direct ISA into an existing ecosystem requires a strategy for handling legacy programs compiled with traditional numeric opcodes. This is a common challenge in ISA evolution, seen in the migration from MIPS to RISC-V or the expansion of the x86 set.35

### **Option A: The Hybrid Decoder**

The recommendation for transition is the **Option A: Dual Opcode Table** \[User Query\]. In this model, the VM's fetch loop recognizes both the old numeric opcodes (e.g., ![][image3] for ADD) and the new ASCII opcodes (![][image1] for ADD). This is implemented via a simple range check:

$$f(opcode) \=

\\begin{cases}

NativeOp(n) & \\text{if } n \< 0x20 \\

ASCIIMap(n) & \\text{if } 0x41 \\le n \\le 0x7A \\

Error & \\text{otherwise}

\\end{cases}$$

This approach is backward compatible, allowing older .gasm files to run without modification.37 It provides a bridge for the ecosystem to update its tools while ensuring that the "Literal Memory-Stamp" functionality is immediately available for new development.

### **Option B: The Clean Cutover**

Option B involves redefining the opcode table entirely and discarding legacy support. While this results in a cleaner architecture with no "shadow opcodes," it requires all existing software to be reassembled.35 In the context of a developing platform, the "ISA Aging" problem suggests that over-conservatism in backward compatibility can lead to long-term bloat and inefficiency.38 However, for a transitionary period, Option A remains the most pragmatic choice to prevent community fragmentation \[User Query\].

## **Expansion Opportunities: The Unassigned Utility Tier**

The lowercase tier contains several unassigned characters that provide room for future expansion. Based on the needs of modern graphical VMs and feedback from the fantasy console community, the following opcodes are suggested for the "Utility" tier \[User Query\]:

| Key | Hex | Proposed Opcode | Description |
| :---- | :---- | :---- | :---- |
| c | 0x63 | COMPARE | Sets system flags (Zero, Negative, Carry) for the next BRANCH. |
| l | 0x6C | LOG | Prints a register's value to the developer console for debugging. |
| v | 0x76 | V-SYNC | Yields execution specifically until the next vertical blanking interval. |
| z | 0x7A | ZERO | A fast-path instruction to clear a register or a block of memory. |

Table 6: Suggested expansions for the lowercase utility tier.13

The COMPARE instruction ('c') is particularly important for structured logic, as it separates the "test" from the "jump," mirroring the behavior of the x86 CMP and Jcc sequences.2 V-SYNC ('v') provides the granular timing control necessary for smooth animations and flicker-free rendering in a graphical environment.12

## **Conclusion: The Aesthetic of Direct Execution**

The ASCII-Direct Instruction Set Architecture represents a bold synthesis of technical efficiency and aesthetic clarity. By embracing the literal identity of the character and the opcode, it removes the "veil of indirection" that has defined computing for decades. It transforms the act of programming from a process of symbolic translation into a tactile exercise in memory-stamping, where the code is a visual, readable, and functional artifact.

Through its 32-bit pixel-word structure, the architecture provides a robust framework for arithmetic, control flow, and high-performance graphics, all while maintaining a human-readable core. Its lineage—connecting the mainframes of the 1960s to the esoteric languages of the 1990s—highlights a persistent desire for machines that are immediate, transparent, and playful. As we look toward the future of minimalist computing, the ASCII-Direct model offers a compelling vision of a machine that is as simple to read as it is to execute, where every keypress is a literal and indelible change in the state of the world.

#### **Works cited**

1. Instruction set architecture \- Wikipedia, accessed April 9, 2026, [https://en.wikipedia.org/wiki/Instruction\_set\_architecture](https://en.wikipedia.org/wiki/Instruction_set_architecture)  
2. List of x86 instructions \- Wikipedia, accessed April 9, 2026, [https://en.wikipedia.org/wiki/List\_of\_x86\_instructions](https://en.wikipedia.org/wiki/List_of_x86_instructions)  
3. What are "opcodes" and what do they do? : r/emulation \- Reddit, accessed April 9, 2026, [https://www.reddit.com/r/emulation/comments/3ntzwv/what\_are\_opcodes\_and\_what\_do\_they\_do/](https://www.reddit.com/r/emulation/comments/3ntzwv/what_are_opcodes_and_what_do_they_do/)  
4. Befunge-93 — The Language Where Code Runs on a Grid Instead of a Line, accessed April 9, 2026, [https://dev.to/viz-x/befunge-93-the-language-where-code-runs-on-a-grid-instead-of-a-line-3ej8](https://dev.to/viz-x/befunge-93-the-language-where-code-runs-on-a-grid-instead-of-a-line-3ej8)  
5. VM Instruction Formats, accessed April 9, 2026, [https://www.cs.tufts.edu/comp/150VM/modules/01Bformats.html](https://www.cs.tufts.edu/comp/150VM/modules/01Bformats.html)  
6. 540 Logic Error Stock Vectors and Vector Art \- Shutterstock, accessed April 9, 2026, [https://www.shutterstock.com/search/logic-error?image\_type=vector](https://www.shutterstock.com/search/logic-error?image_type=vector)  
7. Esoteric Programming \- UCLA Math Circle, accessed April 9, 2026, [https://circles.math.ucla.edu/circles/lib/data/Handout-4608-4631.pdf](https://circles.math.ucla.edu/circles/lib/data/Handout-4608-4631.pdf)  
8. x86 and amd64 instruction reference, accessed April 9, 2026, [https://www.felixcloutier.com/x86/](https://www.felixcloutier.com/x86/)  
9. A virtual stack machine \- Late Night Snack, accessed April 9, 2026, [https://www.latenightsnack.io/2018-02-17-a-virtual-stack-machine.html](https://www.latenightsnack.io/2018-02-17-a-virtual-stack-machine.html)  
10. Lecture 03 Instruction Set Principles, accessed April 9, 2026, [https://passlab.github.io/CSCE513/notes/lecture03\_ISA\_Principles.pdf](https://passlab.github.io/CSCE513/notes/lecture03_ISA_Principles.pdf)  
11. TIC-80 \- Wikipedia, accessed April 9, 2026, [https://en.wikipedia.org/wiki/TIC-80](https://en.wikipedia.org/wiki/TIC-80)  
12. TIC-80 \- SizeCoding, accessed April 9, 2026, [http://www.sizecoding.org/wiki/TIC-80](http://www.sizecoding.org/wiki/TIC-80)  
13. 8bit virtual machine \- Code Golf Stack Exchange, accessed April 9, 2026, [https://codegolf.stackexchange.com/questions/171095/8bit-virtual-machine](https://codegolf.stackexchange.com/questions/171095/8bit-virtual-machine)  
14. Compiler/virtual machine interpreter \- Rosetta Code, accessed April 9, 2026, [https://rosettacode.org/wiki/Compiler/virtual\_machine\_interpreter](https://rosettacode.org/wiki/Compiler/virtual_machine_interpreter)  
15. Computer System Architecture Part 2 — Instruction Set Principles | by Abde Manaaf Ghadiali, accessed April 9, 2026, [https://medium.com/@abdemanaaf.ghadiali.1998/computer-system-architecture-part-2-instruction-set-principles-7e6ec17997af](https://medium.com/@abdemanaaf.ghadiali.1998/computer-system-architecture-part-2-instruction-set-principles-7e6ec17997af)  
16. Adding WebAssembly runtime support via BINARY chunks · Issue \#1259 · nesbox/TIC-80, accessed April 9, 2026, [https://github.com/nesbox/TIC-80/issues/1259](https://github.com/nesbox/TIC-80/issues/1259)  
17. Learn / TIC-80, accessed April 9, 2026, [https://tic80.com/learn](https://tic80.com/learn)  
18. Fantasy Console Wars: A Guide to The Biggest Players in Retrogaming's Newest Trend, accessed April 9, 2026, [https://medium.com/@G05P3L/fantasy-console-wars-a-guide-to-the-biggest-players-in-retrogamings-newest-trend-56bbe948474d](https://medium.com/@G05P3L/fantasy-console-wars-a-guide-to-the-biggest-players-in-retrogamings-newest-trend-56bbe948474d)  
19. Use some kind of retro fantasy CPU instead? · Issue \#1007 · nesbox/TIC-80 \- GitHub, accessed April 9, 2026, [https://github.com/nesbox/TIC-80/issues/1007](https://github.com/nesbox/TIC-80/issues/1007)  
20. Instruction Set Architecture Computers and Programs Machine Code \- UTK-EECS, accessed April 9, 2026, [https://web.eecs.utk.edu/\~mbeck/classes/cs160/lectures/10\_isa.pdf](https://web.eecs.utk.edu/~mbeck/classes/cs160/lectures/10_isa.pdf)  
21. IBM 1401 \- Wikipedia, accessed April 9, 2026, [https://en.wikipedia.org/wiki/IBM\_1401](https://en.wikipedia.org/wiki/IBM_1401)  
22. Meaningful 1 Character Op-Codes \- ibm-1401.info, accessed April 9, 2026, [https://ibm-1401.info/Op-Codes.html](https://ibm-1401.info/Op-Codes.html)  
23. Qui-binary arithmetic: how a 1960s IBM mainframe does math \- Ken Shirriff's blog, accessed April 9, 2026, [http://www.righto.com/2015/10/qui-binary-arithmetic-how-1960s-ibm.html](http://www.righto.com/2015/10/qui-binary-arithmetic-how-1960s-ibm.html)  
24. wutka/froot-1: A terminal-based Apple-1 emulator · GitHub \- GitHub, accessed April 9, 2026, [https://github.com/wutka/froot-1](https://github.com/wutka/froot-1)  
25. alex-code1234/emu8: 8-bit retro computers emulator, tested 6502, 8080, z80 and 8086 ... \- GitHub, accessed April 9, 2026, [https://github.com/alex-code1234/emu8](https://github.com/alex-code1234/emu8)  
26. 00 What is Befunge? – GC Wizard, accessed April 9, 2026, [https://blog.gcwizard.net/manual/en/befunge/00-what-is-befunge/](https://blog.gcwizard.net/manual/en/befunge/00-what-is-befunge/)  
27. Piet — The Language Where Programs Look Like Modern Art \- DEV Community, accessed April 9, 2026, [https://dev.to/viz-x/piet-the-language-where-programs-look-like-modern-art-4me1](https://dev.to/viz-x/piet-the-language-where-programs-look-like-modern-art-4me1)  
28. Exploring the Piet Programming Language | PDF \- Scribd, accessed April 9, 2026, [https://www.scribd.com/document/761798374/PIET-Programming-Language-Case-Study-Report](https://www.scribd.com/document/761798374/PIET-Programming-Language-Case-Study-Report)  
29. Secure by Design Alert: Eliminating OS Command Injection Vulnerabilities \- IC3, accessed April 9, 2026, [https://www.ic3.gov/CSA/2024/240710.pdf](https://www.ic3.gov/CSA/2024/240710.pdf)  
30. ASCII Smuggling Injection Attack: Understanding the Risks \- Giskard, accessed April 9, 2026, [https://www.giskard.ai/glossary/ascii-smuggling-injection-attack](https://www.giskard.ai/glossary/ascii-smuggling-injection-attack)  
31. Microsoft Patches ASCII Smuggling Vulnerability in Recent Security Update \- Bitdefender, accessed April 9, 2026, [https://www.bitdefender.com/en-us/blog/hotforsecurity/microsoft-patches-ascii-smuggling-vulnerability-in-recent-security-update](https://www.bitdefender.com/en-us/blog/hotforsecurity/microsoft-patches-ascii-smuggling-vulnerability-in-recent-security-update)  
32. badkeys vulnerable to ASCII control character injection on console via malformed input · CVE-2026-21439 \- GitHub, accessed April 9, 2026, [https://github.com/advisories/GHSA-wjpc-4f29-83h3](https://github.com/advisories/GHSA-wjpc-4f29-83h3)  
33. 0x2a0 Writing Shellcode, accessed April 9, 2026, [https://bista.sites.dmi.unipg.it/didattica/sicurezza-pg/buffer-overrun/hacking-book/0x2a0-writing\_shellcode.html](https://bista.sites.dmi.unipg.it/didattica/sicurezza-pg/buffer-overrun/hacking-book/0x2a0-writing_shellcode.html)  
34. A Bytecode Virtual Machine, accessed April 9, 2026, [https://thesis.unipd.it/retrieve/7c106510-9c39-40ab-a589-1255f56af7a5/Battisti\_Filippo.pdf](https://thesis.unipd.it/retrieve/7c106510-9c39-40ab-a589-1255f56af7a5/Battisti_Filippo.pdf)  
35. Instruction Set Migration at Warehouse Scale \- arXiv, accessed April 9, 2026, [https://arxiv.org/html/2510.14928v1](https://arxiv.org/html/2510.14928v1)  
36. Migrating the CPU IP Development from MIPS to RISC-V Instruction Set Architecture, accessed April 9, 2026, [https://mips.com/blog/migrating-the-cpu-ip-development-from-mips-to-risc-v-instruction-set-architecture/](https://mips.com/blog/migrating-the-cpu-ip-development-from-mips-to-risc-v-instruction-set-architecture/)  
37. FMV.X.D and FSD on single-precision values · Issue \#30 · riscv/riscv-isa-manual \- GitHub, accessed April 9, 2026, [https://github.com/riscv/riscv-isa-manual/issues/30](https://github.com/riscv/riscv-isa-manual/issues/30)  
38. (PDF) ISA Aging: An X86 case study \- ResearchGate, accessed April 9, 2026, [https://www.researchgate.net/publication/260112900\_ISA\_Aging\_An\_X86\_case\_study](https://www.researchgate.net/publication/260112900_ISA_Aging_An_X86_case_study)

[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAAB/UlEQVR4Xu2VvUscQRjG3/hZiPhRqAgKIRYipEhiIZjIIaKdNoFACi9qFNKEQGKnIv4DNjFFYucXiLVooYWFhY1RUJRAsDFFBAuFFAbR58nM5GZf9tbztLv9wY/bed7d2/dudmZFYnKMx/AdHNKFe2AVPtShR7dE12UensLPcBFOwAeBM7InH17Bp7pgKYeXMKkLPj9hnTe+gJ+88V0YFtPgM5Vv2PyH/Uzb4As4pjJOyR9YpvLb8ggeiWngSbAUILLBA9ipsnExF02rnNPVorImNXbwhjP2OOsGecO/sFXlblo4DY4OuAen4BKsgctwAX71ziO18BBW2nHYFPukbbBUTPG5yj/afMuOucJ2YaMds8ZF9QHW23GxrZEV2OONs26wQsIbfG/zbTueg+2p8r/ab1gA++GaVyNuah2ZNPhGh45fsE1lXMG8iFtOGKz16VDM1rSuQ8msQf7QUHZgl8pGxFz0ReUO1hp0CKrE1KJM/j87RWSD3+BrlU1K8Mv4rPJZI9Xw2B473PQXwkSI/K4Be8zFpXH1UBJithUfrs4zWGLHJ/AcFsFBMSvX55Uaa9jATdvMWx36cJvYFHMjLhBuJWzG8R3OinkcXsJ9Ma9HfvpbkQ//VT29/qzwR+qaMxSu6F44qgti9stmCb7Q+Y9wceV5WUxMTExMLnENfbd8tWPwLQwAAAAASUVORK5CYII=>

[image2]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAAClklEQVR4Xu2WS6hNYRTHl3eRxMBjQCnlppDHQHl0kyiPgVLKgEtRJsirvC9mKCmPQiZet4uBS0oeA8VAeZZnLuWGUIgyYMD/b61vn/Wtc5RrJvtfv+5Z/7X23d/Z+1vrOyKl/jMNB0vBkpj4Sw0ADWA56JinMvUHm8CMmPA6AT6AvaAZbAMdsor2aT14AvaALeAZGJFV6P9fCz6BRtAKroPurqbQczDQxd/Aahe3V0dBVxefAi9AF+dx4T/AMIsHgY/gSFFhmgg2B+8i+Ap6Bf9P1BnMCh6/PBcz0+LxFt8tKlR8k/QzPQZTg9coWng4+J3AuOClJ5DE/cZrt0rlifHzG6m8Pj4A1pyzOGmd+YV4w++i38hrjWjhNedNAQ/APnBadHNfACfBQVdH8VpyW/TL823Mdvmzlj/vPGqD+YV6mjHBm9Aq829aPBjcB3UWM8emWiG6dxh3sxx1zLzEXJejdpl/OfgHzC/U24y4wGXm37H4OJhcSf/KvRPdb4vAFZej+NrfG6x9K/n1o81/KZVpwaZit2cLpF6DScFjB7OQI6eWmFsYTRPnHxftxYXwmjPB55O9JTpeuK24V6sWeA9MC95G0cL9wU9ibkg0TTuleoZyGjwFr4IfxftVLfAQmBe83aKFCyzmXuVeo/pJ9Y3862MD1BIXzledxFHEJ+1PGTYVZ3CmetGx4sXu/Ax6WMy99EV0nywW7Vwv3wQ7QF8XJ3F4t9jnPqIPgNSbx5OGcZPFmTgmbojeiA3CUeJPAg5Udia3wxzwUHSo8q8fRUns+EuiZyxpA9OzCj2j2YTbwSNwFQzNKoLY0fNF/2EU5+VY0XGTNEq0uWr9EGD9SNEfCyvl9ycST5gGMCb4pUqVKlXqX9BPsDaSn0Y2U44AAAAASUVORK5CYII=>

[image3]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACk0lEQVR4Xu2VWaiOURSGX0MoZChDiVIupIgylVlC3IlIIg7ighSKDEm4MmXOkAtj4oKiTDfIkXNxzEm4ERdIhqK44H3P2vt869vf7+S4k++tp/9f797//tbfXmt9QKn/TH3JYrIwXfhLdSZTyfJ0IWg46ZF4g8i8xKvTSfKB7CFnyEbSJLejcVpCfpKzZBc5T9rndgDbYXvukJvkU4jlF/SSdHfxd7LCxY3VDzLOxc/JBRdLO2EJRfTMqtyOoBFkfeJdJl9Ju8T/E+k3VxNvDSyJic5TgsdgV6ocWru1nJ6S8Ym3AXbg4cRvRoYmXp8kPkg2Jd5Y2HkvnLeNbHFxRemBuo5hib8SduAN5+nKHpO9sNrqSi6RU7Ckoq6Q1S6WhiC7ylbBU4KbyWTYjR1AsWnQFvYjdZSXOk/+3RD3JA9I7xBrTU21DHao4pZhrRrFBNWdMcHYLFvJe/KQTCO3yUcyMKzXqQMqJ7g0+LUhPgG7piitvSXNYTV03a3VoJhgf2QJdgreKnIRWe11JN/IqxDX6w0ZmXjqYB2mkVNJWpubmkEaWWoKr8HI/lRDOg3bl9N9MiHx1sI27kv8KK31Ss2g3bDa8hoF+82jEPcj92Cd7HUEFRI8RGYm3g7YxjkhVq3GAu5CXofvUf76Z5P9LpamwM6LU0HdG6/cD/BzwctpNGyseKk7PyOrj3fkC2lBFsA612u6+94G+ZqUVJN68JgQq27VZLPqd9ibS2OokKCkMaEu0oPUIBolSiZK13EcVg56vz6B1Zo+/SiKWkSewbp8BrlGuuV2WLJ6g92Cna/EjqKBga2O1vWsSxdg81Ltr3ETNQDWXE2d56U/OAl23u/e65oCeknMh71NSpUqVarUv6Rf7JyS6TZSTKgAAAAASUVORK5CYII=>

[image4]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAaCAYAAACgoey0AAABe0lEQVR4Xu2UsStGURjGHxQS/wBJiTIYDEwoiUVKxCIWm5hFSiaJJGVQbFK+jMQgZTOwULL4A1iUZOZ5nXOcc9973M9gUfdXv/ru+7znnPudc7pAzt/TTA91UTNKz3/puh1TjAv6Qat1ENJAB2iBvtJ+2kN76Ridp5cwEx19jSiO9IpNOoixTU900VJG7+maDiJUwS/cqbIod3RBFwN26YwuRliBX3hIZSnGYRorVf0s+L1E64PnGNI/Ta9h5ltMxml2YBpD+uibqmUxSK9oCT2FmW8z0RHhAabR3d5b+3wcNmVQQR9ph33ehxl/8N0RoQ7+TOQmT8Cc9TudC/qykH7ZNccW/B/5kT3E3052QW6zIGe17KMEMs69uPYp6EshWyRNszqw1NBnWqsDyw0tVbVh+MXlzFM0wje0q8yxAfNxiVEO88HRdMPPG33hKZjwBX5bNZLL2cdY1QVLC/zCbWHQGgTFnLRjHO7iOPXXrivInCOJjpycnJx/wydF3WxRd1cN7QAAAABJRU5ErkJggg==>

[image5]: <data:image/png;base64,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>

[image6]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAaCAYAAAAjZdWPAAACdUlEQVR4Xu2VTYiOURTHDwpNWWCBaZREFkJiIYyMlKRshJVGPoqkbCQis5FSQ2IzPkJIkg1JvhaKkpSvLHyk2SgyDSlJFvz/nXvf9zz/R/O+Y2Xx/Opfz/2fe97nvveeex6zigqyCdqmpjLTfNJmDfwDC9QAnWo04Cd0Uc3IZegzdBy6Au0thgfNEegRdAd6AH2DDhRmNOY3dFfNyDuoNYyZsCWMB8tR89/I+lEMN2Sded5LDWQ6oD3i3Ye+QiPFbxYueiO03bxUWorhAeHc9+aL/iSxGq+hJeIdMk/qFn8YNC+Mh0AzwjhzWI0mmQZ9gMZa/ZTaCjPMF/HLigshXeYJ14O3FHoFHYMumZcTa+68lRfJ8QqoB7ptfleagXM3pOe86Nn1sDMqBXTR+5LPi0QmQ8+hKWnMWJ95p5kKfU9+hifE+bug1dBjaHphRplV0EPz0yN50ctrMxKjU0AXvTv5rG3CnV1ci3qsFxpqXrdXQ4wwP9bxOOgtNCJ4Sq8VS40VwPd0Bq/GR2i+ePvNE06Ln2FsrZoNYM4FNRM8ybyzKt6vEmwrrNfIQRsgwTw2Xs3ELOiFmuY5N9VM3FIDXDPPOaMBcgpaI94J8wTWGWHtT0zPE8w7TmRheM5/WNscPe1GhO9+pqb5YplzQwOEfVq/gPegfmh4GvP5i3m32QqdTX6GnSLD28+va4R5XMAi8XlabHF6p0huu080kDlp/rnlTd9hviN8UYadgK3tKbQSemNen9zx3GEi7Pu8xGx9LBW+PF7CMcmLipyTGMVLX4I/tN7Ku074B+ZCk4I3B2q3eotSlkE7zb+Mf9vJioqKioqK/4M/usKSHlzgJY8AAAAASUVORK5CYII=>

[image7]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAaCAYAAACgoey0AAABjElEQVR4Xu2UPShGURjH/74iUT5KJMTAIKGUwUIpm9gMUhY2+dhYTAZlsaJkUZTFYOItURZCsqF8DFKyWJT4n55zX889731flzeL7q9+dZ7nOfc573vvOQeIiIj4I5ppnYpraZWKw5JDW2imWwjijK7RXRqjy3THjrcQsgnpoAd0k947tUHapBO5tMeOzQI3dJEW0iP6QattPRXl9JQW0W7Ic5p9Wq8TYzog17QMXw+bZtm+GcHM0HE7noN/4QL6puIE+pD4S39KF6THtsrN21xSlvDNhBAsQHqMqpz3yXzo13hL31VcQXtVHIZDyCLeCSm28UN8Bsmj57SVttsJJ6puvtWEiofpBmT3JsP0M30ybNxv41VvgodpFKPTkJ1pxubVXEDOsmaE3tFHJ6+poVeQ55/oM2ThwDvBd75IJ+RtJMOc+1TkQ3o0QHbzsa/6S0ohZ90li65AaiU2NwX5twPepHSYhexclzbIIq+QTWl4oXvxGWnQSC8ht5NLJWTRSUh9iK5DLo+IiH/OJ5MrTI/xosgsAAAAAElFTkSuQmCC>

[image8]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACWUlEQVR4Xu2VS4iOYRiGH4dYIKxIUcoChRRRDg2JBRtFahI5lgUph1JIiqywcAozFs4yZYESY4EkmxnkWCyIBZpEUSy473net//57vlMxk6+q67+/72f7/D+3/e8729W8Z8xBq6Bq7XwFwyT8US4XLI9sF6y33IGtsED8ALcCbsVjugaP+E9eB3eTuO9hSPMnqW8zEvhuHZewaFh/B1uDOOuojdcUSxbb/gj1cqcVzvUbBrcHgNwDX6F/SX/U06av9J15tdXRsHXsK7Em35IDT7q2ZLtMP8lxyXvASdLNlrGZLcGwiQ4QzK+wedwRAx5Qz7qKTEEm8wneCtks+BjeBBehIPhVXgWHg3HkV1wLjxi/jZ00Sjd4Q04Xwv9zCcyVfINKb+fxsPhQzgyjVnjolpvfnOO2VeZj/AR3AIXwk9wQqgr7PcX5hMtMNDKJ8jeYd6SxqfhzFq5vfYe9jTvteZQI1dgnzD+Bt/AviGL8FprNcy8g9Ml4y/iJLjllMHaMg074Zz5OZe1YP4juWuw3Up5AOdIttX8gockz7BWaObAWLhfsgbzc7gnKlzlTzWMHLOOO/o+8wsuTWP2am70QfBt+p6Jr58rmOcOCFlTyg6HLMNXe0fDSJ35thLh6vxstT76AL/AXnCV+cqNLArf2ZOLw5i8NJ+gvinCp8uV3incJu6a34gLhFsJJ5NphafM22EBfGL+98jPuBVl+M/Ep8K/N557woqLJnIeNmpYBlf0ErhNC+YNzG2C201mvPni6rA1mDc+N//NcKXUlHFwiIYVFRUVFf8AvwDkb4UzcKpNeQAAAABJRU5ErkJggg==>

[image9]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACP0lEQVR4Xu2VTYhOURjHH4yPmhFWbIamZqEpCzUL+UrSjIXYqBFljK9SkhikfO+slMZHZhYWmDLWMyQLTJKNjyJRNj4WlEQR0vj/e56j532c+3o1O+6vft33/J977j33veecK1LynzEHboNbY2EUTIUdcCkcE2qelbAphp5L8D3sgZfhMal+wVpYA1/CATgMr8NJFWcofIgfsDMWPC9go2t/g92u/bfsh+/gfGufgSNw1a8zRG5Z9tyOhQNcBA+F7Br8DKeEvFZ4w6Ou/cWyokFUq8lT2BayI6Kd+kI+Ds4LWUtoL4evQ/YnCgfIG36HC0K+R7QTX0NiGXwMT8ErcAYchP3wnDvvMLwrej7734SbXD1H4QAnixYXhny35feszRX2CM62NmtcVDvhTGtPtBr/9Wei06TBslfwuP3OUTjAaZIf4A7L71v7ouhWkWDtLayDG+ENV7tqdW5biZOWrXOZh7UNMUy8gYtDxhXMTtxycrDWFUPjLLwdsvTAX0OeYI0PmuUhbA/ZAdFOp0OeYK05hgb3UO55nu2ifejYUCNVB9gL14bshFTOC85VzjUyXX5fpf71rxDdmD27RK/3JOQJ1goX0hLRbcXD1fkR1lubm+4nOAFuEV25Hn7OEuPhBzsmuEA4iL0u87C2OYYebhN3RG/E+cKthINJPIAXRKfDatF/gp9HHv1WlODU4OdrCB6E50U/aR4+ZHrt0Sxc0etFLxjhftkqlR/0uaKLKzenyCy4T/LXKykpKSn5F/gJS4WD9e3pW/8AAAAASUVORK5CYII=>

[image10]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAaCAYAAAAjZdWPAAACWklEQVR4Xu2VTahNURTHl48kZcArIYRIKUoMEPXIRMpEGOm9fBShlBERM0VMKOUjhCSZ0Hvlq54e9QYKycBHuhNFhInB6yX+/9be9677P/de7hsZnF/96uy19j5n3bPX2despIRsh7s1qCw0n7RDE8PghAaGwSC8rsHITfgFnoG34KH6dNu8g7+beDXMawXnPtRg5D2cGsZcsDOM22Es/GXFYukQXF2b2pQt5vNfaSKzCh6U2GP4w7yAdpkPK7BTHIB7fEpLxsEP5kV/llyVN1b89cfNF52U+Ci4NIxHwAVhTJaZFxmZBWdIrBHz4EfYYbXdmVY3w7wIblkshBw1X3A3xNbA1/A0vGHeTuw59uipME8ZDfs12IT7cGu6zkUvqqWd8SmhRR9O8QdpPBu+hHPSmLmv5ifNXPgzxRvBj5pr/8YG+NR890guem11RmJCSmjRB1KcvU34ZjurWc9V4Ei4F94OuQhfyje4TRMNqFh9q7ED+JyuEKvyCS6X2BHzBRclnmFuswYFtgX7s9UuZLiT+c2q/L4K8Fhhv0aOWYsF5rnJGhR4KnHev7TGPQ2AO+brL2mCXICbJHbOfAH7jHCbp6frKeYnTmSFjMl+83v0SVzhs19o0LxYru/RBOEb0X/AR+a9OCaNef3d/LTZBS+neGadjAlPFT60VxMB7hZbSL8pko/dZ5rInIdP4Ea4z/x8ZoEZbjGLeA7Xw7fwmvkbzyeMwo+TDz2rCTDRir0buSI5yo++AG/UbcW3TvgDlsCZIbYYrrTaEaXwfOW9JmmipKSkpKTkv+IPbDiSh0N0k7sAAAAASUVORK5CYII=>

[image11]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACXklEQVR4Xu2VTYiOURTHj+8iTSzGNEWJIkUxFsrM9CaxmGSjlIXxEWWDwpRmMMZW2fgoM9kwSDYiUWYWyiyUz/JVSIrFTCHKggX/v3PuM+c579PUYKE8v/o17/nf2/vcee499xUp+c9YCHfA7XHgL3ATzo6hUQcPwJY44DkPP8Dj8BLsgmNyM36fcfAHXBJyfn8b/AQ74St4B052czJew5mu/gb3uvpP2Ce6wIaQH7J8gdWz4Ed4JpthNMGDIeOWfIU1IR8tc+Ab0YUsdvlyyx66jHAnmed4DleFrFN0Yk/IuV3LQpbeQKQVnrXPcYF8AcyuuozstzyDD/wu+h950rbcdtlK+ASegJdFD/d1eAGedvNIPXwBp1sdt/iKZddcRtotz5hqQaMPwR7L71rNDnwM51vNMTbVbtGzw3qSjZEbcK2r4wKPWnbLZeSU5RnTLIgL3Gn5A6t74Yrh4V9jg3A83AL73BhJW5uIC2RHM3srw7fFRPjS8hzvYXPI2MGcyCunCI5tjqHow/pjKNULTKyH90SvFx6rw1KwwEdwdcg6RCeeDHmCY3NjCGpFx0ayNZtdDZ9XtcBuuCFkxyT/ZTyrPGtkBnxnnxNp+yfASoH8rq32mc1F1ogej7FWk/uid3COiui14mF3foZTrB6CX0TPyTbRzvVwq0aCC/TXDLs7vdGKZYusvmh1Dl4TA6IPYoPwKuFiErxQz4keh3Xwqeilyr/+KvLwrcbt9buyS7QJj8Bnomd3no0Vwo7eKPrDHeF9uVTyP/h8I2wuv0WjhT+vm6S4gUpKSkpK/nV+Aua+jycf75d0AAAAAElFTkSuQmCC>

[image12]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAaCAYAAADFTB7LAAACW0lEQVR4Xu2VS4iOYRTHj7tCWI0NUhYSC2UhjCYJCyWliDIhSklyGU0Nhp2VkltYzMKlsHbNwiXJxqVIFjYuhZIoQuL/n3POzHnP+72YbJT3V7++Oef5f+/7zfc9z3lFav4zpsINcH1e+AtGwWVwLuyX1iLMbJVf5E7Dd/AgPAv3SkWwDyyHz+E5eAtehUMLCYU5ZvZJb67EMzg21F/htlD3lXb4Fs60+gj8ARf3JBTPOZ4r0Ax3pd5l+AmOTP0/hTfZE+rP1msNvSXW8xx/Mc8VeALnp16naPBE6g+AM1JvcqoXwpepl2GG1/9drvuG3+Cs1N8ueoEboTcPPoKH4Hk4Bl6AZ+CxkNsN74jm+f7rcG1YJ8zw+p5j5oqUczJCNDg79Xmi2L9r9QT4EE6ymms8VJvhOKuH2Bq/9aei22S49V6IHgKHGb7Hc2SKlHMyWhp/wE3Wv2f1KdER4HDtDRwI18BrYe2SrXNsOQest9Jqz1TlCryCc1KPJ5hBjpxGcG11bhpH4c3U83/4i9XMsK7KFXgAF6Reh2jwcOo7XJuYmwZnaJ5lG6X3G+svmuHfVTlmejgOV8QG2C8abLWae5V7jTRJ+fTFn3+R6MCNbBG93mOrmWFdlSvQIjpWIjydH+AwqzlMP8LBcJ3oyY3wUeUMgu/t1eHG543brObaa6nOleCYuC16I+4DjhJ+GOc+PCm6HZaKfhN8PPI1jiKHW+M7vAh3wi7R53LGc8xwzHRJ41w3PNGrRMMZzsvpouPGmSZ6uAr7JTAe7pDG14swx0x+WNTU1NTU/Ov8BIAPmIHBK4THAAAAAElFTkSuQmCC>