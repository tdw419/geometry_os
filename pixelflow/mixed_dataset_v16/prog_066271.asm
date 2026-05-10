; DESCRIPTION: Places a yellow disk with center (249, 110) and radius 11.
; PLAN: r0=249(x), r1=110(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 110
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
