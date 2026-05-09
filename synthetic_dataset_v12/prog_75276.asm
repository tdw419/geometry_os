; DESCRIPTION: Creates a magenta circular shape at (157, 105) with radius 58.
; PLAN: r0=157(x), r1=105(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 105
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
