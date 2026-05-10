; DESCRIPTION: Renders a magenta disk with center (396, 88) and radius 60.
; PLAN: r0=396(x), r1=88(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 88
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
