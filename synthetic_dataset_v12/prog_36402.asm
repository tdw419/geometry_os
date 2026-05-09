; DESCRIPTION: Draws a white circle centered at (125, 165) with radius 31.
; PLAN: r0=125(x), r1=165(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 165
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
