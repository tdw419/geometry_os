; DESCRIPTION: Creates a magenta circular shape at (195, 139) with radius 41.
; PLAN: r0=195(x), r1=139(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 139
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
