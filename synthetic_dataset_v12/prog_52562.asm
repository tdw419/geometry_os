; DESCRIPTION: Draws a white circle centered at (316, 72) with radius 55.
; PLAN: r0=316(x), r1=72(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 72
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
