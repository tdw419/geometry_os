; DESCRIPTION: Renders a magenta disk with center (140, 66) and radius 15.
; PLAN: r0=140(x), r1=66(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 66
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
