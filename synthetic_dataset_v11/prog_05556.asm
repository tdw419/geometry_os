; DESCRIPTION: Creates a magenta circular shape at (89, 78) with radius 72.
; PLAN: r0=89(x), r1=78(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 78
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
