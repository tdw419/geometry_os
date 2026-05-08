; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; Pixel-LLM Sample 5 - should assemble
LDI r3, 10
LDI r4, 10
LDI r1, 10
LDI r6, 10
LDI r14, 0x44FF44
RECTF r3, r4, r1, r6, r14
HALT
