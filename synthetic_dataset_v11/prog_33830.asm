; DESCRIPTION: Renders a magenta disk with center (88, 77) and radius 68.
; PLAN: r0=88(x), r1=77(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 77
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
