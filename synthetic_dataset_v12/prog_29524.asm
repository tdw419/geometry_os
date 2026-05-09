; DESCRIPTION: Places a blue circle of radius 62 at center (368, 76).
; PLAN: r0=368(x), r1=76(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 76
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
