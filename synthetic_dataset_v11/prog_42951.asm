; DESCRIPTION: Creates a magenta circular shape at (169, 45) with radius 45.
; PLAN: r0=169(x), r1=45(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 45
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
