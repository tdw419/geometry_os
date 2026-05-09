; DESCRIPTION: Draws a white circle centered at (361, 83) with radius 43.
; PLAN: r0=361(x), r1=83(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 83
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
