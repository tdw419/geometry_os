; DESCRIPTION: Renders a magenta disk with center (119, 167) and radius 61.
; PLAN: r0=119(x), r1=167(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 167
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
