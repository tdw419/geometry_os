; DESCRIPTION: Places a blue circle of radius 49 at center (339, 83).
; PLAN: r0=339(x), r1=83(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 83
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
