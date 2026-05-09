; DESCRIPTION: Renders a magenta disk with center (167, 140) and radius 77.
; PLAN: r0=167(x), r1=140(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 140
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
