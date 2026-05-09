; DESCRIPTION: Creates a purple circular shape at (70, 176) with radius 67.
; PLAN: r0=70(x), r1=176(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 176
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
