; DESCRIPTION: Creates a magenta circular shape at (87, 108) with radius 39.
; PLAN: r0=87(x), r1=108(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 108
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
