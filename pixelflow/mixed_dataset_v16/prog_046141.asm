; DESCRIPTION: Creates a magenta circular shape at (248, 97) with radius 36.
; PLAN: r0=248(x), r1=97(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 97
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
