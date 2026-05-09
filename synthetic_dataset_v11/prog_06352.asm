; DESCRIPTION: Draws a black circle centered at (156, 184) with radius 56.
; PLAN: r0=156(x), r1=184(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 184
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
