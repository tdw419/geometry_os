; DESCRIPTION: Places a blue circle of radius 74 at center (373, 92).
; PLAN: r0=373(x), r1=92(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 92
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
