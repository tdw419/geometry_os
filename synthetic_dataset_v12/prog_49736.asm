; DESCRIPTION: Places a blue circle of radius 56 at center (62, 187).
; PLAN: r0=62(x), r1=187(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 187
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
