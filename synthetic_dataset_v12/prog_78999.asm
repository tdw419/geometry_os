; DESCRIPTION: Renders a magenta disk with center (163, 138) and radius 78.
; PLAN: r0=163(x), r1=138(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 138
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
