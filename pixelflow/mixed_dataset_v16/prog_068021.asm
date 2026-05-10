; DESCRIPTION: Draws a white circle centered at (381, 80) with radius 66.
; PLAN: r0=381(x), r1=80(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 80
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
