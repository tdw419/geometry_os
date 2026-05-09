; DESCRIPTION: Places a orange circle of radius 30 at center (88, 123).
; PLAN: r0=88(x), r1=123(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 123
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
