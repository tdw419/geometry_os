; DESCRIPTION: Places a blue circle of radius 73 at center (77, 115).
; PLAN: r0=77(x), r1=115(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 115
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
