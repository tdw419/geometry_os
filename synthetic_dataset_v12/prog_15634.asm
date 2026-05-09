; DESCRIPTION: Renders a magenta disk with center (134, 72) and radius 55.
; PLAN: r0=134(x), r1=72(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 72
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
