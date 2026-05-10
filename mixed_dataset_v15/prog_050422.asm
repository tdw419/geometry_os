; DESCRIPTION: Places a yellow disk with center (125, 158) and radius 53.
; PLAN: r0=125(x), r1=158(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 158
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
