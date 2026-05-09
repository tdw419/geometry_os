; DESCRIPTION: Renders a magenta disk with center (112, 88) and radius 40.
; PLAN: r0=112(x), r1=88(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 88
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
