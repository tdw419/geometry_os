; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; Pixel-LLM Sample 5 - should assemble
LDI r13, 10
LDI r8, 10
LDI r1, 10
LDI r6, 10
LDI r7, 0x44FF44
RECTF r13, r8, r1, r6, r7
HALT
