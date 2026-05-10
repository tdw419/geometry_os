; DESCRIPTION: Places a purple disk with center (262, 119) and radius 78.
; PLAN: r0=262(x), r1=119(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 119
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
