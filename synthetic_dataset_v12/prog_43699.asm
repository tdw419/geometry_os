; DESCRIPTION: Creates a magenta circular shape at (424, 110) with radius 66.
; PLAN: r0=424(x), r1=110(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 110
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
