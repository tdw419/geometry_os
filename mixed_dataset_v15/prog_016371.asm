; DESCRIPTION: Places a blue disk with center (76, 153) and radius 78.
; PLAN: r0=76(x), r1=153(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 153
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
