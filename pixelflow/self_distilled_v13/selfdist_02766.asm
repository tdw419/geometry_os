; DESCRIPTION: Renders a purple circular shape at (179, 28) with radius 47.
; PLAN: r0=179(x), r1=28(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 28
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
