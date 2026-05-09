; DESCRIPTION: Draws a orange circle centered at (185, 68) with radius 56.
; PLAN: r0=185(x), r1=68(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 68
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
