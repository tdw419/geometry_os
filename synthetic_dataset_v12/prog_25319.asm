; DESCRIPTION: Creates a purple circular shape at (164, 50) with radius 35.
; PLAN: r0=164(x), r1=50(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 50
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
