; DESCRIPTION: Renders a blue disk with center (274, 121) and radius 60.
; PLAN: r0=274(x), r1=121(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 121
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
