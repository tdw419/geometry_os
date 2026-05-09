; DESCRIPTION: Creates a purple circular shape at (30, 243) with radius 12.
; PLAN: r0=30(x), r1=243(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 243
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
