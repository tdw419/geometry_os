; DESCRIPTION: Places a black circle of radius 58 at center (134, 74).
; PLAN: r0=134(x), r1=74(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 74
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
