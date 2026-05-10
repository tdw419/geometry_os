; DESCRIPTION: Renders a magenta disk with center (457, 189) and radius 43.
; PLAN: r0=457(x), r1=189(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 189
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
