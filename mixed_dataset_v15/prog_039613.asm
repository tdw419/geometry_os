; DESCRIPTION: Creates a purple circular shape at (135, 181) with radius 11.
; PLAN: r0=135(x), r1=181(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 181
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
