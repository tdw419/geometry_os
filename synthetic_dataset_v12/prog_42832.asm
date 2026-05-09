; DESCRIPTION: Draws a blue circle centered at (341, 183) with radius 46.
; PLAN: r0=341(x), r1=183(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 183
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
