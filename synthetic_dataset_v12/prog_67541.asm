; DESCRIPTION: Creates a purple circular shape at (363, 50) with radius 10.
; PLAN: r0=363(x), r1=50(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 50
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
