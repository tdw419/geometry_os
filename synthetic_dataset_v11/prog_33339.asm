; DESCRIPTION: Creates a purple circular shape at (138, 127) with radius 79.
; PLAN: r0=138(x), r1=127(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 127
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
