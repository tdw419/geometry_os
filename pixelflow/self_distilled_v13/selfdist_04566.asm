; DESCRIPTION: Renders a blue circular shape at (19, 60) with radius 35.
; PLAN: r0=19(x), r1=60(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 60
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
