; DESCRIPTION: Draws a white circle centered at (318, 134) with radius 49.
; PLAN: r0=318(x), r1=134(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 134
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
