; DESCRIPTION: Draws a orange circle centered at (48, 185) with radius 47.
; PLAN: r0=48(x), r1=185(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 185
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
