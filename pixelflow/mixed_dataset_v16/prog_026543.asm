; DESCRIPTION: Renders a magenta circular shape at (47, 29) with radius 74.
; PLAN: r0=47(x), r1=29(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 29
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
