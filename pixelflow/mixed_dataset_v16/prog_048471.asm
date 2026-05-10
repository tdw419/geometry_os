; DESCRIPTION: Places a blue circle of radius 44 at center (287, 88).
; PLAN: r0=287(x), r1=88(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 88
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
