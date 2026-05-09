; DESCRIPTION: Creates a magenta circular shape at (68, 36) with radius 14.
; PLAN: r0=68(x), r1=36(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 36
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
