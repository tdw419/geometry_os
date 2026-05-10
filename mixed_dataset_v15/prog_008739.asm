; DESCRIPTION: Places a blue circle of radius 29 at center (200, 43).
; PLAN: r0=200(x), r1=43(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 43
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
