; DESCRIPTION: Creates a purple circular shape at (465, 181) with radius 34.
; PLAN: r0=465(x), r1=181(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 181
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
