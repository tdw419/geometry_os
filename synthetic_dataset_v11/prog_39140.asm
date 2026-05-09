; DESCRIPTION: Creates a magenta circular shape at (192, 134) with radius 56.
; PLAN: r0=192(x), r1=134(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 134
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
