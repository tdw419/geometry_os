; DESCRIPTION: Places a yellow circle of radius 34 at center (81, 120).
; PLAN: r0=81(x), r1=120(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 120
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
