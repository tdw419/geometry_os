; DESCRIPTION: Places a orange circle of radius 10 at center (196, 245).
; PLAN: r0=196(x), r1=245(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 245
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
