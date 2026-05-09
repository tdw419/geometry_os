; DESCRIPTION: Places a blue circle of radius 15 at center (138, 233).
; PLAN: r0=138(x), r1=233(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 233
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
