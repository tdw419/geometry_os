; DESCRIPTION: Creates a magenta circular shape at (87, 119) with radius 63.
; PLAN: r0=87(x), r1=119(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 119
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
