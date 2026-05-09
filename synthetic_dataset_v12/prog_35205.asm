; DESCRIPTION: Draws a white circle centered at (64, 85) with radius 26.
; PLAN: r0=64(x), r1=85(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 85
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
