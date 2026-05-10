; DESCRIPTION: Creates a purple circular shape at (79, 47) with radius 22.
; PLAN: r0=79(x), r1=47(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 47
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
