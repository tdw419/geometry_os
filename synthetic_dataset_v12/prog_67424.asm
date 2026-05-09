; DESCRIPTION: Creates a magenta circular shape at (117, 101) with radius 28.
; PLAN: r0=117(x), r1=101(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 101
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
