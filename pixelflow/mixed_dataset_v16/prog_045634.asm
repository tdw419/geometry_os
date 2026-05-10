; DESCRIPTION: Draws a white circle centered at (293, 66) with radius 23.
; PLAN: r0=293(x), r1=66(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 66
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
