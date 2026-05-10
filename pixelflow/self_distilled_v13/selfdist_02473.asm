; DESCRIPTION: Places a yellow disk with center (58, 44) and radius 75.
; PLAN: r0=58(x), r1=44(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 44
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
