; DESCRIPTION: Creates a magenta circular shape at (157, 185) with radius 53.
; PLAN: r0=157(x), r1=185(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 185
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
