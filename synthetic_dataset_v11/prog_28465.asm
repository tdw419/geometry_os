; DESCRIPTION: Creates a magenta circular shape at (11, 48) with radius 11.
; PLAN: r0=11(x), r1=48(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 11
LDI r1, 48
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
