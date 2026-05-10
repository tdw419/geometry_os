; DESCRIPTION: Draws a white circle centered at (254, 81) with radius 60.
; PLAN: r0=254(x), r1=81(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 81
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
