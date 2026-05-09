; DESCRIPTION: Creates a purple circular shape at (176, 91) with radius 23.
; PLAN: r0=176(x), r1=91(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 91
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
