; DESCRIPTION: Draws a white circle centered at (227, 64) with radius 20.
; PLAN: r0=227(x), r1=64(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 64
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
