; DESCRIPTION: Creates a purple circular shape at (374, 43) with radius 37.
; PLAN: r0=374(x), r1=43(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 43
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
