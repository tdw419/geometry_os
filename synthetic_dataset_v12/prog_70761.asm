; DESCRIPTION: Places a blue circle of radius 44 at center (117, 49).
; PLAN: r0=117(x), r1=49(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 49
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
