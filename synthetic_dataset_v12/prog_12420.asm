; DESCRIPTION: Renders a magenta disk with center (107, 138) and radius 55.
; PLAN: r0=107(x), r1=138(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 138
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
