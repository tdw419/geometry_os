; DESCRIPTION: Draws a white circle centered at (227, 185) with radius 52.
; PLAN: r0=227(x), r1=185(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 185
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
