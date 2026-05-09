; DESCRIPTION: Draws a orange circle centered at (205, 220) with radius 23.
; PLAN: r0=205(x), r1=220(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 220
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
