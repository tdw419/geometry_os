; DESCRIPTION: Renders a magenta disk with center (427, 75) and radius 71.
; PLAN: r0=427(x), r1=75(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 75
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
