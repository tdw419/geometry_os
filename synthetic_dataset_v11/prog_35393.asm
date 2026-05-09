; DESCRIPTION: Creates a purple circular shape at (112, 220) with radius 29.
; PLAN: r0=112(x), r1=220(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 220
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
