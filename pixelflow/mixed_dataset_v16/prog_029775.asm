; DESCRIPTION: Renders a magenta circular shape at (249, 189) with radius 17.
; PLAN: r0=249(x), r1=189(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 189
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
