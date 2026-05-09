; DESCRIPTION: Places a yellow circle of radius 71 at center (118, 129).
; PLAN: r0=118(x), r1=129(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 129
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
