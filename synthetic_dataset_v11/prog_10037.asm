; DESCRIPTION: Places a yellow circle of radius 37 at center (138, 67).
; PLAN: r0=138(x), r1=67(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 67
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
