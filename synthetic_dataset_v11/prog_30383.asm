; DESCRIPTION: Creates a purple circular shape at (146, 88) with radius 47.
; PLAN: r0=146(x), r1=88(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 88
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
