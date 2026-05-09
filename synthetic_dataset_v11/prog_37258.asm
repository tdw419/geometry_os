; DESCRIPTION: Places a blue circle of radius 59 at center (119, 116).
; PLAN: r0=119(x), r1=116(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 116
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
