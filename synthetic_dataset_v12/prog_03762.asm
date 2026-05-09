; DESCRIPTION: Places a orange circle of radius 10 at center (58, 205).
; PLAN: r0=58(x), r1=205(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 205
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
