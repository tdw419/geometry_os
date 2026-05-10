; DESCRIPTION: Places a purple disk with center (12, 59) and radius 30.
; PLAN: r0=12(x), r1=59(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 12
LDI r1, 59
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
