; DESCRIPTION: Places a purple disk with center (339, 114) and radius 50.
; PLAN: r0=339(x), r1=114(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 114
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
