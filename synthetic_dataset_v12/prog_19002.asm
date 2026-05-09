; DESCRIPTION: Renders a magenta disk with center (112, 141) and radius 68.
; PLAN: r0=112(x), r1=141(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 141
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
