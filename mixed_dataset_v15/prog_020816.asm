; DESCRIPTION: Draws a white circle centered at (372, 102) with radius 74.
; PLAN: r0=372(x), r1=102(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 102
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
