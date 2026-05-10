; DESCRIPTION: Places a purple disk with center (25, 20) and radius 48.
; PLAN: r0=25(x), r1=20(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 20
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
