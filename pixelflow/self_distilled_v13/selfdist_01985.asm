; DESCRIPTION: Places a purple disk with center (122, 18) and radius 16.
; PLAN: r0=122(x), r1=18(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 18
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
