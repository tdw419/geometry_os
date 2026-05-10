; DESCRIPTION: Places a blue circle of radius 24 at center (270, 49).
; PLAN: r0=270(x), r1=49(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 49
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
