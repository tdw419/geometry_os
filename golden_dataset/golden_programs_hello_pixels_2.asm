; DESCRIPTION: A colored object centered at the screen with fixed size.

; hello_pixels.asm -- Pixel-to-CPU-to-Pixel round-trip demo
;
; Pipeline: ASM source -> assembler -> VM execute -> TEXT opcode walks
; font::GLYPHS onto screen[y*256+x] -> vm_screen_ascii reads it back.
;
; TEXT (0x44) renders a null-terminated string from RAM at (x_reg, y_reg).
; Code runs first; data lives after HALT so it isn't executed as opcodes.

LDI r6, 80
LDI r5, 120
LDI r1, msg
TEXT r6, r5, r1
HALT

msg: .ascii "HELLO PIXELS"
     .byte 0
