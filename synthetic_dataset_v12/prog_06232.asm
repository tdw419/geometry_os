; DESCRIPTION: Places a blue circle of radius 31 at center (383, 58).
; PLAN: r0=383(x), r1=58(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 58
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
