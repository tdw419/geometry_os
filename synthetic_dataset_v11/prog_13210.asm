; DESCRIPTION: Renders a magenta disk with center (125, 136) and radius 73.
; PLAN: r0=125(x), r1=136(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 136
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
