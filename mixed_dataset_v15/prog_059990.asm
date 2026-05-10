; DESCRIPTION: Places a blue circle of radius 74 at center (222, 129).
; PLAN: r0=222(x), r1=129(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 129
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
