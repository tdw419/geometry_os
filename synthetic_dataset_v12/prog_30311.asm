; DESCRIPTION: Places a orange circle of radius 47 at center (149, 114).
; PLAN: r0=149(x), r1=114(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 114
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
