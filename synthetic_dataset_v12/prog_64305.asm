; DESCRIPTION: Draws a white circle centered at (414, 106) with radius 63.
; PLAN: r0=414(x), r1=106(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 106
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
