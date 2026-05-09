; DESCRIPTION: Places a blue circle of radius 60 at center (98, 194).
; PLAN: r0=98(x), r1=194(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 194
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
