; DESCRIPTION: Draws a white circle centered at (179, 135) with radius 26.
; PLAN: r0=179(x), r1=135(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 135
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
