; DESCRIPTION: Creates a magenta circular shape at (158, 94) with radius 39.
; PLAN: r0=158(x), r1=94(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 94
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
