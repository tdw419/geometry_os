; DESCRIPTION: Places a blue circle of radius 62 at center (376, 73).
; PLAN: r0=376(x), r1=73(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 73
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
