; DESCRIPTION: Creates a magenta circular shape at (272, 174) with radius 62.
; PLAN: r0=272(x), r1=174(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 174
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
