; DESCRIPTION: Display a rectangle using color colored at the screen.

; Pixel-LLM Sample 5 - should assemble
LDI r4, 10
LDI r13, 10
LDI r15, 10
LDI r11, 10
LDI r2, 0x44FF44
RECTF r4, r13, r15, r11, r2
HALT
