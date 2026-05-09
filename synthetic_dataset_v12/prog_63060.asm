; DESCRIPTION: Creates a magenta circular shape at (101, 184) with radius 72.
; PLAN: r0=101(x), r1=184(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 184
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
