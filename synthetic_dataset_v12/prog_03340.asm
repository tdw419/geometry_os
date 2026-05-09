; DESCRIPTION: Creates a magenta circular shape at (37, 35) with radius 12.
; PLAN: r0=37(x), r1=35(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 35
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
