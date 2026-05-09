; DESCRIPTION: Creates a blue circular shape at (94, 81) with radius 42.
; PLAN: r0=94(x), r1=81(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 81
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
