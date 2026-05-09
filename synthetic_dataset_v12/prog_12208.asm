; DESCRIPTION: Creates a magenta circular shape at (107, 50) with radius 29.
; PLAN: r0=107(x), r1=50(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 50
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
