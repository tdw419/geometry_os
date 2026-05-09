; DESCRIPTION: Creates a purple circular shape at (250, 168) with radius 73.
; PLAN: r0=250(x), r1=168(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 168
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
