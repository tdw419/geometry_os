; DESCRIPTION: Places a yellow disk with center (170, 123) and radius 38.
; PLAN: r0=170(x), r1=123(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 123
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
