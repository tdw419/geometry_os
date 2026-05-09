; DESCRIPTION: Draws a red circle centered at (125, 110) with radius 34.
; PLAN: r0=125(x), r1=110(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 110
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
