; DESCRIPTION: Creates a purple circular shape at (273, 97) with radius 50.
; PLAN: r0=273(x), r1=97(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 97
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
