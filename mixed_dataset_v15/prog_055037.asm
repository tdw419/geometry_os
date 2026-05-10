; DESCRIPTION: Creates a magenta circular shape at (126, 138) with radius 78.
; PLAN: r0=126(x), r1=138(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 138
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
