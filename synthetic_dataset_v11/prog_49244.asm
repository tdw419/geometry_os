; DESCRIPTION: Draws a white circle centered at (145, 136) with radius 47.
; PLAN: r0=145(x), r1=136(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 136
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
