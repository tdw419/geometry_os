; DESCRIPTION: Creates a magenta circular shape at (309, 155) with radius 69.
; PLAN: r0=309(x), r1=155(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 155
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
