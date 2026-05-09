; DESCRIPTION: Creates a magenta circular shape at (94, 176) with radius 68.
; PLAN: r0=94(x), r1=176(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 176
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
