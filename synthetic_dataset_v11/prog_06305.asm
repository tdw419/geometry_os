; DESCRIPTION: Creates a magenta circular shape at (122, 125) with radius 63.
; PLAN: r0=122(x), r1=125(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 125
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
