; DESCRIPTION: Creates a magenta circular shape at (177, 155) with radius 42.
; PLAN: r0=177(x), r1=155(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 155
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
