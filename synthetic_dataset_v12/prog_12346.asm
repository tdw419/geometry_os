; DESCRIPTION: Creates a purple circular shape at (236, 103) with radius 38.
; PLAN: r0=236(x), r1=103(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 103
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
