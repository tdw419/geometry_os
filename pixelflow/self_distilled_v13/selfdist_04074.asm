; DESCRIPTION: Places a yellow disk with center (304, 110) and radius 59.
; PLAN: r0=304(x), r1=110(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 110
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
