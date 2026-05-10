; DESCRIPTION: Draws a white circle centered at (125, 81) with radius 75.
; PLAN: r0=125(x), r1=81(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 81
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
