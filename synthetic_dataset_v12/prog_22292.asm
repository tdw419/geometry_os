; DESCRIPTION: Places a yellow circle of radius 60 at center (88, 78).
; PLAN: r0=88(x), r1=78(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 78
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
