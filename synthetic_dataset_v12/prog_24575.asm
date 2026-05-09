; DESCRIPTION: Creates a magenta circular shape at (270, 39) with radius 38.
; PLAN: r0=270(x), r1=39(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 39
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
