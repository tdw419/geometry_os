; DESCRIPTION: Creates a magenta circular shape at (291, 147) with radius 70.
; PLAN: r0=291(x), r1=147(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 147
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
