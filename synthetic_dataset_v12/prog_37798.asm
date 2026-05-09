; DESCRIPTION: Creates a magenta circular shape at (293, 97) with radius 78.
; PLAN: r0=293(x), r1=97(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 97
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
