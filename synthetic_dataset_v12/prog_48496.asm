; DESCRIPTION: Places a blue circle of radius 62 at center (110, 115).
; PLAN: r0=110(x), r1=115(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 115
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
