; DESCRIPTION: Renders a blue circular shape at (61, 14) with radius 49.
; PLAN: r0=61(x), r1=14(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 14
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
