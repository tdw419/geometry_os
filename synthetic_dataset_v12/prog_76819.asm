; DESCRIPTION: Creates a magenta circular shape at (419, 116) with radius 23.
; PLAN: r0=419(x), r1=116(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 116
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
