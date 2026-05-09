; DESCRIPTION: Creates a magenta circular shape at (209, 137) with radius 63.
; PLAN: r0=209(x), r1=137(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 137
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
