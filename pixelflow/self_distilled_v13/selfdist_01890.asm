; DESCRIPTION: Places a yellow disk with center (227, 94) and radius 77.
; PLAN: r0=227(x), r1=94(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 94
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
