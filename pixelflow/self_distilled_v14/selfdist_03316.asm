; DESCRIPTION: Places a purple disk with center (9, 167) and radius 44.
; PLAN: r0=9(x), r1=167(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 9
LDI r1, 167
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
