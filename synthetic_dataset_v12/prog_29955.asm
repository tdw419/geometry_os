; DESCRIPTION: Draws a orange circle centered at (419, 167) with radius 80.
; PLAN: r0=419(x), r1=167(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 167
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
