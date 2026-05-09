; DESCRIPTION: Places a yellow circle of radius 33 at center (112, 104).
; PLAN: r0=112(x), r1=104(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 104
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
