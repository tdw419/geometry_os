; DESCRIPTION: Creates a magenta circular shape at (88, 113) with radius 75.
; PLAN: r0=88(x), r1=113(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 113
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
