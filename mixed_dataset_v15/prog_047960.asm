; DESCRIPTION: Places a yellow disk with center (370, 115) and radius 62.
; PLAN: r0=370(x), r1=115(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 115
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
