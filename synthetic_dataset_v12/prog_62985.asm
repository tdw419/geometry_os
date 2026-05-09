; DESCRIPTION: Creates a magenta circular shape at (291, 105) with radius 63.
; PLAN: r0=291(x), r1=105(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 105
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
