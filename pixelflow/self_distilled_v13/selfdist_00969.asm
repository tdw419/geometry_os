; DESCRIPTION: Places a yellow disk with center (364, 156) and radius 54.
; PLAN: r0=364(x), r1=156(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 156
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
