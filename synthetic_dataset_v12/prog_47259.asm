; DESCRIPTION: Creates a purple circular shape at (444, 99) with radius 64.
; PLAN: r0=444(x), r1=99(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 99
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
