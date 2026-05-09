; DESCRIPTION: Places a purple circle of radius 31 at center (140, 94).
; PLAN: r0=140(x), r1=94(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 94
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
