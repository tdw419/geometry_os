; DESCRIPTION: Draws a orange circle centered at (487, 117) with radius 13.
; PLAN: r0=487(x), r1=117(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 117
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
