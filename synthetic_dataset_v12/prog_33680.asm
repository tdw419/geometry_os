; DESCRIPTION: Creates a magenta circular shape at (76, 76) with radius 53.
; PLAN: r0=76(x), r1=76(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 76
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
