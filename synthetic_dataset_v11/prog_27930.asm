; DESCRIPTION: Places a blue circle of radius 29 at center (49, 120).
; PLAN: r0=49(x), r1=120(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 120
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
