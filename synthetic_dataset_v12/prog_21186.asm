; DESCRIPTION: Draws a white circle centered at (365, 203) with radius 13.
; PLAN: r0=365(x), r1=203(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 203
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
