; DESCRIPTION: Places a purple disk with center (28, 128) and radius 38.
; PLAN: r0=28(x), r1=128(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 128
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
