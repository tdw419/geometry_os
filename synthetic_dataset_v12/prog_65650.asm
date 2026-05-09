; DESCRIPTION: Draws a white circle centered at (51, 24) with radius 19.
; PLAN: r0=51(x), r1=24(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 24
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
