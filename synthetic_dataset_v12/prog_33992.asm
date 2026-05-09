; DESCRIPTION: Creates a magenta circular shape at (227, 116) with radius 68.
; PLAN: r0=227(x), r1=116(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 116
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
