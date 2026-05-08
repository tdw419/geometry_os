; DESCRIPTION: Display a object using color red at the screen.

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
LDI r0, 20          ; r0 = x = 20
LDI r5, 30          ; r5 = y = 30

; --- Draw a red pixel at (20, 30) ---
LDI r4, 0x00FF      ; r4 = 0x000000FF
SHLI r4, 16          ; r4 = 0x00FF0000
PSET r0, r5, r4      ; screen[30*256+20] = 0x00FF0000 (red)

; --- Read back the pixel via LOAD from screen-mapped address ---
; Address = 0x10000 + 30*256 + 20 = 0x10000 + 7680 + 20 = 0x11E14
LDI r13, 0x0001       ; r13 = 1
SHLI r13, 16           ; r13 = 0x10000
ADDI r13, 0x1E14      ; r13 = 0x11E14
LOAD r7, r13           ; r7 = screen[30*256+20] = 0x00FF0000

; --- Store read value to RAM[0x300] for verification ---
LDI r6, 0x300
STORE r6, r7

; --- Read pixel at (0,0) which should be black (0) ---
LDI r13, 0x10000       ; r13 = 0x10000 (pixel 0,0)
LOAD r8, r13           ; r8 = screen[0] = 0

; --- Store to RAM[0x304] ---
LDI r6, 0x304
STORE r6, r8

; --- Use the read value to draw a copy at (21, 30) ---
LDI r0, 21           ; x = 21
LDI r5, 30           ; y = 30
PSET r0, r5, r7      ; draw with the value we read back

HALT
