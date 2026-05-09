; DESCRIPTION: Renders a magenta disk with center (316, 69) and radius 22.
; PLAN: r0=316(x), r1=69(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 69
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
