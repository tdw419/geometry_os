; DESCRIPTION: Creates a purple circular shape at (377, 151) with radius 17.
; PLAN: r0=377(x), r1=151(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 151
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
