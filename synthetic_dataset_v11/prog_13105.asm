; DESCRIPTION: Creates a magenta circular shape at (167, 99) with radius 76.
; PLAN: r0=167(x), r1=99(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 99
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
