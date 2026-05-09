; DESCRIPTION: Draws a purple circle centered at (262, 96) with radius 17.
; PLAN: r0=262(x), r1=96(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 96
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
