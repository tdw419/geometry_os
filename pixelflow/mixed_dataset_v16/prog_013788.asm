; DESCRIPTION: Draws a orange circle centered at (421, 94) with radius 48.
; PLAN: r0=421(x), r1=94(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 94
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
