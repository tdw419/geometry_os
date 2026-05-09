; DESCRIPTION: Creates a purple circular shape at (392, 181) with radius 14.
; PLAN: r0=392(x), r1=181(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 181
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
