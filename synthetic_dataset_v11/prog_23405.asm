; DESCRIPTION: Renders a magenta disk with center (124, 118) and radius 58.
; PLAN: r0=124(x), r1=118(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 118
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
