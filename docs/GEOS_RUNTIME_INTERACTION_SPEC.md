# GEOMETRY OS: RUNTIME INTERACTION & I/O SPECIFICATION (V1.0)

> "The Computer is Digital Clay that Never Stops Spinning."

This document defines the **Runtime Interaction Layer** of Geometry OS. It is a critical addendum to the Pixel Programming Spec, detailing how programs communicate with the outside world (the user's physical keyboard) while executing.

---

## 1. THE DOUBLE-SLIT PARADOX: PAINTER VS. RUNTIME

Geometry OS has two distinct states of existence. AI agents must understand which state the system is in to interact correctly.

### 1.1 Painter Mode (God Mode / Idle)
- **Trigger:** The VM is halted (`F5` has not been pressed, or a `HALT` instruction was reached).
- **Behavior:** Every keystroke is an **Instruction Stamp**. Typing 'A' directly modifies the 32x32 RAM grid at the cursor position, inserting the opcode for `ADD`.
- **Purpose:** Cold-boot authoring. Painting the initial Kernel or Bootloader.

### 1.2 Runtime Mode (Pulse Execution)
- **Trigger:** The VM is running (`F5` toggles the execution pulse).
- **Behavior:** The VM executes a burst of cycles every frame (approx. 60fps). Keystrokes are **Data**. They do *not* stamp opcodes onto the canvas. Instead, they are routed to a hardware I/O port.
- **Purpose:** Live interaction, OS execution, and self-authoring Shell environments.

---

## 2. MEMORY-MAPPED I/O (THE KEYBOARD PORT)

To allow a running Geometry OS program to "hear" the user, the host substrate (Rust) implements Memory-Mapped I/O.

- **Port Address:** `1023` (The very last pixel in the 32x32 grid: Row 31, Col 31).
- **Data Format:** When a key is pressed, its 8-bit ASCII value is written to `RAM[1023]`.
- **Volatility:** The hardware *does not* clear this port. It is the responsibility of the OS (the Keyboard Driver) to read the value and then reset `RAM[1023]` to `0` (ACK).

---

## 3. WRITING A KEYBOARD DRIVER (POLLING LOOP)

Because Geometry OS lacks hardware interrupts in V1.0, the OS must actively poll Address 1023.

### 3.1 The Standard Polling Pattern
An AI agent designing an interactive shell should implement a loop similar to this pseudo-assembly:

```assembly
; --- Initialization ---
LDI r0, 1023       ; r0 points to the Keyboard Port
LDI r4, 0          ; r4 holds the ACK value (0)

:poll_loop
    LOAD r1, r0    ; Read RAM[1023] into r1
    
    ; Check if r1 != 0 (A key was pressed)
    ; In GEOS, BRANCH condition 1 is BNE (Branch Not Equal).
    ; We construct the condition pixel: cond | (r_src1 << 16) | (r_src2 << 24)
    ; BNE r1, r4 -> 1 | (1 << 16) | (4 << 24)
    BRANCH <BNE_r1_r4>, :handle_key
    
    JMP :poll_loop ; No key, keep waiting

:handle_key
    ; ... (Process the keystroke in r1) ...
    
    STORE r0, r4   ; ACK: Write 0 back to RAM[1023] to clear the buffer
    JMP :poll_loop ; Wait for the next key
```

---

## 4. THE LIVE-CODING MACHINE (SELF-AUTHORING)

The ultimate goal of Runtime Interaction is the **Live-Coding Machine**. 

Instead of stopping the VM to use Painter Mode, the OS Shell should read keystrokes from Port 1023 and use the `EDIT_OVERWRITE` (`e`), `EDIT_INSERT` (`f`), or `EDIT_DELETE` (`j`) opcodes to modify the grid dynamically.

### Example: The "Reflector" Concept
1. The user types `A` while the VM is running.
2. The OS Shell reads `0x41` from Port 1023.
3. The OS Shell uses `EDIT_OVERWRITE` to write `0x41` into the **User Stratum** (e.g., Address 512).
4. The OS Shell advances its internal cursor to 513.

In this way, the OS literally builds programs inside its own memory while the user watches the pixels change colors. **The OS teaches itself to grow.**

---
*GEOMETRY OS -- Phase 20: Visual Bootstrapping / Runtime I/O*
