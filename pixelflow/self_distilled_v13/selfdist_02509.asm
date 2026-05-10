; DESCRIPTION: Places a orange disk with center (341, 161) and radius 53.
; PLAN: r0=341(x), r1=161(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 161
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
