; DESCRIPTION: Places a purple disk with center (291, 23) and radius 70.
; PLAN: r0=291(x), r1=23(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 23
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
