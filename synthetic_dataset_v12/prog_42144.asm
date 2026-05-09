; DESCRIPTION: Draws a white circle centered at (421, 77) with radius 39.
; PLAN: r0=421(x), r1=77(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 77
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
