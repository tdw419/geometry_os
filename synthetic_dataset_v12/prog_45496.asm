; DESCRIPTION: Draws a white circle centered at (368, 85) with radius 33.
; PLAN: r0=368(x), r1=85(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 85
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
