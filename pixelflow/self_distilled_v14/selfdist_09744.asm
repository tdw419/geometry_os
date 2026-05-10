; DESCRIPTION: Draws a white circle centered at (233, 14) with radius 73.
; PLAN: r0=233(x), r1=14(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 14
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
