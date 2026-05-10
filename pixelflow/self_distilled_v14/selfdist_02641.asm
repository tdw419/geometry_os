; DESCRIPTION: Renders a purple circular shape at (367, 86) with radius 25.
; PLAN: r0=367(x), r1=86(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 86
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
