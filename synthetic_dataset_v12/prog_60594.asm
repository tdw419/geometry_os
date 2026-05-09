; DESCRIPTION: Renders a magenta disk with center (85, 81) and radius 68.
; PLAN: r0=85(x), r1=81(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 81
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
