; DESCRIPTION: Renders a magenta disk with center (122, 107) and radius 71.
; PLAN: r0=122(x), r1=107(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 107
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
