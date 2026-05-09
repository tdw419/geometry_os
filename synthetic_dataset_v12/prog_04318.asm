; DESCRIPTION: Creates a magenta circular shape at (326, 62) with radius 18.
; PLAN: r0=326(x), r1=62(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 62
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
