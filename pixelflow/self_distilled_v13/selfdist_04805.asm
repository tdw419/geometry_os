; DESCRIPTION: Places a purple disk with center (99, 23) and radius 47.
; PLAN: r0=99(x), r1=23(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 23
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
