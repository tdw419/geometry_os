; DESCRIPTION: Places a purple disk with center (327, 118) and radius 56.
; PLAN: r0=327(x), r1=118(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 118
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
