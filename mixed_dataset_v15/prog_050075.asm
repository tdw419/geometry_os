; DESCRIPTION: Creates a magenta circular shape at (266, 157) with radius 57.
; PLAN: r0=266(x), r1=157(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 157
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
