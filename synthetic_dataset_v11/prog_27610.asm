; DESCRIPTION: Creates a magenta circular shape at (161, 109) with radius 74.
; PLAN: r0=161(x), r1=109(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 109
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
