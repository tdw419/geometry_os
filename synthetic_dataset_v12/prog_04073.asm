; DESCRIPTION: Creates a magenta circular shape at (384, 148) with radius 43.
; PLAN: r0=384(x), r1=148(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 148
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
