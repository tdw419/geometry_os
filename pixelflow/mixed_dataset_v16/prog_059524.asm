; DESCRIPTION: Creates a magenta circular shape at (457, 165) with radius 19.
; PLAN: r0=457(x), r1=165(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 165
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
