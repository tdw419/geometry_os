; DESCRIPTION: This GeOS assembly code loads the coordinates (80, 120) into registers `r0` and `r11`, respectively, and a pointer to the string "HELLO PIXELS" in register `r15`. It then uses the `TEXT` opcode to render the null-terminated string at the specified screen position. The code halts after displaying the message.

; hello_pixels.asm -- Pixel-to-CPU-to-Pixel round-trip demo
;
; Pipeline: ASM source -> assembler -> VM execute -> TEXT opcode walks
; font::GLYPHS onto screen[y*256+x] -> vm_screen_ascii reads it back.
;
; TEXT (0x44) renders a null-terminated string from RAM at (x_reg, y_reg).
; Code runs first; data lives after HALT so it isn't executed as opcodes.

LDI r0, 80
LDI r11, 120
LDI r15, msg
TEXT r0, r11, r15
HALT

msg: .ascii "HELLO PIXELS"
     .byte 0
