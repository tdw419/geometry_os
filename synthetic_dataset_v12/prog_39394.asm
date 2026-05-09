; DESCRIPTION: Places a blue circle of radius 20 at center (20, 53).
; PLAN: r0=20(x), r1=53(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 53
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
