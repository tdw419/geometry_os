; DESCRIPTION: Creates a purple circular shape at (104, 229) with radius 22.
; PLAN: r0=104(x), r1=229(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 229
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
