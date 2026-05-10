; DESCRIPTION: Creates a purple circular shape at (350, 176) with radius 64.
; PLAN: r0=350(x), r1=176(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 176
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
