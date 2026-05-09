; DESCRIPTION: Places a blue circle of radius 15 at center (321, 158).
; PLAN: r0=321(x), r1=158(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 158
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
