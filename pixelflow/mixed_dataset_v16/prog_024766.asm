; DESCRIPTION: Renders a purple circular shape at (381, 35) with radius 13.
; PLAN: r0=381(x), r1=35(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 35
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
