; DESCRIPTION: Draws a orange circle centered at (124, 86) with radius 45.
; PLAN: r0=124(x), r1=86(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 86
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
