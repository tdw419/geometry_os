; DESCRIPTION: Creates a magenta circular shape at (367, 111) with radius 62.
; PLAN: r0=367(x), r1=111(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 111
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
