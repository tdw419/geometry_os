; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; hello_pixels.asm -- Pixel-to-CPU-to-Pixel round-trip demo
;
; Pipeline: ASM source -> assembler -> VM execute -> TEXT opcode walks
; font::GLYPHS onto screen[y*256+x] -> vm_screen_ascii reads it back.
;
; TEXT (0x44) renders a null-terminated string from RAM at (x_reg, y_reg).
; Code runs first; data lives after HALT so it isn't executed as opcodes.

LDI r3, 80
LDI r14, 120
LDI r6, msg
TEXT r3, r14, r6
HALT

msg: .ascii "HELLO PIXELS"
     .byte 0
