; DESCRIPTION: Creates a purple circular shape at (132, 91) with radius 48.
; PLAN: r0=132(x), r1=91(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 91
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
