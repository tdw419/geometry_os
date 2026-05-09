; DESCRIPTION: Draws a black circle centered at (156, 181) with radius 59.
; PLAN: r0=156(x), r1=181(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 181
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
