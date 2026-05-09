; DESCRIPTION: Creates a magenta circular shape at (291, 49) with radius 29.
; PLAN: r0=291(x), r1=49(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 49
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
