; DESCRIPTION: Renders a purple circular shape at (33, 40) with radius 70.
; PLAN: r0=33(x), r1=40(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 40
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
