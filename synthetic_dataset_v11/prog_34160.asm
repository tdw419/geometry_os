; DESCRIPTION: Creates a purple circular shape at (70, 215) with radius 30.
; PLAN: r0=70(x), r1=215(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 215
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
