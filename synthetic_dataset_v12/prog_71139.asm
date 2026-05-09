; DESCRIPTION: Draws a black circle centered at (154, 144) with radius 79.
; PLAN: r0=154(x), r1=144(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 144
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
