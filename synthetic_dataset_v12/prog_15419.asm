; DESCRIPTION: Creates a magenta circular shape at (467, 29) with radius 22.
; PLAN: r0=467(x), r1=29(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 29
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
