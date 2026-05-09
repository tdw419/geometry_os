; DESCRIPTION: Draws a blue circle centered at (129, 189) with radius 40.
; PLAN: r0=129(x), r1=189(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 189
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
