; DESCRIPTION: Renders a magenta disk with center (147, 93) and radius 17.
; PLAN: r0=147(x), r1=93(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 93
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
