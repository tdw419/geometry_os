; DESCRIPTION: Creates a magenta circular shape at (201, 55) with radius 55.
; PLAN: r0=201(x), r1=55(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 55
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
