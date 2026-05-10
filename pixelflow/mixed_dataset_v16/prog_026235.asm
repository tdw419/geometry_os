; DESCRIPTION: Renders a blue circular shape at (1, 84) with radius 35.
; PLAN: r0=1(x), r1=84(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 1
LDI r1, 84
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
