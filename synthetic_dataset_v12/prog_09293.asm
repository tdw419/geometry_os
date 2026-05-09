; DESCRIPTION: Creates a purple circular shape at (230, 152) with radius 45.
; PLAN: r0=230(x), r1=152(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 152
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
