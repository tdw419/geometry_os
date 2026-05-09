; DESCRIPTION: Renders a magenta disk with center (81, 172) and radius 61.
; PLAN: r0=81(x), r1=172(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 172
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
