; DESCRIPTION: Draws a white circle centered at (268, 85) with radius 13.
; PLAN: r0=268(x), r1=85(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 85
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
