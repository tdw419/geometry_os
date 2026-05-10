; DESCRIPTION: Draws a white circle centered at (89, 141) with radius 45.
; PLAN: r0=89(x), r1=141(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 141
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
