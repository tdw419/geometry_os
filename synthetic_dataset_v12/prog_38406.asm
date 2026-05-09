; DESCRIPTION: Creates a magenta circular shape at (184, 134) with radius 23.
; PLAN: r0=184(x), r1=134(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 134
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
