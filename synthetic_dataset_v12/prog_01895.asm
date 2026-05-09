; DESCRIPTION: Places a orange circle of radius 62 at center (71, 148).
; PLAN: r0=71(x), r1=148(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 148
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
