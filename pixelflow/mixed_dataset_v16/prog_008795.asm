; DESCRIPTION: Places a purple circle of radius 70 at center (419, 164).
; PLAN: r0=419(x), r1=164(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 164
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
