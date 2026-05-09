; DESCRIPTION: Draws a white circle centered at (459, 76) with radius 20.
; PLAN: r0=459(x), r1=76(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 76
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
