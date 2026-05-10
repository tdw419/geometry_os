; DESCRIPTION: Draws a blue circle centered at (395, 183) with radius 14.
; PLAN: r0=395(x), r1=183(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 183
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
