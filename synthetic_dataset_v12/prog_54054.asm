; DESCRIPTION: Places a yellow circle of radius 56 at center (244, 118).
; PLAN: r0=244(x), r1=118(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 118
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
