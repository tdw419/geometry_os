; DESCRIPTION: Places a yellow circle of radius 47 at center (253, 47).
; PLAN: r0=253(x), r1=47(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 47
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
