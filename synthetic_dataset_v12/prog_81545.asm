; DESCRIPTION: Renders a magenta disk with center (302, 114) and radius 71.
; PLAN: r0=302(x), r1=114(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 114
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
