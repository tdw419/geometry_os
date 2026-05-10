; DESCRIPTION: Creates a magenta circular shape at (190, 188) with radius 58.
; PLAN: r0=190(x), r1=188(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 188
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
