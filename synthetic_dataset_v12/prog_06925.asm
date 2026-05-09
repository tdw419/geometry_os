; DESCRIPTION: Creates a magenta circular shape at (267, 100) with radius 14.
; PLAN: r0=267(x), r1=100(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 100
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
