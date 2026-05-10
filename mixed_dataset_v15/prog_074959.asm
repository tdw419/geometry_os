; DESCRIPTION: Renders a magenta disk with center (191, 134) and radius 70.
; PLAN: r0=191(x), r1=134(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 134
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
