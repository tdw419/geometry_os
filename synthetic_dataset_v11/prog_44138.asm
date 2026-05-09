; DESCRIPTION: Renders a magenta disk with center (147, 43) and radius 39.
; PLAN: r0=147(x), r1=43(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 43
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
