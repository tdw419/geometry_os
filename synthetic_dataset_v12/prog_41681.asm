; DESCRIPTION: Creates a magenta circular shape at (357, 99) with radius 67.
; PLAN: r0=357(x), r1=99(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 99
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
