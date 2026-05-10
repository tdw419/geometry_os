; DESCRIPTION: Places a purple disk with center (4, 181) and radius 75.
; PLAN: r0=4(x), r1=181(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 4
LDI r1, 181
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
