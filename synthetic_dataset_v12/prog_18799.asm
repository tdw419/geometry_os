; DESCRIPTION: Places a yellow circle of radius 47 at center (364, 109).
; PLAN: r0=364(x), r1=109(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 109
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
