; DESCRIPTION: Draws a white circle centered at (141, 119) with radius 57.
; PLAN: r0=141(x), r1=119(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 119
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
