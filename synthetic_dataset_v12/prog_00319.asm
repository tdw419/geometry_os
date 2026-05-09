; DESCRIPTION: Creates a magenta circular shape at (274, 178) with radius 75.
; PLAN: r0=274(x), r1=178(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 178
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
