; DESCRIPTION: Creates a magenta circular shape at (155, 207) with radius 27.
; PLAN: r0=155(x), r1=207(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 207
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
