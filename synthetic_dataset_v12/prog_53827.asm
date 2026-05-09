; DESCRIPTION: Places a orange circle of radius 56 at center (321, 63).
; PLAN: r0=321(x), r1=63(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 63
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
