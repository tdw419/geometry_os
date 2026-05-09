; DESCRIPTION: Places a yellow circle of radius 61 at center (430, 69).
; PLAN: r0=430(x), r1=69(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 69
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
