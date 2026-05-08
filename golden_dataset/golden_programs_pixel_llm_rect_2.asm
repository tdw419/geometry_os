; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

; Pixel-LLM Sample 5 - should assemble
LDI r1, 10
LDI r9, 10
LDI r15, 10
LDI r13, 10
LDI r4, 0x44FF44
RECTF r1, r9, r15, r13, r4
HALT
