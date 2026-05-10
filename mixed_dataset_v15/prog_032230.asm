; DESCRIPTION: Places a purple circle of radius 37 at center (371, 85).
; PLAN: r0=371(x), r1=85(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 85
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
