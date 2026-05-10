; DESCRIPTION: Places a purple disk with center (384, 10) and radius 36.
; PLAN: r0=384(x), r1=10(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 10
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
