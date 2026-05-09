; DESCRIPTION: Creates a magenta circular shape at (384, 97) with radius 72.
; PLAN: r0=384(x), r1=97(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 97
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
