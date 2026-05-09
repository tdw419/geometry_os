; DESCRIPTION: Creates a magenta circular shape at (275, 232) with radius 12.
; PLAN: r0=275(x), r1=232(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 232
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
