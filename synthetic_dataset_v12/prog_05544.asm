; DESCRIPTION: Creates a purple circular shape at (106, 143) with radius 79.
; PLAN: r0=106(x), r1=143(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 143
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
