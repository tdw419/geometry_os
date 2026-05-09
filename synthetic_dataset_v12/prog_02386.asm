; DESCRIPTION: Creates a magenta circular shape at (275, 62) with radius 37.
; PLAN: r0=275(x), r1=62(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 62
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
