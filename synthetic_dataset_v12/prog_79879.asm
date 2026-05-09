; DESCRIPTION: Creates a magenta circular shape at (304, 144) with radius 39.
; PLAN: r0=304(x), r1=144(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 144
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
