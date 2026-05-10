; DESCRIPTION: Creates a purple circular shape at (317, 117) with radius 64.
; PLAN: r0=317(x), r1=117(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 117
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
