; DESCRIPTION: Places a orange disk with center (355, 82) and radius 26.
; PLAN: r0=355(x), r1=82(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 82
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
