; DESCRIPTION: Places a orange circle of radius 24 at center (131, 102).
; PLAN: r0=131(x), r1=102(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 102
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
