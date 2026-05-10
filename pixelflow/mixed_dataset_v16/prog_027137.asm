; DESCRIPTION: Renders a blue circular shape at (232, 120) with radius 40.
; PLAN: r0=232(x), r1=120(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 120
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
