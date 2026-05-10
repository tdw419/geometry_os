; DESCRIPTION: Draws a white circle centered at (26, 95) with radius 75.
; PLAN: r0=26(x), r1=95(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 95
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
