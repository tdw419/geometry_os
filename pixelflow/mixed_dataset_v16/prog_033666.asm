; DESCRIPTION: Draws a orange circle centered at (354, 80) with radius 19.
; PLAN: r0=354(x), r1=80(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 80
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
