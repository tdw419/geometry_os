; DESCRIPTION: Creates a magenta circular shape at (238, 144) with radius 43.
; PLAN: r0=238(x), r1=144(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 144
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
