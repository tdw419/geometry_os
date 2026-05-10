; DESCRIPTION: Places a yellow circle of radius 58 at center (112, 141).
; PLAN: r0=112(x), r1=141(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 141
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
