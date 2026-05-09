; DESCRIPTION: Draws a blue circle centered at (211, 153) with radius 78.
; PLAN: r0=211(x), r1=153(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 153
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
