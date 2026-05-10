; DESCRIPTION: Places a purple disk with center (197, 14) and radius 64.
; PLAN: r0=197(x), r1=14(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 14
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
