; DESCRIPTION: This GeOS assembly code demonstrates a memory-mapped screen buffer readback by drawing a red pixel at coordinates (20, 30), reading it back using the LOAD instruction from its mapped address, and then storing both the original and the read-back values in RAM for verification. It also reads and verifies the initial black pixel at (0, 0) and uses the read value to draw a copy of the red pixel at coordinates (21, 30).

; screen_readback_demo.asm
; Phase: Memory-Mapped Screen Buffer Readback
; 
; Demonstrates that VM programs can read the screen buffer via LOAD
; from address range 0x10000-0x1FFFF.
;
; Screen layout: pixel at (x, y) is at address 0x10000 + y*256 + x
; Screen is 256x256 pixels, each pixel is a 24-bit RGB color (u32).
;
; This program:
; 1. Draws a red pixel at (20, 30) using PSET
; 2. Reads it back via LOAD from 0x10000 + 30*256 + 20
; 3. Reads pixel (0,0) via LOAD from 0x10000 (should be 0 = black)
; 4. Stores both values to RAM for verification
; 5. Uses the read value to draw a copy of the pixel at (21, 30)

; --- Set up coordinates ---
LDI r7, 20          ; r7 = x = 20
LDI r4, 30          ; r4 = y = 30

; --- Draw a red pixel at (20, 30) ---
LDI r13, 0x00FF      ; r13 = 0x000000FF
SHLI r13, 16          ; r13 = 0x00FF0000
PSET r7, r4, r13      ; screen[30*256+20] = 0x00FF0000 (red)

; --- Read back the pixel via LOAD from screen-mapped address ---
; Address = 0x10000 + 30*256 + 20 = 0x10000 + 7680 + 20 = 0x11E14
LDI r14, 0x0001       ; r14 = 1
SHLI r14, 16           ; r14 = 0x10000
ADDI r14, 0x1E14      ; r14 = 0x11E14
LOAD r10, r14           ; r10 = screen[30*256+20] = 0x00FF0000

; --- Store read value to RAM[0x300] for verification ---
LDI r0, 0x300
STORE r0, r10

; --- Read pixel at (0,0) which should be black (0) ---
LDI r14, 0x10000       ; r14 = 0x10000 (pixel 0,0)
LOAD r6, r14           ; r6 = screen[0] = 0

; --- Store to RAM[0x304] ---
LDI r0, 0x304
STORE r0, r6

; --- Use the read value to draw a copy at (21, 30) ---
LDI r7, 21           ; x = 21
LDI r4, 30           ; y = 30
PSET r7, r4, r10      ; draw with the value we read back

HALT
