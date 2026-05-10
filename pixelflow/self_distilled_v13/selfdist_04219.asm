; DESCRIPTION: Renders a purple circular shape at (395, 14) with radius 37.
; PLAN: r0=395(x), r1=14(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 14
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
