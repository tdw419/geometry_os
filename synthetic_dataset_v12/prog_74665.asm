; DESCRIPTION: Draws a white circle centered at (432, 81) with radius 53.
; PLAN: r0=432(x), r1=81(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 81
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
