; DESCRIPTION: Creates a magenta circular shape at (276, 136) with radius 67.
; PLAN: r0=276(x), r1=136(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 136
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
