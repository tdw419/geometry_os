; DESCRIPTION: Places a blue circle of radius 70 at center (426, 106).
; PLAN: r0=426(x), r1=106(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 106
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
