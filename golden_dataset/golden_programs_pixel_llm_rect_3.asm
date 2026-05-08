; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; Pixel-LLM Sample 5 - should assemble
LDI r12, 10
LDI r4, 10
LDI r10, 10
LDI r13, 10
LDI r7, 0x44FF44
RECTF r12, r4, r10, r13, r7
HALT
