; DESCRIPTION: Draws a white circle centered at (85, 156) with radius 65.
; PLAN: r0=85(x), r1=156(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 156
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
