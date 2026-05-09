; DESCRIPTION: Places a yellow circle of radius 52 at center (112, 98).
; PLAN: r0=112(x), r1=98(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 98
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
