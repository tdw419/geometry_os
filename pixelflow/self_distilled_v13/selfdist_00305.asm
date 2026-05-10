; DESCRIPTION: Renders a purple circular shape at (15, 53) with radius 78.
; PLAN: r0=15(x), r1=53(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 53
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
