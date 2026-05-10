; DESCRIPTION: Creates a purple circular shape at (444, 130) with radius 56.
; PLAN: r0=444(x), r1=130(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 130
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
