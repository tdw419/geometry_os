; DESCRIPTION: Places a purple circle of radius 21 at center (200, 126).
; PLAN: r0=200(x), r1=126(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 126
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
