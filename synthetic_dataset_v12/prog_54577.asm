; DESCRIPTION: Draws a white circle centered at (117, 200) with radius 36.
; PLAN: r0=117(x), r1=200(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 200
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
