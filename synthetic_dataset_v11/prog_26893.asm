; DESCRIPTION: Renders a magenta disk with center (175, 109) and radius 66.
; PLAN: r0=175(x), r1=109(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 109
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
