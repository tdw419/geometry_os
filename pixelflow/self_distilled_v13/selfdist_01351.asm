; DESCRIPTION: Renders a purple circular shape at (75, 38) with radius 26.
; PLAN: r0=75(x), r1=38(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 38
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
