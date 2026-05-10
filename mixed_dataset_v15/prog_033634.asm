; DESCRIPTION: Creates a magenta circular shape at (339, 183) with radius 28.
; PLAN: r0=339(x), r1=183(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 183
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
