; DESCRIPTION: Places a yellow circle of radius 30 at center (299, 114).
; PLAN: r0=299(x), r1=114(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 114
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
