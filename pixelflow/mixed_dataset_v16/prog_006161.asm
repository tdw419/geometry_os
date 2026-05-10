; DESCRIPTION: Places a blue circle of radius 56 at center (129, 183).
; PLAN: r0=129(x), r1=183(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 183
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
