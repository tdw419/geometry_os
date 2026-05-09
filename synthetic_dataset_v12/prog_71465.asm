; DESCRIPTION: Creates a magenta circular shape at (67, 101) with radius 59.
; PLAN: r0=67(x), r1=101(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 101
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
