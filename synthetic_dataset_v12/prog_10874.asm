; DESCRIPTION: Draws a white circle centered at (203, 184) with radius 61.
; PLAN: r0=203(x), r1=184(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 184
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
