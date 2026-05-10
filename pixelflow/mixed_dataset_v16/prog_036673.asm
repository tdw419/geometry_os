; DESCRIPTION: Draws a white circle centered at (77, 219) with radius 23.
; PLAN: r0=77(x), r1=219(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 219
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
