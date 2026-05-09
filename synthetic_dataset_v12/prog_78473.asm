; DESCRIPTION: Creates a purple circular shape at (203, 216) with radius 11.
; PLAN: r0=203(x), r1=216(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 216
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
