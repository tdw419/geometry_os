; DESCRIPTION: Places a yellow circle of radius 17 at center (102, 47).
; PLAN: r0=102(x), r1=47(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 47
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
