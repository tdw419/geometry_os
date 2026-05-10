; DESCRIPTION: Creates a magenta circular shape at (311, 175) with radius 74.
; PLAN: r0=311(x), r1=175(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 175
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
