; DESCRIPTION: Places a blue circle of radius 62 at center (104, 93).
; PLAN: r0=104(x), r1=93(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 93
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
