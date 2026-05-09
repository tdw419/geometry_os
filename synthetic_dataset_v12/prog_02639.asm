; DESCRIPTION: Places a purple circle of radius 48 at center (442, 110).
; PLAN: r0=442(x), r1=110(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 110
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
