; DESCRIPTION: Places a blue circle of radius 53 at center (205, 70).
; PLAN: r0=205(x), r1=70(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 70
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
