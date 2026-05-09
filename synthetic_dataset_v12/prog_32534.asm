; DESCRIPTION: Creates a magenta circular shape at (158, 226) with radius 20.
; PLAN: r0=158(x), r1=226(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 226
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
