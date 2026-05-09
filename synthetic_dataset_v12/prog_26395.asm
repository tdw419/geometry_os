; DESCRIPTION: Creates a purple circular shape at (81, 236) with radius 18.
; PLAN: r0=81(x), r1=236(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 236
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
