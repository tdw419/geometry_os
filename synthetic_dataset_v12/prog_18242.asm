; DESCRIPTION: Places a blue circle of radius 43 at center (216, 70).
; PLAN: r0=216(x), r1=70(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 70
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
