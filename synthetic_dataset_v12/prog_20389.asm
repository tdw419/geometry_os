; DESCRIPTION: Places a blue circle of radius 46 at center (382, 116).
; PLAN: r0=382(x), r1=116(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 116
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
