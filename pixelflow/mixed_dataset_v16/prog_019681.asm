; DESCRIPTION: Places a purple disk with center (330, 24) and radius 28.
; PLAN: r0=330(x), r1=24(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 24
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
