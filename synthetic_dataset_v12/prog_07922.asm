; DESCRIPTION: Draws a orange circle centered at (329, 56) with radius 25.
; PLAN: r0=329(x), r1=56(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 56
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
