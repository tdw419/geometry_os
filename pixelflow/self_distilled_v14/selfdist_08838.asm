; DESCRIPTION: Renders a magenta circular shape at (119, 2) with radius 26.
; PLAN: r0=119(x), r1=2(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 2
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
