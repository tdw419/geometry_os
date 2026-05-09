; DESCRIPTION: Renders a magenta disk with center (88, 167) and radius 58.
; PLAN: r0=88(x), r1=167(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 167
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
