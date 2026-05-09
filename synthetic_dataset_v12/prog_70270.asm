; DESCRIPTION: Draws a white circle centered at (15, 39) with radius 15.
; PLAN: r0=15(x), r1=39(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 39
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
