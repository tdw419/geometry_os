; DESCRIPTION: Renders a blue circular shape at (338, 44) with radius 74.
; PLAN: r0=338(x), r1=44(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 44
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
