; DESCRIPTION: Creates a purple circular shape at (350, 66) with radius 20.
; PLAN: r0=350(x), r1=66(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 66
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
