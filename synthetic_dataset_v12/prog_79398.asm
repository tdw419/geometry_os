; DESCRIPTION: Creates a magenta circular shape at (364, 109) with radius 73.
; PLAN: r0=364(x), r1=109(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 109
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
