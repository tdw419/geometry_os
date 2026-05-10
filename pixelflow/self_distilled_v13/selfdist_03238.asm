; DESCRIPTION: Renders a blue circular shape at (382, 70) with radius 47.
; PLAN: r0=382(x), r1=70(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 70
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
