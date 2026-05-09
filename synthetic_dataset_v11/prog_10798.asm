; DESCRIPTION: Places a blue circle of radius 21 at center (49, 100).
; PLAN: r0=49(x), r1=100(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 100
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
