; DESCRIPTION: Draws a blue circle centered at (113, 156) with radius 77.
; PLAN: r0=113(x), r1=156(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 156
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
