; DESCRIPTION: Places a orange circle of radius 70 at center (289, 161).
; PLAN: r0=289(x), r1=161(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 161
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
