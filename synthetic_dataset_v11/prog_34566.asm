; DESCRIPTION: Places a yellow circle of radius 24 at center (101, 104).
; PLAN: r0=101(x), r1=104(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 104
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
