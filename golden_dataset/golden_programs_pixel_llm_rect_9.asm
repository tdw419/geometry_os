; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; Pixel-LLM Sample 5 - should assemble
LDI r3, 10
LDI r6, 10
LDI r13, 10
LDI r8, 10
LDI r12, 0x44FF44
RECTF r3, r6, r13, r8, r12
HALT
