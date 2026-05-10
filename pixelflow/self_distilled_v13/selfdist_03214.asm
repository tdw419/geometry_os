; DESCRIPTION: Places a yellow disk with center (88, 84) and radius 73.
; PLAN: r0=88(x), r1=84(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 84
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
