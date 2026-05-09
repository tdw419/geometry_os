; DESCRIPTION: Creates a magenta circular shape at (417, 177) with radius 10.
; PLAN: r0=417(x), r1=177(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 177
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
