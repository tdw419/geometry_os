; DESCRIPTION: Draws a white circle centered at (162, 134) with radius 15.
; PLAN: r0=162(x), r1=134(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 134
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
