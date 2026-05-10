; DESCRIPTION: Renders a purple circular shape at (118, 39) with radius 47.
; PLAN: r0=118(x), r1=39(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 39
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
