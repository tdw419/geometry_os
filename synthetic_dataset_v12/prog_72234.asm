; DESCRIPTION: Draws a white circle centered at (110, 156) with radius 35.
; PLAN: r0=110(x), r1=156(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 156
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
