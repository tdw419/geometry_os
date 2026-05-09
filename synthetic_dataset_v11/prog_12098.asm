; DESCRIPTION: Creates a magenta circular shape at (111, 78) with radius 74.
; PLAN: r0=111(x), r1=78(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 78
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
