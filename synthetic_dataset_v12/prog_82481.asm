; DESCRIPTION: Places a blue circle of radius 76 at center (355, 87).
; PLAN: r0=355(x), r1=87(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 87
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
