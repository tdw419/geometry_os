; DESCRIPTION: Creates a magenta circular shape at (37, 40) with radius 30.
; PLAN: r0=37(x), r1=40(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 40
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
