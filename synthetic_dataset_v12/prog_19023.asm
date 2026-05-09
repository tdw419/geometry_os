; DESCRIPTION: Creates a magenta circular shape at (201, 142) with radius 39.
; PLAN: r0=201(x), r1=142(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 142
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
