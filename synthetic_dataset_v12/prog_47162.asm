; DESCRIPTION: Draws a blue circle centered at (278, 106) with radius 78.
; PLAN: r0=278(x), r1=106(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 106
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
