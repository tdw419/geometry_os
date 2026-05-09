; DESCRIPTION: Places a purple circle of radius 12 at center (476, 30).
; PLAN: r0=476(x), r1=30(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 30
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
