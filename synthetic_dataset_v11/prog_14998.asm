; DESCRIPTION: Draws a white circle centered at (94, 188) with radius 49.
; PLAN: r0=94(x), r1=188(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 188
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
