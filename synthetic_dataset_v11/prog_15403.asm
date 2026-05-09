; DESCRIPTION: Creates a magenta circular shape at (107, 89) with radius 70.
; PLAN: r0=107(x), r1=89(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 89
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
