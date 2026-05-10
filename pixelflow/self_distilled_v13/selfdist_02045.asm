; DESCRIPTION: Places a purple disk with center (2, 43) and radius 23.
; PLAN: r0=2(x), r1=43(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 2
LDI r1, 43
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
