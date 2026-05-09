; DESCRIPTION: Creates a magenta circular shape at (183, 60) with radius 59.
; PLAN: r0=183(x), r1=60(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 60
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
