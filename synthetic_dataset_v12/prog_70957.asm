; DESCRIPTION: Draws a white circle centered at (200, 178) with radius 40.
; PLAN: r0=200(x), r1=178(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 178
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
