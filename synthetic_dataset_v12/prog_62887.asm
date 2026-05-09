; DESCRIPTION: Places a orange circle of radius 57 at center (437, 119).
; PLAN: r0=437(x), r1=119(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 119
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
