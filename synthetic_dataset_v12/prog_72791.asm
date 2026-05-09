; DESCRIPTION: Creates a magenta circular shape at (70, 232) with radius 22.
; PLAN: r0=70(x), r1=232(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 232
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
