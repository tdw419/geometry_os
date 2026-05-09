; DESCRIPTION: Draws a white circle centered at (25, 118) with radius 10.
; PLAN: r0=25(x), r1=118(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 118
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
