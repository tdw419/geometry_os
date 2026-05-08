; DESCRIPTION: Display a object using color colored at the screen.

; hello_pixels.asm -- Pixel-to-CPU-to-Pixel round-trip demo
;
; Pipeline: ASM source -> assembler -> VM execute -> TEXT opcode walks
; font::GLYPHS onto screen[y*256+x] -> vm_screen_ascii reads it back.
;
; TEXT (0x44) renders a null-terminated string from RAM at (x_reg, y_reg).
; Code runs first; data lives after HALT so it isn't executed as opcodes.

LDI r6, 80
LDI r3, 120
LDI r5, msg
TEXT r6, r3, r5
HALT

msg: .ascii "HELLO PIXELS"
     .byte 0
