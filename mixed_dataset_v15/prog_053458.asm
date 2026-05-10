; DESCRIPTION: Creates a magenta circular shape at (87, 75) with radius 13.
; PLAN: r0=87(x), r1=75(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 75
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
