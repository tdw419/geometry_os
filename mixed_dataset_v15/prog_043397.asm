; DESCRIPTION: Places a blue circle of radius 60 at center (304, 100).
; PLAN: r0=304(x), r1=100(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 100
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
