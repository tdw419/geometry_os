; DESCRIPTION: Renders a blue circular shape at (15, 69) with radius 35.
; PLAN: r0=15(x), r1=69(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 69
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
