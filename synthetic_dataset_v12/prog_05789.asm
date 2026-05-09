; DESCRIPTION: Creates a purple circular shape at (309, 83) with radius 63.
; PLAN: r0=309(x), r1=83(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 83
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
