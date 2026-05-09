; DESCRIPTION: Renders a magenta disk with center (134, 184) and radius 54.
; PLAN: r0=134(x), r1=184(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 184
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
