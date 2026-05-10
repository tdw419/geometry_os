; DESCRIPTION: Renders a blue circular shape at (21, 134) with radius 49.
; PLAN: r0=21(x), r1=134(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 134
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
