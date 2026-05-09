; DESCRIPTION: Creates a magenta circular shape at (283, 140) with radius 56.
; PLAN: r0=283(x), r1=140(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 140
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
