; DESCRIPTION: Creates a purple circular shape at (94, 60) with radius 50.
; PLAN: r0=94(x), r1=60(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 60
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
