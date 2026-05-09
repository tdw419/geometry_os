; DESCRIPTION: Creates a magenta circular shape at (178, 72) with radius 66.
; PLAN: r0=178(x), r1=72(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 72
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
