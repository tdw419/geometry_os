; DESCRIPTION: Places a orange circle of radius 49 at center (216, 119).
; PLAN: r0=216(x), r1=119(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 119
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
