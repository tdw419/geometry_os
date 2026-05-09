; DESCRIPTION: Places a purple circle of radius 60 at center (176, 89).
; PLAN: r0=176(x), r1=89(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 89
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
