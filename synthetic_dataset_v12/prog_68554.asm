; DESCRIPTION: Places a yellow circle of radius 24 at center (100, 223).
; PLAN: r0=100(x), r1=223(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 223
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
