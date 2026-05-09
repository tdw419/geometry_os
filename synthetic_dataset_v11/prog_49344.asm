; DESCRIPTION: Draws a blue circle centered at (138, 189) with radius 66.
; PLAN: r0=138(x), r1=189(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 189
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
