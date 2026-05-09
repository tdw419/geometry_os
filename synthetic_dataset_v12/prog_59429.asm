; DESCRIPTION: Places a blue circle of radius 43 at center (390, 181).
; PLAN: r0=390(x), r1=181(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 181
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
