; DESCRIPTION: Render a colored rectangle at the screen.

; Pixel-LLM Sample 5 - should assemble
LDI r8, 10
LDI r6, 10
LDI r1, 10
LDI r11, 10
LDI r4, 0x44FF44
RECTF r8, r6, r1, r11, r4
HALT
