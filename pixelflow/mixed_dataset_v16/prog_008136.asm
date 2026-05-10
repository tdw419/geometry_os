; DESCRIPTION: Creates a purple circular shape at (126, 89) with radius 46.
; PLAN: r0=126(x), r1=89(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 89
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
