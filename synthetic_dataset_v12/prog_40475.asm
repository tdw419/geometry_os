; DESCRIPTION: Creates a magenta circular shape at (430, 100) with radius 63.
; PLAN: r0=430(x), r1=100(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 100
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
