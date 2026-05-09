; DESCRIPTION: Renders a magenta disk with center (223, 184) and radius 17.
; PLAN: r0=223(x), r1=184(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 184
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
