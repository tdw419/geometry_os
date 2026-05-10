; DESCRIPTION: Creates a magenta circular shape at (85, 167) with radius 45.
; PLAN: r0=85(x), r1=167(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 167
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
