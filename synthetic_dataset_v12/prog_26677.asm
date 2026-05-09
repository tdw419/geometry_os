; DESCRIPTION: Creates a purple circular shape at (442, 216) with radius 13.
; PLAN: r0=442(x), r1=216(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 216
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
