; DESCRIPTION: Places a purple circle of radius 34 at center (94, 164).
; PLAN: r0=94(x), r1=164(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 164
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
