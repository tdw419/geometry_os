; DESCRIPTION: Creates a purple circular shape at (300, 162) with radius 77.
; PLAN: r0=300(x), r1=162(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 162
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
