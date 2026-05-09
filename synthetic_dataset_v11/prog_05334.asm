; DESCRIPTION: Places a blue circle of radius 17 at center (59, 104).
; PLAN: r0=59(x), r1=104(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 104
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
