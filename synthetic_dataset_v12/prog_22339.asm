; DESCRIPTION: Creates a magenta circular shape at (31, 54) with radius 31.
; PLAN: r0=31(x), r1=54(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 54
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
