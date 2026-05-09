; DESCRIPTION: Places a orange circle of radius 23 at center (149, 74).
; PLAN: r0=149(x), r1=74(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 74
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
