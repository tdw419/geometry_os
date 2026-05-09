; DESCRIPTION: Creates a magenta circular shape at (76, 58) with radius 39.
; PLAN: r0=76(x), r1=58(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 58
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
