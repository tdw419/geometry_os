; DESCRIPTION: Draws a orange circle centered at (375, 207) with radius 37.
; PLAN: r0=375(x), r1=207(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 207
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
