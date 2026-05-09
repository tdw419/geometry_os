; DESCRIPTION: Draws a blue circle centered at (134, 156) with radius 27.
; PLAN: r0=134(x), r1=156(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 156
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
