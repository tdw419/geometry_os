; DESCRIPTION: Places a blue disk with center (61, 123) and radius 45.
; PLAN: r0=61(x), r1=123(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 123
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
