; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

; Pixel-LLM Sample 5 - should assemble
LDI r9, 10
LDI r3, 10
LDI r7, 10
LDI r0, 10
LDI r10, 0x44FF44
RECTF r9, r3, r7, r0, r10
HALT
