; DESCRIPTION: Creates a magenta circular shape at (118, 175) with radius 21.
; PLAN: r0=118(x), r1=175(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 175
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
