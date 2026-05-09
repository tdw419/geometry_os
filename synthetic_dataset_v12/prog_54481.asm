; DESCRIPTION: Renders a magenta disk with center (461, 167) and radius 23.
; PLAN: r0=461(x), r1=167(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 167
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
