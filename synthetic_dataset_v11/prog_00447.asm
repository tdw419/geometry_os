; DESCRIPTION: Draws a white circle centered at (74, 156) with radius 66.
; PLAN: r0=74(x), r1=156(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 156
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
