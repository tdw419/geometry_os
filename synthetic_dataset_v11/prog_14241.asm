; DESCRIPTION: Places a yellow circle of radius 36 at center (121, 129).
; PLAN: r0=121(x), r1=129(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 129
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
