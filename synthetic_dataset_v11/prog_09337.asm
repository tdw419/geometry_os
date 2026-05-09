; DESCRIPTION: Places a blue circle of radius 17 at center (153, 77).
; PLAN: r0=153(x), r1=77(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 77
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
