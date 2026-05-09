; DESCRIPTION: Draws a orange circle centered at (48, 43) with radius 37.
; PLAN: r0=48(x), r1=43(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 43
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
