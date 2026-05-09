; DESCRIPTION: Places a orange circle of radius 34 at center (102, 161).
; PLAN: r0=102(x), r1=161(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 161
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
