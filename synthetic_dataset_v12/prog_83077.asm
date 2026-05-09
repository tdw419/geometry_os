; DESCRIPTION: Creates a magenta circular shape at (56, 212) with radius 31.
; PLAN: r0=56(x), r1=212(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 212
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
