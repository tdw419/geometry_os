; DESCRIPTION: Places a blue circle of radius 53 at center (447, 54).
; PLAN: r0=447(x), r1=54(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 54
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
