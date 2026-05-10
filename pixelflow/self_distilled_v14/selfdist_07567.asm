; DESCRIPTION: Renders a purple circular shape at (32, 57) with radius 14.
; PLAN: r0=32(x), r1=57(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 57
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
