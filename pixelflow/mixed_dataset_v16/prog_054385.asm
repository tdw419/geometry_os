; DESCRIPTION: Renders a magenta circular shape at (78, 14) with radius 11.
; PLAN: r0=78(x), r1=14(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 14
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
