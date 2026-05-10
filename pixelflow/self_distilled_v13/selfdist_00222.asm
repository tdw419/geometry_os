; DESCRIPTION: Renders a purple circular shape at (238, 48) with radius 70.
; PLAN: r0=238(x), r1=48(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 48
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
