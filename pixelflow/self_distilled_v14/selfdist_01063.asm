; DESCRIPTION: Places a purple disk with center (370, 181) and radius 16.
; PLAN: r0=370(x), r1=181(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 181
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
