; DESCRIPTION: Draws a orange circle centered at (32, 9) with radius 66.
; PLAN: r0=32(x), r1=9(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 9
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
