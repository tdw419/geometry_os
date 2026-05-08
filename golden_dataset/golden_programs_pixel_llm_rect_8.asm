; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; Pixel-LLM Sample 5 - should assemble
LDI r11, 10
LDI r5, 10
LDI r6, 10
LDI r10, 10
LDI r8, 0x44FF44
RECTF r11, r5, r6, r10, r8
HALT
