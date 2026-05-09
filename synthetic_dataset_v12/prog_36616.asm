; DESCRIPTION: Draws a white circle centered at (469, 165) with radius 33.
; PLAN: r0=469(x), r1=165(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 165
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
