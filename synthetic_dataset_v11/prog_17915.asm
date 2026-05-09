; DESCRIPTION: Creates a magenta circular shape at (63, 108) with radius 13.
; PLAN: r0=63(x), r1=108(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 108
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
